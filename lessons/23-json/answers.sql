USE mysql_learning;

SET @payload = '[{"id":1,"quantity":2},{"id":5,"quantity":3}]';
SELECT p.product_name, j.quantity,
       CAST(p.price * j.quantity AS DECIMAL(10,2)) AS line_value
FROM JSON_TABLE(@payload, '$[*]' COLUMNS (
    product_id INT PATH '$.id' ERROR ON EMPTY ERROR ON ERROR,
    quantity INT PATH '$.quantity' ERROR ON EMPTY ERROR ON ERROR
)) AS j JOIN products AS p ON p.product_id = j.product_id
ORDER BY p.product_id;
