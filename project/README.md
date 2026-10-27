# Shop reporting project

Build these reports after finishing the lessons. Start with a fresh seed
(`SOURCE data/reset.sql;`) and write your queries in a copy of `tasks.sql`.
Use paid/shipped orders for all revenue and completed-order metrics. Include
pending/cancelled orders only in the explicitly all-status absence checks.
Do not inspect `solutions.sql` until you have attempted each task.

| Report | Required result | Check |
|--------|-----------------|-------|
| 1 | Monthly revenue in month order | 41.50, 53.00, 79.50 |
| 2 | Every customer's completed count and spend, by customer_id | 6 rows, total 174.00 |
| 3 | Every product's completed units and revenue, by product_id | 6 rows, 27 units, 174.00 |
| 4 | Customers who have never ordered, any status | Farah Ali |
| 5 | Products never ordered, any status | Backpack |
| 6 | Completed-order count, revenue, average order value | 6, 174.00, 29.00 |
| 7 | Completed orders with running revenue by date and ID | last total 174.00 |
| 8 | All customers ranked by completed spend, retaining ties | Brian 1, Amina 2; zero spenders tie at 5 |

For each query, state what one row represents, justify the join type, and
explain how you handle missing matches. Report 6 must average **order totals**,
not line values. For report 8 use DENSE_RANK with only revenue as its window
sort key; use customer_id only in the final display order.

Before running a report, write down its expected row count and one known total.
If the result differs, inspect the joins and status filters before changing
the query. Use the seed facts to explain the difference.

```sql
SOURCE project/solutions.sql;
```

The solution emits a REPORT label before each result. Compare against
[the expected TSV](../checks/expected-project.tsv) or run the
[automated checker](../checks/README.md). The checker compares actual report
rows and checks data integrity and rollback behavior, not just syntax.

Stretch work: add a fourth month with no completed orders and build a calendar
CTE that reports its revenue as zero. Add a transaction for an order with two
lines and stock reservations; make the entire transaction roll back if either
reservation fails. Keep your work in `practice/` and reset afterward.
