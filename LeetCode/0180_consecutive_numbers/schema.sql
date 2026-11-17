-- DDL: Table Creation
CREATE TABLE IF NOT EXISTS Logs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    num VARCHAR(255)
);

-- Truncate table to ensure a clean state
TRUNCATE TABLE Logs;

-- DML: Mock Data Insertion (Example 1)
INSERT INTO Logs (id, num) VALUES
(1, '1'),
(2, '1'),
(3, '1'),
(4, '2'),
(5, '1'),
(6, '2'),
(7, '2');