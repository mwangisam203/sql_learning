# Revision 01: Retrieve columns and inspect the row grain

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Return product_id, product_name, and inventory_value (price * stock) for
   every catalog product, ordered by product_id. Keep the original two-decimal
   money precision. Predict how many rows appear.
2. Return each distinct customer city once, sorted alphabetically.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. Why does selecting inventory_value not change any product prices or stock?
2. What is the difference between one row in orders and one row in order_items?

<details>
<summary>Open after answering: reasoning checks</summary>

1. SELECT evaluates an expression for the result. UPDATE is required to change
   stored values. This query returns six product rows.
2. An order row is a header; an order_items row is a particular product within
   that order. One order can have multiple lines, so the row grains differ.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [SELECT](../../lessons/01-select/README.md), [Data modeling](../../lessons/21-normalization/README.md).
