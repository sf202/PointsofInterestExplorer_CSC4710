from flask import Flask, render_template, request, redirect, session, flash
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


@app.route('/')
def index():
    """Home page route showing a list of all blog entries."""
    cur = mysql.connection.cursor()
    if cur.execute("SELECT * FROM blog"):
        blogs = cur.fetchall()
        cur.close()
        return render_template('index.html', blogs=blogs)
    cur.close()
    return render_template('index.html', blogs=None)

@app.route('/about/')
def about():
    """About page route showing average ratings and joining data from multiple tables."""
    cur = mysql.connection.cursor()
    cur.execute("SELECT AVG(rating) AS avg_rating FROM blog")
    avg_rating_result = cur.fetchone()
    avg_rating = avg_rating_result['avg_rating'] if avg_rating_result['avg_rating'] else 0

    cur.execute("""
        SELECT u.first_name AS firstname, b.body AS blog_body, e.user_id AS event_userid
        FROM user u
        LEFT JOIN blog b ON u.user_id = b.author
        LEFT JOIN events e ON u.user_id = e.user_id
    """)
    join_results = cur.fetchall()
    cur.close()
    return render_template('about.html', avg_rating=avg_rating, join_results=join_results)

@app.route('/map/')
def map():
    """Route to display a map (static or interactive depending on implementation)."""
    return render_template('map.html')

@app.route('/blogs/<int:id>/')
def blogs(id):
    """Route to display a specific blog entry, identified by its ID."""
    cur = mysql.connection.cursor()
    if cur.execute("SELECT * FROM blog WHERE blog_id = %s", (id,)):
        blog = cur.fetchone()
        return render_template('blog.html', blog=blog)
    return 'Blog not found'

@app.route('/register/', methods=['GET', 'POST'])
def register():
    """Route to handle user registration."""
    if request.method == 'POST':
        userDetails = request.form
        if userDetails['password'] != userDetails['confirm_password']:
            flash('Passwords do not match! Try again.', 'danger')
            return render_template('register.html')
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO user(first_name, last_name, username, email, password) VALUES (%s,%s,%s,%s,%s)",
                    (userDetails['first_name'], userDetails['last_name'],
                     userDetails['username'], userDetails['email'], userDetails['password']))
        mysql.connection.commit()
        cur.close()
        flash('Registration successful! Please login.', 'success')
        return redirect('/login')
    return render_template('register.html')

@app.route('/login/', methods=['GET', 'POST'])
def login():
    """Route to handle user login."""
    if request.method == 'POST':
        userDetails = request.form
        username = userDetails['username']
        cur = mysql.connection.cursor()
        if cur.execute("SELECT * FROM user WHERE username = %s", ([username])):
            user = cur.fetchone()
            if userDetails['password'] == user['password']:
                session['login'] = True
                session['firstName'] = user['first_name']
                session['lastName'] = user['last_name']
                flash('Welcome ' + session['firstName'] + '! You have been successfully logged in', 'success')
            else:
                flash('Password does not match', 'danger')
                return render_template('login.html')
        else:
            flash('User not found', 'danger')
            return render_template('login.html')
        cur.close()
        return redirect('/')
    return render_template('login.html')

@app.route('/write-blog/', methods=['GET', 'POST'])
def write_blog():
    """Route for users to write and submit new blog posts."""
    if request.method == 'POST':
        blogpost = request.form
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO blog(title, body, author, rating, posted_date) VALUES (%s, %s, %s, %s, %s)",
                    (blogpost['title'], blogpost['body'], session['firstName'] + ' ' + session['lastName'],
                     blogpost['rating'], blogpost['posted_date']))
        mysql.connection.commit()
        cur.close()
        flash("Successfully posted new blog", 'success')
        return redirect('/')
    return render_template('write_blog.html')

@app.route('/my-blogs/')
def view_blogs():
    """Route for users to view their own blog posts."""
    cur = mysql.connection.cursor()
    if cur.execute("SELECT * FROM blog WHERE author = %s", [session['firstName'] + ' ' + session['lastName']]):
        my_blogs = cur.fetchall()
        return render_template('my_blogs.html', my_blogs=my_blogs)
    return render_template('my_blogs.html', my_blogs=None)

@app.route('/edit-blog/<int:id>/', methods=['GET', 'POST'])
def edit_blog(id):
    """Route for users to edit their blog posts."""
    cur = mysql.connection.cursor()
    if request.method == 'POST':
        cur.execute("UPDATE blog SET title = %s, body = %s, rating = %s, posted_date = %s WHERE blog_id = %s",
                    (request.form['title'], request.form['body'], request.form['rating'],
                     request.form['posted_date'], id))
        mysql.connection.commit()
        flash('Blog updated successfully', 'success')
        return redirect('/blogs/{}'.format(id))
    if cur.execute("SELECT * FROM blog WHERE blog_id = %s", (id,)):
        blog = cur.fetchone()
        return render_template('edit_blog.html', blog_form=blog)
    flash('Blog not found', 'danger')
    return redirect('/')

@app.route('/delete-blog/<int:id>/')
def delete_blog(id):
    """Route for users to delete their blog posts."""
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM blog WHERE blog_id = %s", (id,))
    mysql.connection.commit()
    flash("Your blog has been deleted", 'success')
    return redirect('/my-blogs')

@app.route('/logout/')
def logout():
    """Route to handle user logout."""
    session.clear()
    flash("You have been logged out", 'info')
    return redirect('/')

@app.route('/search', methods=['GET', 'POST'])
def search():
    """Route for searching users by username."""
    if request.method == 'POST':
        username = request.form['username']
        cur = mysql.connection.cursor()
        if cur.execute("SELECT first_name, last_name, email FROM user WHERE username = %s", (username,)):
            user_info = cur.fetchone()
            return render_template('search_results.html', user_info=user_info)
        flash('User not found', 'danger')
    return render_template('search.html')

@app.route('/events/')
def view_events():
    """Route to display events."""
    cur = mysql.connection.cursor()
    if cur.execute("SELECT * FROM Events"):
        events = cur.fetchall()
        return render_template('events.html', events=events)
    return 'No events found'

@app.route('/points_of_interest')
def points_of_interest():
    """Route to display points of interest."""
    cur = mysql.connection.cursor()
    if cur.execute("SELECT * FROM Points_of_Interest"):
        points_of_interest = cur.fetchall()
        return render_template('points_of_interest.html', points_of_interest=points_of_interest)
    return 'No points of interest found'

@app.route('/categories')
def view_categories():
    """Route to display categories of points of interest."""
    cur = mysql.connection.cursor()
    if cur.execute("SELECT * FROM Categories"):
        categories = cur.fetchall()
        return render_template('categories.html', categories=categories)
    return 'No categories found'

if __name__ == '__main__':
    app.run(debug=True)
