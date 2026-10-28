# Workshop 18: Extend LAST_VALUE to the whole partition when required

Observations (observation_id,reading) are (1,10), (2,20), and (3,30). The
business question asks for the final reading alongside every observation.

## Try it

Return observation_id, LAST_VALUE(reading) with only ORDER BY observation_id,
and LAST_VALUE(reading) with an explicit ROWS frame from UNBOUNDED PRECEDING
to UNBOUNDED FOLLOWING. Sort the output by observation_id.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/18-last-value-frame/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

With this unique ordering, the default ordered frame ends at the current row,
so its last value is that row's reading. Extending the frame to the partition's
end supplies 30 on every row. LAST_VALUE refers to the frame, not its name alone.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Value function frames](https://dev.mysql.com/doc/refman/8.4/en/window-functions-frames.html).
