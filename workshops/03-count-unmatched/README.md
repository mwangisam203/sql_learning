# Workshop 03: Count child keys rather than preserved rows

Parents are IDs 1 and 2. Children (child_id,parent_id) are (10,1) and (11,1).
Parent 2 has no children, but a LEFT JOIN still keeps that parent.

## Try it

Build both CTEs and return parent_id, COUNT(*) as joined_rows, and COUNT(child_id)
as child_count after a LEFT JOIN. Group and order by parent ID. Predict the
unmatched parent's two different counts before executing.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/03-count-unmatched/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

The unmatched parent contributes one NULL-extended joined row, so COUNT(*)
is 1. The child key is NULL on that row, so COUNT(child_id) is 0. Choose the
count whose grain matches the business question.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [LEFT JOIN](../../lessons/09-left-join/README.md).
