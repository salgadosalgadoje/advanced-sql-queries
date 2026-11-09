# Advanced SQL Queries

A growing collection of SQL problem solutions and database setup scripts designed for practice, review, and continued learning in relational database querying.

This repository focuses on real-world SQL patterns such as joins, filtering, aggregation, and edge-case handling, with examples aligned to LeetCode-style data challenges.

## Overview

Each problem folder contains:

- `schema.sql` — table definitions and sample data
- `solution.sql` — the query logic used to solve the challenge

The repository currently includes solutions for two classic SQL problems:

- `Combine Two Tables`
- `Second Highest Salary`

## Repository Structure

```text
advanced-sql-queries/
├── README.md
└── LeetCode/
    ├── 0175_combine_two_tables/
    │   ├── schema.sql
    │   └── solution.sql
    └── 0176_second_highest_salary/
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

If you are using a MySQL client directly, the equivalent commands are:

```bash
mysql -u <username> -p < LeetCode/0175_combine_two_tables/schema.sql
mysql -u <username> -p < LeetCode/0175_combine_two_tables/solution.sql

mysql -u <username> -p < LeetCode/0176_second_highest_salary/schema.sql
mysql -u <username> -p < LeetCode/0176_second_highest_salary/solution.sql
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

## Goals

This repository is intended to:

- strengthen SQL fundamentals
- practice reading and writing production-style queries
- build a reusable archive of challenge-based solutions
- document problem-solving logic clearly and consistently

## Future Scope

This project is designed to expand over time with additional LeetCode problem solutions, each organized in its own folder with schema and answer scripts.

## License

This repository is provided for educational and learning purposes.
