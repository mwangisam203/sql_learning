USE mysql_learning;

SHOW INDEX FROM orders;
EXPLAIN SELECT order_id, ordered_at FROM orders
WHERE customer_id = 1 AND ordered_at >= '2025-01-01' AND ordered_at < '2025-03-01';

CREATE INDEX idx_lesson_orders_customer_date ON orders (customer_id, ordered_at);
EXPLAIN SELECT order_id, ordered_at FROM orders
WHERE customer_id = 1 AND ordered_at >= '2025-01-01' AND ordered_at < '2025-03-01';
EXPLAIN ANALYZE SELECT order_id, ordered_at FROM orders
WHERE customer_id = 1 AND ordered_at >= '2025-01-01' AND ordered_at < '2025-03-01';
DROP INDEX idx_lesson_orders_customer_date ON orders;
