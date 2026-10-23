# Validation record

Validated on October 23, 2026 using an isolated MySQL 8.0.46 server with
strict SQL mode and ONLY_FULL_GROUP_BY enabled.

- All 20 lessons: 40 runnable example/answer SQL files executed successfully.
- Every stored seed column remained unchanged after each lesson.
- All 8 project reports matched the checked-in expected TSV exactly.
- Known NULL, grouping, subquery, window, stock-guard, and rollback results passed.
- Seven invalid writes were rejected with the expected constraint error codes.
- Lesson sandbox tables, view, and composite index were removed successfully.
- A mysqldump backup restored into a separate temporary database with matching
  rows, constraints, and all eight project reports.
- Local Markdown links and the Python runner's syntax were checked.
- Docker Compose configuration parsed successfully with .env.example.

The temporary server used a dedicated /tmp data directory and a Unix socket,
with network listening disabled. Existing databases were not used. The Docker
container path and MySQL 8.4 runtime were not exercised in this validation.

Reproduce the database checks using the commands in [checks/README.md](README.md).
The backup/restore lab remains a separate manual exercise for learners.
