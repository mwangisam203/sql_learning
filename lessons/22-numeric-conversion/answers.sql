USE mysql_learning;

SELECT CAST(SUM(oi.quantity * oi.unit_price) / NULLIF(SUM(oi.quantity), 0)
            AS DECIMAL(10,2)) AS revenue_per_unit
FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
WHERE o.status IN ('paid', 'shipped');
SELECT 5 / NULLIF(0, 0) AS undefined_rate, 7 DIV 2 AS integer_quotient;
