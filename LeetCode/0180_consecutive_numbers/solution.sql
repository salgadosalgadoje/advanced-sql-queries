/*
Problem: 180. Consecutive Numbers
Platform: LeetCode
Difficulty: Medium
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