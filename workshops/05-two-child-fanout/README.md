# Workshop 05: Preaggregate independent one-to-many relationships

Order 1 has line amounts 10 and 20, and payment amounts 5,10,15. Joining both
children directly creates every line/payment pair: six rows for one order.

## Try it

First demonstrate the bad join: return joined_rows, summed_lines, summed_payments.
Then aggregate each child by order_id before joining those summaries, returning
order_id, line_total, payment_total. Use decimal amounts with two digits.

Write your query in a copy of `starter.sql` under `practice/`. Predict results
before opening `solution.sql`. The worked solution uses inline sample rows or
explicitly named temporary tables and preserves the four shop seed tables.
Run it from a mysql client opened at the repository root:

```sql
SOURCE workshops/05-two-child-fanout/solution.sql;
```

Compare the ordered results with `expected.tsv` (tabs separate columns).
The course checker executes the solution; it does not grade your practice file.

## Explain the result

Each line repeats for three payments; each payment repeats for two lines.
The inflated sums are 90.00 and 60.00, although both real totals are 30.00.
Aggregate each independent child at the order grain before combining them.

Record one wrong assumption and its replacement in [the review log](../review-log.txt).

References: [Join grain](../../lessons/08-inner-join/README.md).
