# Workshop 11: Escape literal percent and underscore in LIKE

Labels are (1,'50% off'), (2,'500 off'), (3,'50_ off'). A search for literal
percent or underscore must not interpret that character as a wildcard.

## Try it

Return label_id and label for labels beginning with literal 50%, then repeat
for labels beginning with literal 50_. Use ESCAPE '!' to keep SQL string
backslash processing out of the example. Sort each result by label_id.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/11-literal-like-wildcards/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

The first pattern is '50!%%': !% is a literal percent, and the final % matches
any suffix. '50!_%' similarly escapes underscore. Binding a search value as a
parameter protects SQL syntax, but does not remove LIKE's wildcard semantics.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [LIKE syntax](https://dev.mysql.com/doc/refman/8.4/en/string-comparison-functions.html).
