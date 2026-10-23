# Seed facts to check your work

Run `data/reset.sql` before comparing results. The seed uses fixed dates so
results do not depend on today's date. Do not use NOW() for seed exercises.

| Object or measurement | Expected |
|-----------------------|----------|
| Customers | 6 |
| Products | 6 |
| Orders | 8 |
| Order lines | 13 |
| Customers with no order of any status | Farah Ali (6) |
| Product never ordered | Backpack (6) |
| Customers with a non-NULL phone | 2 |
| Paid/shipped orders | 6 |
| Revenue from paid/shipped orders | 174.00 |
| Average paid/shipped order value | 29.00 |
| Units in paid/shipped orders | 27 |
| All-status line value (not revenue) | 241.50 |

## Individual order totals

| Order | Status | Total |
|-------|--------|-------|
| 1 | paid | 13.50 |
| 2 | shipped | 28.00 |
| 3 | shipped | 53.00 |
| 4 | pending | 22.50 |
| 5 | cancelled | 45.00 |
| 6 | paid | 39.00 |
| 7 | shipped | 24.00 |
| 8 | paid | 16.50 |

Monthly revenue: January 2025 = 41.50, February = 53.00, March = 79.50.
Customer revenue including zero spenders, in customer_id order:
66.50, 67.00, 16.50, 0.00, 24.00, 0.00.

These are order-line values, not payments collected or accounting profit.
Stock is illustrative; seed orders are not automatically deducted from it.
