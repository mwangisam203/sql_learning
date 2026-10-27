# Revision 19: Distinguish idempotent replacement from repeated increments

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Create a temporary stock table with product_id primary key and integer stock.
   Insert product 1 at stock 10. Upsert absolute stock 12 twice and select ID/stock.
2. On that same temporary row, upsert an additive increase of 2 twice. Select
   ID/stock again, then DROP TEMPORARY TABLE. Predict both output values.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. Why does an absolute-state upsert survive a duplicate retry differently from an increment?
2. Is an idempotent update enough to guarantee that the latest business state wins?

<details>
<summary>Open after answering: reasoning checks</summary>

1. Setting the same target twice has the same final state as setting it once.
   Applying an increment twice changes the state twice; deduplicate events if
   retries must count only once.
2. No. An older absolute update can overwrite newer state. Ordering/version
   checks and the business event identity are separate design requirements.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [Upserts](../../lessons/26-upserts/README.md), [Temporary tables](../../lessons/25-temporary-tables/README.md).
