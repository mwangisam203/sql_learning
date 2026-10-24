USE mysql_learning;

WITH neighbors AS (
    SELECT order_id, ordered_at,
           LAG(order_id) OVER (ORDER BY ordered_at, order_id) AS previous_order_id,
           LEAD(order_id) OVER (ORDER BY ordered_at, order_id) AS next_order_id,
           LAG(ordered_at) OVER (ORDER BY ordered_at, order_id) AS previous_order_at
    FROM orders WHERE status IN ('paid', 'shipped')
)
SELECT order_id, previous_order_id, next_order_id,
       DATEDIFF(ordered_at, previous_order_at) AS calendar_days_since_previous
FROM neighbors ORDER BY ordered_at, order_id;
