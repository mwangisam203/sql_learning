# Workshop 19: Find runs of consecutive active dates

Activity dates are January 1,2,2,4,7,8 of 2025. The duplicate January 2 must
not make a run longer or split it. We need one row per consecutive-date run.

## Try it

Deduplicate dates, assign ROW_NUMBER by date, and subtract that row number in
days to obtain an island key. Return first_day, last_day, and active_days per
key, ordered by first_day. State why duplicate removal happens before numbering.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/19-activity-islands/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

For consecutive dates, date minus its one-based position is constant. A gap
changes that key. Duplicate dates would consume extra row numbers without
advancing the date, so remove them first. This measures distinct active days.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [CTEs](../../lessons/16-ctes/README.md), [Window ordering](../../lessons/17-windows/README.md).
