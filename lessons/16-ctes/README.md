# 16. Name query steps with common table expressions

## Goal
Use WITH to make a multi-step report easier to follow.

```sql
WITH named_step AS (SELECT ...)
SELECT ... FROM named_step;
```

A common table expression (CTE) is a named result available to one statement.
Multiple CTEs are separated by commas; later ones can refer to earlier ones.
A CTE is not a permanent table and is not automatically a performance win.
The optimizer may merge or materialize it. Prefer clear steps with a defined
row grain: first one row per order, then one row per month or customer.

## Good to know
WITH RECURSIVE supports hierarchical traversal and sequence generation. It
needs an anchor, a recursive step, and a termination condition. MySQL also
limits recursive depth. This course uses a tiny bounded sequence, not an
unbounded recursion. CTEs require MySQL 8.0+.

## Check yourself
Monthly revenue is 41.50, 53.00, 79.50. The sequence returns 1 through 5.
Customers with at least 50.00 completed revenue are Amina (66.50) and Brian
(67.00). Farah and Diego have no qualifying rows in that exercise.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
