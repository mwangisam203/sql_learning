# Workshop 24: Distinguish JSON null from an absent path

The document is {"present":null,"empty":""}. An explicit JSON null, an
absent key, and an empty string are three different document states.

## Try it

For paths $.present, $.absent, and $.empty, return field_label, path_exists,
and kind. Labels are explicit_null, absent, empty_text in that order. Use
JSON_CONTAINS_PATH, JSON_EXTRACT, and JSON_TYPE; kinds are json_null, missing,
and STRING. Avoid JSON_TABLE's version-sensitive JSON-null conversion behavior.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/24-json-null-or-missing/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

JSON_CONTAINS_PATH detects presence even when the value is JSON null.
JSON_TYPE of that value is the text 'NULL'; a missing extraction is SQL NULL.
Checking presence and type preserves the distinction before applying defaults.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [JSON search functions](https://dev.mysql.com/doc/refman/8.4/en/json-search-functions.html).
