 USE beautydb;

--
--  H1 · Does a higher price mean a lower rating?
-- Sephora — average rating per price bucket
--

SELECT
CASE
WHEN price_usd < 25 THEN 'Under $25'
WHEN price_usd BETWEEN 25 AND 50  THEN '$25 to $50'
WHEN price_usd BETWEEN 50 AND 100 THEN '$50 to $100'
WHEN price_usd BETWEEN 100 AND 200 THEN '$100 to $200'
ELSE 'Over $200'
END AS price_range,
COUNT(*) AS nb_products,
ROUND(AVG(rating), 2) AS avg_rating
FROM beauty_sephora
GROUP BY price_range
ORDER BY MIN(price_usd);

-- 
--  H2 · Are there more cruelty-free products in EU countries?
--  EU vs Non-EU — cruelty-free rate
SELECT
CASE WHEN c.eu = 1 
THEN 'EU' 
ELSE 'Non-EU' 
END AS region,
COUNT(*) AS nb_products,
SUM(w.cruelty_free) AS nb_cruelty_free,
ROUND(AVG(w.cruelty_free) * 100, 1) AS pct_cruelty_free
FROM beauty_world AS w
JOIN country AS c 
ON w.country_id= c.country_id
GROUP BY region;

--
-- 3a. Share of each category in the catalog
--

SELECT
cat.category_name,
COUNT(*) AS nb_products,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM beauty_sephora), 1) AS pct_of_catalog
FROM beauty_sephora AS s
JOIN category AS cat 
ON s.category_id = cat.category_id
GROUP BY cat.category_name
ORDER BY nb_products DESC;
 
SELECT *
FROM category;
-- 
-- 3b. Skincare vs everything else
--

SELECT
CASE
WHEN cat.category_name = 'Skincare' THEN 'Skincare'
ELSE 'Other'
END AS segment,
COUNT(*) AS nb_products,
ROUND(AVG(s.price_usd), 2) AS avg_price,
ROUND(AVG(s.rating), 2)AS avg_rating,
ROUND(AVG(s.reviews), 0) AS avg_reviews
FROM beauty_sephora AS s
JOIN category AS cat ON s.category_id = cat.category_id
GROUP BY segment;

-- 

-- H2 In EU are there more cruelty free products? 
--

SELECT c.eu,COUNT(*) AS total_cruelty_free_products
FROM beauty_world bw
JOIN country c
ON bw.country_id = c.country_id
WHERE bw.cruelty_free = 'true'
GROUP BY c. eu
;

--
-- H1 - World data rating and price
--

SELECT
CASE
WHEN price_usd < 25 THEN 'Under $25'
WHEN price_usd BETWEEN 25 AND 50  THEN '$25 to $50'
WHEN price_usd BETWEEN 50 AND 100 THEN '$50 to $100'
WHEN price_usd BETWEEN 100 AND 200 THEN '$100 to $200'
ELSE 'Over $200'
END AS price_range,
COUNT(*) AS nb_products,
ROUND(AVG(rating), 2) AS avg_rating
FROM beauty_world
GROUP BY price_range
ORDER BY MIN(price_usd);

