# 22. Convert types and guard arithmetic
## Goal
Make numeric types and undefined calculations explicit.

```sql
SELECT CAST('12.50' AS DECIMAL(10,2)), 7 DIV 2, 7 / 2;
SELECT amount / NULLIF(denominator, 0) FROM example_table;
```

DIV performs integer division; / performs division with result precision based
on the operands and MySQL settings. CAST explicitly converts a value. DECIMAL
keeps exact decimal arithmetic; FLOAT and DOUBLE use approximate binary values.
ROUND affects rounding; CAST to DECIMAL also determines precision and scale.

## Must know
NULLIF(a, b) returns NULL when the two values compare equal, otherwise a.
Dividing by NULL yields NULL, so NULLIF(denominator, 0) prevents a zero divisor.
Do not automatically replace that missing result with zero: an undefined rate
and a genuine 0% rate mean different things. Reject malformed input before
conversion; CAST is not a complete validation API. Strict mode and statement
context affect how bad conversions are handled. Do not rely on implicit
numeric conversion of text such as '12 items'.

## Check yourself
Completed units = 27 and revenue = 174.00, giving 6.44 per unit when rounded
to two decimals. That is different from the 29.00 average **order** value.
The second exercise yields NULL for a zero divisor, then integer quotient 3.

## Practice

Start from the seed, run `examples.sql`, then solve `exercises.sql` before
reading `answers.sql`. These files preserve the four shop tables. Compare
answers with `expected-answers.tsv` (tabs separate columns; NULL means missing).
Run files from a mysql client with this repository as its working directory:

```sql
SOURCE lessons/22-numeric-conversion/examples.sql;
SOURCE lessons/22-numeric-conversion/answers.sql;
```
