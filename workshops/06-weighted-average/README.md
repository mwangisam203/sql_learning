# Workshop 06: Use the intended denominator for weighted averages

Two purchases have (purchase_id,unit_price,quantity): (1,10.00,1) and (2,20.00,9).
The question is average price per purchased unit, not average listed line price.

## Try it

Return total_units, unweighted_price (AVG(unit_price)), and weighted_price
(SUM(unit_price*quantity)/SUM(quantity)) in one row. Cast both prices to
DECIMAL(10,2) and guard the quantity denominator with NULLIF.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/06-weighted-average/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

The first line represents one unit while the second represents nine. Giving
each line equal influence yields 15.00; weighting the ten units yields 19.00.
An average is only meaningful once you define what receives equal weight.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Numeric arithmetic](../../lessons/22-numeric-conversion/README.md).
