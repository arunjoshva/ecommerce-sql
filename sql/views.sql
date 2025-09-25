-- View for top customers
CREATE VIEW top_customers AS
SELECT c.cust_id, c.name, SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o ON c.cust_id = o.cust_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.cust_id, c.name
ORDER BY total_spent DESC;