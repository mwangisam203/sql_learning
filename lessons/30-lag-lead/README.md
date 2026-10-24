# 30. Compare neighboring rows with LAG and LEAD
## Goal
Read the preceding or following row without collapsing the result.

```sql
SELECT month, revenue, LAG(revenue) OVER (ORDER BY month) AS previous_revenue
FROM monthly_totals;
```

LAG reads an earlier row; LEAD reads a later one. Their default offset is one,
and their default result when no such row exists is NULL. PARTITION BY resets
the sequence for each group. A deterministic window ORDER BY is essential.

## Must know
LAG means previous **row**, not necessarily previous calendar month. Fill
calendar gaps first when calculating month-over-month changes. Aggregate order
lines into monthly/order totals before applying a window; line-level neighbors
would answer a different question. To use a window value in another expression,
calculate it in a CTE and refer to that column in the outer SELECT.

A percentage change is 100*(current-previous)/previous. NULLIF protects a
zero denominator; retain NULL when the rate is undefined. For elapsed durations,
DATEDIFF uses date portions only; TIMESTAMPDIFF supports other units and has
different argument order. This exercise intentionally measures calendar days.

## Check yourself
Monthly growth is NULL for January, 27.71% for February, and 50.00% for March.
Completed-order day gaps are NULL, 5, 23, 27, 2, and 2. Pending/cancelled
orders must not appear in the neighboring-order exercise.

## Practice

Start from the seed, run `examples.sql`, then solve `exercises.sql` before
reading `answers.sql`. These files preserve the four shop tables. Compare
answers with `expected-answers.tsv` (tabs separate columns; NULL means missing).
Run files from a mysql client with this repository as its working directory:

```sql
SOURCE lessons/30-lag-lead/examples.sql;
SOURCE lessons/30-lag-lead/answers.sql;
```
