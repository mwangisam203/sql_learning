# 15. Keep related changes together with transactions

## Goal
Commit a complete unit of work or roll its row changes back.

```sql
START TRANSACTION;
-- related INSERT / UPDATE / DELETE statements
COMMIT; -- use ROLLBACK instead to discard the transaction
```

ACID means atomicity (all-or-nothing work), consistency (valid state),
isolation (control concurrent interactions), and durability (committed changes
survive failures under the server's configured durability guarantees).
With autocommit enabled, each standalone write normally commits immediately.
START TRANSACTION groups later writes until COMMIT or ROLLBACK.
SAVEPOINT marks a point for partial rollback without ending the transaction.

## Must know
Transactions here require InnoDB. Keep them short. A guarded stock update
(`WHERE stock >= amount`) and its affected-row count can prevent overselling.
Use SELECT ... FOR UPDATE inside a transaction when later decisions depend
on locking current rows. COMMIT/ROLLBACK release locks. Lock conflicts can
wait or deadlock; applications should retry the whole transaction when appropriate.
Most DDL implicitly commits. Transactions do not nest: starting another can
commit the current one. A statement failure often leaves the transaction open;
explicitly decide whether to roll back. Deadlocks can roll back the whole transaction.

## Optional two-session lab
In client A: START TRANSACTION, then SELECT product 1 FOR UPDATE. In client B:
start a transaction and try updating the same product. B waits for A's lock.
ROLLBACK in A, then ROLLBACK in B after its UPDATE completes. A plain consistent
SELECT may still read a snapshot; it is different from a locking SELECT.
Never leave either session open with an unfinished transaction.

## Check yourself
After the savepoint rollback, product 1 is 99 and product 3 is 40. After the
full rollback, both are back at 100 and 40. Exercise results restore stock too.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
