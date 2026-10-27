# Revision 16: Separate average order value from average line value

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Build a CTE with one total per completed order. Return completed_orders,
   revenue, and average_order_value cast to DECIMAL(10,2).
2. Work directly at completed-order line grain. Return line_count, units,
   and average_line_value cast to DECIMAL(10,2). Explain why its average differs.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. Why does averaging joined line totals understate the seed's average order value?
2. Does naming the order-total query as a CTE permanently cache its rows?

<details>
<summary>Open after answering: reasoning checks</summary>

1. Eleven lines and six orders are different denominators. Average order value
   is 174/6 = 29.00; average line value is 174/11, rounded to 15.82.
2. No. A CTE exists for one statement. Its name improves structure, not a
   guarantee of permanent storage or a particular optimizer strategy.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [CTEs](../../lessons/16-ctes/README.md), [Joins](../../lessons/08-inner-join/README.md).
