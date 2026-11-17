/*
Problem: 180. Consecutive Numbers
Platform: LeetCode
Difficulty: Medium
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

Link: https://leetcode.com/problems/consecutive-numbers/
Approach: We use a CTE with LAG() and LEAD() window functions ordered by 'id' 
          to inspect the immediate previous and next values for each row in a 
          single table pass (avoiding expensive self-joins). Then, we filter 
          where the current number equals both neighbors and apply DISTINCT to 
          avoid duplicates if a number repeats more than three times.
*/

WITH ConsecutiveCheck AS (
    SELECT 
        num,
        LAG(num, 1) OVER (ORDER BY id) AS prev_num,
        LEAD(num, 1) OVER (ORDER BY id) AS next_num
    FROM 
        Logs
)
SELECT DISTINCT 
    num AS ConsecutiveNums
FROM 
    ConsecutiveCheck
WHERE 
    num = prev_num 
    AND num = next_num;