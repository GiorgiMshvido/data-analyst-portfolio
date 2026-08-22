-- Customer Analysis

-- Checking how many unique customers placed an order
SELECT COUNT(DISTINCT user_id) AS unique_customers
FROM orders;


-- Checking one-time vs repeat customers
WITH user_orders AS (
    SELECT
        user_id,
        COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY user_id
)

SELECT
    COUNT(CASE WHEN total_orders = 1 THEN 1 END) AS one_time_customers,
    COUNT(CASE WHEN total_orders > 1 THEN 1 END) AS repeat_customers
FROM user_orders;


-- Checking top 10 customers by number of orders
SELECT
    user_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY user_id
ORDER BY total_orders DESC
LIMIT 10;


-- Checking top 10 customers by revenue
SELECT
    user_id,
    SUM(price_usd) AS revenue
FROM orders
GROUP BY user_id
ORDER BY revenue DESC
LIMIT 10;


-- Checking how much revenue comes from one-time vs repeat customers
WITH user_orders AS (
    SELECT
        user_id,
        COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY user_id
)

SELECT
    CASE
        WHEN u.total_orders = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    SUM(o.price_usd) AS revenue
FROM orders o
JOIN user_orders u
    ON o.user_id = u.user_id
GROUP BY customer_type
ORDER BY revenue DESC;