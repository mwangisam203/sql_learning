# 04. Handle missing values with NULL

## Goal
Distinguish missing values from empty strings and zero.

```sql
SELECT COALESCE(optional_column, 'fallback') FROM table_name
WHERE optional_column IS NULL;
```

NULL means unknown or absent. `phone = NULL` is not a missing-value test;
use IS NULL or IS NOT NULL. Comparisons to NULL usually evaluate to UNKNOWN,
and WHERE does not retain UNKNOWN results. `NULL = NULL` is also UNKNOWN.
MySQL's `<=>` is null-safe equality, useful when comparing nullable values.

## Must know
- COALESCE returns its first non-NULL argument. It does not replace empty text.
- Arithmetic involving NULL normally returns NULL.
- COUNT(*) counts rows; COUNT(phone) counts rows with a non-NULL phone.
- A NOT IN list or subquery containing NULL can yield surprising missing rows;
  prefer NOT EXISTS for relationship checks (lesson 10).

## Check yourself
Four customers have missing phones; IDs 2 and 4 have a phone.
The truth-table example returns NULL, 1, and NULL respectively.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
