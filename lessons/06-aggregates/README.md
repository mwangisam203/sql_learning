# 06. Summarize rows with aggregate functions

## Goal
Turn many input rows into a summary.

```sql
SELECT COUNT(*), SUM(amount), AVG(amount), MIN(amount), MAX(amount)
FROM example_table WHERE condition;
```

COUNT(*) counts rows; COUNT(column) counts non-NULL values; COUNT(DISTINCT
column) counts distinct non-NULL values. SUM and AVG ignore NULL values.
Without GROUP BY, an aggregate query returns a single summary row.

## Must know
For an empty input, COUNT returns 0 while SUM and AVG return NULL.
COALESCE(SUM(...), 0) can represent an empty total as zero. AVG ignores
missing values, so replacing NULL with zero changes the meaning of an average.
Do not combine arbitrary ungrouped columns with aggregates.

## Check yourself
Customer count = 6, known phone count = 2, distinct cities = 3. Stock units
= 435; cheapest product = 1.50 and most expensive = 45.00. There are six
paid/shipped orders. All-status line value is 241.50; that is NOT revenue.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
