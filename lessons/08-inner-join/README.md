# 08. Connect related rows with INNER JOIN

## Goal
Combine related tables using explicit keys.

```sql
SELECT a.column_name, b.column_name
FROM table_a AS a
JOIN table_b AS b ON b.foreign_key = a.primary_key;
```

INNER JOIN keeps matching pairs. Aliases keep table references short. Qualify
shared names such as customer_id and order_id to avoid ambiguity.

## Must know: define the row grain
Joining orders to order_items changes the result from one row per order to
one row per order line. COUNT(*) then counts lines. Use COUNT(DISTINCT
order_id) for orders, or summarize lines per order first. Joining two separate
one-to-many children can multiply rows and inflate totals; aggregate each
child before combining them.

A missing or wrong ON condition can multiply unrelated rows. Check join keys
and counts before trusting SUM. Do not use DISTINCT to hide an incorrect join.
Revenue uses historical unit_price and paid/shipped orders in this course.

## Check yourself
The customer/order join has eight rows. The detailed completed-order join has
11 rows. The exercise returns six orders and revenue of 174.00.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
