USE mysql_learning;

CREATE OR REPLACE SQL SECURITY INVOKER VIEW v_order_totals AS
SELECT o.order_id, o.customer_id, o.ordered_at, o.status,
       SUM(oi.quantity * oi.unit_price) AS order_total
FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
GROUP BY o.order_id, o.customer_id, o.ordered_at, o.status;
SELECT SUM(order_total) AS pending_value FROM v_order_totals WHERE status = 'pending';
DROP VIEW v_order_totals;
