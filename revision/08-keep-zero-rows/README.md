# Revision 08: Keep customers with zero qualifying orders

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Return every customer's ID and number of paid/shipped orders, including
   zero counts. Filter qualifying orders in ON, group by customer_id, and sort by ID.
2. Use a LEFT JOIN absence check to find products never ordered in any status.
   Return product_id and product_name, sorted by product_id.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. Why does COUNT(*) return one for a customer whose joined order columns are NULL?
2. What would change if the completed-status condition moved from ON to WHERE?

<details>
<summary>Open after answering: reasoning checks</summary>

1. LEFT JOIN preserves a left-side row even without a match. COUNT(*) counts
   that preserved row; COUNT(o.order_id) counts only non-NULL child keys.
2. Unmatched customers would fail the right-side WHERE test and disappear.
   Put the condition in ON to keep all customers with zero qualifying children.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [LEFT JOIN](../../lessons/09-left-join/README.md).
