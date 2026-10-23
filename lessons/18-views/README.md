# 18. Reuse a report definition with a view

## Goal
Expose a reusable SELECT as a named database object.

```sql
CREATE OR REPLACE SQL SECURITY INVOKER VIEW view_name AS SELECT ...;
SELECT * FROM view_name;
DROP VIEW view_name;
```

An ordinary MySQL view stores a query definition, not a cached copy of rows.
Reading it reflects underlying data according to the current transaction's
visibility rules. The example view has one row per order and computes each
order total once in its definition. It includes every status so callers choose
which statuses matter for a particular report.

## Must know
Views do not guarantee output order; add ORDER BY when reading one.
Aggregate views are not directly updatable. A view is not automatically a
performance optimization. SQL SECURITY INVOKER checks the caller's underlying
privileges; SQL SECURITY DEFINER has different security implications. Creating,
replacing, and dropping a view are DDL, with implicit-commit behavior.

## Check yourself
Reading paid/shipped totals through the view gives 174.00. Pending-order
value is 22.50. Each runnable file creates and drops the course view so it
works independently after setup. Do not store your own work under its name.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
