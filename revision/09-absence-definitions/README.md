# Revision 09: Distinguish no orders from no completed orders

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Use NOT EXISTS to return customer_id and full_name for customers who have
   never placed an order of any status. Sort by ID.
2. Use NOT EXISTS to return the same columns for customers with no paid/shipped
   orders. Keep customers who have only cancelled/pending orders. Sort by ID.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. Which customer's cancelled order makes the two result sets differ?
2. Why is NOT EXISTS often easier to reason about than NOT IN with nullable data?

<details>
<summary>Open after answering: reasoning checks</summary>

1. Diego (4) has cancelled order 5. He has ordered, but has no completed order.
   Farah (6) has no orders of any status and belongs to both result sets.
2. A NULL inside a NOT IN result can make comparisons UNKNOWN. NOT EXISTS
   directly tests whether a matching relationship exists without that trap.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [Subqueries](../../lessons/10-subqueries/README.md), [LEFT JOIN](../../lessons/09-left-join/README.md).
