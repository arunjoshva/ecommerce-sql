# E-Commerce Database Project

This project is a beginner-friendly **E-Commerce Database** built using MySQL.  
It demonstrates database design, SQL queries, views, procedures, and triggers.

## Tables (Planned)
- **customers**: customer details (cust_id, name, email, phone)
- **products**: store products (product_id, name, price, stock)
- **orders**: customer orders (order_id, cust_id, order_date)
- **order_items**: items in each order (item_id, order_id, product_id, quantity, price_at_order)
- **payments**: order payments (payment_id, order_id, amount, payment_date)

## Core Features
1. Place an order (orders + order_items + payment)
2. Reduce product stock automatically (trigger)
3. Generate reports: sales per month, top products, total spending per customer

## Deployment Plan
- Development: MySQL Workbench (local)
- Deployment: Railway / Clever Cloud (optional hosting)
- Showcase: GitHub repo + ER diagram + demo queries

## ER Diagram
![ER Diagram](diagrams/eer-diagram.png)