# 05. Use text number and date functions

## Goal
Transform values inside a query.

```sql
SELECT UPPER(name), ROUND(price * 1.16, 2), DATE_ADD(joined_on, INTERVAL 7 DAY)
FROM example_table;
```

Functions take arguments and return values. CONCAT combines text, LOWER and
UPPER change case, TRIM removes surrounding spaces, and CHAR_LENGTH counts
characters. LENGTH counts bytes, which can differ with Unicode.
ROUND controls numeric precision; DATE_FORMAT formats a date as text.
DATEDIFF(a, b) returns days from b to a, ignoring the time portions.

## Must know
CONCAT returns NULL when an argument is NULL; use COALESCE when appropriate.
Store dates as date/time types, not formatted strings. NOW() uses the session
timezone; UTC_TIMESTAMP() gives UTC. The seed's DATETIME convention is UTC.
TIMESTAMP has session-timezone conversion behavior unlike DATETIME.
Avoid wrapping indexed filter columns in functions when a direct range works.

## Check yourself
Notebook's price plus the hypothetical 16% tax is 5.22. Order months are
2025-01, 2025-02, and 2025-03. Farah's seven-day follow-up is 2025-03-08.

## Practice

Read `exercises.sql`, write your own queries, then compare with `answers.sql`.
Run `examples.sql` first. Start with a fresh seed for predictable results.
