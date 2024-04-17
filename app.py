from flask import Flask, render_template, request, redirect, session, flash, url_for
from flask_bootstrap import Bootstrap
from flask_mysqldb import MySQL
from flask_ckeditor import CKEditor
import yaml
import os  # Added for environment variable access

# Configuration loading
app = Flask(__name__)
Bootstrap(app)
ckeditor = CKEditor(app)

# Load database configuration from YAML file securely
config_path = os.path.join(os.getcwd(), "db.yaml")
if os.path.exists(config_path):
    db = yaml.safe_load(open(config_path))
    app.config["MYSQL_HOST"] = db["mysql_host"]
    app.config["MYSQL_USER"] = db["mysql_user"]
    app.config["MYSQL_PASSWORD"] = db["mysql_password"]
    app.config["MYSQL_DB"] = db["mysql_db"]
    app.config["MYSQL_CURSORCLASS"] = "DictCursor"
else:
    print("Database configuration file 'db.yaml' is missing.")
    exit(1)

mysql = MySQL(app)
app.config["SECRET_KEY"] = "secret"


def get_coordinates(location):
    try:
        # Split the location into latitude and longitude
        parts = location.split(',')
        if len(parts) != 2:
            raise ValueError("Location should be in 'latitude,longitude' format.")

        # Convert the latitude and longitude to float
        latitude = float(parts[0].strip())
        longitude = float(parts[1].strip())

        return latitude, longitude
    except ValueError as e:
        # Handle the case where conversion to float fails or input is not as expected
        print(f"Error converting location to coordinates: {e}")
        return None, None


def get_user_id_by_username(cur, username):
    """
    Retrieve the user_id from the database for a given username.

    Parameters:
    cur (MySQLCursor): The cursor object to execute the database query.
    username (str): The username of the user.

    Returns:
    int: The user_id associated with the username, or None if not found.
    """
    try:
        cur.execute("SELECT user_id FROM user WHERE username = %s", [username])
        result = cur.fetchone()
        return result['user_id'] if result else None
    except Exception as e:
        print(f"An error occurred: {e}")
        return None


@app.route("/")
def index():
    """Home page route showing a list of all blog entries."""
    cur = mysql.connection.cursor()
    cur.execute("""
        SELECT r.*, u.username, p.name as poi_name FROM reviews r
        JOIN user u ON r.user_id = u.user_id
        JOIN points_of_interest p ON r.poi_pid = p.poi_pid
        ORDER BY r.posted_on DESC
    """)
    reviews = cur.fetchall()
    cur.close()
    return render_template("index.html", reviews=reviews)


@app.route("/about/")
def about():
    """About page route with application overview, mission, vision, and user testimonials."""
    cur = mysql.connection.cursor()

    # Fetch the average rating by category for all Points of Interest (POIs)
    cur.execute("""
        SELECT c.category_name, AVG(r.rating) AS avg_rating
        FROM reviews r
        JOIN points_of_interest p ON r.poi_pid = p.poi_pid
        JOIN categories c ON p.category_id = c.category_id
        GROUP BY c.category_name
        ORDER BY avg_rating DESC
    """)
    avg_ratings_by_category = cur.fetchall()

    # Ensure we get a value for each category or a placeholder if no ratings
    avg_ratings_by_category = [
        {'category_name': res['category_name'], 
         'avg_rating': res['avg_rating'] if res['avg_rating'] is not None else "No ratings yet"}
        for res in avg_ratings_by_category
    ]

    # Fetch testimonials, for example, from the most popular reviews or blogs
    cur.execute("""
        SELECT b.title, b.body, u.first_name, u.last_name
        FROM blog b
        JOIN user u ON b.username = u.username
        WHERE b.rating >= 4
        ORDER BY b.rating DESC
        LIMIT 5
    """)
    testimonials = cur.fetchall()

    # Fetching some highlighted POIs
    cur.execute("""
        SELECT p.name, p.description
        FROM points_of_interest p
        JOIN reviews r ON p.poi_pid = r.poi_pid
        GROUP BY p.poi_pid
        ORDER BY AVG(r.rating) DESC
        LIMIT 5
    """)
    highlights = cur.fetchall()

    cur.close()
    return render_template(
        "about.html",
        avg_ratings_by_category=avg_ratings_by_category,
        testimonials=testimonials,
        highlights=highlights,
    )


@app.route('/add-poi', methods=['GET', 'POST'])
def add_poi():
    if request.method == 'POST':
        name = request.form['name']
        description = request.form['description']
        category_id = request.form['category_id']
        location = request.form['location']  # Example input: "34.0522, -118.2437"
        latitude, longitude = get_coordinates(location)

        # Retrieve the user_id based on the username from session
        username = session["username"]
        cur = mysql.connection.cursor()
        user_id = get_user_id_by_username(cur, username)


        cur.execute("""
            INSERT INTO points_of_interest (name, description, category_id, location, user_id) 
            VALUES (%s, %s, %s, ST_PointFromText('POINT(%s %s)'), %s)
        """, (name, description, category_id, latitude, longitude, user_id))
        mysql.connection.commit()
        cur.close()
        flash('Point of Interest added successfully!', 'success')
        return redirect(url_for('add_poi'))

    cur = mysql.connection.cursor()
    cur.execute("SELECT category_id, category_name FROM categories")
    categories = cur.fetchall()
    cur.close()

    return render_template('add_poi.html', categories=categories)


@app.route("/map/")
def map():
    """Route to display a map (static or interactive depending on implementation)."""
    return render_template("map.html")


@app.route("/blogs/<int:id>/")
def blogs(id):
    """Route to display a specific blog entry, identified by its ID."""
    cur = mysql.connection.cursor()
    if cur.execute("SELECT * FROM blog WHERE blog_id = %s", (id,)):
        blog = cur.fetchone()
        return render_template("blog.html", blog=blog)
    return "Blog not found"


@app.route("/register/", methods=["GET", "POST"])
def register():
    """Route to handle user registration."""
    if request.method == "POST":
        userDetails = request.form
        if userDetails["password"] != userDetails["confirm_password"]:
            flash("Passwords do not match! Try again.", "danger")
            return render_template("register.html")
        cur = mysql.connection.cursor()
        cur.execute(
            "INSERT INTO user(first_name, last_name, username, email, password) VALUES (%s,%s,%s,%s,%s)",
            (
                userDetails["first_name"],
                userDetails["last_name"],
                userDetails["username"],
                userDetails["email"],
                userDetails["password"],
            ),
        )
        mysql.connection.commit()
        cur.close()
        flash("Registration successful! Please login.", "success")
        return redirect("/login")
    return render_template("register.html")


@app.route("/login/", methods=["GET", "POST"])
def login():
    """Route to handle user login."""
    if request.method == "POST":
        userDetails = request.form
        username = userDetails["username"]
        cur = mysql.connection.cursor()
        if cur.execute("SELECT * FROM user WHERE username = %s", ([username])):
            user = cur.fetchone()
            if userDetails["password"] == user["password"]:
                session["login"] = True
                session["id"] = user["user_id"]
                session["username"] = user["username"]
                session["firstName"] = user["first_name"]
                flash(
                    "Welcome "
                    + session["firstName"]
                    + "! You have been successfully logged in",
                    "success",
                )
            else:
                flash("Password does not match", "danger")
                return render_template("login.html")
        else:
            flash("User not found", "danger")
            return render_template("login.html")
        cur.close()
        return redirect("/")
    return render_template("login.html")


@app.route("/write-review/", methods=["GET", "POST"])
def write_review():
    if request.method == "POST":
        # Retrieve form data
        poi_pid = request.form["poi_pid"]
        comment = request.form["comment"]
        rating = request.form["rating"]
        posted_date = request.form["posted_date"]

        # Retrieve the user_id based on the username from session
        username = session["username"]
        cur = mysql.connection.cursor()
        user_id = get_user_id_by_username(cur, username)

        # Insert the new review into the reviews table
        cur.execute(
            "INSERT INTO reviews(comment, user_id, rating, posted_on, poi_pid) VALUES (%s, %s, %s, %s, %s)",
            (comment, user_id, rating, posted_date, poi_pid)
        )
        mysql.connection.commit()
        cur.close()
        flash("Successfully posted new review", "success")
        return redirect("/")
    else:
        cur = mysql.connection.cursor()
        # Retrieve Points of Interest to populate the dropdown
        cur.execute("SELECT poi_pid, name FROM points_of_interest")
        pois = cur.fetchall()
        cur.close()
        return render_template("write_review.html", pois=pois)


@app.route("/my-blogs/")
def view_reviews():
    """Route for users to view their own blog posts."""
    if not session['login']:
        flash('Please log in to view your blogs.', 'danger')
        return redirect(url_for('login'))

    username = session['username']  # Assuming user_id is stored in the session upon login
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM blog WHERE username = %s", [username])
    my_reviews = cur.fetchall()
    cur.close()

    return render_template("my_blogs.html", my_reviews=my_reviews)


@app.route("/edit-blog/<int:id>/", methods=["GET", "POST"])
def edit_blog(id):
    """Route for users to edit their blog posts."""
    cur = mysql.connection.cursor()
    if request.method == "POST":
        cur.execute(
            "UPDATE blog SET title = %s, body = %s, rating = %s, posted_date = %s WHERE blog_id = %s",
            (
                request.form["title"],
                request.form["body"],
                request.form["rating"],
                request.form["posted_date"],
                id,
            ),
        )
        mysql.connection.commit()
        flash("Blog updated successfully", "success")
        return redirect("/blogs/{}".format(id))
    if cur.execute("SELECT * FROM blog WHERE blog_id = %s", (id,)):
        blog = cur.fetchone()
        return render_template("edit_blog.html", blog_form=blog)
    flash("Blog not found", "danger")
    return redirect("/")


@app.route("/delete-blog/<int:id>/")
def delete_blog(id):
    """Route for users to delete their blog posts."""
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM blog WHERE blog_id = %s", (id,))
    mysql.connection.commit()
    flash("Your blog has been deleted", "success")
    return redirect("/my-reviews")


@app.route("/logout/")
def logout():
    """Route to handle user logout."""
    session.clear()
    flash("You have been logged out", "info")
    return redirect("/")


@app.route("/search", methods=["GET", "POST"])
def search():
    cur = mysql.connection.cursor()
    # Load categories for the form
    cur.execute("SELECT * FROM categories")
    categories = cur.fetchall()

    if request.method == "POST":
        keyword = f"%{request.form.get('keyword', '')}%"
        category = request.form.get("category", "")
        location = request.form.get("location", "")
        sort = request.form.get("sort", "popularity")
        tags = request.form.getlist("tags")

        query_parameters = [keyword, keyword]  # Parameters for LIKE conditions

        query = """
        SELECT 
            p.*, 
            COALESCE(AVG(r.rating), 0) AS average_rating,
            c.category_name AS category_name,
            ST_X(p.location) AS latitude,
            ST_Y(p.location) AS longitude
        FROM points_of_interest p
        LEFT JOIN reviews r ON p.poi_pid = r.poi_pid
        LEFT JOIN categories c ON p.category_id = c.category_id
        WHERE (p.name LIKE %s OR p.description LIKE %s)
        """

        # Add category condition only if a category is selected
        if category:
            query += "AND p.category_id = %s "
            query_parameters.append(category)

        # If tags are selected, modify the query to filter by these tags
        if tags:
            tag_placeholders = ", ".join(["%s"] * len(tags))
            query += f"AND t.tag_id IN ({tag_placeholders}) "
            query_parameters.extend(tags)

        # For location, assuming 'location' input as 'lat,lng'
        if location:
            lat, lng = get_coordinates(location)
            query += "AND ST_Distance_Sphere(p.location, ST_PointFromText('POINT(%s %s)', 4326)) < 10000 "
            query_parameters.extend([lat, lng])

        query += "GROUP BY p.poi_pid "

        # Sorting condition
        if sort == "popularity":
            query += "ORDER BY average_rating DESC"
        else:
            query += "ORDER BY p.posted_date DESC"

        cur.execute(query, query_parameters)
        points_of_interest = cur.fetchall()

        return render_template(
            "search_results.html", points_of_interest=points_of_interest
        )

    # If it's not a POST request, render the search page normally
    return render_template("search.html", categories=categories)


@app.route("/create-event", methods=['GET', 'POST'])
def create_event():
    if request.method == 'POST':
        # Extract the form data
        title = request.form.get('title')
        description = request.form.get('description')
        event_date = request.form.get('event_date')
        location = request.form.get('location')
        # Retrieve the user_id based on the username from session
        username = session["username"]
        cur = mysql.connection.cursor()
        user_id = get_user_id_by_username(cur, username)

        # Insert the new event into the database
        # You may need to get the host's user id based on the username if the events table uses user_id
        cur.execute("INSERT INTO events (title, description, event_date, location, user_id) VALUES (%s, %s, %s, %s, %s)",
                    (title, description, event_date, location, user_id))

        # Commit the transaction
        mysql.connection.commit()

        # Close the cursor
        cur.close()

        # Redirect to the events page, or another success page
        return redirect(url_for('view_events'))

    # If method is GET, render the form page
    return render_template("create_event.html")


@app.route("/edit-event/<int:event_id>", methods=['GET', 'POST'])
def edit_event(event_id):
    # Verify user is logged in and get their username
    if 'username' not in session:
        return redirect(url_for('login'))

    # Get the current user's username
    username = session['username']
    cur = mysql.connection.cursor()
    user_id = get_user_id_by_username(cur, username)

    # Retrieve the event details to pre-populate the form
    if request.method == 'GET':
        cur.execute("""
                    SELECT
                        *
                    FROM events e
                    JOIN user u ON e.user_id = u.user_id
                    WHERE e.event_id = %s AND u.username = %s
                    """, (event_id, username))
        event = cur.fetchone()

        if event is None:
            return "Event not found or you do not have permission to edit this event", 404

        return render_template("edit_event.html", event=event)

    # Update the event details in the database
    if request.method == 'POST':
        title = request.form.get('title')
        description = request.form.get('description')
        event_date = request.form.get('event_date')
        location = request.form.get('location')

        cur.execute("""
                    UPDATE events SET
                        title = %s,
                        description = %s,
                        event_date = %s,
                        location = %s
                    WHERE event_id = %s AND user_id = %s
                    """, (title, description, event_date, location, event_id, user_id))
        mysql.connection.commit()
        cur.close()

        return redirect(url_for('view_events'))


@app.route("/events/")
def view_events():
    cur = mysql.connection.cursor()
    query = """
    SELECT 
        e.event_id,
        e.title,
        e.description,
        e.event_date,
        e.location,
        u.username as host_username
    FROM events e
    JOIN user u ON e.user_id = u.user_id
    ORDER BY e.event_date
    """
    cur.execute(query)
    events = cur.fetchall()
    cur.close()
    return render_template("events.html", events=events)


@app.route("/points_of_interest")
def points_of_interest():
    """Route to display points of interest."""
    cur = mysql.connection.cursor()
    # Assuming 'username' column exists in 'Users' table and it's related to 'Points_of_Interest' via 'user_id'.
    query = """
    SELECT
        poi.poi_pid,
        poi.name,
        poi.description,
        poi.category_id,
        ST_X(poi.location) AS latitude,
        ST_Y(poi.location) AS longitude,
        usr.username,
        ctg.category_name
    FROM Points_of_Interest poi
    JOIN User usr ON poi.user_id = usr.user_id
    JOIN Categories ctg ON poi.category_id = ctg.category_id
    """
    if cur.execute(query):
        points_of_interest = cur.fetchall()
        return render_template(
            "points_of_interest.html", points_of_interest=points_of_interest
        )
    else:
        return "No points of interest found"


@app.route("/categories")
def view_categories():
    """Route to display categories of points of interest."""
    cur = mysql.connection.cursor()
    if cur.execute("SELECT * FROM Categories"):
        categories = cur.fetchall()
        return render_template("categories.html", categories=categories)
    return "No categories found"


if __name__ == "__main__":
    app.run(debug=True)
