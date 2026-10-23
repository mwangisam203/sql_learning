# 12. Create update and delete rows safely

## Goal
Practice the write operations in CRUD: Create, Read, Update, Delete.

```sql
INSERT INTO table_name (column_a, column_b) VALUES (value_a, value_b);
UPDATE table_name SET column_a = new_value WHERE primary_key = id;
DELETE FROM table_name WHERE primary_key = id;
```

Always name INSERT columns. Preview an UPDATE or DELETE target with SELECT
using the same WHERE condition. Check the affected-row count immediately
with ROW_COUNT(). An UPDATE can match rows without changing their values.
LAST_INSERT_ID() returns the generated identifier for this connection.

## Must know
An UPDATE or DELETE without WHERE targets every row. SQL_SAFE_UPDATES can
catch some broad writes but is not a substitute for reviewing a predicate.
The runnable examples wrap writes in a transaction and ROLLBACK, preserving
seed row values. Auto-increment counters may still advance after rollback.
Do not add DDL inside these transactions: lesson 15 explains implicit commits.

## Check yourself
The temporary customer disappears after rollback. Notebook stock changes
from 100 to 99 in the transaction and returns to 100 afterward.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
