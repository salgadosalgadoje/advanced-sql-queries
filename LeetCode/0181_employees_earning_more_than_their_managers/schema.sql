-- DDL: Table Creation
CREATE TABLE IF NOT EXISTS Employee (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    salary INT,
    managerId INT
);

-- Truncate table to ensure a clean state
TRUNCATE TABLE Employee;

-- DML: Mock Data Insertion (Example 1)
INSERT INTO Employee (id, name, salary, managerId) VALUES
(1, 'Joe', 70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam', 60000, NULL),
(4, 'Max', 90000, NULL);