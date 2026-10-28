# Workshop 25: Keep parent documents with empty JSON arrays

Document 1 contains [] and document 2 [{"q":2},{"q":3}]. A report needs one
summary row per document, including the document with no expanded lines.

## Try it

Build a documents CTE with document_id and lines_json. LEFT JOIN JSON_TABLE
on '$[*]' with an ordinal line_no and typed quantity. Return document_id,
COUNT(line_no), and COALESCE(SUM(quantity),0), grouped and sorted by document ID.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/25-empty-json-array/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

Expanding an empty array yields no line rows. The LEFT JOIN keeps its document
with NULL line fields, so count the ordinal rather than COUNT(*). JSON_TABLE
can reference the preceding document row without an explicit LATERAL keyword.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [JSON table functions](https://dev.mysql.com/doc/refman/8.4/en/json-table-functions.html).
