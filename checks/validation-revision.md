# Revision drill validation

Validated on October 27, 2026 with MySQL 8.0.46 in an isolated temporary
instance. Networking was disabled; strict SQL mode and ONLY_FULL_GROUP_BY
were enabled. Existing databases and accounts were not changed.

- All 35 original lessons passed: 70 example/answer SQL files.
- All 20 revision answer files matched their manually specified expected TSV.
- The drills contain 40 SQL tasks and 40 reasoning questions, with worked
  SQL answers and written reasoning checks for self-review.
- Every stored shop seed column remained unchanged after each lesson and drill.
- All eight project reports still matched their expected results.
- Existing NULL, grouping, scalar-subquery, window, stock-guard, and rollback
  checks passed, alongside the seven expected integrity-constraint failures.
- Invalid stored-procedure inputs still raised the expected user-defined errors.
- Sandbox tables, routines, trigger, view, and demo index were cleaned up.
- The complete run made 177 mysql client calls.
- Revision file completeness, consecutive numbering, local Markdown links,
  Python syntax, and whitespace were checked.

Reproduce using [the checker guide](README.md). Starter files are intentionally
unfinished: the automated checks execute worked answers, not your copied
practice queries. Explain and compare your own answers before awarding yourself
points in the review log.

MySQL 8.4 and the Docker path were not run in this validation. The unchanged
backup/restore lab was not repeated. See the [original validation](validation.md)
and [continuation validation](validation-extension.md) for earlier results.
