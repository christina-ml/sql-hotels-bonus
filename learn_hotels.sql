-- Getting started, do not update
DROP DATABASE IF EXISTS learn_hotels;
CREATE DATABASE learn_hotels;
\c learn_hotels
-- End getting started code

--
-- Write your code below each prompt

--
\echo Create a table called learn_hotels
-- with the following columns:
-- id
-- name
-- city
-- state
-- pets
-- rating
CREATE TABLE hotels (id SERIAL PRIMARY KEY, name TEXT, city TEXT, state TEXT, pets BOOLEAN, rating numeric DEFAULT 5, CHECK (rating >= 0 AND rating <= 5));
-- 
\echo See details of the table you created
-- 
\d learn_hotels;
-- 
\echo Lets insert some data
-- 
INSERT INTO hotels (name, city, state, rating, pets)
VALUES
('Hotel California', null, 'California', 4, true),
('The Great Northern', 'Twin Peaks', 'Washington', 3, true),
('Hilbert''s Hotel', null, null, 1, false),
('Hotelicopter', 'Somewhere in the sky', null, 3, false),
('Fawlty Towers', 'Torquay on the English Riviera','England', 2, true),
('Grand Budapest Hotel', 'Republic of Zubrowka', null, 1, true);
-- 
\echo Lets check out our data
-- 
SELECT * FROM hotels;
-- 
\echo Lets create a rooms table
-- 
CREATE TABLE rooms (id SERIAL PRIMARY KEY, name TEXT, price numeric, vacant BOOLEAN, room_num INT, hotel_id INT);
-- 
\echo Lets add some rooms
-- 
INSERT INTO rooms (hotel_id, name, price, room_num, vacant)
VALUES
(1, 'Queen', 1200, 202, true),
(1, 'Queen', 1200, 303, true),
(1, 'King', 1400, 404, true),
(1, 'Penthouse', 2200, 707, true),
(2, 'Queen', 400, 201, true),
(2, 'Queen', 400, 302, false),
(2, 'King', 600, 403, false),
(2, 'Penthouse', 1200, 605, false),
(3, 'Room', null, null, null),
(4, null, 4000, null, true),
(5, 'Queen', 1200, 111, false),
(5, 'Queen', 1200, 222, false),
(5, 'King', 1400, 333, false),
(7, 'Queen', 1200, 1111, false),
(7, 'Queen', 1200, 2222, false),
(7, 'King', 1400, 3333, false);
-- 
\echo Lets check out our data
-- 
SELECT * FROM rooms;
-- 

-- JOINS
\echo Full Outer Join
-- 
SELECT * FROM hotels FULL OUTER JOIN rooms ON hotels.id = rooms.hotel_id;
SELECT * FROM rooms FULL OUTER JOIN hotels ON hotels.id = rooms.hotel_id;
-- 
\echo Inner Join
-- 
SELECT * FROM hotels INNER JOIN rooms ON hotels.id = rooms.hotel_id;
-- 
\echo Left Join
-- 
SELECT * FROM hotels LEFT JOIN rooms ON hotels.id = rooms.hotel_id;
-- 
\echo Right Join
-- 
SELECT * FROM hotels RIGHT JOIN rooms ON hotels.id = rooms.hotel_id;

-- BONUS Complex Queries
\echo What is the average price of a hotel room that can be booked at Boutique Travel Travel Boutique ?
-- 
SELECT AVG(price) FROM rooms INNER JOIN hotels ON hotels.id = rooms.hotel_id;
-- 
\echo Which hotels have vacancies?
-- 
SELECT DISTINCT hotels.name FROM hotels JOIN rooms ON hotels.id = rooms.hotel_id WHERE rooms.vacant IS TRUE;


-- SQL Part 2a
-- Choose Your Own Learning
-- Rate your comfort and choose the matching activity
-- 4, Feeling good: Go back to the bonus challenges in the lecture markdowns and solve each one
-- Write your code below each prompt

--
-- TRY IT:
\echo Query for hotels that allow pets
-- 
-- 
\echo Query for hotels that allow pets AND have vacancies
-- 
-- 
\echo Query for the average room price for a hotel that allows pets
-- 
-- 
\echo Query for the most expensive room
-- 
-- 
\echo Query for the average price of a room that has a name that includes queen in it (case insensitive)
-- 
-- 
\echo Query for the most expensive room
-- 
-- 
\echo Update a room at Hotel California with a room number of 202 to go from vacant-true to vacant false.
-- 
-- 
\echo Update all the rooms with the hotel_id of 7 to now have a hotel_id that matches the Grand Budapest Hotel

--
-- finish SQL Part 2a
--
-- start SQL Part 2b
-- 





--
-- finish
--
-- DROP TABLE IF EXISTS learn_hotels;


-- CHRISTINA: How to run the file:
-- \i learn_hotels.sql to run the file learn_hotels.sql