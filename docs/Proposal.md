# Description:

We intend to build a points of interest (POI) explorer that allows users to discover, rate, and discuss parks, historical sites, and other significant landmarks within a specific city-region. Our proposed web application would serve as a centralized hub of landmark related information by utilizing open-source data to populate comprehensive listings. The existence of such a repository encourages both tourism and community engagement from residents as users' discoveries foster a sense of connection, city-identity, exploration, and boost the local economy. In short, the platform will engage residents and tourists while also promoting economic activity in a city-region.   

As previously mentioned, the application will utilize open-source data which ensures that all content is freely accessible and reusable. In particular, data sets from OpenStreetMap, Wikimedia Commons, and various government / public domains will be used. Unlike alternative platforms / services such as Google Maps, which primarily serves as a mapping platform, or Yelp, which is primarily for crowd-sourced reviews about commercial businesses such as restaurants, our platform will primarily focus on community engagement and detailed exploration of sites through user-contributed stories, historical facts, and personal recommendations. The biggest difference between our proposed platform and services like Google or Yelp is the intended audience and the why. In our case, we are first serving tourists & residents with public and historically significant landmarks as the focus of the application, not commercial restaurants (Yelp) or mainly functioning as a general-purpose mapping application (Google Maps).

# Functionality

### Basic Functions:

- User account registration and management:
    - Allow users to register by providing necessary details such as username, email, and password.
    - Implement functionality to insert these submitted details into the database.
    - Develop functionality for users to manage their accounts, including options to update personal information or delete their account if desired.
- Posting and editing of local attractions by registered users
    - Implement an editing feature that allows users to update information about attractions they have posted.
- Browsing and searching for attractions by category, location, or popularity
    - Implement a search functionality allowing users to find attractions based on keywords, category, or location.
- User reviews and ratings for attractions
    - By joining the POI and Reviews tables on their user id, we can retrieve POI names alongside their corresponding average ratings based on user reviews.
    - In proposing to assess the overall user satisfaction level, we aim to calculate the average rating across all attractions, utilizing the average function on the ratings column within the reviews table.
    - Enable users with appropriate permissions to delete records, such as attractions or user reviews.

### Advanced Functions:

- Implementing an innovative tagging system for Points of Interest (POIs) that not only accommodates user-generated tags and standard categories but also offers advanced filtering options, allowing for more nuanced searches like "kid-friendly" or "great for photography," thereby enriching the user's exploration and interaction with the platform.
- Allow users to share their favorite attractions and reviews on social media platforms. Integration with social media APIs enables seamless sharing and increases user engagement.
- Implement a content moderation system to ensure the quality and appropriateness of user-generated content, such as reviews and photos.

# ER Diagram + Assumptions

### ER Diagram:

The ER diagram will detail entities such as Users, Attractions, Reviews, Categories, and Events. It will illustrate relationships like Users posting Attractions, Attractions belonging to Categories, Users creating and attending Events, and Users writing Reviews for Attractions.

**Entities:**

1. **Users:** Individuals who interact with the platform.
    - Attributes: user_id (primary key), username, email, password.
2. **POIs (Points of Interest):** The various attractions or places of interest.
    - Attributes: poi_pid (primary key), name, description, category_id (foreign key), location (latitude and longitude), user_id (foreign key to indicate who submitted the POI).
3. **Categories:** Types of POIs, such as parks, museums, or historical sites.
    - Attributes: category_id (primary key), category_name, description
4. **Reviews:** Feedback or comments left by users for a specific POI.
    - Attributes: ReviewID (primary key), POIID (foreign key), UserID (foreign key), Rating, Comment, DatePosted.
5. **Events:** Activities or meetups planned by users related to visiting POIs.
    - Attributes: EventID (primary key), Title, Description, EventDate, Location, UserID (foreign key to indicate the organizer).

**Relationships:**

- **Users to POIs:** One-to-Many. A user can submit multiple POIs, but each POI is submitted by one user.
- **Users to Reviews:** One-to-Many. A user can write multiple reviews, but each review is written by one user.
- **POIs to Categories:** Many-to-One. Multiple POIs can belong to a single category.
- **POIs to Reviews:** One-to-Many. A POI can have multiple reviews, but each review is associated with one POI.
- **Users to Events:** One-to-Many. A user can organize multiple events, but each event is organized by one user.

### Assumptions:

- POIs are verifiable through open-source datasets.
- User contributions (reviews, stories, tags) are moderated to ensure quality and relevance.
- The platform encourages active community participation, assuming users are motivated to share their local knowledge and experiences.
