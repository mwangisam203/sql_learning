# Workshop 13: Distinguish calendar-day differences from elapsed minutes

Session 1 runs from January 1, 2025 at 23:59 to January 2 at 00:01.
Session 2 runs from January 1 at 00:00 to January 1 at 23:00. Treat all values
as UTC-by-convention DATETIME values without timezone conversion.

## Try it

Return session_id, DATEDIFF(end,start) as calendar_days, and
TIMESTAMPDIFF(MINUTE,start,end) as elapsed_minutes for both sessions. Predict
which session has more calendar days and which has more elapsed minutes.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/13-duration-units/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

DATEDIFF compares date portions, so the two-minute midnight crossing counts
one calendar day. TIMESTAMPDIFF uses start then end and the requested unit;
the other session is 1380 minutes while crossing zero date boundaries.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Date/time functions](https://dev.mysql.com/doc/refman/8.4/en/date-and-time-functions.html).
