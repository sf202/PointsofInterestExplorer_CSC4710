CREATE TABLE IF NOT EXISTS events(
    event_id INT AUTO_INCREMENT,
    user_id INT,
    title VARCHAR(255),
    description TEXT,
    event_date DATE,
    location VARCHAR(255),
    PRIMARY KEY(event_id)
);

INSERT INTO events (user_id, title, description, event_date, location) VALUES
(1, 'Annual Flower Show', 'Join us for the annual flower show showcasing Georgia\'s native plants and beautiful gardens.', '2024-05-15', 'Atlanta Botanical Garden'),
(2, 'Hiking Adventure at Stone Mountain', 'Explore the scenic trails and breathtaking views at Stone Mountain Park.', '2024-06-20', 'Stone Mountain Park'),
(3, 'Music Festival in Piedmont Park', 'Enjoy live music performances, food trucks, and family-friendly activities at Piedmont Park.', '2024-07-10', 'Piedmont Park'),
(4, 'Historic Savannah Tour', 'Take a guided tour through Savannah\'s historic district and learn about its rich history and architecture.', '2024-08-05', 'Savannah, GA'),
(5, 'Georgia Aquarium Dolphin Encounter', 'Experience a close encounter with dolphins at the renowned Georgia Aquarium.', '2024-09-15', 'Georgia Aquarium');
