create database RSVP_project;
use RsVP_project;

CREATE TABLE Movies ( 
movie_id INT PRIMARY KEY,
title VARCHAR(100), 
release_year YEAR, 
genre VARCHAR(50), 
language VARCHAR(30), 
budget DECIMAL(10,2), 
revenue DECIMAL(10,2) 
);

-- Directors Table 
CREATE TABLE Directors ( 
director_id INT PRIMARY KEY, 
name VARCHAR(100) );  

-- Movie_Director Table 
CREATE TABLE Movie_Director ( 
movie_id INT, director_id INT, 
FOREIGN KEY (movie_id) REFERENCES Movies(movie_id), 
FOREIGN KEY (director_id) REFERENCES Directors(director_id) ); 

-- Ratings Table 
CREATE TABLE Ratings ( 
movie_id INT, 
rating DECIMAL(3,1), 
FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ); 

-- Insert Movies 
INSERT INTO Movies VALUES 
(1, 'Uri: The Surgical Strike', 2019, 'Action', 'Hindi', 25.00, 350.00), 
(2, 'Kedarnath', 2018, 'Romance', 'Hindi', 40.00, 100.00), 
(3, 'Love Per Square Foot', 2018, 'Comedy', 'Hindi', 20.00, 45.00); 

-- Insert Directors 
INSERT INTO Directors VALUES 
(1, 'Aditya Dhar'), 
(2, 'Abhishek Kapoor'), 
(3, 'Anand Tiwari'); 

-- Insert Movie_Director 
INSERT INTO Movie_Director VALUES 
(1, 1), 
(2, 2), 
(3, 3); 

-- Insert Ratings 
INSERT INTO Ratings VALUES 
(1, 8.3), 
(2, 6.9), 
(3, 7.3); 

-- List all movies released after 2017 
SELECT title, release_year 
FROM Movies 
WHERE release_year > 2017; 

-- Q2: Find the highest revenue movie 
SELECT title, revenue 
FROM Movies 
ORDER BY revenue DESC LIMIT 1;

-- Q3: Show movies with rating > 7 
SELECT m.title, r.rating 
FROM Movies m 
JOIN Ratings r ON m.movie_id = r.movie_id 
WHERE r.rating > 7; 

-- Q4: Get directors and their movies 
SELECT d.name AS Director, m.title AS Movie 
FROM Directors d 
JOIN Movie_Director md 
ON d.director_id = md.director_id 
JOIN Movies m ON md.movie_id = m.movie_id; 

-- Calculate Profit = Revenue – Budget 
SELECT title, (revenue - budget) AS profit FROM Movies; 

-- Profit example: Uri → 350 – 25 = 325 Cr. 
-- Q6: Find average rating per genre 
SELECT m.genre, AVG(r.rating) AS avg_rating 
FROM Movies m 
JOIN Ratings r ON m.movie_id = r.movie_id GROUP BY m.genre; 

-- Average rating grouped by genres.  

-- Q7: Recommend Top 3 movies by rating 

SELECT m.title, r.rating 
FROM Movies m 
JOIN Ratings r ON m.movie_id = r.movie_id 
ORDER BY r.rating DESC LIMIT 3; 


--  Uri  is the most profitable movie. 
-- ●  Comedy & Action genres perform better in ratings. 
-- ●  Directors can be compared by success of their movies. 
-- ●  Top rated movies can be recommended to customers. 










