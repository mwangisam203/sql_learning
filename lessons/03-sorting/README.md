# 03. Sort results and limit pages

## Goal
Make output order explicit and retrieve a predictable subset.

```sql
SELECT columns FROM table_name
ORDER BY sort_column DESC, unique_id ASC
LIMIT 10 OFFSET 0;
```

ASC sorts ascending and is the default; DESC sorts descending. The second
sort column breaks ties. LIMIT applies to the ordered result.

## Must know
A unique tie breaker makes pages deterministic for an unchanged dataset.
OFFSET counts rows to skip; large offsets can be expensive. Rows inserted
between requests can shift offset pages. Keyset pagination continues after
the last seen sort key and is often better for long feeds.

## Check yourself
The three most expensive products are Keyboard, Backpack, and Mug. The first
customer page contains IDs 1 and 2; the second page has IDs 3 and 4.
The exercise returns orders 8 and 7, newest first.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
