# Workshop 20: Detect overlaps using half-open intervals

On January 1, 2025, meeting 1 runs [09:00,10:00), meeting 2 [10:00,11:00),
and meeting 3 [09:30,10:30). The closing boundary is excluded, so touching
meetings 1 and 2 do not overlap. Every interval has start < end.

## Try it

Build the meetings CTE and return unique overlapping ID pairs. Use a.id < b.id,
a.starts_at < b.ends_at, and b.starts_at < a.ends_at. Sort by the first then
second ID. Explain what <= would change for a touching boundary.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/20-interval-overlap/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

The matches are (1,3) and (2,3). Strict comparisons match the half-open rule;
using <= would wrongly count meetings touching at 10:00. The ID condition
removes self-pairs and mirrored duplicates, not time conflicts.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Self joins](../../lessons/27-self-joins/README.md).
