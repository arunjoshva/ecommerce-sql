DELIMITER $$
CREATE PROCEDURE GetCustomerOrders(IN customerId INT)
BEGIN
  SELECT o.order_id, o.order_date, SUM(p.amount) AS total_paid
  FROM orders o
  JOIN payments p ON o.order_id = p.order_id
  WHERE o.cust_id = customerId
  GROUP BY o.order_id, o.order_date;
END $$
DELIMITER ;