# Revision 04: Distinguish missing values from empty text

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Return total_customers, known_phones, and missing_phones in one row.
   Derive the last value using COUNT(*) and COUNT(phone).
2. Create a CTE with sample_id/sample_value rows (1,NULL), (2,''), (3,'0').
   Return sample_id and a label: missing for NULL, empty for '', present otherwise.
   Use CASE and sort by sample_id.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. What does `NULL = NULL` produce, and which predicate detects missing phones?
2. Does COALESCE(phone, 'Missing') replace an empty string too?

<details>
<summary>Open after answering: reasoning checks</summary>

1. Ordinary equality produces UNKNOWN (shown as NULL), not TRUE. Use IS NULL
   to test for missing phone values.
2. No. COALESCE chooses the first non-NULL argument; an empty string is a value.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [NULL](../../lessons/04-null/README.md), [Aggregate counts](../../lessons/06-aggregates/README.md).
