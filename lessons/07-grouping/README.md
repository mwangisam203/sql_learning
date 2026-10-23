# 07. Group rows and filter summaries

## Goal
Produce one summary row per group.

```sql
SELECT group_column, COUNT(*) AS row_count
FROM table_name WHERE row_condition
GROUP BY group_column HAVING COUNT(*) >= 2
ORDER BY row_count DESC, group_column;
```

WHERE filters individual input rows before grouping. GROUP BY forms groups.
HAVING filters groups after aggregate values are computed. A useful conceptual
order is FROM/JOIN, WHERE, GROUP BY, HAVING, SELECT, ORDER BY, LIMIT; this is
not a promise about physical execution by the optimizer.

## Must know
Keep ONLY_FULL_GROUP_BY enabled. Select grouped columns, aggregates, or
columns MySQL can prove depend on the grouping key. Arbitrary ungrouped
columns can be ambiguous; disabling strict grouping hides a query design bug.
NULL grouping values form one group.

## Check yourself
City counts: Kisumu 1, Mombasa 2, Nairobi 3. Status counts: cancelled 1,
paid 3, pending 1, shipped 3. The repeated-customer exercise returns
customer IDs 1, 2, and 3, each with two orders of any status.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
