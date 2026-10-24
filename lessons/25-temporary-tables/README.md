# 25. Stage results with temporary tables
## Goal
Materialize an intermediate result that several statements can read.

```sql
CREATE TEMPORARY TABLE staged (id INT PRIMARY KEY, total DECIMAL(12,2));
INSERT INTO staged (id, total) SELECT id, SUM(amount) FROM source GROUP BY id;
DROP TEMPORARY TABLE staged;
```

A CTE lives for one statement. A temporary table lives for a client connection
until explicitly dropped or disconnected. Other sessions cannot see it, even
with the same name. A temporary table can shadow a permanent table, so use
unique lesson-prefixed names and DROP TEMPORARY TABLE for cleanup.

## Must know
INSERT ... SELECT copies result values; later source edits do not refresh the
staging table. This is a snapshot of the query result, not a view. Declare types
and keys explicitly when you need them; CREATE TABLE ... AS SELECT does not
copy all source constraints and indexes. MySQL generally cannot reopen the
same temporary table under multiple references within one query; use a CTE or
a suitable alternative if you encounter 'Can't reopen table'.
CREATE/DROP TEMPORARY TABLE do not cause an implicit commit, but their table
creation/removal is not undone by a normal rollback. InnoDB row changes within
a temporary table can be transactional. Temporary storage can still use disk.

## Check yourself
The staged table has six completed orders. The exercise reduces it to four
customer summaries, with total revenue still 174.00. It is explicitly dropped.

## Practice

Start from the seed, run `examples.sql`, then solve `exercises.sql` before
reading `answers.sql`. These files preserve the four shop tables. Compare
answers with `expected-answers.tsv` (tabs separate columns; NULL means missing).
Run files from a mysql client with this repository as its working directory:

```sql
SOURCE lessons/25-temporary-tables/examples.sql;
SOURCE lessons/25-temporary-tables/answers.sql;
```
