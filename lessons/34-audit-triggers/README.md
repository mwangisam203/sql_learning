# 34. Audit changes with transactional triggers
## Goal
Observe a row change and record it in a separate audit table.

```sql
CREATE TRIGGER example_audit AFTER UPDATE ON example_inventory
FOR EACH ROW INSERT INTO example_log (old_stock, new_stock)
VALUES (OLD.stock, NEW.stock);
```

A trigger runs automatically for each affected row. OLD and NEW expose the
before/after values for UPDATE; INSERT has NEW and DELETE has OLD. BEFORE
triggers can adjust permitted NEW values; AFTER triggers observe the resulting
row. A multi-row update can invoke the trigger many times.

## Must know
With both tables using InnoDB, the audit insert participates in the same
transaction as the inventory update. ROLLBACK undoes both. This audit records
committed changes, not a tamper-proof record of every attempted action. A
trigger cannot issue START TRANSACTION, COMMIT, or ROLLBACK itself.
Use a value-change test if no-op updates should not create log rows.
Triggers execute in a definer security context, so creating them requires
appropriate privileges; binary-logging settings can impose additional creation
requirements. Review hidden work and privilege behavior when adopting triggers.

The lesson uses only lesson34_inventory and lesson34_audit, explicitly created
for practice. Dropping the inventory table also drops its trigger. MySQL
CREATE/DROP TRIGGER and ordinary table DDL have implicit-commit behavior, so
create the sandbox before beginning the rollback demonstration.

## Check yourself
The answer records stock 10 -> 7 once. A second no-op update adds no audit
row. After ROLLBACK, stock is 10 and the audit contains zero rows.

## Practice

Start from the seed, run `examples.sql`, then solve `exercises.sql` before
reading `answers.sql`. These files preserve the four shop tables. Compare
answers with `expected-answers.tsv` (tabs separate columns; NULL means missing).
Run files from a mysql client with this repository as its working directory:

```sql
SOURCE lessons/34-audit-triggers/examples.sql;
SOURCE lessons/34-audit-triggers/answers.sql;
```
