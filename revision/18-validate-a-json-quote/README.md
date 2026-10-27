# Revision 18: Validate JSON product references before quoting

Allow 15-25 minutes. Work from memory first, then revisit the linked lessons.
Use the fixed shop seed and paid/shipped revenue convention.

## Write and predict

1. Expand the JSON array below with JSON_TABLE. LEFT JOIN catalog products and
   return product_id, product_name, quantity, quote_value, and issue, sorted by ID.
   Use unknown_product for no matching product, invalid_quantity for missing or
   nonpositive quantity, and ok otherwise. Missing/invalid quotes must be NULL.
   Payload: [{"id":1,"quantity":2},{"id":5,"quantity":3},{"id":999,"quantity":1}].
2. For rows with a known product and positive quantity, return valid_lines and
   total_quote. This is a prospective catalog-price quote, not historical revenue.

Copy `starter.sql` into your own `practice/` file. Write the queries, predict
the row counts or values, then run them. Compare with `answers.sql` and
`expected.tsv` only after attempting both tasks. Tabs separate columns;
NULL in the expected output means a missing SQL value.

## Explain without running SQL

1. Why does extracting a JSON id as INT not prove that the product exists?
2. Why would an INNER JOIN hide a useful validation failure in task 1?

<details>
<summary>Open after answering: reasoning checks</summary>

1. A successful conversion establishes a type, not referential integrity.
   Check the product relationship explicitly before promoting an incoming row.
2. It would discard ID 999 completely. LEFT JOIN preserves that input row
   so the caller can see and handle unknown_product rather than silently lose it.

</details>

## Record your review

Give yourself one point per SQL task and one per reasoning question (4 total).
Record the score and one correction in [the review log](../review-log.txt).
Retry missed tasks from memory in your next session.

Revisit: [JSON_TABLE](../../lessons/23-json/README.md), [Import validation](../../lessons/35-data-quality-capstone/README.md).
