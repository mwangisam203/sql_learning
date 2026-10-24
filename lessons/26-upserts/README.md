# 26. Handle duplicate keys with upserts
## Goal
Choose what should happen when an INSERT meets an existing unique key.

```sql
INSERT INTO example_stock (product_id, stock) VALUES (1, 12)
ON DUPLICATE KEY UPDATE stock = 12;
```

An upsert inserts a missing key or updates the conflicting row. It only
recognizes duplicates through PRIMARY KEY or UNIQUE constraints, not arbitrary
business similarity. The examples use a temporary table with one key so the
conflict target is unambiguous.

## Must know
Setting stock to an absolute value twice leaves the same value: that operation
is idempotent. Adding 2 twice adds 4: an increment is not idempotent. Choose
based on whether your payload is a latest state or a new event. Event-driven
increments need deduplication when requests may be retried.
REPLACE can delete a conflicting row and insert a new one, with different
foreign-key/trigger effects; do not treat it as a synonym for this upsert.
Avoid INSERT IGNORE when you need validation failures to remain visible.
Avoid relying on affected-row counts as a simple inserted/updated Boolean;
counts vary with outcome and client options.

These examples use constant update expressions supported at the course's
8.0.18 floor. The legacy VALUES(column) update reference is deprecated in
newer MySQL; incoming-row alias syntax requires a newer 8.0 release.

## Check yourself
The answer returns product 1 with stock 12 and product 5 with stock 6. A second
absolute-state upsert leaves product 1 at 12. No real product stock is changed.

## Practice

Start from the seed, run `examples.sql`, then solve `exercises.sql` before
reading `answers.sql`. These files preserve the four shop tables. Compare
answers with `expected-answers.tsv` (tabs separate columns; NULL means missing).
Run files from a mysql client with this repository as its working directory:

```sql
SOURCE lessons/26-upserts/examples.sql;
SOURCE lessons/26-upserts/answers.sql;
```
