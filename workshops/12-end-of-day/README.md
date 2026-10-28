# Workshop 12: Include the whole last day of a datetime range

Events are (1,'2025-02-28 00:00:00'), (2,'2025-02-28 23:59:59'), and
(3,'2025-03-01 00:00:00'). Both February events belong in a February report.

## Try it

Return event IDs with >= '2025-02-01' and < '2025-03-01'. Then demonstrate the
incomplete BETWEEN '2025-02-01' AND '2025-02-28' result on the same data.
Sort both outputs by event ID and identify the omitted event.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/12-end-of-day/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

The date-only upper endpoint means midnight at the start of February 28.
An exclusive next-month boundary includes all times on the final day without
assuming a particular seconds/fractional-seconds precision.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Date filters](../../lessons/02-filtering/README.md).
