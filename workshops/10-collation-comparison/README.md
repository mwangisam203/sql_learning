# Workshop 10: Make case and accent comparison rules explicit

A utf8mb4 character set can store text, while its collation decides comparison
rules. The course's ai_ci collation is accent-insensitive and case-insensitive.

## Try it

In one SELECT return whether Cafe equals cafe under utf8mb4_0900_ai_ci,
whether cafe equals café under that same collation, and whether Cafe equals
café under utf8mb4_0900_as_cs. Use explicit utf8mb4 string introducers.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/10-collation-comparison/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

The results are 1,1,0. Encoding support does not define equality on its own.
Collation choices also affect sorting, grouping, and uniqueness checks; choose
them deliberately for the field's business meaning. These 0900 collations are MySQL-specific.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Collation naming](https://dev.mysql.com/doc/refman/8.4/en/charset-collation-names.html).
