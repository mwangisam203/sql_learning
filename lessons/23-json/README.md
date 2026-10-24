# 23. Read JSON documents as relational rows
## Goal
Read structured JSON without turning every relational fact into a document.

```sql
SELECT JSON_UNQUOTE(JSON_EXTRACT(document, '$.name'));
SELECT j.id FROM JSON_TABLE(document, '$[*]'
  COLUMNS (id INT PATH '$.id')) AS j;
```

JSON_OBJECT constructs an object. JSON_EXTRACT returns JSON values, so a
JSON string normally retains quotes; JSON_UNQUOTE extracts its text value.
JSON_TABLE expands a document into typed SQL rows. The alias after JSON_TABLE
is required. $ is the document root, and [*] iterates an array's elements.

## Must know
JSON is useful for flexible optional attributes and incoming payloads. Keep
stable relationships and business constraints in regular columns and keys.
A missing path and a JSON null have nuanced behavior; this lesson uses missing
optional paths with NULL ON EMPTY and avoids version-sensitive JSON-null cases.
Use ERROR ON ERROR for fields that should reject type conversion problems.
It does not replace complete application validation. Document object-key order
is not a report contract; extract fields and ORDER BY the relational result.

## Check yourself
The exercise expands two incoming product quantities and joins their IDs to
the catalog: Notebook, 2, 9.00 and Cable, 3, 24.00. Nothing is inserted.

## Practice

Start from the seed, run `examples.sql`, then solve `exercises.sql` before
reading `answers.sql`. These files preserve the four shop tables. Compare
answers with `expected-answers.tsv` (tabs separate columns; NULL means missing).
Run files from a mysql client with this repository as its working directory:

```sql
SOURCE lessons/23-json/examples.sql;
SOURCE lessons/23-json/answers.sql;
```
