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
('Georgia Aquarium', 'One of the largest aquariums in the world, featuring a wide variety of marine life.', 3, POINT(-84.3951, 33.7634), 1),
('Centennial Olympic Park', 'A 22-acre public park located in downtown Atlanta, created by the Atlanta Committee for the Olympic Games.', 1, POINT(-84.3930, 33.7609), 2),
('Atlanta Botanical Garden', 'A 30-acre botanical garden located adjacent to Piedmont Park in Midtown Atlanta.', 1, POINT(-84.3728, 33.7904), 3),
('Martin Luther King Jr. National Historic Site', 'A collection of buildings including Martin Luther King Jr.''s boyhood home and the original Ebenezer Baptist Church.', 2, POINT(-84.3736, 33.7555), 4),
('World of Coca-Cola', 'A museum showcasing the history of The Coca-Cola Company including its well-known advertising as well as a host of entertainment areas and attractions.', 3, POINT(-84.3926, 33.7629), 5);
