# 35. Quarantine invalid incoming data
## Goal
Review incoming records before writing them to constrained shop tables.

Treat a batch as untrusted input. Load it into an isolated staging structure,
identify every issue, then decide which records are eligible for promotion.
Keep production keys and checks enabled; do not disable them just to import
rows that break the model.

## Exercise rules
The incoming table has seven already-parsed rows. batch_row identifies a row
inside this batch; external_id is the upstream event identity. Reject **both**
rows when an external_id is duplicated in this batch. Also reject missing
customers, NULL/nonpositive quantities, NULL/negative prices, and unsupported
or NULL statuses. One record can have several issues; do not hide later issues
behind the first matching CASE branch.

Use one temporary issues table and separate INSERT ... SELECT statements.
This also avoids MySQL's restrictions on reopening a temporary table several
times in one query. A window COUNT(*) detects duplicate external IDs without
a second reference to the staging table in that statement.

## Must know
A count of issue rows differs from a count of rejected batch rows. Reconcile
input rows = distinct rejected rows + eligible rows. Cross-batch duplicate
events require a persistent unique event key; this small lab checks only one
batch. A production import must also validate raw text parsing, currency,
date/time conventions, and concurrent reference changes. This typed staging
example is not a complete ingestion service.

The lesson reports eligibility only; it does not insert orders or reserve
stock. Promotion should use a transaction and database constraints, with an
explicit retry/deduplication design. Temporary data disappears on disconnect.

## Check yourself
Rows 1/2 duplicate an event, row 3 has no customer, row 4 has zero quantity,
row 5 has a negative price, and row 6 has an unsupported status. Seven input
rows produce six rejected rows and one eligible row (7). Completed shop
revenue remains 174.00 throughout.

## Practice

Start from the seed, run `examples.sql`, then solve `exercises.sql` before
reading `answers.sql`. These files preserve the four shop tables. Compare
answers with `expected-answers.tsv` (tabs separate columns; NULL means missing).
Run files from a mysql client with this repository as its working directory:

```sql
SOURCE lessons/35-data-quality-capstone/examples.sql;
SOURCE lessons/35-data-quality-capstone/answers.sql;
```
