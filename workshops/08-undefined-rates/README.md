# Workshop 08: Keep undefined rates distinct from measured zero

Metrics are (sample_id,numerator,denominator): (1,0,5), (2,5,0), (3,NULL,5).
All three deserve different explanations even though two have no numeric rate.

## Try it

Return sample_id, rate cast to DECIMAL(10,2), and reason. Label missing input
as missing, a zero denominator as undefined, and a valid denominator as measured.
Use NULLIF for division, and keep undefined/missing rates as SQL NULL.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/08-undefined-rates/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

The measured zero is 0.00. A zero denominator is undefined; missing input is
unknown. COALESCE(rate,0) would erase those distinctions, so only substitute
zero when that is an explicit reporting convention with the intended meaning.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [NULL arithmetic](../../lessons/22-numeric-conversion/README.md).
