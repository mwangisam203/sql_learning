# 29. Fill missing months in reports
## Goal
Report a requested period even when no matching orders exist.

A GROUP BY over orders only returns months present in the input. Generate a
calendar independently, then LEFT JOIN monthly totals to it. This separates
which periods should appear from which periods have data.

```sql
WITH RECURSIVE calendar AS (
  SELECT CAST('2025-01-01' AS DATE) AS month_start
  UNION ALL
  SELECT DATE_ADD(month_start, INTERVAL 1 MONTH)
  FROM calendar WHERE month_start < '2025-04-01'
)
SELECT month_start FROM calendar;
```

## Must know
Start with the first day of each month so adding one month has an unambiguous
boundary. Filter paid/shipped orders before summarizing; keep missing-period
rows by joining that summary to the calendar. COALESCE(..., 0.00) represents
an absent revenue total as zero. Do not put an order-side WHERE filter after
the LEFT JOIN if you need months with no qualifying orders.

A zero month has no qualifying records in the available data. It does not
prove that data ingestion completed successfully; operational completeness
is a separate question. Dates here are fixed UTC calendar boundaries.

## Check yourself
January through April 2025 yields 41.50, 53.00, 79.50, and 0.00. The exercise
extends the calendar to May and must retain both zero-revenue months.

## Practice

Start from the seed, run `examples.sql`, then solve `exercises.sql` before
reading `answers.sql`. These files preserve the four shop tables. Compare
answers with `expected-answers.tsv` (tabs separate columns; NULL means missing).
Run files from a mysql client with this repository as its working directory:

```sql
SOURCE lessons/29-calendar-reports/examples.sql;
SOURCE lessons/29-calendar-reports/answers.sql;
```
