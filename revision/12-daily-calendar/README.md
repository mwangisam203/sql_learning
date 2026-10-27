# Revision 12: Report days without completed orders

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Return each completed order from March 1 through March 6, 2025: order_id,
   order_day formatted YYYY-MM-DD, and order_total. Use an exclusive March 7
   boundary, historical line prices, and order_id ordering.
2. Generate every date March 1 through March 6 with a recursive CTE, then
   return day and daily completed revenue. Keep zero-revenue days and order by date.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. Why does grouping only existing orders fail to produce March 2 and March 4?
2. Does LAG(revenue) automatically refer to yesterday when dates are missing?

<details>
<summary>Open after answering: reasoning checks</summary>

1. GROUP BY summarizes existing rows; it does not create missing dates. Build
   a calendar independently and LEFT JOIN the completed daily summary to it.
2. No. LAG reads a previous row in its ordered input. Fill the calendar first
   when the business question requires adjacent days.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [Calendar reports](../../lessons/29-calendar-reports/README.md), [Date filters](../../lessons/02-filtering/README.md).
