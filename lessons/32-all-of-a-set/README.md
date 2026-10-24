# 32. Find customers matching every required product
## Goal
Find customers who bought every product in a required set.

An IN predicate answers whether a row matches **any** item in a set. An
all-of-a-set question needs a different pattern. For a nonempty set, count
each customer's DISTINCT qualifying products and compare with the required
product count. Repeated orders for one product must not substitute for another.
This operation is often called relational division.

## Syntax

```sql
HAVING COUNT(DISTINCT purchased_product_id) = (SELECT COUNT(*) FROM required_products)
```

Alternatively, double NOT EXISTS means: there is no required product for
which this customer has no qualifying purchase. This version naturally returns
all candidate customers when the required set is empty (vacuous truth).
A count-based join usually returns no customers for an empty set. Choose the
business rule explicitly rather than assuming the methods always coincide.

## Must know
Count only products in the required set, only paid/shipped orders, and only
one occurrence of each product per customer. Keep required product identifiers
unique. If a requirement includes quantities or dates, add those conditions;
a customer who bought one unit does not automatically meet a five-unit rule.

## Check yourself
The stationery set contains Notebook (1) and Pen (2). Only Amina (1) bought
both in completed orders. Brian bought pens but no notebook; Chloe bought a
notebook but no pen. The two exercise methods each return Amina once.

## Practice

Start from the seed, run `examples.sql`, then solve `exercises.sql` before
reading `answers.sql`. These files preserve the four shop tables. Compare
answers with `expected-answers.tsv` (tabs separate columns; NULL means missing).
Run files from a mysql client with this repository as its working directory:

```sql
SOURCE lessons/32-all-of-a-set/examples.sql;
SOURCE lessons/32-all-of-a-set/answers.sql;
```
