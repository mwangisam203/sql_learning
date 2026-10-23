# 14. Change table structure with ALTER TABLE

## Goal
Separate schema changes (DDL) from row changes (DML).

```sql
ALTER TABLE example_table ADD COLUMN notes VARCHAR(200) NULL;
ALTER TABLE example_table MODIFY COLUMN notes VARCHAR(400) NULL;
ALTER TABLE example_table RENAME COLUMN notes TO memo;
ALTER TABLE example_table DROP COLUMN memo;
```

CREATE defines objects, ALTER changes their structure, and DROP removes them.
DELETE removes selected rows while retaining the table. TRUNCATE removes all
rows, resets an auto-increment sequence, and has DDL-style commit behavior.

## Must know
Most DDL, including ALTER TABLE, causes implicit commits and cannot be undone
with a normal ROLLBACK. MySQL atomic DDL protects a statement's internal
consistency; it does not make successful DDL user-rollbackable. Back up and
plan production migrations, check locking/rebuild cost, and validate afterward.
MODIFY must restate the desired attributes, including nullability and default.

## Check yourself
The examples create a dedicated `lesson_schema_demo` table, add/rename/drop a
column, inspect it, then remove that demo table. They do not alter shop tables.
The exercise creates a different sandbox and cleans it up.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
