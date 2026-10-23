USE mysql_learning;

SELECT COUNT(*) AS completed_orders FROM orders WHERE status IN ('paid', 'shipped');
SELECT COUNT(*) AS products, SUM(stock) AS stock_units
FROM products WHERE category = 'electronics';
-- Expected electronics: 2 products, 75 units.
