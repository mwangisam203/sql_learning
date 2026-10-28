# Workshop 26: Choose whether combined inputs preserve repeated rows

Input A contains IDs 1,1,2. Input B contains IDs 2,3. Combining these inputs
has different meaning depending on whether the report describes a set or every occurrence.

## Try it

For UNION return row_count and SUM(id). Repeat using UNION ALL. Build both
inputs as CTEs and put the combined query in a derived table. Predict both
counts and sums, including the repeated ID inside input A.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/26-union-bags/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

UNION deduplicates complete result rows across the combination, yielding
1,2,3: three rows totaling 6. UNION ALL retains five occurrences totaling 9.
Neither choice automatically corrects a flawed business identity or join.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [UNION](../../lessons/11-case-union/README.md).
