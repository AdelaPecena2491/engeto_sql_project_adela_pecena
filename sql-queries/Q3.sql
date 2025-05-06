WITH price_growth AS (
    SELECT 
        category_code,
        food_name,
        price_year,
        avg_price,
        LAG(avg_price) OVER (PARTITION BY category_code ORDER BY price_year) AS prev_price
    FROM t_adela_pecena_project_SQL_primary_final
)
SELECT 
    category_code,
    food_name,
    ROUND(AVG((avg_price - prev_price) / prev_price * 100), 2) AS avg_percent_increase
FROM price_growth
WHERE prev_price IS NOT NULL
  AND (avg_price - prev_price) > 0
GROUP BY category_code, food_name
ORDER BY avg_percent_increase;
