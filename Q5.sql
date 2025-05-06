WITH hdp_growth AS (
    SELECT 
        year,
        GDP,
        LAG(GDP) OVER (ORDER BY year) AS prev_GDP,
        ROUND((GDP - LAG(GDP) OVER (ORDER BY year)) / LAG(GDP) OVER (ORDER BY year) * 100, 2) AS GDP_growth
    FROM t_adela_pecena_project_SQL_secondary_final
    WHERE country = 'Czech Republic'
),
compare AS (
    SELECT 
        a.price_year,
        (SELECT ROUND(AVG(avg_price), 2) FROM t_adela_pecena_project_SQL_primary_final WHERE price_year = a.price_year) AS avg_food_price,
        (SELECT AVG(avg_annual_salary) FROM t_adela_pecena_project_SQL_primary_final WHERE payroll_year = a.price_year AND industry_branch_code IS NULL) AS avg_salary,
        b.GDP_growth
    FROM t_adela_pecena_project_SQL_primary_final a
    JOIN hdp_growth b
        ON a.price_year = b.year
    GROUP BY a.price_year, b.GDP_growth
)
SELECT *
FROM compare
WHERE GDP_growth > 5;
