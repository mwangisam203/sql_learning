# Workshop 17: Compare peer-aware RANGE frames with row frames

Rows (row_id,score,amount) are (1,10,1), (2,10,2), and (3,20,3). A cumulative
range over score includes all equal-score peers at once.

## Try it

Return row_id, range_total, and rows_total. Use ORDER BY score with RANGE
UNBOUNDED PRECEDING to CURRENT ROW for range_total, and ORDER BY score,row_id
with the equivalent ROWS frame for rows_total. Display by row_id.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/17-range-versus-rows/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

The two score-10 rows are peers in the RANGE window, so both see 3. The
explicitly ordered ROWS window advances one row at a time, yielding 1 then 3.
Define peer membership and sequence deliberately rather than relying on defaults.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Frame specification](https://dev.mysql.com/doc/refman/8.4/en/window-functions-frames.html).
