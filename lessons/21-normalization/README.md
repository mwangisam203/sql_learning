# 21. Normalize a relational design
## Goal
Explain why the shop stores customers, products, orders, and lines separately.

A functional dependency describes a rule: customer_id determines a customer's
name and contact details. A sample result alone cannot establish that rule.
In an order-line export, customer details repeat on every line. Editing only
one repeated copy creates an update anomaly. Storing a customer once and
referencing its key avoids that inconsistency.

## Must know
- First normal form: use scalar values for the chosen domain; do not store a
  comma-separated list of product IDs in one order column.
- Second normal form: attributes depend on the entire candidate key. With a
  composite line key (order_id, product_id), a product's name depends on only
  product_id, so keep its catalog name in products.
- Third normal form: for every nontrivial dependency X -> A, X is a superkey
  or A is part of a candidate key. In simple designs this avoids storing
  non-key facts that depend on other non-key facts.

Historical unit_price belongs on the line: a purchase's agreed price differs
from today's catalog price. Not every repeated value is a normalization bug.
Category text may be promoted to a lookup table when it needs its own facts
or independent validation. Normalization follows business rules, not row counts.

## Syntax and result check
Use JOIN to reconstruct an export from normalized tables. The exercise shows
Amina's four lines across two orders, followed by one normalized customer row.
A join repeats values in a result without duplicating stored customer records.

## Practice

Start from the seed, run `examples.sql`, then solve `exercises.sql` before
reading `answers.sql`. These files preserve the four shop tables. Compare
answers with `expected-answers.tsv` (tabs separate columns; NULL means missing).
Run files from a mysql client with this repository as its working directory:

```sql
SOURCE lessons/21-normalization/examples.sql;
SOURCE lessons/21-normalization/answers.sql;
```
