# 11. Build labels with CASE and combine rows with UNION

## Goal
Derive categories and stack compatible result sets.

```sql
SELECT CASE WHEN price >= 30 THEN 'premium' ELSE 'standard' END AS band
FROM products;
```

CASE checks WHEN conditions in order and returns the first matching THEN
value. Without ELSE, unmatched rows get NULL. Conditional aggregation uses
CASE inside SUM or COUNT to compute multiple measures in one query.

UNION stacks rows from queries with the same number of columns and compatible
types. UNION removes duplicate output rows; UNION ALL keeps them and avoids
deduplication work. Output names come from the first SELECT. A final ORDER BY
sorts the combined result. JOIN combines columns; UNION combines rows.

## Must know
`COUNT(CASE WHEN condition THEN 1 END)` counts matches. Adding ELSE 0 there
counts every row because 0 is non-NULL. Use SUM(CASE ... ELSE 0 END) instead
when you want a numeric conditional count.

## Check yourself
The completed count is 6 and the other-status count is 2. Premium products
are Keyboard and Backpack. The UNION ALL contacts exercise returns 12 rows.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
