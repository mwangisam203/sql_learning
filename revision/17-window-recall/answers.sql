USE mysql_learning;

WITH counts AS (
    SELECT c.customer_id, COUNT(o.order_id) AS completed_orders
    FROM customers AS c LEFT JOIN orders AS o
      ON o.customer_id = c.customer_id AND o.status IN ('paid', 'shipped')
    GROUP BY c.customer_id
)
SELECT customer_id, completed_orders,
       DENSE_RANK() OVER (ORDER BY completed_orders DESC) AS count_rank
FROM counts ORDER BY customer_id;
WITH monthly AS (
    SELECT DATE_FORMAT(o.ordered_at, '%Y-%m') AS month,
           SUM(oi.quantity * oi.unit_price) AS revenue
    FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE o.status IN ('paid', 'shipped') GROUP BY DATE_FORMAT(o.ordered_at, '%Y-%m')
)
SELECT month, revenue, SUM(revenue) OVER (
    ORDER BY month ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS running_revenue FROM monthly ORDER BY month;
