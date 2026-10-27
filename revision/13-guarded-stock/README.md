# Revision 13: Reserve stock and verify affected rows

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. In a transaction, reserve 2 units of product 5 only if stock >= 2. Immediately
   select ROW_COUNT(), then the current stock. ROLLBACK and select stock again.
2. In another transaction, attempt to reserve 999 units of product 5 with an
   appropriate guard. Immediately select ROW_COUNT(), ROLLBACK, then select stock.
   Predict all five output values before running anything.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. What must an application do when the guarded UPDATE changes zero rows?
2. Why should ROW_COUNT() be inspected immediately after the UPDATE?

<details>
<summary>Open after answering: reasoning checks</summary>

1. Treat the reservation as unsuccessful; do not continue as if stock was
   reserved. Roll back related work when the full operation requires it.
2. It describes the preceding statement. Running another statement first can
   replace the status you intended to inspect.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [Safe CRUD](../../lessons/12-crud/README.md), [Transactions](../../lessons/15-transactions/README.md).
