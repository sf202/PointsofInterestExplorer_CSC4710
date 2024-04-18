CREATE TABLE IF NOT EXISTS points_of_interest(
    poi_pid INT AUTO_INCREMENT,
    name VARCHAR(255),
    description TEXT,
    category_id INT,
    location POINT,
    user_id INT,
    PRIMARY KEY(poi_pid),
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Assuming category_id 1 is 'Nature', 2 is 'Historical Sites', and 3 is 'Amusement Parks'
-- Assuming there are valid users with user_id from 1 to 5
INSERT INTO points_of_interest (name, description, category_id, location, user_id) VALUES
('Georgia Aquarium', 'One of the largest aquariums in the world, featuring a wide variety of marine life.', 3, POINT(33.7634, -84.3951), 1),
('Centennial Olympic Park', 'A 22-acre public park located in downtown Atlanta, created by the Atlanta Committee for the Olympic Games.', 1, POINT(33.7609, -84.3930), 2),
('Atlanta Botanical Garden', 'A 30-acre botanical garden located adjacent to Piedmont Park in Midtown Atlanta.', 1, POINT(33.7904, -84.3728), 3),
('Martin Luther King Jr. National Historic Site', 'A collection of buildings including Martin Luther King Jr.''s boyhood home and the original Ebenezer Baptist Church.', 2, POINT(33.7555, -84.3736), 4),
('World of Coca-Cola', 'A museum showcasing the history of The Coca-Cola Company including its well-known advertising as well as a host of entertainment areas and attractions.', 3, POINT(33.7629, -84.3926), 5),
('Six Flags Over Georgia', 'A major amusement park featuring many rides and attractions.', 3, POINT(33.75524463218406, -84.4475594589887), 3),
('Ebenezer Baptist Church', 'The historic church where Martin Luther King, Jr. was co-pastor.', 2, POINT(33.76746493549025, -84.36359627873266), 5),
('Piedmont Park', 'A lush green park in the heart of Midtown, offering walking trails, picnic facilities, and a dog park.', 1, POINT(33.7090675897689, -84.40613902207603), 3),
('LEGOLAND Discovery Center', 'Indoor family attraction chain with play areas and rides.', 3, POINT(33.73013690913665, -84.36340958008834), 1),
('Atlanta History Center', 'Museum housing exhibitions on Southern history and the 1996 Olympics.', 2, POINT(33.78196285338474, -84.44271901547002), 3),
('Kennesaw Mountain', 'A historical battlefield site with hiking trails and scenic views.', 1, POINT(33.760658762536714, -84.43088738735894), 3),
('Swan House', 'Historic 1928 mansion and museum set on the grounds of the Atlanta History Center.', 2, POINT(33.738509438569686, -84.43762954448307), 1),
('Chattahoochee River', 'Recreational area along a river offering fishing, boating, and riverside trails.', 1, POINT(33.78468998275057, -84.40555498052484), 4),
('Silver Comet Trail', 'A scenic trail built on abandoned railroad lines, perfect for biking and jogging.', 1, POINT(33.76965320248302, -84.37916363928771), 2),
('Margaret Mitchell House', 'The apartment where the author wrote "Gone with the Wind."', 2, POINT(33.709237919787995, -84.35699020290579), 1),
('Children''s Museum of Atlanta', 'Interactive exhibits aimed at children''s education through play.', 3, POINT(33.73012946317963, -84.42478883187525), 1),
('SkyView Atlanta', 'A 20-story Ferris wheel offering panoramic views of the city.', 3, POINT(33.77401375741306, -84.43164271368502), 4),
('Stone Mountain Park', 'A vast park surrounding a quartz monzonite dome with historic carvings.', 1, POINT(33.77556399928722, -84.3661863454186), 4),
('Fox Theatre', 'Historic theater with opulent interiors offering live entertainment and film events.', 2, POINT(33.77147394275667, -84.39567903036004), 2),
('Zoo Atlanta', 'Large zoo known for its gorillas and giant pandas.', 3, POINT(33.798339222695475, -84.44781173320702), 2),
('Historic Downtown Savannah', 'a National Historic Landmark District and is one of the largest urban historic preservation districts in the United States.', 2, POINT(32.0843641530001, -81.09583828), 6);
