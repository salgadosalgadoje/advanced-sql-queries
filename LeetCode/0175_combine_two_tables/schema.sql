-- DDL: Table Creation
CREATE TABLE IF NOT EXISTS Person (
    personId INT PRIMARY KEY,
    lastName VARCHAR(255),
    firstName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Address (
    addressId INT PRIMARY KEY,
    personId INT,
    city VARCHAR(255),
    state VARCHAR(255)
);

-- Truncate tables to ensure a clean state if the script is run multiple times
TRUNCATE TABLE Person;
TRUNCATE TABLE Address;

-- DML: Mock Data Insertion
INSERT INTO Person (personId, lastName, firstName) VALUES
(1, 'Wang', 'Allen'),
(2, 'Alice', 'Bob');

INSERT INTO Address (addressId, personId, city, state) VALUES
(1, 2, 'New York City', 'New York'),
(2, 3, 'Leetcode', 'California');