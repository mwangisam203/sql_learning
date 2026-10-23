USE mysql_learning;

SELECT 'REPORT_01' AS report;
WITH completed_orders AS (
    SELECT o.order_id, o.ordered_at, SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE o.status IN ('paid', 'shipped') GROUP BY o.order_id, o.ordered_at
)
SELECT DATE_FORMAT(ordered_at, '%Y-%m') AS month, SUM(order_total) AS revenue
FROM completed_orders GROUP BY DATE_FORMAT(ordered_at, '%Y-%m') ORDER BY month;

SELECT 'REPORT_02' AS report;
WITH completed_orders AS (
    SELECT o.order_id, o.customer_id, SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE o.status IN ('paid', 'shipped') GROUP BY o.order_id, o.customer_id
)
SELECT c.customer_id, c.full_name, COUNT(co.order_id) AS completed_orders,
       COALESCE(SUM(co.order_total), 0.00) AS revenue
FROM customers AS c LEFT JOIN completed_orders AS co ON co.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name ORDER BY c.customer_id;

SELECT 'REPORT_03' AS report;
WITH product_sales AS (
    SELECT oi.product_id, SUM(oi.quantity) AS units_sold,
           SUM(oi.quantity * oi.unit_price) AS revenue
    FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE o.status IN ('paid', 'shipped') GROUP BY oi.product_id
)
SELECT p.product_id, p.product_name, COALESCE(s.units_sold, 0) AS units_sold,
       COALESCE(s.revenue, 0.00) AS revenue
FROM products AS p LEFT JOIN product_sales AS s ON s.product_id = p.product_id
ORDER BY p.product_id;

SELECT 'REPORT_04' AS report;
SELECT c.customer_id, c.full_name FROM customers AS c
WHERE NOT EXISTS (SELECT 1 FROM orders AS o WHERE o.customer_id = c.customer_id)
ORDER BY c.customer_id;

SELECT 'REPORT_05' AS report;
SELECT p.product_id, p.product_name FROM products AS p
WHERE NOT EXISTS (SELECT 1 FROM order_items AS oi WHERE oi.product_id = p.product_id)
ORDER BY p.product_id;

SELECT 'REPORT_06' AS report;
WITH completed_orders AS (
    SELECT o.order_id, SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE o.status IN ('paid', 'shipped') GROUP BY o.order_id
)
SELECT COUNT(*) AS completed_orders, SUM(order_total) AS revenue,
       CAST(AVG(order_total) AS DECIMAL(10,2)) AS average_order_value
FROM completed_orders;

SELECT 'REPORT_07' AS report;
WITH completed_orders AS (
    SELECT o.order_id, o.ordered_at, SUM(oi.quantity * oi.unit_price) AS order_total
    FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE o.status IN ('paid', 'shipped') GROUP BY o.order_id, o.ordered_at
)
SELECT order_id, order_total,
       SUM(order_total) OVER (ORDER BY ordered_at, order_id
                             ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_revenue
FROM completed_orders ORDER BY ordered_at, order_id;

SELECT 'REPORT_08' AS report;
WITH customer_totals AS (
    SELECT o.customer_id, SUM(oi.quantity * oi.unit_price) AS revenue
    FROM orders AS o JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE o.status IN ('paid', 'shipped') GROUP BY o.customer_id
), all_customers AS (
    SELECT c.customer_id, c.full_name, COALESCE(t.revenue, 0.00) AS revenue
    FROM customers AS c LEFT JOIN customer_totals AS t ON t.customer_id = c.customer_id
)
SELECT customer_id, full_name, revenue,
       DENSE_RANK() OVER (ORDER BY revenue DESC) AS spend_rank
FROM all_customers ORDER BY spend_rank, customer_id;
