--
-- @lc app=leetcode id=180 lang=mysql
--
-- [180] Consecutive Numbers
--
/*
Consecutive Numbers
Category	Difficulty	Likes	Dislikes
database	Medium (45.80%)	2363	340
Tags
Companies
Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column starting from 1.
 

Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.
*/

-- @lc code=start
# Write your MySQL query statement below
select distinct l1.num as ConsecutiveNums
from logs l1
join logs l2 on l1.id=l2.id-1
join logs l3 on l1.id=l3.id-2
and l2.num=l3.num and l3.num=l1.num;
-- @lc code=end

