# Revision 20: Reconcile a customer report with line-level totals

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Build a complete customer report: customer_id, completed_orders, revenue,
   and DENSE_RANK by revenue descending. Keep all customers, retain equal-spend
   ties, and sort the displayed rows by customer_id. Aggregate order lines to
   one row per order before counting orders.
2. From every joined order line, produce one reconciliation row with these
   six columns: completed_orders, completed_lines, completed_units,
   completed_revenue, excluded_line_value, and all_line_value. Only paid/shipped
   orders count as completed. Use conditional aggregates and show how the last
   three values reconcile. Each line must contribute once.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. How would you check this report after a backup restore, and does an ordinary view store a frozen result?
2. Does a procedure's SIGNAL guarantee full transaction rollback, and what happens to InnoDB audit-trigger writes on explicit ROLLBACK?

<details>
<summary>Open after answering: reasoning checks</summary>

1. Run the same fixed-seed reports against a separate restored database and
   compare row counts, totals, constraints, and expected output. An ordinary
   view stores a query definition and reads visible underlying data, not frozen rows.
2. Do not assume SIGNAL undoes earlier transaction statements; handle transaction
   ownership explicitly. Audit writes to InnoDB tables participate in the same
   transaction as their triggering row change, so explicit ROLLBACK undoes both.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [Shop reporting with CTEs](../../lessons/16-ctes/README.md), [Windows](../../lessons/17-windows/README.md), [Security and recovery](../../lessons/20-security-backups/README.md).
