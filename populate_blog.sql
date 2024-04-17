CREATE TABLE IF NOT EXISTS blog(blog_id int auto_increment, title varchar(100),
username varchar(40), body varchar(1000), primary key(blog_id), rating int, posted_date date);

-- Insert additional reviews for national parks in Georgia
INSERT INTO `blog` (`title`, `username`, `body`, `rating`, `posted_date`)
VALUES
    ('Exploring Amicalola Falls State Park', 'charlottebaker', 'Amicalola Falls State Park offers breathtaking views and hiking trails. A perfect getaway for nature enthusiasts.', 5, '2024-03-23'),
    ('Wildlife Spotting at George L. Smith State Park', 'noahnelson', 'George L. Smith State Park is a haven for wildlife spotting. Saw deer, rabbits, and various bird species during my visit.', 4, '2024-03-23'),
    ('Family Camping at Fort McAllister Historic Park', 'ameliacarter', 'Fort McAllister Historic Park is ideal for family camping trips. The historic ambiance adds a unique charm to the camping experience.', 5, '2024-03-23'),
    ('Scenic Views at Providence Canyon State Park', 'elijahmitchell', 'Providence Canyon State Park offers stunning scenic views and unique geological formations. A photographer''s paradise!', 5, '2024-03-23'),
    ('Relaxing Picnic at Red Top Mountain State Park', 'evelynhernandez', 'Red Top Mountain State Park is a serene location for a relaxing picnic. The lakefront picnic areas are picturesque.', 4, '2024-03-23'),
    ('Bird Watching Paradise at Skidaway Island State Park', 'liamwalker', 'Skidaway Island State Park is a bird watching paradise. Saw rare species and enjoyed the coastal scenery.', 5, '2024-03-23'),
    ('Historic Exploration at Fort Yargo State Park', 'oliveryoung', 'Explored the historic sites at Fort Yargo State Park. The preserved structures offer a glimpse into the region''s past.', 4, '2024-03-23'),
    ('Fishing Fun at Smithgall Woods State Park', 'charlottebarnes', 'Smithgall Woods State Park is a great spot for fishing enthusiasts. The creek is stocked with trout, providing a fun fishing experience.', 5, '2024-03-23'),
    ('Nature Walks at Tallulah Gorge State Park', 'jamesmitchell', 'Took leisurely nature walks at Tallulah Gorge State Park. The lush greenery and waterfalls create a tranquil environment.', 4, '2024-03-23'),
    ('Stargazing Night at Cloudland Canyon State Park', 'avalewis', 'Cloudland Canyon State Park offers a mesmerizing stargazing experience. The clear skies make it perfect for observing celestial objects.', 5, '2024-03-23'),
    ('River Kayaking at Okefenokee Swamp', 'williamwhite', 'Enjoyed river kayaking at Okefenokee Swamp. The swamp''s unique ecosystem and wildlife sightings made the trip memorable.', 4, '2024-03-23'),
    ('Hiking Adventures at Vogel State Park', 'emilybaker', 'Embarked on exciting hiking adventures at Vogel State Park. The trails offer varying difficulty levels suitable for all hikers.', 5, '2024-03-23'),
    ('Exploring Moccasin Creek State Park', 'ethancarter', 'Explored the serene landscapes of Moccasin Creek State Park. A peaceful retreat away from the hustle and bustle of city life.', 4, '2024-03-23'),
    ('Mountain Views at Black Rock Mountain State Park', 'isabellaadams', 'Black Rock Mountain State Park offers panoramic mountain views. A great spot for nature enthusiasts and photographers.', 5, '2024-03-23'),
    ('Camping Bliss at Chattahoochee National Forest', 'oliviaturner', 'Experienced camping bliss at Chattahoochee National Forest. The forest''s tranquility and starry nights create a magical atmosphere.', 5, '2024-03-23'),
    ('Wildlife Encounters at Richard B. Russell State Park', 'aidenscott', 'Encountered diverse wildlife at Richard B. Russell State Park. Saw deer, raccoons, and several bird species during my visit.', 4, '2024-03-23'),
    ('Family Fun Day at Unicoi State Park', 'sophiacook', 'Had a fun-filled family day at Unicoi State Park. The park offers activities for all ages, from hiking to paddle boating.', 5, '2024-03-23'),
    ('Nature Photography at Panola Mountain State Park', 'charlottebaker', 'Captured stunning nature photographs at Panola Mountain State Park. The park''s diverse landscapes provide ample photography opportunities.', 4, '2024-03-23'),
    ('Biking Trails at Stephen C. Foster State Park', 'jamesmitchell', 'Explored the biking trails at Stephen C. Foster State Park. The trails offer scenic views and a challenging ride for bikers.', 5, '2024-03-23'),
    ('Waterfall Views at Tugaloo State Park', 'avalewis', 'Enjoyed beautiful waterfall views at Tugaloo State Park. The cascading water and lush surroundings create a picturesque setting.', 4, '2024-03-23'),
    ('Historic Exploration at Fort Mountain State Park', 'williamwhite', 'Delved into the historic sites at Fort Mountain State Park. The ancient stone wall and tower offer a glimpse into the past.', 5, '2024-03-23'),
    ('Fishing Adventures at Reed Bingham State Park', 'emilybaker', 'Embarked on fishing adventures at Reed Bingham State Park. The lake is teeming with various fish species, making it a great spot for anglers.', 4, '2024-03-23');
-- Insert reviews for national parks in Georgia for the provided users
INSERT INTO `blog` (`title`, `username`, `body`, `rating`, `posted_date`)
VALUES
    ('Exploring Chattahoochee National Forest', 'John Doe', 'Had an amazing experience exploring Chattahoochee National Forest. The views were breathtaking!', 5, '2024-03-23'),
    ('Hiking Trails at Tallulah Gorge State Park', 'Jane Smith', 'The hiking trails at Tallulah Gorge State Park were challenging yet rewarding. A must-visit for nature lovers!', 4, '2024-03-23'),
    ('Camping at Fort Mountain State Park', 'Michael Johnson', 'Spent a weekend camping at Fort Mountain State Park. The campground facilities were excellent and the scenery was beautiful.', 4, '2024-03-23'),
    ('Bird Watching at Okefenokee Swamp', 'Emily Brown', 'Okefenokee Swamp is a paradise for bird watchers. Saw numerous species in their natural habitat.', 5, '2024-03-23'),
    ('Wildlife Encounter at Providence Canyon State Park', 'William Davis', 'Had a close wildlife encounter at Providence Canyon State Park. The park rangers were knowledgeable and ensured our safety.', 4, '2024-03-23'),
    ('Picnic at Vogel State Park', 'Olivia Wilson', 'Enjoyed a lovely picnic at Vogel State Park. The serene lake and surrounding mountains created a perfect backdrop.', 5, '2024-03-23'),
    ('Nature Photography at Cloudland Canyon State Park', 'James Taylor', 'Cloudland Canyon State Park offers stunning landscapes for nature photography enthusiasts. Captured some breathtaking shots!', 5, '2024-03-23'),
    ('Family Fun at Amicalola Falls State Park', 'Sophia Martinez', 'Amicalola Falls State Park is perfect for a family outing. The kids loved exploring the trails and playing by the waterfalls.', 4, '2024-03-23'),
    ('Adventure at Red Top Mountain State Park', 'Alexander Anderson', 'Had an adventurous day at Red Top Mountain State Park. The trails were well-marked and the lake activities were enjoyable.', 4, '2024-03-23'),
    ('Relaxing Day at Moccasin Creek State Park', 'Emma Thomas', 'Spent a relaxing day at Moccasin Creek State Park. The peaceful surroundings and lake views were rejuvenating.', 5, '2024-03-23'),
    ('Scenic Drive at Black Rock Mountain State Park', 'Ethan Hernandez', 'Took a scenic drive through Black Rock Mountain State Park. The overlooks provided panoramic views of the mountains and valleys.', 5, '2024-03-23'),
    ('Nature Trails at George L. Smith State Park', 'Isabella Lopez', 'George L. Smith State Park has well-maintained nature trails that showcase the beauty of Georgia''s natural landscapes.', 4, '2024-03-23'),
    ('Historical Sites at Fort McAllister Historic Park', 'Michael Gonzalez', 'Explored the historical sites at Fort McAllister Historic Park. A fascinating glimpse into Georgia''s past.', 4, '2024-03-23'),
    ('Fishing at Richard B. Russell State Park', 'Ava Perez', 'Had a great day fishing at Richard B. Russell State Park. The lake is well-stocked, and the fishing pier is convenient.', 5, '2024-03-23'),
    ('Sunset Views at Smithgall Woods State Park', 'Mason Rodriguez', 'Witnessed stunning sunset views at Smithgall Woods State Park. A peaceful and serene location for nature enthusiasts.', 5, '2024-03-23'),
    ('Wildflowers at Tallulah Gorge State Park', 'Sophia Lee', 'Tallulah Gorge State Park is a paradise for wildflower enthusiasts. The diversity of flora is simply amazing.', 4, '2024-03-23'),
    ('Ranger-led Programs at Skidaway Island State Park', 'William Walker', 'Participated in ranger-led programs at Skidaway Island State Park. Educational and fun experience for visitors of all ages.', 5, '2024-03-23'),
    ('Fall Foliage at Unicoi State Park', 'Emily Hall', 'Visited Unicoi State Park during the fall season. The foliage colors were spectacular, making it a memorable trip.', 5, '2024-03-23'),
    ('Mountain Biking at Fort Yargo State Park', 'Alexander Allen', 'Fort Yargo State Park has excellent trails for mountain biking enthusiasts. The terrain offers a good mix of challenges.', 4, '2024-03-23'),
    ('Campfire Stories at Stephen C. Foster State Park', 'Mia Young', 'Gathered around a campfire at Stephen C. Foster State Park and shared stories under the starry sky. A magical experience!', 5, '2024-03-23'),
    ('Stargazing at Hard Labor Creek State Park', 'Ethan Hernandez', 'Hard Labor Creek State Park is a great spot for stargazing. The clear night sky offers amazing views of the stars and constellations.', 5, '2024-03-23'),
    ('Nature Walk at Black Rock Mountain State Park', 'Chloe Lewis', 'Took a peaceful nature walk at Black Rock Mountain State Park. The trails are well-maintained and offer beautiful vistas.', 4, '2024-03-23'),
    ('Canoeing at George L. Smith State Park', 'Daniel King', 'Enjoyed a day of canoeing at George L. Smith State Park. The calm waters and scenic surroundings made it a relaxing experience.', 5, '2024-03-23'),
    ('Bird Watching at Reed Bingham State Park', 'Olivia Wright', 'Reed Bingham State Park is a bird watcher''s paradise. Saw a variety of bird species in their natural habitat.', 4, '2024-03-23'),
    ('Family Picnic at Tugaloo State Park', 'Aiden Scott', 'Had a fun family picnic at Tugaloo State Park. The picnic areas are well-equipped, and the lake views are stunning.', 5, '2024-03-23'),
    ('Wildlife Photography at Panola Mountain State Park', 'Sophia Young', 'Captured some amazing wildlife photographs at Panola Mountain State Park. The park is home to diverse flora and fauna.', 5, '2024-03-23'),
    ('Fishing Expedition at Red Top Mountain State Park', 'Madison Allen', 'Embarked on a fishing expedition at Red Top Mountain State Park. Caught some impressive fish and enjoyed the outdoors.', 4, '2024-03-23'),
    ('Trail Running at Fort Yargo State Park', 'Logan Green', 'Fort Yargo State Park offers great trails for trail running enthusiasts. The varied terrain adds to the challenge.', 4, '2024-03-23');

INSERT INTO `blog` (`title`, `username`, `body`, `rating`, `posted_date`)
VALUES
    ('Serenity at Chattahoochee National Forest', 'johndoe', 'Found serenity amidst nature at Chattahoochee National Forest. The peaceful ambiance and lush greenery were truly rejuvenating.', 5, '2024-03-23'),
    ('Tranquil Camping at Vogel State Park', 'johndoe', 'Enjoyed a tranquil camping experience at Vogel State Park. The campground amenities and lake views made it a memorable trip.', 4, '2024-03-23'),
    ('Bird Watching Delight at Okefenokee Swamp', 'johndoe', 'Experienced a bird watching delight at Okefenokee Swamp. Witnessed rare bird species and immersed in the swamp''s unique ecosystem.', 5, '2024-03-23'),
    ('Hiking Adventures at Tallulah Gorge State Park', 'johndoe', 'Embarked on thrilling hiking adventures at Tallulah Gorge State Park. The challenging trails and stunning waterfalls made it an unforgettable experience.', 4, '2024-03-23'),
    ('Nature''s Beauty at Black Rock Mountain State Park', 'johndoe', 'Captivated by nature''s beauty at Black Rock Mountain State Park. The panoramic views and diverse flora and fauna are a photographer''s dream.', 5, '2024-03-23');


INSERT INTO `blog` (`title`, `username`, `body`, `rating`, `posted_date`)
VALUES
    ('Exploring Savannah Historic District', 'johndoe', 'Had a wonderful time exploring the charming streets and historic buildings in Savannah Historic District. The architecture and ambiance are truly captivating.', 5, '2024-03-23'),
    ('Visiting Georgia Aquarium', 'johndoe', 'Visited Georgia Aquarium and was amazed by the diverse marine life on display. The exhibits are educational and visually stunning.', 4, '2024-03-23'),
    ('Adventures at Stone Mountain Park', 'johndoe', 'Had thrilling adventures at Stone Mountain Park. From hiking to scenic railway rides, there''s something for everyone.', 5, '2024-03-23'),
    ('Touring CNN Studio in Atlanta', 'johndoe', 'Took a tour of the CNN Studio in Atlanta and gained insights into the world of news broadcasting. An interesting and informative experience.', 4, '2024-03-23'),
    ('Exploring Callaway Gardens', 'johndoe', 'Explored the beautiful gardens and outdoor activities at Callaway Gardens. The botanical displays and recreational options make it a perfect day trip.', 5, '2024-03-23');
