-- ============================================================
-- PROJECT: Data-Driven Social Engagement Initiative
-- PURPOSE: Analyse social media content performance using SQL
-- DATABASE: social_engagement_db
-- DATASET: 29,999 posts
-- DATE RANGE: 19 November 2024 to 19 November 2025
--
-- PROJECT OBJECTIVES:
-- 1. Analyse engagement across content categories.
-- 2. Identify top-performing posts.
-- 3. Compare saves and engagement across categories.
-- 4. Compare performance across media types.
-- 5. Analyse monthly engagement trends.
-- 6. Validate the dataset.
-- ============================================================

-- 1. DATABASE AND TABLE CREATION
-- Purpose: Create the database and define the posts table.
CREATE DATABASE social_engagement_db;
USE social_engagement_db;
SHOW TABLES;
DESCRIBE posts;

-- 2. DATASET VALIDATION
USE social_engagement_db;

SELECT COUNT(*) AS total_posts FROM posts;
SELECT * FROM posts LIMIT 5;
SELECT COUNT(*) AS total_posts FROM social_engagement_db.posts;

-- Imported dataset contains 29,999 posts.

-- 3. CATEGORY-WISE ENGAGEMENT PERFORMANCE
SELECT content_category,
COUNT(*) AS total_posts,
ROUND(AVG(engagement_rate) * 100, 2) AS avg_engagement_pct,
SUM(shares) AS total_shares,
SUM(saves) AS total_saves
FROM posts
GROUP BY content_category
ORDER BY avg_engagement_pct DESC;

-- Music has the highest average engagement at 4.28%.
-- Fashion has the highest total shares (44,984) and saves (132,092).
-- Differences are small and do not establish statistical significance.

-- 4. TOP THREE POSTS WITHIN EACH CONTENT CATEGORY
WITH ranked_posts AS (
SELECT post_id, content_category, media_type, engagement_rate,
shares, saves,
DENSE_RANK() OVER (
PARTITION BY content_category
ORDER BY engagement_rate DESC
) AS post_rank
FROM posts
)
SELECT *
FROM ranked_posts
WHERE post_rank <= 3
ORDER BY content_category, post_rank, post_id;

-- Identifies highly engaging posts within each category.

-- 5. CATEGORY-WISE TOTAL SAVES
SELECT content_category, SUM(saves) AS total_saves
FROM posts
GROUP BY content_category
ORDER BY total_saves DESC;

-- Fashion: 132,092 saves.
-- Photography: 130,190 saves.
-- Music: 129,215 saves.

-- 6. TOP 15 MOST-SAVED POSTS
SELECT post_id, content_category, saves
FROM posts
ORDER BY saves DESC
LIMIT 15;

-- Identifies the individual posts with the highest saves.

-- 7. TOP THREE ENGAGEMENT RANKS WITHIN EACH MEDIA TYPE
WITH top_media AS (
SELECT post_id, content_category, media_type, engagement_rate,
shares, saves,
DENSE_RANK() OVER (
PARTITION BY media_type
ORDER BY engagement_rate DESC
) AS top_m
FROM posts
)
SELECT *
FROM top_media
WHERE top_m <= 3
ORDER BY media_type, top_m;

-- Highest individual-post engagement shown:
-- Carousel: 27.10%; Image: 25.31%; Reel: 26.58%.
-- These are individual posts, not average media-type performance.

-- 8. CATEGORIES ABOVE THE OVERALL AVERAGE ENGAGEMENT
SELECT content_category, AVG(engagement_rate) AS avg_engagement
FROM posts
GROUP BY content_category
HAVING AVG(engagement_rate) > (
SELECT AVG(engagement_rate) FROM posts
)
ORDER BY avg_engagement DESC;

-- Music, Fitness, Fashion and Beauty are above the overall average.

-- 9. MONTHLY ENGAGEMENT ANALYSIS
SELECT MONTH(post_date) AS month_number,
MONTHNAME(post_date) AS month_name,
YEAR(post_date) AS post_year,
ROUND(AVG(engagement_rate) * 100, 2) AS avg_engagement_pct,
COUNT(*) AS total_posts
FROM posts
GROUP BY MONTH(post_date), MONTHNAME(post_date), YEAR(post_date)
ORDER BY month_number;

-- December recorded 4.28% and February recorded 4.13%
-- in the monthly results.
-- The dataset contains two different Novembers, from different years.
-- Chronological sorting should account for both year and month.

-- 10. FINAL DATASET DATE-RANGE VALIDATION
SELECT MIN(post_date) AS first_post_date,
MAX(post_date) AS last_post_date,
COUNT(*) AS total_posts
FROM posts;

-- First post date: 2024-11-19.
-- Last post date: 2025-11-19.
-- Total posts: 29,999.