# Revision 14: Predict partial and full rollback results

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Begin a transaction, reserve 2 units of product 1, and create a savepoint.
   Reserve 1 unit of product 3, then roll back to that savepoint. Select product_id
   and stock for products 1 and 3, ordered by ID. Fully roll back, then select them again.
2. Insert a practice customer inside a new transaction. Capture LAST_INSERT_ID()
   into a session variable and count that ID (expect one). ROLLBACK, then count
   that same ID again (expect zero). Use the seed's required customer columns.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. Does ROLLBACK TO SAVEPOINT end the transaction or undo the earlier reservation?
2. Why can a later AUTO_INCREMENT ID have a gap even after the inserted row was rolled back?

<details>
<summary>Open after answering: reasoning checks</summary>

1. Neither. It undoes changes after the savepoint and keeps the transaction
   open. A full ROLLBACK then discards the earlier reservation too.
2. Allocated auto-increment values are not guaranteed to be reclaimed by
   rollback. Never treat IDs as a row count or require gap-free sequences.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [Transactions and savepoints](../../lessons/15-transactions/README.md), [INSERT](../../lessons/12-crud/README.md).
