# Revision 11: Turn reporting rules into explicit labels

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Return every customer's ID, completed revenue, and spend_band. Use high
   for revenue >= 60, some for positive revenue below 60, and none for zero.
   Preserve zero spenders, aggregate before labeling, and sort by customer ID.
2. In one row, count paid, shipped, pending, and cancelled orders separately
   with conditional SUM expressions in that column order.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. Why is COUNT(CASE WHEN status = 'paid' THEN 1 ELSE 0 END) the wrong paid count?
2. How would moving the completed-status predicate into a final WHERE affect zero spenders?

<details>
<summary>Open after answering: reasoning checks</summary>

1. Both 1 and 0 are non-NULL, so COUNT counts every row. Use SUM with ELSE 0,
   or COUNT with an implicit NULL for nonmatching rows.
2. It could remove unmatched customers. Filter inside the revenue summary and
   LEFT JOIN that summary to customers before applying COALESCE and CASE.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [CASE](../../lessons/11-case-union/README.md), [CTEs](../../lessons/16-ctes/README.md).
