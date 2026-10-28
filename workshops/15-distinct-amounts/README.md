# Workshop 15: Avoid using DISTINCT amounts to hide join bugs

Two legitimate lines have different line IDs but the same amount 10.00. Both
must contribute to the total even though their amounts are equal.

## Try it

Build lines (1,10.00) and (2,10.00). Return COUNT(*) as lines_count,
SUM(amount) as correct_total, and SUM(DISTINCT amount) as distinct_value_total.
Explain why DISTINCT amounts cannot establish whether lines are duplicates.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/15-distinct-amounts/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

The real total is 20.00; deduplicating the value reduces it to 10.00. Deduplicate
by the appropriate business identity when the input truly repeats a record.
For join multiplication, fix the join grain instead of deduplicating the measure.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Join grain](../../lessons/08-inner-join/README.md).
