# Validation of lessons 21-35

Validated on October 24, 2026 using an isolated MySQL 8.0.46 instance with
network listening disabled, strict SQL mode, and ONLY_FULL_GROUP_BY enabled.

- All 35 lessons ran: 70 example/answer SQL files, including DELIMITER-based
  procedures and audit triggers.
- Answers for all 15 continuation lessons matched their expected TSV rows.
- Every stored shop seed column remained unchanged after each lesson.
- All eight original project reports still matched expected results.
- NULL, grouping, subquery, window, stock-guard, and rollback checks passed.
- All seven integrity violations produced the expected MySQL error codes.
- Procedure input values NULL, 0, and -1 each produced user-defined error 1644.
- Trigger audit rows rolled back with inventory changes; no-op updates did
  not create extra audit entries.
- Sandbox tables, routines, triggers, view, and temporary composite index
  were removed. Session-local temporary tables were explicitly dropped.
- The runner made 137 successful/expected-failure mysql client calls.
- Local Markdown links, Python syntax, answer fixtures, and whitespace passed
  static checks.

Reproduce with the commands in [the checker guide](README.md). No Python
packages are required. The test server used a dedicated temporary data
directory; existing databases and accounts were not changed. MySQL 8.4 and
the Docker container path were not exercised in this run.

The earlier [validation record](validation.md) documents the original 20
lessons and the separate backup/restore test. The backup lab was not repeated
for this extension because its commands and source schema were unchanged.
