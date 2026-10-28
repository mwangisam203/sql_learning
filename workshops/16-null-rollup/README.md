# Workshop 16: Distinguish a real NULL group from a grand total

Rows (category,amount) are (NULL,2), ('home',3), and ('home',4). WITH ROLLUP
produces a NULL grouping marker for the total as well as the real NULL category.

## Try it

Group with ROLLUP and return category_label, total, and is_total. Label the
real NULL category (missing), the home category home, and the total ALL.
Use GROUPING(category), then order by that flag and the original category.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/16-null-rollup/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

Testing category IS NULL cannot distinguish the two meanings. GROUPING is 0
for the actual missing-category group and 1 for the super-aggregate row.
Do not add the total row to the detail groups again.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [ROLLUP](../../lessons/31-rollup/README.md).
