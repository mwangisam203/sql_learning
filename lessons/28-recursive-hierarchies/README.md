# 28. Traverse hierarchies with recursive CTEs
## Goal
Follow a manager/employee relationship across multiple levels.

```sql
WITH RECURSIVE tree AS (
  SELECT id, manager_id, 0 AS depth FROM employees WHERE id = 1
  UNION ALL
  SELECT e.id, e.manager_id, t.depth + 1
  FROM employees AS e JOIN tree AS t ON e.manager_id = t.id
  WHERE t.depth < 10
)
SELECT * FROM tree;
```

The anchor chooses a starting node. The recursive member finds its children,
then their children, until no new rows are produced. Depth counts edges from
the chosen root. Include a bounded condition and understand the server's
cte_max_recursion_depth limit before using an unknown hierarchy.

## Must know
A depth bound stops runaway traversal but does not detect or repair cycles.
Real hierarchies need cycle prevention/detection and clear handling of orphans.
UNION ALL preserves paths; using UNION to deduplicate is not a general cycle
solution when depth/path values keep changing. Result ordering is separate
from traversal: use ORDER BY for a stable report.

Recursive column types are inferred from the anchor. CAST a growing path to
a large enough CHAR size at the anchor, or later concatenation may overflow.
The demo uses an inline, acyclic employee set and creates no permanent tables.

## Check yourself
Starting at Brian (2), include Brian at depth 0, Diego (4) and Ella (5) at
1, and Farah (6) at 2. Chloe reports to Amina, so is not in Brian's subtree.

## Practice

Start from the seed, run `examples.sql`, then solve `exercises.sql` before
reading `answers.sql`. These files preserve the four shop tables. Compare
answers with `expected-answers.tsv` (tabs separate columns; NULL means missing).
Run files from a mysql client with this repository as its working directory:

```sql
SOURCE lessons/28-recursive-hierarchies/examples.sql;
SOURCE lessons/28-recursive-hierarchies/answers.sql;
```
