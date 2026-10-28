# Workshop 27: Define the rule when the required set is empty

Candidates are 1 and 2. Their purchases are (1,10) and (2,20), but the current
required-product set contains no rows. Does everyone satisfy every requirement?

## Try it

Use double NOT EXISTS to return qualifying candidate IDs, ordered by ID.
Then repeat with an explicit rule requiring the requirements set to be nonempty,
returning only a qualifying-candidate count. Do not silently choose a business policy.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/27-empty-required-set/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

With no requirements, there cannot be a missing requirement, so the first
query accepts both candidates. Requiring EXISTS(required) changes the policy
and returns zero. An empty configuration could also be treated as an error by
an application; SQL alone cannot choose the desired business rule.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Relational division](../../lessons/32-all-of-a-set/README.md).
