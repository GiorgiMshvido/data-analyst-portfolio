-- Sales Analysis

-- Checking total revenue, total orders, and average order value
SELECT 
   ROUND(SUM(price_usd), 2) AS total_revenue,
   COUNT(order_id) AS total_orders,
   ROUND(AVG(price_usd), 2) AS average_order_value
FROM orders;


-- Checking how revenue and orders changed over time
-- Year and month are used as the reporting period
SELECT 
   TO_CHAR(created_at, 'YYYY-MM') AS order_date,
   SUM(price_usd) AS revenue,
   COUNT(order_id) AS orders
FROM orders
GROUP BY order_date
ORDER BY order_date;


-- Checking which year generated the highest revenue
SELECT 
   EXTRACT(YEAR FROM created_at) AS order_year,
   SUM(price_usd) AS revenue
FROM orders
GROUP BY order_year
ORDER BY revenue DESC
LIMIT 1;


-- Checking overall gross profit and gross margin percentage
SELECT 
   ROUND(SUM(price_usd) - SUM(cogs_usd), 2) AS gross_profit,
   ROUND(((SUM(price_usd) - SUM(cogs_usd)) / SUM(price_usd)) * 100, 2) AS gross_margin
FROM orders;


-- Checking which month generated the highest gross profit
SELECT
   TO_CHAR(created_at, 'YYYY-MM') AS order_date,
   ROUND(SUM(price_usd) - SUM(cogs_usd), 2) AS gross_profit,
   ROUND(((SUM(price_usd) - SUM(cogs_usd)) / SUM(price_usd)) * 100, 2) AS gross_margin
FROM orders
GROUP BY order_date
ORDER BY gross_profit DESC;