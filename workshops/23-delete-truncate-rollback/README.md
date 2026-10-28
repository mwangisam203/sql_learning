# Workshop 23: Compare DELETE rollback with TRUNCATE rollback

This lab empties only a temporary sandbox table. It contrasts a transactional
row deletion with a TRUNCATE that cannot be recovered using ordinary ROLLBACK.
Never substitute a real shop or application table name.

## Try it

Create temporary workshop23_rows with IDs 1 and 2 before any transaction.
In a transaction delete ID 1, ROLLBACK, and count the rows. Start another
transaction, TRUNCATE the sandbox, ROLLBACK, and count again. Drop it afterward.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/23-delete-truncate-rollback/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

DELETE against InnoDB participates in the transaction, restoring two rows on
rollback. TRUNCATE has DDL behavior and cannot be reversed by that rollback,
leaving zero rows. Do not infer transaction safety from similar end results.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [TRUNCATE](https://dev.mysql.com/doc/refman/8.4/en/truncate-table.html).
