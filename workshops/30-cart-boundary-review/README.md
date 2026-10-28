# Workshop 30: Validate a cart before reserving inventory

Using the fixed shop catalog, cart rows (cart_row,product_id,quantity) are
(1,1,101), (2,2,2), (3,999,1), and (4,3,0). The cart mixes insufficient
stock, a valid line, an unknown product, and an invalid quantity.

## Try it

LEFT JOIN the cart to products. Return cart_row, product_id, issue, and
eligible_value, sorted by cart_row. Issue precedence is unknown_product,
invalid_quantity (NULL or <= 0), insufficient_stock, then ok. Only ok lines
have a current-price quote value. Repeat the checked CTE to return valid_lines,
invalid_lines, and eligible_quote_total. Do not insert orders or change stock.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/30-cart-boundary-review/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

Only the pen line is eligible, quoting 3.00. LEFT JOIN preserves the unknown
ID for diagnosis. Validating now does not reserve stock against concurrent
buyers: promotion needs a transaction with guarded updates and affected-row
checks. Catalog quotes and historical purchase prices remain different facts.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Staging checks](../../lessons/35-data-quality-capstone/README.md), [Guarded writes](../../lessons/15-transactions/README.md).
