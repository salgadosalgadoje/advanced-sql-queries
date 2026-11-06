# Advanced SQL Queries

A growing collection of SQL problem solutions and database setup scripts, designed for practice, review, and continued learning in relational database querying.

This repository focuses on real-world SQL patterns such as joins, filtering, aggregation, and table design, with examples aligned to LeetCode-style data challenges.

## Overview

The project is organized around problem folders, each containing:

- `schema.sql` — table definitions and sample data
- `solution.sql` — the query logic used to solve the challenge

The current repository includes a focused example for the classic `Combine Two Tables` problem.

## Repository Structure

```text
advanced-sql-queries/
├── README.md
└── LeetCode/
    └── 0175_combine_two_tables/
        ├── schema.sql
        └── solution.sql
```

## Included Challenge

### LeetCode 175: Combine Two Tables

This problem demonstrates the effective use of a `LEFT JOIN` to preserve all records from the `Person` table while returning matched `Address` data when it exists.

Key concept:
- Keep every person in the result set
- Return `NULL` values for city and state where no address row matches

The solution is implemented in:
- `LeetCode/0175_combine_two_tables/solution.sql`

## Database Setup

Run the schema script first to create the required tables and sample data:

```sql
SOURCE LeetCode/0175_combine_two_tables/schema.sql;
```

Then run the solution query:

```sql
SOURCE LeetCode/0175_combine_two_tables/solution.sql;
```

If you are using a MySQL client directly, the equivalent command is:

```bash
mysql -u <username> -p < LeetCode/0175_combine_two_tables/schema.sql
mysql -u <username> -p < LeetCode/0175_combine_two_tables/solution.sql
```

## How the Solution Works

The query uses a left join from `Person` to `Address` on `personId`:

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
