# Revision 05: Predict aggregate results for empty inputs

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. For products costing more than 1000, return COUNT(*) as matches, SUM(price)
   as raw_total, and COALESCE(SUM(price), 0.00) as displayed_total.
2. For all catalog products, return average_price cast to DECIMAL(10,2),
   MIN(price) as lowest_price, and MAX(price) as highest_price.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. Why does COUNT return zero while SUM returns NULL on the first input?
2. Why is an undefined average not always interchangeable with zero?

<details>
<summary>Open after answering: reasoning checks</summary>

1. COUNT describes how many rows were found: zero. SUM has no values to sum
   and returns NULL; COALESCE can supply a reporting convention explicitly.
2. No observations and an observed average of zero mean different things.
   Keep NULL when replacing it would misstate the measurement.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [Aggregates](../../lessons/06-aggregates/README.md), [Numeric conversion](../../lessons/22-numeric-conversion/README.md).
