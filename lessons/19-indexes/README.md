# 19. Read query plans and choose useful indexes

## Goal
Understand why a query reads rows the way it does.

```sql
CREATE INDEX idx_example ON example_table (filter_column, range_column);
EXPLAIN SELECT ...;
EXPLAIN ANALYZE SELECT ...;
```

An index is an additional access structure. It can speed filtering, joins,
and ordering, but consumes storage and adds work to writes. The leftmost
prefix matters for composite B-tree indexes: (customer_id, ordered_at) suits
queries that start with customer_id, optionally followed by a date range.
A date-only filter is not its main access pattern.

EXPLAIN shows the optimizer's plan and estimates. Examine access type, chosen
key, estimated rows, filtering, and sort work. EXPLAIN ANALYZE actually executes
the supported statement and reports measured rows/timing; use it intentionally.
On this six/eight-row dataset, scans may be cheaper. Do not claim speedups
from tiny data or a single timing. Test representative data and workload.

## Must know
MySQL already indexes primary keys and creates suitable foreign-key indexes
when needed. Inspect SHOW INDEX before adding redundant ones.
An automatically generated foreign-key index may be replaced by a suitable
wider index. The schema explicitly defines idx_orders_customer so this demo
can remove its temporary index while retaining foreign-key support. Compare a
function-wrapped date predicate with a direct range. 'Using filesort' does not
necessarily mean disk I/O. CREATE/DROP INDEX are DDL and implicitly commit.
This demo removes its composite index afterward.

## Check yourself
The indexed query returns customer 1's orders 1 and 3; the exercise returns
customer 2's March order 6. Plan details can legitimately vary by version.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
