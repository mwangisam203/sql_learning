USE mysql_learning;

CREATE OR REPLACE SQL SECURITY INVOKER VIEW v_order_totals AS
SELECT o.order_id, o.customer_id, o.ordered_at, o.status,
       SUM(oi.quantity * oi.unit_price) AS order_total
FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
GROUP BY o.order_id, o.customer_id, o.ordered_at, o.status;
SELECT order_id, order_total FROM v_order_totals ORDER BY order_id;
SELECT SUM(order_total) AS revenue FROM v_order_totals WHERE status IN ('paid', 'shipped');
DROP VIEW v_order_totals;
