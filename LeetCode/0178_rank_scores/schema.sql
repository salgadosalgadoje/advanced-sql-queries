-- DDL: Table Creation
CREATE TABLE IF NOT EXISTS Scores (
    id INT PRIMARY KEY,
    score DECIMAL(3, 2)
);

-- Truncate table to ensure a clean state
TRUNCATE TABLE Scores;

-- DML: Mock Data Insertion (Example 1)
INSERT INTO Scores (id, score) VALUES
(1, 3.50),
(2, 3.65),
(3, 4.00),
(4, 3.85),
(5, 4.00),
(6, 3.65);