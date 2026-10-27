# Revision 02: Repair Boolean filters and date boundaries

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Return product_id and product_name for electronics costing at least 8.00
   OR home products costing at most 12.00. Make both groups explicit with
   parentheses and order by product_id.
2. Return order_id and customer_id for paid/shipped February 2025 orders only.
   Use an inclusive start and exclusive next-month boundary, ordered by order_id.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. In `A OR B AND C`, which operation binds more tightly? Why use parentheses?
2. Why can an end boundary of '2025-02-28' omit most orders on February 28?

<details>
<summary>Open after answering: reasoning checks</summary>

1. AND binds more tightly. Parentheses make the intended groups visible and
   prevent an edit from accidentally broadening the filter.
2. A date string used as a datetime boundary represents midnight at the start
   of that day. `< '2025-03-01'` covers the entire preceding month.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [Filtering](../../lessons/02-filtering/README.md).
