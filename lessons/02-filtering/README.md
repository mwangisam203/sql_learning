# 02. Filter rows with WHERE

## Goal
Choose the rows that meet a condition.

```sql
SELECT columns FROM table_name
WHERE condition_a AND (condition_b OR condition_c);
```

Comparisons include `=`, `<>`, `>`, `>=`, `<`, and `<=`. `IN` matches a list.
BETWEEN includes both endpoints. LIKE uses `%` for zero or more characters
and `_` for exactly one character. Text matching follows the collation; the
course tables use a case-insensitive, accent-insensitive collation.

## Must know
AND binds more tightly than OR. Parentheses document the intended logic.
For datetime ranges, use an inclusive start and exclusive next boundary:
`ordered_at >= '2025-02-01' AND ordered_at < '2025-03-01'`. An end date at
midnight can accidentally exclude the rest of that day.

WHERE keeps only rows for which its condition is TRUE. NULL needs special
handling in lesson 04. Use single quotes for text and ISO date strings.

## Check yourself
There are three Nairobi customers and three February orders (3, 4, 5).
The electronics exercise returns Keyboard and Cable. The name exercise
returns only Amina Otieno.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
