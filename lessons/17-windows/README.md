# 17. Rank rows and calculate running totals

## Goal
Add analytical values while preserving individual result rows.

```sql
SELECT value,
       ROW_NUMBER() OVER (PARTITION BY category ORDER BY value DESC, id) AS position
FROM example_table;
```

GROUP BY collapses groups. Window functions calculate across related rows
while keeping the input row grain. PARTITION BY creates independent groups;
ORDER BY defines sequence inside a window. The final query ORDER BY still
controls display order. ROW_NUMBER assigns positions, RANK leaves gaps after
ties, and DENSE_RANK does not leave gaps. Do not add a unique ID to a rank's
ORDER BY when equal measured values should remain tied.

## Must know
Use an explicit ROWS frame for row-by-row running totals. The default frame
with ORDER BY can include peer rows in ways you did not intend. Add a unique
tie breaker for deterministic row numbering. MySQL does not support QUALIFY;
filter window results in an outer query or a CTE. Windows require MySQL 8.0+.

## Check yourself
The last running revenue is 174.00 across six rows. All-status customer order
counts have a three-way tie at 2; their RANK is 1, followed by rank 4 for the
two customers with one order. Category leaders are Keyboard, Mug, Notebook,
and Backpack (ordered by category in the answer).

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
