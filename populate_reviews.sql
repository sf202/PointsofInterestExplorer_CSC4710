CREATE TABLE IF NOT EXISTS reviews(
    review_pid INT AUTO_INCREMENT,
    poi_pid INT,
    user_id INT,
    rating INT,
    comment TEXT,
    posted_on DATE,
    PRIMARY KEY(review_pid),
    FOREIGN KEY (poi_pid) REFERENCES points_of_interest(poi_pid),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Insert sample reviews for points of interest
INSERT INTO reviews (poi_pid, user_id, rating, comment, posted_on) VALUES
(1, 1, 5, 'An amazing experience with diverse marine life and interactive exhibits.', '2024-04-01'),
(1, 2, 4, 'Educational and fun for the family, though it was quite crowded.', '2024-04-02'),
(2, 3, 5, 'Beautiful park right in the heart of the city, loved the Olympic rings fountain.', '2024-04-03'),
(3, 4, 5, 'The garden lights event was magical, a must-visit during the holiday season.', '2024-04-04'),
(4, 5, 4, 'Inspirational visit to the home of MLK, well preserved and informative.', '2024-04-05'),
(5, 1, 4, 'Interesting to learn about the history of Coca-Cola, but a bit too commercialized.', '2024-04-06');
