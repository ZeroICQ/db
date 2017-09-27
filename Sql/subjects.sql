CONNECT "..\students.fdb";

CREATE TABLE subjects(
    id       INTEGER,
    name     VARCHAR(255),
    group_id INTEGER
);

INSERT INTO subjects VALUES (1, 'Language Arts', 1);
INSERT INTO subjects VALUES (2, 'Mathematics', 5);
INSERT INTO subjects VALUES (3, 'Science', 3);
INSERT INTO subjects VALUES (4, 'Health', 1);
INSERT INTO subjects VALUES (5, 'Handwriting', 1);
INSERT INTO subjects VALUES (6, 'Physical Education (P.E.)', 2);
INSERT INTO subjects VALUES (7, 'Art', 4);
INSERT INTO subjects VALUES (8, 'Music', 2);
INSERT INTO subjects VALUES (9, 'Movement or Eurythmy', 1);
INSERT INTO subjects VALUES (10, 'Handwork or handcrafts', 5);
INSERT INTO subjects VALUES (11, 'Life Lab or gardening', 5);
INSERT INTO subjects VALUES (12, 'Dramatics', 2);
INSERT INTO subjects VALUES (13, 'Dance', 5);
INSERT INTO subjects VALUES (14, 'Spanish or other foreign language', 3);
INSERT INTO subjects VALUES (15, 'Leadership', 4);
INSERT INTO subjects VALUES (16, 'Special Education Day Class', 4);
INSERT INTO subjects VALUES (17, 'Resource Program', 2);
INSERT INTO subjects VALUES (18, 'Speech', 2);
INSERT INTO subjects VALUES (19, 'Adaptive P.E.', 3);
INSERT INTO subjects VALUES (20, 'Occupational Therapy', 5);
INSERT INTO subjects VALUES (21, 'Middle School Subjects', 5);
INSERT INTO subjects VALUES (22, 'CORE – core subjects class', 3);
INSERT INTO subjects VALUES (23, 'Reading', 1);
INSERT INTO subjects VALUES (24, 'Language arts', 4);
INSERT INTO subjects VALUES (25, 'Speech and Debate', 3);
INSERT INTO subjects VALUES (26, 'English', 4);
INSERT INTO subjects VALUES (27, 'Basic Math', 3);
INSERT INTO subjects VALUES (28, 'Pre-algebra', 2);
INSERT INTO subjects VALUES (29, 'Consumer Math', 3);
INSERT INTO subjects VALUES (30, 'Algebra', 4);
INSERT INTO subjects VALUES (31, 'Geometry', 3);
INSERT INTO subjects VALUES (32, 'Honors Math in Algebra or Geometry', 4);
INSERT INTO subjects VALUES (33, 'Life Science', 1);
INSERT INTO subjects VALUES (34, 'Earth Science', 2);
INSERT INTO subjects VALUES (35, 'Physical Science', 2);
INSERT INTO subjects VALUES (36, 'Health', 3);
INSERT INTO subjects VALUES (37, 'Social Studies', 1);
INSERT INTO subjects VALUES (38, 'Geography', 3);
INSERT INTO subjects VALUES (39, 'Ancient Civilizations', 4);
INSERT INTO subjects VALUES (40, 'Medieval and Renaissance', 1);
INSERT INTO subjects VALUES (41, 'U.S. History and Government', 2);
INSERT INTO subjects VALUES (42, 'French / Spanish / Latin', 3);
INSERT INTO subjects VALUES (43, 'Computer Science or Lab', 2);
INSERT INTO subjects VALUES (44, 'Art', 2);
INSERT INTO subjects VALUES (45, 'Home Economics', 5);
INSERT INTO subjects VALUES (46, 'Woodshop', 1);
INSERT INTO subjects VALUES (47, 'Metal Shop', 4);
INSERT INTO subjects VALUES (48, 'Business Technology', 4);
INSERT INTO subjects VALUES (49, 'Instrumental Music', 3);
INSERT INTO subjects VALUES (50, 'Band', 1);
INSERT INTO subjects VALUES (51, 'Choir', 3);
INSERT INTO subjects VALUES (52, 'Drama', 2);
INSERT INTO subjects VALUES (53, 'Physical Education', 4);
INSERT INTO subjects VALUES (54, 'Sports', 1);
INSERT INTO subjects VALUES (55, 'Special Education Day Class', 1);
INSERT INTO subjects VALUES (56, 'Resource Program', 5);
INSERT INTO subjects VALUES (57, 'Speech Therapy', 2);
INSERT INTO subjects VALUES (58, 'Occupational Therapy', 3);