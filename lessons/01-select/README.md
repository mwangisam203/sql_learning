# 01. Read data with SELECT

## Goal
Retrieve specific columns and calculate values without changing stored data.

```sql
SELECT column_name, expression AS label
FROM table_name;
```

SELECT chooses output columns; FROM identifies the source table. An alias
renames an output column for that query. `AS` is optional, but helps reading.
SQL keywords are case-insensitive; use consistent capitalization. Table name
case can depend on the host OS, so use the lowercase names in this course.

## Must know
- `SELECT *` is convenient for exploration; explicit columns make stable reports.
- A query without ORDER BY has no guaranteed row order.
- String values use single quotes. MySQL backticks quote identifiers when needed.
- `-- ` (with a following space) starts a line comment; `/* ... */` is a block comment.
- SQL returns a result set; selecting an expression does not update the table.

## Check yourself
The price-and-stock example returns six rows. Notebook's inventory value is
450.00 and Pen's is 300.00. Your exercise should return six product names.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
