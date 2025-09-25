-- schema.sql
-- E-Commerce schema (MySQL). Run this file to create the database and tables.
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- CUSTOMERS: store customer details
CREATE TABLE customers(
	cust_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE =  InnoDB DEFAULT CHARSET = utf8mb4;

-- PRODUCTS: product catalog
CREATE TABLE products(
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK(price>=0),
    stock INT NOT NULL DEFAULT 0 CHECK(stock>=0),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE INDEX product_name_idx(product_name)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- ORDERS: an order placed by a customer
CREATE TABLE orders(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    cust_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30) NOT NULL DEFAULT "placed",
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- ORDER_ITEMS: line items inside each order (many-to-many connector)
CREATE TABLE order_items(
	item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity>0),
    price_at_order DECIMAL(10,2) NOT NULL, -- price snapshot at time of order
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE = InnoDB DEFAULT CHARSET= utf8mb4;

-- PAYMENTS: payments for orders
CREATE TABLE payments(
	payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL CHECK (amount>0),
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    method VARCHAR(30),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE INDEX order_date_idx ON orders(order_date);
CREATE INDEX order_items_order_products_idx ON order_items(order_id, product_id);

ALTER TABLE products AUTO_INCREMENT = 1001;
ALTER TABLE orders AUTO_INCREMENT = 5001;
ALTER TABLE order_items AUTO_INCREMENT = 10001;
ALTER TABLE payments AUTO_INCREMENT = 20001;
