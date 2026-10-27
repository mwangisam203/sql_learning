# Revision 15: Read constraints and verify data integrity

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Query information_schema.TABLE_CONSTRAINTS for products in mysql_learning.
   Return CONSTRAINT_TYPE and its count, grouped and sorted by type.
2. In one row, return counts of orphan_orders (no customer), invalid_products
   (negative stock or price), and invalid_lines (nonpositive quantity or negative
   unit_price). Use independent subqueries to avoid multiplying rows.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. Why is CHECK(quantity > 0) alone insufficient to reject a NULL quantity?
2. Can successful ALTER TABLE work be reversed with the same ROLLBACK used for row updates?

<details>
<summary>Open after answering: reasoning checks</summary>

1. The expression is UNKNOWN for NULL, and CHECK accepts UNKNOWN. Add NOT NULL
   when a value is required, as the course schema does.
2. No. Most schema DDL implicitly commits and is not reversed by ordinary
   transaction rollback. Plan a migration and recovery before changing structure.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [Constraints](../../lessons/13-constraints/README.md), [Schema changes](../../lessons/14-alter/README.md).
