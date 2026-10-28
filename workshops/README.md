# MySQL edge-case workshops

Use these workshops after the lessons or whenever a revision drill feels easy.
Each workshop supplies a small counterexample: ties, missing values, repeated
rows, empty sets, or a boundary that a happy-path query can miss.

1. Explain the intended row grain and predict the output.
2. Build the sample data in a copy of starter.sql and write the query.
3. Compare with solution.sql and expected.tsv only after making an attempt.
4. Record one incorrect assumption and the rule you will use next time.

Start with the [normal setup](../docs/setup.md) and the disposable shop seed.
All solution files select mysql_learning; their inline/temporary sample rows
are separate from the shop data. Keep ordinary DDL out of a transaction you
intend to roll back. Some labs intentionally contrast an incorrect result
with its correction; the README defines the output sequence.

The [course checker](../checks/README.md) compares each solution with its
expected TSV and verifies all stored shop rows remain unchanged. The checker
uses --reset to replace the four course tables, so use a dedicated practice DB.
MySQL 8.0.18+ is required; MariaDB/SQLite behavior can differ.

| Workshop | Skill |
|----------|-------|
| [01: Choose ranking semantics when values tie](01-ranking-ties/README.md) | ROW_NUMBER, RANK, DENSE_RANK |
| [02: Expose the NULL trap in NOT IN](02-null-in-not-in/README.md) | Three-valued logic |
| [03: Count child keys rather than preserved rows](03-count-unmatched/README.md) | Outer-join counting |
| [04: Keep outer-join filters in the intended place](04-outer-filter-position/README.md) | ON versus WHERE |
| [05: Preaggregate independent one-to-many relationships](05-two-child-fanout/README.md) | Join multiplication |
| [06: Use the intended denominator for weighted averages](06-weighted-average/README.md) | Aggregate meaning |
| [07: Compare rounding each line with rounding the total](07-rounding-stage/README.md) | Exact decimal rounding |
| [08: Keep undefined rates distinct from measured zero](08-undefined-rates/README.md) | NULLIF and CASE |
| [09: Distinguish Unicode character length from byte length](09-unicode-length/README.md) | UTF-8 strings |
| [10: Make case and accent comparison rules explicit](10-collation-comparison/README.md) | Character set versus collation |
| [11: Escape literal percent and underscore in LIKE](11-literal-like-wildcards/README.md) | Pattern matching |
| [12: Include the whole last day of a datetime range](12-end-of-day/README.md) | Half-open date boundaries |
| [13: Distinguish calendar-day differences from elapsed minutes](13-duration-units/README.md) | DATEDIFF and TIMESTAMPDIFF |
| [14: Choose one latest event with a deterministic tie breaker](14-latest-event/README.md) | Window-based deduplication |
| [15: Avoid using DISTINCT amounts to hide join bugs](15-distinct-amounts/README.md) | Row identity versus measure value |
| [16: Distinguish a real NULL group from a grand total](16-null-rollup/README.md) | GROUPING markers |
| [17: Compare peer-aware RANGE frames with row frames](17-range-versus-rows/README.md) | Window frame units |
| [18: Extend LAST_VALUE to the whole partition when required](18-last-value-frame/README.md) | Frame-sensitive value functions |
| [19: Find runs of consecutive active dates](19-activity-islands/README.md) | Gaps and islands |
