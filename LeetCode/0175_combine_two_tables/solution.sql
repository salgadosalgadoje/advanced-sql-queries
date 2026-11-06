/*
Problem: 175. Combine Two Tables
Platform: LeetCode
Difficulty: Easy
Link: https://leetcode.com/problems/combine-two-tables/
Approach: A LEFT JOIN is used from the Person table to the Address table 
          on the 'personId' foreign key. This ensures that all persons are 
          included in the final result set, mapping 'city' and 'state' to NULL 
          if no matching address record exists.
*/

SELECT 
    p.firstName, 
    p.lastName, 
    a.city, 
    a.state
FROM 
    Person p
LEFT JOIN 
    Address a 
    ON p.personId = a.personId;