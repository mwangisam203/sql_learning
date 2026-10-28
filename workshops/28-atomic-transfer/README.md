# Workshop 28: Keep both sides of a transfer in one transaction

A temporary toy balance table has account 101 at 100.00 and 202 at 50.00.
We will move 20.00, inspect the provisional values, then roll everything back.
This is a SQL transaction exercise, not a production payment design.

## Try it

Create an InnoDB temporary table with nonnegative DECIMAL(10,2) balances.
Debit 101 only if enough is available, save ROW_COUNT immediately, and credit
202 only when that saved flag is 1. Show credit ROW_COUNT, then account/balance
rows. ROLLBACK and show the restored rows. Finally try a guarded debit of 999,
apply the same credit guard, show debit/credit counts, ROLLBACK, and drop the table.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/28-atomic-transfer/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

The successful provisional balances are 80.00 and 70.00; rollback restores
100.00 and 50.00. The failed debit must not create a credit. Real workflows
must check both affected-row counts and roll back if either side fails, use
consistent lock ordering, and handle retry/deduplication requirements.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Transactions](../../lessons/15-transactions/README.md).
