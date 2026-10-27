# Revision 06: Separate row filters from group filters

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Filter orders to paid/shipped, then return customer_id and completed_orders
   only for customers with at least two completed orders. Sort by customer_id.
2. Return city and customer_count for cities with at least two customers.
   Sort by city. Keep ONLY_FULL_GROUP_BY enabled.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. Why does a completed-status predicate belong in WHERE and a count threshold in HAVING?
2. Why is selecting an arbitrary full_name while grouping only by city ambiguous?

<details>
<summary>Open after answering: reasoning checks</summary>

1. Status selects individual input rows; the aggregate count exists only after
   grouping. WHERE filters those rows and HAVING filters their summaries.
2. A city can contain several customers with different names. The city does
   not determine one name, so use grouped columns and explicit aggregates.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [Grouping](../../lessons/07-grouping/README.md).
