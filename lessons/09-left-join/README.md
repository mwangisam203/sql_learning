# 09. Keep unmatched rows with LEFT JOIN

## Goal
Include customers or products with no matching child rows.

```sql
SELECT p.id, COUNT(c.id)
FROM parents AS p LEFT JOIN children AS c ON c.parent_id = p.id
GROUP BY p.id;
```

LEFT JOIN preserves every left-side row. When there is no match, right-side
columns become NULL. `WHERE right_table.primary_key IS NULL` finds parents
without children; use a non-nullable right-side key for that test.

## Must know
A right-side condition in WHERE can remove NULL-extended rows and defeat the
purpose of a LEFT JOIN. Put qualifying-child conditions in ON when you want
to retain all parents. COUNT(*) counts even an unmatched left-side row;
COUNT(o.order_id) counts only matching orders. COALESCE can turn missing
aggregate totals into zero for reporting.

## Check yourself
Farah (6) has no orders. Diego (4) and Farah (6) have no paid/shipped orders.
Backpack is the only product never ordered. Every customer must remain in
the count exercise, including customers with a zero count.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
