-- Product & Refund Analysis

-- Checking which products generate the most revenue
SELECT 
    product_name, 
    SUM(price_usd) AS total_revenue
FROM order_items
JOIN products
    ON products.product_id = order_items.product_id
GROUP BY product_name
ORDER BY total_revenue DESC;


--Checking which products generate the most profit
SELECT 
    product_name, 
    ROUND(SUM(price_usd) - SUM(cogs_usd),2) AS total_profit
FROM order_items
JOIN products
    ON products.product_id = order_items.product_id
GROUP BY product_name
ORDER BY total_profit DESC;


-- Checking which products have the highest gross margin percentage
SELECT 
    product_name, 
    ROUND(((SUM(price_usd) - SUM(cogs_usd)) / SUM(price_usd))*100,2) AS gross_margin
FROM order_items
JOIN products
    ON products.product_id = order_items.product_id
GROUP BY product_name
ORDER BY gross_margin DESC;


--Which products are being refunded the most
SELECT 
    p.product_name, 
    COUNT(r.order_item_refund_id) AS refunds
FROM products p
JOIN order_items oi 
    ON p.product_id = oi.product_id
JOIN order_item_refunds r 
    ON oi.order_item_id = r.order_item_id
GROUP BY p.product_name
ORDER BY refunds DESC;

--Checking the refund rate per product 
SELECT 
    p.product_name,
    COUNT(r.order_item_refund_id) AS refunded_items,
    COUNT(oi.order_item_id) AS total_items_sold,
    ROUND(
        COUNT(r.order_item_refund_id) * 100.0 / COUNT(oi.order_item_id),
        2
    ) AS refund_rate
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
LEFT JOIN order_item_refunds r
    ON oi.order_item_id = r.order_item_id
GROUP BY p.product_name
ORDER BY refund_rate DESC;