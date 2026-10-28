# Workshop 04: Keep outer-join filters in the intended place

Parents are 1 and 2. Children (child_id,parent_id,status) are (10,1,'paid')
and (11,2,'pending'). The report must keep both parents and count paid children.

## Try it

Return parent_id and paid_count with the status condition in ON. Repeat the
CTEs and move that condition into WHERE to show the counterexample. Sort each
result by parent_id. Explain which parent disappears and why.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/04-outer-filter-position/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

Filtering in ON controls which children match while keeping each parent.
Filtering the right-side status in WHERE removes nonpaid/unmatched output
rows. Parent 2 disappears instead of receiving a zero count.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [LEFT JOIN](../../lessons/09-left-join/README.md).
