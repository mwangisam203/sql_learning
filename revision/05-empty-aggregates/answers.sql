USE mysql_learning;

SELECT COUNT(*) AS matches, SUM(price) AS raw_total,
       COALESCE(SUM(price), 0.00) AS displayed_total FROM products WHERE price > 1000;
SELECT CAST(AVG(price) AS DECIMAL(10,2)) AS average_price,
       MIN(price) AS lowest_price, MAX(price) AS highest_price FROM products;
