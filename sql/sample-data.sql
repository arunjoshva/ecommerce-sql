USE ecommerce;

INSERT INTO customers (name, email, phone) VALUES ("ARUN", "arun@gmail.com", "9234567890"), ("SAM", "sam@gmail.com", "9472583690"), ("JOEL", "joel@gmail.com", "9594871230"), ("AJITHA", "ajitha@gmail.com", "9874561470"), ("HEPZHIBA", "hepzibha@gmail.com", "9848814520");
INSERT INTO products (product_name, price, stock) VALUES ("LAPTOP", 50000.00, 50), ("MOUSE", 1000.00, 100), ("KEYBOARD", 1500.00, 200), ("MOBILE", 10000.00, 500), ("EARPHONE", 650.00, 150);
INSERT INTO orders(cust_id, order_date) VALUES (1, "2025-09-05 10:00:00"), (2, "2025-09-10 11:00:00"), (3, "2025-09-15 12:00:00"), (4, "2025-09-20 13:00:00"), (5,"2025-09-25 14:00:00");
INSERT INTO order_items (order_id, product_id, quantity, price_at_order) VALUES (5001, 1001, 1, 50000.00), (5002, 1002, 1, 1000.00), (5003, 1003, 1, 1500.00), (5004, 1004, 1, 10000.00 ), (5005, 1005, 1, 650.00);
INSERT INTO payments (order_id, amount, payment_date, method) VALUES (5001, 50000.00, "2025-09-05 10:00:00", "cash"), (5002, 1000.00, "2025-09-10 11:00:00", "card"), (5003, 1500.00, "2025-09-15 12:00:00", "upi"), (5004, 10000.00, "2025-09-20 13:00:00", "cheque"), (5005, 650.00, "2025-09-25 14:00:00", "NEFT");



