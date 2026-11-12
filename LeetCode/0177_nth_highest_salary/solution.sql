/*
Problem: 177. Nth Highest Salary
Platform: LeetCode
Difficulty: Medium
Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
n = 2
Output: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
n = 2
Output: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| null                   |
+------------------------+
Link: https://leetcode.com/problems/nth-highest-salary/
Approach: In MySQL, the OFFSET clause only accepts integer literals or local 
          variables, not arithmetic expressions like (N - 1). Therefore, we 
          first guard against non-positive inputs (N <= 0) returning NULL, 
          decrement N by 1, and then query the distinct salaries ordered 
          descending using LIMIT 1 OFFSET N.
*/

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    IF N <= 0 THEN
        RETURN NULL;
    END IF;

    SET N = N - 1;
    RETURN (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET N
    );
END