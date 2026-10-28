# Workshop validation

Validated October 28, 2026 on an isolated MySQL 8.0.46 instance with network
listening disabled, strict SQL mode, and ONLY_FULL_GROUP_BY enabled.

- 30 workshop solutions matched their expected TSV outputs.
- All 70 lesson SQL files, 20 revision drills, and eight project reports passed.
- Every stored shop seed column stayed unchanged after each lesson, drill, and workshop.
- Existing constraint, procedure input, transaction, and cleanup checks passed.
- The complete run made 237 mysql client calls.
- File completeness, numbering, local Markdown links, Python syntax, and whitespace passed.

See [the checker guide](README.md) to reproduce the checks. Starter files are
practice templates; the automated run verifies worked solutions. MySQL 8.4,
Docker runtime, and the unchanged manual backup lab were not retested.
