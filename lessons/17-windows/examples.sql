USE mysql_learning;

WITH order_totals AS (
    SELECT o.order_id, o.ordered_at, SUM(oi.quantity * oi.unit_price) AS total
    FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE o.status IN ('paid', 'shipped') GROUP BY o.order_id, o.ordered_at
)
SELECT order_id, total,
       SUM(total) OVER (ORDER BY ordered_at, order_id
                       ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_revenue
FROM order_totals ORDER BY ordered_at, order_id;

WITH counts AS (
    SELECT customer_id, COUNT(*) AS order_count FROM orders GROUP BY customer_id
)
SELECT customer_id, order_count,
       ROW_NUMBER() OVER (ORDER BY order_count DESC, customer_id) AS row_position,
       RANK() OVER (ORDER BY order_count DESC) AS tied_rank,
       DENSE_RANK() OVER (ORDER BY order_count DESC) AS dense_position
FROM counts ORDER BY row_position;
