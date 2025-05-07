--
-- @lc app=leetcode id=1341 lang=mysql
--
-- [1341] Movie Rating
--
/*
Movie Rating
Category	Difficulty	Likes	Dislikes
database	Medium (41.36%)	753	217
Tags
Companies
Table: Movies

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+
movie_id is the primary key (column with unique values) for this table.
title is the name of the movie.
 

Table: Users

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.
The column 'name' has unique values.
Table: MovieRating

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+
(movie_id, user_id) is the primary key (column with unique values) for this table.
This table contains the rating of a movie by a user in their review.
created_at is the user's review date. 
 

Write a solution to:

Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
The result format is in the following example.
*/

-- @lc code=start
# Write your MySQL query statement below
(SELECT name as results
FROM Users U JOIN MovieRating R ON U.user_id = R.user_id
GROUP BY U.user_id
ORDER BY Count(*) DESC, name
LIMIT 1)
UNION ALL
(SELECT m.title as results
FROM Movies m Right JOIN MovieRating R ON m.movie_id = R.movie_id
WHERE R.created_at BETWEEN '2020-02-01' AND '2020-02-28'
GROUP BY m.movie_id
ORDER BY avg(rating) DESC, m.title
LIMIT 1)
-- @lc code=end

