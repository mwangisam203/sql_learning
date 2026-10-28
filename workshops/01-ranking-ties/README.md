# Workshop 01: Choose ranking semantics when values tie

Three items have (item_id, score): (1,10), (2,10), (3,5). A report needs both
stable row positions and ranks that treat equal scores as equal.

## Try it

Build an items CTE. Return item_id, score, row_position, tied_rank, dense_position,
ordered by item_id. Use score DESC/id ASC for ROW_NUMBER, but score DESC alone
for the two rank functions. Predict where RANK leaves a gap.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/01-ranking-ties/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

ROW_NUMBER assigns 1,2,3. RANK assigns 1,1,3; DENSE_RANK assigns 1,1,2.
Adding item_id inside a rank's ordering would remove the score ties. Final
ORDER BY controls display separately from each window's ordering.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Windows](../../lessons/17-windows/README.md).
