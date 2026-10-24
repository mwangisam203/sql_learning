USE mysql_learning;

SELECT CAST('12.50' AS DECIMAL(10,2)) AS exact_price,
       7 DIV 2 AS integer_quotient, CAST(7 / 2 AS DECIMAL(10,2)) AS quotient;
SELECT CAST(100 * 3 / NULLIF(12, 0) AS DECIMAL(10,2)) AS percent_value,
       3 / NULLIF(0, 0) AS undefined_rate;
