# 27. Compare rows with self joins
## Goal
Treat two aliases of the same table as independent roles.

```sql
SELECT a.id, b.id
FROM example_people AS a JOIN example_people AS b
  ON a.city = b.city AND a.id < b.id;
```

A self join is a normal join using the same table twice. Aliases distinguish
left/right, employee/manager, or earlier/later roles. For unordered pairs,
a.id < b.id removes self-pairs and mirrored duplicates. Using <> removes
self-pairs but still produces both (A,B) and (B,A).

## Must know
A self join can create many rows: a city containing n people has n*(n-1)/2
unordered pairs. Keep the intended grain clear. Use a LEFT JOIN for a manager
lookup if employees without a manager should remain. Self joins follow only
the relationships described by the ON clause; arbitrary-depth trees need a
recursive query, introduced next.

## Check yourself
The exercise returns four pairs: (1,3), (1,6), (2,5), and (3,6). Three Nairobi
customers produce three pairs; two Mombasa customers produce one pair.
No customer is paired with themself and no pair appears in reverse.

## Practice

Start from the seed, run `examples.sql`, then solve `exercises.sql` before
reading `answers.sql`. These files preserve the four shop tables. Compare
answers with `expected-answers.tsv` (tabs separate columns; NULL means missing).
Run files from a mysql client with this repository as its working directory:

```sql
SOURCE lessons/27-self-joins/examples.sql;
SOURCE lessons/27-self-joins/answers.sql;
```
