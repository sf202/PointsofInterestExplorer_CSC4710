CREATE TABLE tags (
    tag_id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE NOT NULL
);

-- Inserting into the tags table
INSERT INTO tags (tag_name) VALUES
('family-friendly'),
('free-entry'),
('nature-lovers'),
('historical-significance'),
('photography'),
('pet-friendly'),
('guided-tours-available'),
('kid-friendly'),
('great-for-photography'),
('scenic-views'),
('museum-lovers'),
('aquarium'),
('park'),
('garden'),
('national-park');

