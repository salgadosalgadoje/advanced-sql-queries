/*
Problem: 183. Customers Who Never Order
Platform: LeetCode
Difficulty: Easy
Link: https://leetcode.com/problems/customers-who-never-order/
Approach: We perform a LEFT JOIN from Customers to Orders on c.id = o.customerId 
          and filter for rows where o.id IS NULL (Left Anti-Join pattern). This 
          reliably identifies customers with zero orders while avoiding the 
          NULL-handling pitfalls of NOT IN subqueries.
*/

SELECT 
    c.name AS Customers
FROM 
    Customers c
LEFT JOIN 
    Orders o 
    ON c.id = o.customerId
WHERE 
    o.id IS NULL;