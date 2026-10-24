USE mysql_learning;

DELIMITER //
CREATE PROCEDURE lesson33_customer_revenue(IN p_customer_id INT)
SQL SECURITY INVOKER
READS SQL DATA
BEGIN
    IF p_customer_id IS NULL OR p_customer_id < 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer ID must be positive';
    END IF;
    SELECT c.customer_id, c.full_name,
           COALESCE(SUM(oi.quantity * oi.unit_price), 0.00) AS revenue
    FROM customers AS c
    LEFT JOIN orders AS o ON o.customer_id = c.customer_id AND o.status IN ('paid', 'shipped')
    LEFT JOIN order_items AS oi ON oi.order_id = o.order_id
    WHERE c.customer_id = p_customer_id GROUP BY c.customer_id, c.full_name;
END//
DELIMITER ;
CALL lesson33_customer_revenue(1);
CALL lesson33_customer_revenue(6);
-- Intentional failure, run separately before DROP: CALL lesson33_customer_revenue(NULL);
DROP PROCEDURE lesson33_customer_revenue;
