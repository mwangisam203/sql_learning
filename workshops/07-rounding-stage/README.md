# Workshop 07: Compare rounding each line with rounding the total

Two lines each contain the exact decimal amount 0.335. A rule that rounds each
line before summing can produce a different result from rounding the final sum.

## Try it

Build a two-row CTE with amount DECIMAL(10,3). Return line_id, amount, and the
amount rounded to two places. Then return summed_rounded_lines and rounded_sum.
Do not use approximate floating-point literals or assume the two totals match.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/07-rounding-stage/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

Each 0.335 rounds to 0.34, so the first total is 0.68. The unrounded sum is
0.670, so its rounded total is 0.67. The domain's rounding policy must specify
where rounding happens; the SQL expression should implement that chosen policy.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Rounding](../../lessons/05-functions/README.md).
