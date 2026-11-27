-- DDL: Table Creation
CREATE TABLE IF NOT EXISTS Customers (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Orders (
    id INT PRIMARY KEY,
    customerId INT,
    FOREIGN KEY (customerId) REFERENCES Customers(id)
);

-- Truncate tables to ensure a clean state (disable FK checks temporarily if needed)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Orders;
TRUNCATE TABLE Customers;
SET FOREIGN_KEY_CHECKS = 1;

-- DML: Mock Data Insertion (Example 1)
INSERT INTO Customers (id, name) VALUES
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

INSERT INTO Orders (id, customerId) VALUES
(1, 3),
(2, 1);