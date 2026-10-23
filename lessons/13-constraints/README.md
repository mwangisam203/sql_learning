# 13. Protect data with keys and constraints

## Goal
Recognize the database rules that reject invalid writes.

```sql
CREATE TABLE example_table (
    id INT PRIMARY KEY,
    email VARCHAR(254) NOT NULL UNIQUE,
    quantity INT NOT NULL CHECK (quantity > 0)
);
```

PRIMARY KEY identifies each row. UNIQUE prevents duplicate non-NULL key
values; a nullable MySQL UNIQUE column can contain multiple NULLs. NOT NULL
requires a value. DEFAULT supplies a value when an insert omits that column.
CHECK rejects FALSE conditions, but accepts UNKNOWN, so use NOT NULL too.
FOREIGN KEY requires an existing parent for a non-NULL reference.

## Must know
The schema uses InnoDB and MySQL 8.0.18+; older MySQL versions before 8.0.16
did not enforce CHECK. MySQL checks foreign keys immediately. Do not disable
foreign-key checks to make a failing insert pass. Understand RESTRICT,
CASCADE, and SET NULL before choosing deletion behavior. ON DELETE CASCADE
can remove many child rows; it is intentionally absent from this course schema.

## Check yourself
SHOW CREATE TABLE reveals the exact rule names. The commented examples
produce errors 1062 (duplicate), 3819 (CHECK), and 1452 (missing parent).
Run an intentional failure one statement at a time, then ROLLBACK; a statement
error does not generally roll back the entire surrounding transaction.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
