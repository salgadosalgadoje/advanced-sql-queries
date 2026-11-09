/*
Problem: 176. Second Highest Salary
Platform: LeetCode
Difficulty: Medium
Link: https://leetcode.com/problems/second-highest-salary/
Approach: We use a subquery with DISTINCT, ORDER BY, and LIMIT/OFFSET to fetch 
          the 2nd highest salary. Wrapping the query inside a SELECT statement 
          is crucial here: it ensures that if the subquery returns an empty set 
          (e.g., there is only one employee), it will evaluate to NULL instead 
          of returning no rows, satisfying the problem's edge case requirement.
*/

SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS "SecondHighestSalary";