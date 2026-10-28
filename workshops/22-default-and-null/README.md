# Workshop 22: Distinguish omitted columns from explicit NULL

A temporary table has state VARCHAR(20) NULL DEFAULT 'new'. We want to compare
omitting that column, explicitly providing NULL, and supplying DEFAULT.

## Try it

Create workshop22_tasks with task_id primary key and the described state.
Insert task 1 with only its ID, task 2 with explicit NULL state, and task 3
with DEFAULT. Return ID and COALESCE(state,'(missing)') ordered by ID, then drop it.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/22-default-and-null/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

Omission and DEFAULT use 'new'; explicit NULL remains NULL because the column
allows it. A default is not a general replacement for missing values on every
write. The behavior of a NOT NULL column must be considered separately.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Defaults and constraints](../../lessons/13-constraints/README.md).
