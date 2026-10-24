# 33. Package queries in stored procedures
## Goal
Create a reusable database routine with a typed input parameter.

```sql
DELIMITER //
CREATE PROCEDURE example(IN p_id INT)
SQL SECURITY INVOKER
BEGIN
  IF p_id IS NULL OR p_id < 1 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ID must be positive';
  END IF;
  SELECT p_id;
END//
DELIMITER ;
CALL example(1);
DROP PROCEDURE example;
```

DELIMITER is a mysql **client command**, not server SQL. It lets the client
send semicolons inside BEGIN/END as part of a single routine definition.
Drivers normally send the full CREATE PROCEDURE string without DELIMITER.
IN provides an input; OUT and INOUT can return parameter values. A SELECT
inside a routine can also return a result set; drivers must consume results.

## Must know
Prefix parameter names to distinguish them from columns. SQL SECURITY INVOKER
checks the caller's privileges on underlying objects. Creating/dropping routines
is DDL; do not place it inside a transaction expecting ordinary rollback.
SIGNAL raises an error; it does not promise to undo every earlier transaction
statement. Keep transaction ownership and error handling explicit.

The example validates a positive customer ID, then reports completed revenue.
An unknown positive ID yields no customer row. Execute its commented invalid
CALL before DROP if you want to observe error 1644 manually. The exercise
routine is read-only and creates no new customers or products.

## Check yourself
The example returns Amina at 66.50 and Farah at 0.00. The exercise category
lookup returns Notebook (4.50) and Pen (1.50), ordered by product ID.

## Practice

Start from the seed, run `examples.sql`, then solve `exercises.sql` before
reading `answers.sql`. These files preserve the four shop tables. Compare
answers with `expected-answers.tsv` (tabs separate columns; NULL means missing).
Run files from a mysql client with this repository as its working directory:

```sql
SOURCE lessons/33-stored-procedures/examples.sql;
SOURCE lessons/33-stored-procedures/answers.sql;
```
