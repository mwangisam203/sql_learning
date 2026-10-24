# 31. Add subtotals with ROLLUP
## Goal
Return grouped summaries and their grand total in one result.

```sql
SELECT CASE WHEN GROUPING(category) = 1 THEN 'ALL' ELSE category END AS label,
       SUM(stock)
FROM products GROUP BY category WITH ROLLUP;
```

WITH ROLLUP adds super-aggregate rows. With one grouping column, that is a
grand total. With several columns, their order describes a subtotal hierarchy:
GROUP BY city, status WITH ROLLUP adds city subtotals and an overall total.

## Must know
ROLLUP uses NULL in grouping columns on subtotal rows, but real data can also
contain NULL. GROUPING(column) is 1 for a super-aggregate position and 0 for a
regular value, so test it instead of treating every NULL as a total. Apply a
clear ORDER BY; do not depend on incidental subtotal placement.

Do not sum the entire output to recover a grand total: it already contains
both detail groups and totals, which would double count. When exporting or
feeding a chart, include a grouping flag or separate total rows deliberately.
MySQL 8.0.18+ supports the ORDER BY usage shown here.

## Check yourself
Category stock counts: electronics 75, home 40, stationery 300, travel 20.
The ALL row has 6 products and 435 stock units. Product counts total 6 before
including the grand-total row, and 12 if you incorrectly add that row again.

## Practice

Start from the seed, run `examples.sql`, then solve `exercises.sql` before
reading `answers.sql`. These files preserve the four shop tables. Compare
answers with `expected-answers.tsv` (tabs separate columns; NULL means missing).
Run files from a mysql client with this repository as its working directory:

```sql
SOURCE lessons/31-rollup/examples.sql;
SOURCE lessons/31-rollup/answers.sql;
```
