USE mysql_learning;

SELECT product_name,
       CASE WHEN price >= 30 THEN 'premium'
            WHEN price >= 10 THEN 'midrange' ELSE 'budget' END AS price_band
FROM products ORDER BY product_id;

SELECT SUM(CASE WHEN status IN ('paid', 'shipped') THEN 1 ELSE 0 END) AS completed,
       SUM(CASE WHEN status NOT IN ('paid', 'shipped') THEN 1 ELSE 0 END) AS other
FROM orders;

-- UNION removes the repeated Nairobi value; UNION ALL keeps both rows.
SELECT 'Nairobi' AS city UNION SELECT 'Nairobi' AS city;
SELECT 'Nairobi' AS city UNION ALL SELECT 'Nairobi' AS city;
