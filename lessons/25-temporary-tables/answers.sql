USE mysql_learning;

CREATE TEMPORARY TABLE lesson25_order_totals (
    order_id INT UNSIGNED PRIMARY KEY, customer_id INT UNSIGNED NOT NULL,
    order_total DECIMAL(12,2) NOT NULL
) ENGINE=InnoDB;
INSERT INTO lesson25_order_totals (order_id, customer_id, order_total)
SELECT o.order_id, o.customer_id, SUM(oi.quantity * oi.unit_price)
FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
WHERE o.status IN ('paid', 'shipped') GROUP BY o.order_id, o.customer_id;
SELECT customer_id, COUNT(*) AS completed_orders, SUM(order_total) AS revenue
FROM lesson25_order_totals GROUP BY customer_id ORDER BY customer_id;
DROP TEMPORARY TABLE lesson25_order_totals;
