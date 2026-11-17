# Advanced SQL Queries

A growing collection of SQL problem solutions and database setup scripts designed for practice, review, and continued learning in relational database querying.

This repository focuses on real-world SQL patterns such as joins, filtering, aggregation, and edge-case handling, with examples aligned to LeetCode-style data challenges.

## Overview

Each problem folder contains:

- `schema.sql` — table definitions and sample data
- `solution.sql` — the query logic used to solve the challenge

The repository currently includes solutions for five classic SQL problems:

- `Combine Two Tables`
- `Second Highest Salary`
- `Nth Highest Salary`
- `Rank Scores`
- `Consecutive Numbers`

## Repository Structure

```text
advanced-sql-queries/
├── README.md
└── LeetCode/
    ├── 0175_combine_two_tables/
    │   ├── schema.sql
    │   └── solution.sql
    ├── 0176_second_highest_salary/
    │   ├── schema.sql
    │   └── solution.sql
    ├── 0177_nth_highest_salary/
    │   ├── schema.sql
    │   └── solution.sql
    ├── 0178_rank_scores/
    │   ├── schema.sql
    │   └── solution.sql
    └── 0180_consecutive_numbers/
        ├── schema.sql
        └── solution.sql
```

## Included Challenges

### LeetCode 175: Combine Two Tables

This problem demonstrates the effective use of a `LEFT JOIN` to preserve all records from the `Person` table while returning matched `Address` data when it exists.

Key concept:
- Keep every person in the result set
- Return `NULL` values for `city` and `state` when no address row matches

The solution is implemented in:
- `LeetCode/0175_combine_two_tables/solution.sql`

### LeetCode 176: Second Highest Salary

This problem demonstrates how to retrieve the second-highest distinct salary while handling the edge case where no second salary exists.

Key concept:
- Use `DISTINCT` to eliminate duplicate salary values
- Sort in descending order and skip the top result with `LIMIT 1 OFFSET 1`
- Wrap the query in an outer `SELECT` so the result becomes `NULL` when the subquery is empty

The solution is implemented in:
- `LeetCode/0176_second_highest_salary/solution.sql`

### LeetCode 177: Nth Highest Salary

This problem demonstrates how to retrieve the Nth-highest distinct salary while returning `NULL` if fewer than N distinct salaries exist.

Key concept:
- Reject non-positive N values by returning `NULL`
- Decrement N to convert the requested rank to a zero-based offset
- Use `DISTINCT` and descending order to find the requested salary

The solution is implemented in:
- `LeetCode/0177_nth_highest_salary/solution.sql`

### LeetCode 178: Rank Scores

This problem demonstrates how to rank scores in descending order while assigning tied scores the same rank and leaving no gaps.

Key concept:
- Use `DENSE_RANK()` as a window function to assign consecutive ranks across ties
- Order the final results by score descending

The solution is implemented in:
- `LeetCode/0178_rank_scores/solution.sql`

### LeetCode 180: Consecutive Numbers

This problem demonstrates how to detect values that appear at least three times in consecutive rows based on the `id` ordering.

Key concept:
- Use window functions such as `LAG()` and `LEAD()` to compare each record with its immediate neighbors
- Filter for rows where the current value matches both adjacent values
- Remove duplicates with `DISTINCT` to keep the result set clean

The solution is implemented in:
- `LeetCode/0180_consecutive_numbers/solution.sql`

## Database Setup

Run the schema script first to create the required tables and sample data for a challenge:

```sql
SOURCE LeetCode/0175_combine_two_tables/schema.sql;
```

Then run the matching solution query:

```sql
SOURCE LeetCode/0175_combine_two_tables/solution.sql;
```

To work with the second-highest-salary challenge instead:

```sql
SOURCE LeetCode/0176_second_highest_salary/schema.sql;
SOURCE LeetCode/0176_second_highest_salary/solution.sql;
```

For the Nth-highest-salary challenge:

```sql
SOURCE LeetCode/0177_nth_highest_salary/schema.sql;
SOURCE LeetCode/0177_nth_highest_salary/solution.sql;
```

For the rank-scores challenge:

```sql
SOURCE LeetCode/0178_rank_scores/schema.sql;
SOURCE LeetCode/0178_rank_scores/solution.sql;
```

For the consecutive-numbers challenge:

```sql
SOURCE LeetCode/0180_consecutive_numbers/schema.sql;
SOURCE LeetCode/0180_consecutive_numbers/solution.sql;
```

If you are using a MySQL client directly, the equivalent commands are:

```bash
mysql -u <username> -p < LeetCode/0175_combine_two_tables/schema.sql
mysql -u <username> -p < LeetCode/0175_combine_two_tables/solution.sql

mysql -u <username> -p < LeetCode/0176_second_highest_salary/schema.sql
mysql -u <username> -p < LeetCode/0176_second_highest_salary/solution.sql

mysql -u <username> -p < LeetCode/0177_nth_highest_salary/schema.sql
mysql -u <username> -p < LeetCode/0177_nth_highest_salary/solution.sql

mysql -u <username> -p < LeetCode/0178_rank_scores/schema.sql
mysql -u <username> -p < LeetCode/0178_rank_scores/solution.sql

mysql -u <username> -p < LeetCode/0180_consecutive_numbers/schema.sql
mysql -u <username> -p < LeetCode/0180_consecutive_numbers/solution.sql
```

## How the Solutions Work

### Left join approach for Combine Two Tables

```sql
SELECT
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
    ON p.personId = a.personId;
```

This ensures:
- all records from `Person` are returned
- matching `Address` values appear when available
- missing addresses remain `NULL`

### Subquery approach for Second Highest Salary

```sql
SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS "SecondHighestSalary";
```

This ensures:
- only distinct salaries are considered
- the highest salary is skipped to reach the second value
- the result is `NULL` when no second salary exists

### Nth-highest salary function

```sql
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
```

This ensures:
- only distinct salaries are ranked
- the requested rank maps to the correct zero-based offset
- `NULL` is returned for non-positive N or when fewer than N distinct salaries exist

### Dense ranking approach for Rank Scores

```sql
SELECT
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
FROM Scores
ORDER BY score DESC;
```

This ensures:
- tied scores share the same rank
- ranks remain consecutive with no gaps
- results are returned in descending score order

### Window-function approach for Consecutive Numbers

```sql
WITH ConsecutiveCheck AS (
    SELECT
        num,
        LAG(num, 1) OVER (ORDER BY id) AS prev_num,
        LEAD(num, 1) OVER (ORDER BY id) AS next_num
    FROM Logs
)
SELECT DISTINCT
    num AS ConsecutiveNums
FROM ConsecutiveCheck
WHERE num = prev_num
  AND num = next_num;
```

This ensures:
- each value is compared with the values immediately before and after it
- only repeated values that remain unchanged across three consecutive rows are kept
- `DISTINCT` prevents duplicate values from appearing multiple times in a run

## Goals

This repository is intended to:

- strengthen SQL fundamentals
- practice reading and writing production-style queries
- compare common patterns such as joins, window functions, and subqueries
- build confidence solving LeetCode-style SQL challenges in a structured way
- build a reusable archive of challenge-based solutions
- document problem-solving logic clearly and consistently

## Future Scope

This project is designed to expand over time with additional LeetCode problem solutions, each organized in its own folder with schema and answer scripts.

## License

This repository is provided for educational and learning purposes.
