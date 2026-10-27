# Revision 17: Preserve ties and calculate a running total

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Return every customer's ID, completed-order count, and DENSE_RANK by that
   count descending. Include zero counts and sort the display by customer ID.
2. Summarize completed revenue per month, then return month, revenue, and
   running_revenue. Use an explicit ROWS frame from the first row to the current
   row, and display months chronologically.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. What happens to count ties if customer_id is added to DENSE_RANK's window ordering?
2. Why aggregate to months before applying this running-total window?

<details>
<summary>Open after answering: reasoning checks</summary>

1. The distinct IDs break the ties. Use only the measured count inside the
   rank window; use customer_id in the final display ORDER BY instead.
2. The requirement is one row per month. A window over individual lines would
   retain line rows and calculate a different sequence and result grain.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [Window functions](../../lessons/17-windows/README.md), [LAG and LEAD](../../lessons/30-lag-lead/README.md).
