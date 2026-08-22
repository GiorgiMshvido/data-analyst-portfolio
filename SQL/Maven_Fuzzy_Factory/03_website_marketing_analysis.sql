-- Website marketing analysis

--Checking which marketing source generates most website sessions
SELECT utm_source, COUNT(website_session_id) 
FROM website_sessions
GROUP BY utm_source
ORDER BY COUNT(website_session_id) DESC;


--Checking which campaigns generates most traffic
-- Data quality note:
-- Some missing marketing attribution values are stored as the literal text 'NULL'
-- rather than SQL NULL. These values are labeled as 'Unattributed' for readability.
SELECT
    CASE
        WHEN utm_campaign = 'NULL' THEN 'Unattributed'
        ELSE utm_campaign
    END AS campaign,
    COUNT(website_session_id) AS total_sessions
FROM website_sessions
GROUP BY
    CASE
        WHEN utm_campaign = 'NULL' THEN 'Unattributed'
        ELSE utm_campaign
    END
ORDER BY total_sessions DESC;


-- Checking which device type generates more website sessions
SELECT
    device_type,
    COUNT(website_session_id) AS total_sessions
FROM website_sessions
GROUP BY device_type
ORDER BY total_sessions DESC;


--Checking which marketing source generates the most orders
-- Data quality note:
-- Some missing marketing attribution values are stored as the literal text 'NULL'
-- rather than as SQL NULL values. These records are treated as unattributed traffic
-- during the analysis.
SELECT
    CASE
        WHEN w.utm_source = 'NULL' THEN 'Unattributed'
        ELSE w.utm_source
    END AS marketing_source,
    COUNT(o.order_id) AS total_orders
FROM website_sessions AS w
JOIN orders AS o
    ON w.website_session_id = o.website_session_id
GROUP BY
    CASE
        WHEN w.utm_source = 'NULL' THEN 'Unattributed'
        ELSE w.utm_source
    END
ORDER BY total_orders DESC;

-- Checking which marketing source has the highest conversion rate
SELECT
   CASE
      WHEN w.utm_source = 'NULL' THEN 'Unattributed'
      ELSE w.utm_source
   END AS marketing_source, 
   COUNT(w.website_session_id) AS website_visits,
   COUNT(o.order_id) AS total_orders,
   CONCAT(
      ROUND(COUNT(o.order_id) * 100.0 / COUNT(w.website_session_id), 2),
      '%'
   ) AS conversion_rate
FROM website_sessions AS w
LEFT JOIN orders AS o
   ON w.website_session_id = o.website_session_id
GROUP BY marketing_source
ORDER BY COUNT(o.order_id) * 100.0 / COUNT(w.website_session_id) DESC;