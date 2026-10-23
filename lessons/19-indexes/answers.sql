USE mysql_learning;

SELECT order_id, ordered_at FROM orders
WHERE customer_id = 2 AND ordered_at >= '2025-03-01' AND ordered_at < '2025-04-01'
ORDER BY ordered_at, order_id;
EXPLAIN SELECT order_id, ordered_at FROM orders
WHERE customer_id = 2 AND ordered_at >= '2025-03-01' AND ordered_at < '2025-04-01';
-- Actual key and row estimates vary; the query must return order 6.
