USE mysql_learning;

SELECT full_name, phone FROM customers WHERE phone IS NOT NULL ORDER BY customer_id;
SELECT full_name, COALESCE(phone, 'Ask customer') AS contact_phone
FROM customers ORDER BY customer_id;
