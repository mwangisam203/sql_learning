# Revision 03: Continue a sorted page without skipping ties

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Return product_id and price for the three most expensive products. Order
   by price DESC and product_id ASC.
2. Continue after the last row of that page, product 3 at price 12.00, using
   a keyset predicate rather than OFFSET. Return the next three IDs and prices
   with the same ordering. Handle possible equal prices correctly.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. Why is `price < 12` alone incomplete if other products also cost 12?
2. Does ORDER BY inside a window function guarantee final display order?

<details>
<summary>Open after answering: reasoning checks</summary>

1. A later row with price 12 and ID greater than 3 must also be eligible.
   Use price < 12 OR (price = 12 AND product_id > 3) for this mixed ordering.
2. No. The outer SELECT needs its own ORDER BY to guarantee display order.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [Sorting and pagination](../../lessons/03-sorting/README.md).
