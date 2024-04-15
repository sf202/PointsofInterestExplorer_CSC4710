CREATE TABLE poi_tags (
    poi_id INT NOT NULL,
    tag_id INT AUTO_INCREMENT,
    PRIMARY KEY (poi_id, tag_id),
    FOREIGN KEY (poi_id) REFERENCES points_of_interest(poi_pid),
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
);

