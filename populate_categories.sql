CREATE TABLE IF NOT EXISTS categories(
    category_id INT AUTO_INCREMENT,
    category_name VARCHAR(255),
    description TEXT,
    PRIMARY KEY(category_id)
);

INSERT INTO categories (category_name, description) VALUES
('Nature', 'Points of interest related to natural attractions and outdoor activities'),
('Historical Sites', 'Points of interest showcasing historical landmarks and monuments'),
('Amusement Parks', 'Points of interest offering amusement and entertainment');
