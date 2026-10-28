# Workshop 02: Expose the NULL trap in NOT IN

Candidate IDs are 1,2,3. An exclusion result contains 1 and NULL. The requirement
is to exclude matching IDs, not to discard every candidate.

## Try it

First return the count from a NOT IN filter using that exclusion set. Then
rebuild the CTEs and return the surviving IDs using a correlated NOT EXISTS,
ordered by ID. Explain why the first result is zero rather than two.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/02-null-in-not-in/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

For nonmatching IDs, comparing against the NULL makes NOT IN UNKNOWN. WHERE
keeps only TRUE. NOT EXISTS asks whether a matching exclusion row exists;
its NULL exclusion cannot match IDs 2 or 3, so both survive.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [NULL](../../lessons/04-null/README.md), [Subqueries](../../lessons/10-subqueries/README.md).
