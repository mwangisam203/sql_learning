# Revision drills

Practice retrieving what you have learned before reading another solution.
Use one drill per session, then retry missed tasks in a later session.

1. Load the disposable seed from the repository root with `SOURCE data/reset.sql;`.
2. Read a drill's README and copy starter.sql into your own practice/ directory.
3. Predict results, write both queries, and answer both reasoning questions.
4. Compare with answers.sql and expected.tsv, then record a score out of four.

The answer files preserve all stored shop rows. Write drills use ROLLBACK or
temporary tables. Rolled-back inserts may still advance auto-increment counters.
Do not insert schema changes into the middle of a rollback exercise.
Run SOURCE paths from the repository root; for example:

```sql
SOURCE revision/01-read-the-schema/answers.sql;
```

The [course checker](../checks/README.md) runs every revision answer file,
compares expected output, and checks the seed rows after each drill. Its
--reset option replaces the four course tables; use a dedicated learning DB.
A passing answer file does not prove your own starter solution is correct:
compare your query and reasoning with the requirements too.

Use [the review log](review-log.txt). Aim for an explanation you can repeat,
not just a result that happens to match today's seed.

| Drill | Practice focus |
|-------|----------------|
| [01: Retrieve columns and inspect the row grain](01-read-the-schema/README.md) | SELECT |
| [02: Repair Boolean filters and date boundaries](02-repair-filters/README.md) | Filtering |
| [03: Continue a sorted page without skipping ties](03-stable-pages/README.md) | Sorting and pagination |
| [04: Distinguish missing values from empty text](04-null-or-empty/README.md) | NULL |
| [05: Predict aggregate results for empty inputs](05-empty-aggregates/README.md) | Aggregates |
| [06: Separate row filters from group filters](06-where-or-having/README.md) | Grouping |
