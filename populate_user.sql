CREATE TABLE IF NOT EXISTS user(
    user_id int auto_increment,
    first_name varchar(20),
    last_name varchar(20),
    username varchar(20) unique,
    email varchar(30) unique,
    password varchar(100),
    primary key(user_id)
);

-- Generate 50 unique users
INSERT INTO `user` (first_name, last_name, username, email, password) VALUES
('John', 'Doe', 'johndoe', 'johndoe@example.com', 'password1'),
('Jane', 'Smith', 'janesmith', 'janesmith@example.com', 'password2'),
('Michael', 'Johnson', 'michaeljohnson', 'michaeljohnson@example.com', 'password3'),
('Emily', 'Brown', 'emilybrown', 'emilybrown@example.com', 'password4'),
('William', 'Davis', 'williamdavis', 'williamdavis@example.com', 'password5'),
('Olivia', 'Wilson', 'oliviawilson', 'oliviawilson@example.com', 'password6'),
('James', 'Taylor', 'jamestaylor', 'jamestaylor@example.com', 'password7'),
('Sophia', 'Martinez', 'sophiamartinez', 'sophiamartinez@example.com', 'password8'),
('Alexander', 'Anderson', 'alexanderanderson', 'alexanderanderson@example.com', 'password9'),
('Emma', 'Thomas', 'emmathomas', 'emmathomas@example.com', 'password10'),
('Ethan', 'Hernandez', 'ethanhernandez', 'ethanhernandez@example.com', 'password11'),
('Isabella', 'Lopez', 'isabellalopez', 'isabellalopez@example.com', 'password12'),
('Michael', 'Gonzalez', 'michaelgonzalez', 'michaelgonzalez@example.com', 'password13'),
('Ava', 'Perez', 'avaperez', 'avaperez@example.com', 'password14'),
('Mason', 'Rodriguez', 'masonrodriguez', 'masonrodriguez@example.com', 'password15'),
('Sophia', 'Lee', 'sophialee', 'sophialee@example.com', 'password16'),
('William', 'Walker', 'williamwalker', 'williamwalker@example.com', 'password17'),
('Emily', 'Hall', 'emilyhall', 'emilyhall@example.com', 'password18'),
('Alexander', 'Allen', 'alexanderallen', 'alexanderallen@example.com', 'password19'),
('Mia', 'Young', 'miayoung', 'miayoung@example.com', 'password20'),
('Ethan', 'Hernandez', 'ethanhernandez2', 'ethanhernandez2@example.com', 'password21'),
('Chloe', 'Lewis', 'chloelewis', 'chloelewis@example.com', 'password22'),
('Daniel', 'King', 'danielking', 'danielking@example.com', 'password23'),
('Olivia', 'Wright', 'oliviawright', 'oliviawright@example.com', 'password24'),
('Aiden', 'Scott', 'aidenscott', 'aidenscott@example.com', 'password25'),
('Sophia', 'Young', 'sophiayoung', 'sophiayoung@example.com', 'password26'),
('Madison', 'Allen', 'madisonallen', 'madisonallen@example.com', 'password27'),
('Logan', 'Green', 'logangreen', 'logangreen@example.com', 'password28'),
('Abigail', 'Hall', 'abigailhall', 'abigailhall@example.com', 'password29'),
('Jacob', 'Martin', 'jacobmartin', 'jacobmartin@example.com', 'password30'),
('Ava', 'Harris', 'avaharris', 'avaharris@example.com', 'password31'),
('Michael', 'Clark', 'michaelclark', 'michaelclark@example.com', 'password32'),
('Emily', 'Gonzalez', 'emilygonzalez', 'emilygonzalez@example.com', 'password33'),
('Matthew', 'Young', 'matthewyoung', 'matthewyoung@example.com', 'password34'),
('Charlotte', 'Baker', 'charlottebaker', 'charlottebaker@example.com', 'password35'),
('Noah', 'Nelson', 'noahnelson', 'noahnelson@example.com', 'password36'),
('Amelia', 'Carter', 'ameliacarter', 'ameliacarter@example.com', 'password37'),
('Elijah', 'Mitchell', 'elijahmitchell', 'elijahmitchell@example.com', 'password38'),
('Evelyn', 'Hernandez', 'evelynhernandez', 'evelynhernandez@example.com', 'password39'),
('Liam', 'Walker', 'liamwalker', 'liamwalker@example.com', 'password40'),
('Oliver', 'Young', 'oliveryoung', 'oliveryoung@example.com', 'password41'),
('Sophia', 'Cook', 'sophiacook', 'sophiacook@example.com', 'password42'),
('Charlotte', 'Barnes', 'charlottebarnes', 'charlottebarnes@example.com', 'password43'),
('James', 'Mitchell', 'jamesmitchell', 'jamesmitchell@example.com', 'password44'),
('Ava', 'Lewis', 'avalewis', 'avalewis@example.com', 'password45'),
('William', 'White', 'williamwhite', 'williamwhite@example.com', 'password46'),
('Emily', 'Baker', 'emilybaker', 'emilybaker@example.com', 'password47'),
('Ethan', 'Carter', 'ethancarter', 'ethancarter@example.com', 'password48'),
('Isabella', 'Adams', 'isabellaadams', 'isabellaadams@example.com', 'password49'),
('Olivia', 'Turner', 'oliviaturner', 'oliviaturner@example.com', 'password50');


