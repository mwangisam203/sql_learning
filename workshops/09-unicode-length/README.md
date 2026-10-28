# Workshop 09: Distinguish Unicode character length from byte length

The strings are precomposed café and 猫. Under utf8mb4, the first has four
characters and the second one, but their byte counts differ from those counts.

## Try it

Build samples (sample_id,text_value) for those two strings. Return sample_id,
text_value, CHAR_LENGTH(text_value), and LENGTH(text_value), sorted by sample_id.
Use a utf8mb4 client connection as the checker does.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/09-unicode-length/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

CHAR_LENGTH counts characters; LENGTH counts bytes. café occupies five UTF-8
bytes and 猫 occupies three. Neither function is a complete user-interface
measure of visible glyph width; combining sequences can need extra handling.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [String functions](https://dev.mysql.com/doc/refman/8.4/en/string-functions.html).
