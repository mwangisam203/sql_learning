# 10. Ask nested questions with subqueries

## Goal
Use one query's result inside another query.

```sql
SELECT * FROM products WHERE price > (SELECT AVG(price) FROM products);
```

A scalar subquery returns one column and at most one row. An aggregate without
GROUP BY is a common scalar use. A multi-row subquery can feed IN. EXISTS
checks whether a subquery has at least one match; SELECT 1 documents that
its returned columns do not matter. A correlated subquery refers to an outer
row, for example `o.customer_id = c.customer_id`.

## Must know
NOT EXISTS is useful for absence checks even when child columns may contain
NULL. NOT IN with a NULL result can evaluate to UNKNOWN instead of TRUE.
A scalar subquery returning multiple rows is an error. Subqueries are not
automatically slow: inspect the execution plan when performance matters.

## Check yourself
Keyboard and Backpack cost more than the average catalog price (~16.83).
Completed-order customers are IDs 1, 2, 3, and 5. Backpack is never ordered.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
