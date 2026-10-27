# Revision 07: Count orders correctly after joining their lines

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Join paid/shipped orders to their lines. In one row return line_count,
   order_count, and revenue. Count distinct order IDs for order_count.
2. Repeat for orders of every status, labeling the last column line_value
   rather than revenue. Explain why this produces different totals.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. Why does COUNT(*) count something different after joining order_items?
2. Can SUM(DISTINCT quantity * unit_price) safely fix an inflated revenue report?

<details>
<summary>Open after answering: reasoning checks</summary>

1. The joined grain is one row per order line. An order with two lines
   contributes two joined rows, so count distinct order IDs for orders.
2. No. Different legitimate lines may have equal amounts and would be removed
   by DISTINCT. Repair the join grain or aggregate children before joining.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [INNER JOIN](../../lessons/08-inner-join/README.md), [Aggregates](../../lessons/06-aggregates/README.md).
