-- =========================================
-- DATA EXPLORATION
-- =========================================

-- Inspect website sessions
SELECT *
FROM website_sessions
LIMIT 10;

-- Inspect website pageviews
SELECT *
FROM website_pageviews
LIMIT 10;

-- Inspect orders
SELECT *
FROM orders
LIMIT 10;

-- Inspect order items
SELECT *
FROM order_items
LIMIT 10;

-- Inspect refunds
SELECT *
FROM order_item_refunds
LIMIT 10;

-- Inspect products
SELECT *
FROM products
LIMIT 10;


-- Check the date range covered by the dataset
SELECT 
    MIN(created_at) AS earliest_date,
    MAX(created_at) AS latest_date
FROM website_sessions;

--Checking if there are any non unique ids
SELECT COUNT(*) AS total_rows, COUNT(DISTINCT website_session_id) AS unique_rows FROM website_sessions;


--Checking for NULL values for each column
SELECT COUNT(*) FROM website_sessions WHERE utm_source IS NULL;
SELECT COUNT(*) FROM website_sessions WHERE utm_source = '';

--Checking if the session_id matches
SELECT COUNT(*) FROM website_sessions
RIGHT JOIN website_pageviews
on website_sessions.website_session_id = website_pageviews.website_session_id
WHERE website_sessions.website_session_id IS NULL;