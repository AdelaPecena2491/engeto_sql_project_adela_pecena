-- Autorka: Adéla Pečená
-- Úkol 3: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

SELECT 
    food_name,
    MIN(price_year) AS year_start,
    MAX(price_year) AS year_end,
    MIN(avg_price) AS price_start,
    MAX(avg_price) AS price_end,
    ROUND(((MAX(avg_price) - MIN(avg_price)) / MIN(avg_price)) * 100, 2) AS price_growth_percent
FROM view_no2_price
WHERE price_year BETWEEN 2006 AND 2018
GROUP BY food_name
ORDER BY price_growth_percent DESC;
