
-- Creating university database system
-- CREATE DATABASE IF NOT EXISTS University_System;

CREATE DATABASE IF NOT EXISTS University_System;
USE University_System;
CREATE TABLE IF NOT EXISTS Department(
    dept_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS Vice_Canceller(
    ID INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS Department_Chairmens(
    Chariman_ID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT
);
USE University_System;
CREATE TABLE computer_science(
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
    Chariman_ID INT,
    FOREIGN KEY (Chariman_ID) REFERENCES Department_Chairmens(Chariman_ID)
);
INSERT INTO department
VALUES (777, "Computer Science");
INSERT INTO department_chairmens
VALUES (10777, "Peter", 34);

SELECT *
FROM computer_science;

INSERT INTO computer_science
VALUES (777, 10777);

SELECT *
FROM computer_science;

CREATE TABLE student_computer_science(
    roll_no INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL CHECK (age > 18),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
    city VARCHAR(50)
);

INSERT INTO student_computer_science (roll_no, name, age, dept_id, city)
VALUES (101, 'Alice Smith', 20, 777, 'New York'),
    (102, 'Bob Johnson', 22, 777, 'Los Angeles'),
    (103, 'Charlie Brown', 21, 777, 'Chicago'),
    (104, 'David Wilson', 23, 777, 'Houston'),
    (105, 'Eve Davis', 20, 777, 'Phoenix'),
    (106, 'Frank Miller', 21, 777, 'Philadelphia'),
    (107, 'Grace Lee', 22, 777, 'San Antonio'),
    (108, 'Hannah Martin', 23, 777, 'San Diego'),
    (109, 'Ivy White', 21, 777, 'Dallas'),
    (110, 'Jack Thompson', 22, 777, 'San Jose'),
    (111, 'Karen Harris', 20, 777, 'Austin'),
    (112, 'Leo Clark', 23, 777, 'Jacksonville'),
    (113, 'Mia Rodriguez', 21, 777, 'Fort Worth'),
    (114, 'Nina Lewis', 22, 777, 'Columbus'),
    (115, 'Oscar Walker', 23, 777, 'Charlotte');

SELECT *
FROM student_computer_science;
-- DROP table student_computer_science;

USE University_System;

SELECT *
FROM student_computer_science
WHERE age > 21;

SELECT DISTINCT city
FROM student_computer_science;
SELECT city,
    COUNT(name)
FROM student_computer_science
GROUP BY city;

INSERT INTO student_computer_science
VALUES (116, "Bob", 25, 777, 'Austin');
UPDATE student_computer_science
SET name = "Big Boob"
WHERE name = "Bob";

SELECT *
FROM student_computer_science;
SET SQL_SAFE_UPDATES = 0;
UPDATE department
SET dept_id = 0777
WHERE dept_id = 777;
SELECT *
FROM department;

ALTER TABLE department
MODIFY COLUMN dept_id CREATE VIEW view1 AS
SELECT roll_no,
    name,
    dept_id
From student_computer_science;
USE University_System;

SHOW TABlES;

SELECT *
FROM student_computer_science;

SELECT DISTINCT age -- Distinct FOR UNIQUE values 
FROM student_computer_science;
SELECT *
FROM student_computer_science
WHERE age BETWEEN 20 AND 22;

-- Betweeen Operator use for range of elementss
SELECT *
FROM student_computer_science
WHERE city IN ("New York", "Dallas");
SELECT *
FROM student_computer_science
WHERE city NOT IN ("New York", "Dallas");
-- IN and NOT IN Both Select the ranges of values

SELECT *
FROM department;
SELECT *
FROM student_computer_science
ORDER BY name ASC;
-- Aggregate Functions Uses and also these functions returns only one value
-- some are:
-- COUNT, MAX, MIN, SUM, AVG
SELECT COUNT(name)
FROM student_computer_science;

SELECT AVG(age)
FROM student_computer_science;
-- Group by same as pandas we group coolumn
SELECT city,
    COUNT(name)
FROM student_computer_science
GROUP BY city;

SELECT age,
    COUNT(roll_no)
FROM student_computer_science
GROUP BY age
ORDER BY age;

SHOW DATABASES;
