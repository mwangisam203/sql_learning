USE mysql_learning;

SELECT COUNT(*) AS customers, COUNT(phone) AS known_phones,
       COUNT(DISTINCT city) AS cities FROM customers;
SELECT SUM(stock) AS stock_units, ROUND(AVG(price), 2) AS average_price,
       MIN(price) AS cheapest, MAX(price) AS most_expensive FROM products;
SELECT SUM(quantity * unit_price) AS all_status_line_value FROM order_items;
SELECT COUNT(*) AS rows_found, SUM(price) AS raw_sum,
       COALESCE(SUM(price), 0) AS empty_total FROM products WHERE price > 1000;
