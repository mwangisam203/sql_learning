# Learn MySQL, one commit at a time

A beginner-friendly course with **35 lessons** and a shop reporting project.
Each topic is introduced in a focused Git commit. Target: **MySQL 8.0.18+**, with
MySQL 8.4 used in the optional Docker setup. These are MySQL examples;
SQLite and MariaDB have different syntax and behavior in some areas.

## Start here

1. Follow [setup](docs/setup.md) to connect to a local practice server.
2. From this repository's root, load `data/reset.sql` as documented there.
   It **drops and recreates the four course tables** in `mysql_learning`.
3. Read a lesson's `README.md`, run `examples.sql`, then try `exercises.sql`.
4. Compare your work with `answers.sql` and explain the result out loud.
5. Finish the [shop reporting project](project/README.md).
6. Reinforce each topic with [revision drills](revision/README.md) and record
   your attempts in the review log.
7. Test your assumptions with [edge-case workshops](workshops/README.md).

All people and orders are fictional. Prices are in one unspecified currency;
revenue means paid or shipped orders, excluding pending and cancelled orders.
Use only a disposable learning database. Leave strict SQL mode enabled.
The existing `demo_mysql_test.py` is independent of this course.

## Lessons

Lessons 01-20 build the foundation. After the shop project, use lessons 21-35
for deeper design, reporting, stored programs, and import practice.

| # | Topic | Main skill |
|---|-------|------------|
| 01 | [SELECT](lessons/01-select/README.md) | Columns, expressions, aliases |
| 02 | [Filtering](lessons/02-filtering/README.md) | WHERE, AND, OR, IN, LIKE |
| 03 | [Sorting](lessons/03-sorting/README.md) | ORDER BY, LIMIT, pagination |
| 04 | [NULL](lessons/04-null/README.md) | Missing values, COALESCE |
| 05 | [Functions](lessons/05-functions/README.md) | Text, numbers, dates |
| 06 | [Aggregates](lessons/06-aggregates/README.md) | COUNT, SUM, AVG |
| 07 | [Grouping](lessons/07-grouping/README.md) | GROUP BY and HAVING |
| 08 | [INNER JOIN](lessons/08-inner-join/README.md) | Relationships and row grain |
| 09 | [LEFT JOIN](lessons/09-left-join/README.md) | Missing relationships |
| 10 | [Subqueries](lessons/10-subqueries/README.md) | IN, EXISTS, NOT EXISTS |
| 11 | [CASE and UNION](lessons/11-case-union/README.md) | Labels and combining rows |
| 12 | [CRUD](lessons/12-crud/README.md) | INSERT, UPDATE, DELETE |
| 13 | [Constraints](lessons/13-constraints/README.md) | Keys and valid data |
| 14 | [Schema changes](lessons/14-alter/README.md) | ALTER TABLE and migrations |
| 15 | [Transactions](lessons/15-transactions/README.md) | COMMIT, ROLLBACK, locks |
| 16 | [CTEs](lessons/16-ctes/README.md) | Named query steps |
| 17 | [Window functions](lessons/17-windows/README.md) | Ranking and running totals |
| 18 | [Views](lessons/18-views/README.md) | Reusable query definitions |
| 19 | [Indexes](lessons/19-indexes/README.md) | Composite indexes, EXPLAIN |
| 20 | [Security and backups](lessons/20-security-backups/README.md) | Parameters and recovery |
| 21 | [Normalize a relational design](lessons/21-normalization/README.md) | Recognize dependencies and avoid update anomalies |
| 22 | [Convert types and guard arithmetic](lessons/22-numeric-conversion/README.md) | Cast numeric values and handle zero denominators |
| 23 | [Read JSON documents as relational rows](lessons/23-json/README.md) | Extract JSON fields and expand arrays with JSON_TABLE |
| 24 | [Derive values with generated columns](lessons/24-generated-columns/README.md) | Choose virtual or stored generated columns |
| 25 | [Stage results with temporary tables](lessons/25-temporary-tables/README.md) | Reuse session-local results with INSERT SELECT |
| 26 | [Handle duplicate keys with upserts](lessons/26-upserts/README.md) | Separate replacement upserts from additive updates |
| 27 | [Compare rows with self joins](lessons/27-self-joins/README.md) | Match a table to itself without duplicate pairs |
| 28 | [Traverse hierarchies with recursive CTEs](lessons/28-recursive-hierarchies/README.md) | Walk a tree with an anchor and recursive step |
| 29 | [Fill missing months in reports](lessons/29-calendar-reports/README.md) | Combine a calendar CTE with zero-filled revenue |
| 30 | [Compare neighboring rows with LAG and LEAD](lessons/30-lag-lead/README.md) | Calculate period changes and time between orders |
| 31 | [Add subtotals with ROLLUP](lessons/31-rollup/README.md) | Distinguish totals from missing values with GROUPING |
| 32 | [Find customers matching every required product](lessons/32-all-of-a-set/README.md) | Express all-of-a-set questions with relational division |
| 33 | [Package queries in stored procedures](lessons/33-stored-procedures/README.md) | Use procedure parameters and signal invalid input |
| 34 | [Audit changes with transactional triggers](lessons/34-audit-triggers/README.md) | Inspect OLD and NEW values and roll back audit writes |
| 35 | [Quarantine invalid incoming data](lessons/35-data-quality-capstone/README.md) | Detect duplicate events and reconcile an import batch |

## Keep nearby

- [Data model](docs/data-model.md) and [seed facts](docs/dataset.md)
- [Syntax cheat sheet](notes/syntax-cheatsheet.txt) and [advanced reference](notes/advanced-cheatsheet.txt)
- [Must-know rules](notes/must-know.txt) and [common mistakes](notes/common-mistakes.txt)
- [Study method](notes/study-guide.txt) and [progress checklist](notes/progress.txt)
- [Official references](docs/sources.md)
- [Validation instructions](checks/README.md) and [latest results](checks/validation-revision.md)

Use `git log --reverse --oneline` to see the learning sequence and
`git show <commit>` to inspect the files introduced by one step.
Commits are local; no remote repository is required.
