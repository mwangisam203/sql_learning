# Workshop 21: Understand multiple NULLs in a nullable unique key

A practice contact table has an integer primary key and a nullable UNIQUE
email column. Two contacts have no email; one has a known address.

## Try it

Create temporary workshop21_contacts and insert (1,NULL), (2,NULL),
(3,'a@example.test'). Return row_count and known_emails. Then group by email,
label missing email as (missing), and return label/count ordered by original
email. Drop the temporary table. Do not execute a deliberately failing insert.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/21-nullable-unique/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

MySQL permits multiple NULLs in this nullable UNIQUE key. The key still rejects
duplicate non-NULL values according to its comparison rules. Add NOT NULL when
every row must supply a value; uniqueness and requiredness are different rules.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Constraints](../../lessons/13-constraints/README.md).
