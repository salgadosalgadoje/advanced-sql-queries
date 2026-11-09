-- DDL: Table Creation
CREATE TABLE IF NOT EXISTS Employee (
    id INT PRIMARY KEY,
    salary INT
);

-- Truncate table to ensure a clean state
TRUNCATE TABLE Employee;

-- DML: Mock Data Insertion (Example 1)
INSERT INTO Employee (id, salary) VALUES
(1, 100),
(2, 200),
(3, 300);

/*
-- Mock Data Insertion (Example 2 - Run this to test the NULL case)
TRUNCATE TABLE Employee;
INSERT INTO Employee (id, salary) VALUES
(1, 100);
*/