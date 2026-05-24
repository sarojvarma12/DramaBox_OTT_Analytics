# Step 2 — Run All SQL Queries in MySQL Workbench

USE dramabox;

-- Q1: Users by City
SELECT city,
       COUNT(user_id)  AS total_users
FROM users
GROUP BY city
ORDER BY total_users DESC;

-- Q2: Subscription Breakdown
SELECT subscription_type,
       COUNT(*)           AS total_users,
       ROUND(AVG(age),1)  AS avg_age
FROM users
GROUP BY subscription_type
ORDER BY total_users DESC;

-- Q3: Top 10 Most Watched Shows
SELECT c.show_name,
       c.genre,
       COUNT(w.watch_id)                   AS total_views,
       ROUND(AVG(w.dropped_at_percent),1)  AS avg_completion
FROM watch_history w
JOIN content c ON w.show_id = c.show_id
GROUP BY c.show_name, c.genre
ORDER BY total_views DESC
LIMIT 10;

-- Q4: Genre Performance
SELECT c.genre,
       COUNT(w.watch_id)                   AS total_views,
       ROUND(AVG(w.dropped_at_percent),1)  AS avg_completion,
       COUNT(DISTINCT w.user_id)           AS unique_viewers
FROM watch_history w
JOIN content c ON w.show_id = c.show_id
GROUP BY c.genre
ORDER BY total_views DESC;

-- Q5: Daily Active Users
SELECT DATE(watch_date)         AS watch_date,
       COUNT(DISTINCT user_id)  AS daily_active_users,
       COUNT(watch_id)          AS total_views
FROM watch_history
GROUP BY DATE(watch_date)
ORDER BY watch_date DESC
LIMIT 30;

-- Q6: Device Usage
SELECT device,
       COUNT(watch_id)                   AS total_views,
       COUNT(DISTINCT user_id)           AS unique_users,
       ROUND(AVG(watch_time_mins),2)     AS avg_watch_time,
       ROUND(AVG(dropped_at_percent),1)  AS avg_completion
FROM watch_history
GROUP BY device
ORDER BY total_views DESC;

-- Q7: User Funnel
WITH funnel AS (
    SELECT
        COUNT(DISTINCT c.click_id)                       AS impressions,
        SUM(CASE WHEN c.clicked=1 THEN 1 ELSE 0 END)    AS clicks,
        COUNT(DISTINCT w.watch_id)                       AS watches,
        SUM(CASE WHEN w.completed=1 THEN 1 ELSE 0 END)  AS completions
    FROM clicks c
    LEFT JOIN watch_history w ON c.user_id = w.user_id
)
SELECT impressions,
       clicks,
       ROUND(clicks*100.0/impressions,2)    AS ctr_percent,
       watches,
       ROUND(watches*100.0/clicks,2)        AS watch_rate,
       completions,
       ROUND(completions*100.0/watches,2)   AS completion_rate
FROM funnel;

-- Q8: A/B Test Results
SELECT thumbnail_version,
       COUNT(*)                              AS total_shown,
       SUM(ctr_flag)                         AS total_clicks,
       ROUND(SUM(ctr_flag)*100.0/COUNT(*),2) AS ctr_percent
FROM clicks
GROUP BY thumbnail_version;

-- Q9: Churn Rate
SELECT subscription_type,
       COUNT(*)                                                   AS total_users,
       SUM(CASE WHEN is_churned=1 THEN 1 ELSE 0 END)             AS churned,
       ROUND(SUM(CASE WHEN is_churned=1
             THEN 1 ELSE 0 END)*100.0/COUNT(*),2)                AS churn_rate,
       SUM(amount_paid)                                           AS total_revenue
FROM subscriptions
GROUP BY subscription_type
ORDER BY churn_rate DESC;

-- Q10: Show Rankings within Genre
SELECT c.genre,
       c.show_name,
       COUNT(w.watch_id) AS total_views,
       RANK() OVER (
           PARTITION BY c.genre
           ORDER BY COUNT(w.watch_id) DESC
       ) AS rank_in_genre
FROM watch_history w
JOIN content c ON w.show_id = c.show_id
GROUP BY c.genre, c.show_name
ORDER BY c.genre, rank_in_genre;

-- Q11: Month over Month Growth
WITH monthly AS (
    SELECT MONTHNAME(watch_date)   AS month_name,
           MONTH(watch_date)       AS month_number,
           COUNT(watch_id)         AS total_views,
           COUNT(DISTINCT user_id) AS unique_users
    FROM watch_history
    GROUP BY MONTHNAME(watch_date), MONTH(watch_date)
),
growth AS (
    SELECT month_name,
           month_number,
           total_views,
           unique_users,
           LAG(total_views) OVER (
               ORDER BY month_number
           ) AS prev_month_views
    FROM monthly
)
SELECT month_name,
       total_views,
       unique_users,
       prev_month_views,
       ROUND((total_views - prev_month_views)
             *100.0/prev_month_views,2) AS growth_percent
FROM growth
ORDER BY month_number;