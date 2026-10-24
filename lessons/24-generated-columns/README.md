# 24. Derive values with generated columns
## Goal
Define a value once in a table so MySQL derives it from other columns.

```sql
CREATE TABLE example_lines (
  quantity INT NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  line_total DECIMAL(12,2) GENERATED ALWAYS AS (quantity * unit_price) STORED
);
```

A generated column follows its expression when inputs change. VIRTUAL values
are evaluated when read; STORED values occupy storage and are computed on
inserts/updates. InnoDB can index generated columns, subject to the normal
expression/type restrictions. Pick based on access patterns and measured cost.

## Must know
A generated expression derives from the current row; it cannot contain a
subquery looking up a different table. Use deterministic permitted expressions.
Do not try to supply an ordinary value for a generated column on INSERT or
UPDATE; omit it (or use DEFAULT where permitted). Keep the purchase's historical
unit_price as an input. A generated total does not capture a catalog price
from another table or solve historical pricing for you.

The sandbox is a session-local temporary table. Its generated total is
recalculated when quantity changes, and DROP TEMPORARY TABLE removes it.

## Check yourself
The exercise starts at 13.50 for quantity 3 at 4.50, then becomes 18.00 when
quantity is 4. The catalog and all shop rows remain unchanged.

## Practice

Start from the seed, run `examples.sql`, then solve `exercises.sql` before
reading `answers.sql`. These files preserve the four shop tables. Compare
answers with `expected-answers.tsv` (tabs separate columns; NULL means missing).
Run files from a mysql client with this repository as its working directory:

```sql
SOURCE lessons/24-generated-columns/examples.sql;
SOURCE lessons/24-generated-columns/answers.sql;
```
