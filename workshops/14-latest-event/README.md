# Workshop 14: Choose one latest event with a deterministic tie breaker

Incoming rows (ingest_id,event_key,received_at,value) are:
(1,'event-a','2025-01-01 09:00:00',10), (2,'event-a','2025-01-02 09:00:00',12),
(3,'event-b','2025-01-02 09:00:00',20), (4,'event-b','2025-01-02 09:00:00',21).
The chosen rule is latest received_at, then highest ingest_id for equal times.

## Try it

Rank the rows within event_key and keep exactly one according to that rule.
Return ingest_id, event_key, value ordered by event_key. Explain why MAX of
the timestamp alone cannot choose one event-b row.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/14-latest-event/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

Both event-b rows share the latest timestamp. A unique secondary key makes
the chosen row predictable; ROW_NUMBER filtered in an outer query returns
one row per event key. This selects a policy; it does not prove upstream freshness.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Window ranking](../../lessons/17-windows/README.md).
