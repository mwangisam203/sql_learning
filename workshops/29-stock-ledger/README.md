# Workshop 29: Reconcile a cached balance against its movement ledger

Opening stock is 10 units. Ordered movements (movement_id,delta) are (1,5),
(2,-3), and (3,1). A cached final stock value says 12, which may be stale.

## Try it

Return movement_id, delta, and opening stock plus the running SUM(delta),
with an explicit ROWS frame ordered by movement_id. Then return expected_stock,
cached_stock (12), and discrepancy (expected minus cached) in one row.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/29-stock-ledger/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

The running balances are 15,12,13, so the cache differs by one unit. A matching
cache does not by itself prove every movement was valid or complete. A real
ledger also needs stable event identity and checks against duplicated events.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Running totals](../../lessons/17-windows/README.md).
