WITH food_salary_growth AS (
    SELECT 
        price_year,
        ROUND(AVG(avg_price), 2) AS avg_food_price,
        (SELECT AVG(avg_annual_salary) FROM t_adela_pecena_project_SQL_primary_final WHERE industry_branch_code IS NULL AND payroll_year = price_year) AS avg_salary
    FROM t_adela_pecena_project_SQL_primary_final
    GROUP BY price_year
),
growth AS (
    SELECT 
        price_year,
        avg_food_price,
        avg_salary,
        ROUND((avg_food_price - LAG(avg_food_price) OVER (ORDER BY price_year)) / LAG(avg_food_price) OVER (ORDER BY price_year) * 100, 2) AS food_growth,
        ROUND((avg_salary - LAG(avg_salary) OVER (ORDER BY price_year)) / LAG(avg_salary) OVER (ORDER BY price_year) * 100, 2) AS salary_growth
    FROM food_salary_growth
)
SELECT 
    price_year,
    food_growth,
    salary_growth,
    food_growth - salary_growth AS growth_diff
FROM growth
WHERE food_growth - salary_growth > 10;
