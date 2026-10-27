# Revision 10: Compare a value with its own group average

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Return product_id, product_name, and category for products priced strictly
   above their own category's average. Use a correlated scalar subquery and sort by ID.
2. Return product_id and price for products above the entire catalog average,
   sorted by ID. Compare this result with the category-based result.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. What makes the first subquery correlated, and what changes if its category condition is removed?
2. Why does AVG without GROUP BY produce a suitable scalar result here?

<details>
<summary>Open after answering: reasoning checks</summary>

1. It references the outer product's category. Removing that condition
   compares every product against the overall catalog average instead.
2. It returns one aggregate value, not one row per product. A scalar subquery
   that unexpectedly returns multiple rows would raise an error.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [Subqueries](../../lessons/10-subqueries/README.md).
