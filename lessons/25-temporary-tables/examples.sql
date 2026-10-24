USE mysql_learning;

CREATE TEMPORARY TABLE lesson25_order_totals (
    order_id INT UNSIGNED PRIMARY KEY,
    customer_id INT UNSIGNED NOT NULL,
    order_total DECIMAL(12,2) NOT NULL
) ENGINE=InnoDB;
INSERT INTO lesson25_order_totals (order_id, customer_id, order_total)
SELECT o.order_id, o.customer_id, SUM(oi.quantity * oi.unit_price)
FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
WHERE o.status IN ('paid', 'shipped') GROUP BY o.order_id, o.customer_id;
SELECT order_id, order_total FROM lesson25_order_totals
WHERE order_total >= 25 ORDER BY order_id;
SELECT COUNT(*) AS completed_orders, SUM(order_total) AS revenue FROM lesson25_order_totals;
DROP TEMPORARY TABLE lesson25_order_totals;
