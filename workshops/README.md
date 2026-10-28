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
