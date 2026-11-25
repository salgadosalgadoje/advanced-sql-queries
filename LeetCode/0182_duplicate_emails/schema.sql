-- DDL: Table Creation
CREATE TABLE IF NOT EXISTS Person (
    id INT PRIMARY KEY,
    email VARCHAR(255) NOT NULL
);

-- Truncate table to ensure a clean state
TRUNCATE TABLE Person;

-- DML: Mock Data Insertion (Example 1)
INSERT INTO Person (id, email) VALUES
(1, 'a@b.com'),
(2, 'c@d.com'),
(3, 'a@b.com');