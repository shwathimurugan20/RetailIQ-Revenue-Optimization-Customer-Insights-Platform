CREATE DATABASE nykaa_project;
USE nykaa_project;

SELECT COUNT(*) FROM orders;

SELECT SUM(quantity * selling_price) AS total_revenue
FROM order_items;

SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
SUM(oi.quantity * oi.selling_price) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month;

SELECT p.product_name, SUM(oi.quantity) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC
LIMIT 10;

SELECT c.customer_id,
SUM(oi.quantity * oi.selling_price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 10;

SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING MAX(order_date) < DATE_SUB(CURDATE(), INTERVAL 90 DAY);