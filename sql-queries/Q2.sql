SELECT 
    price_year,
    food_name,
    avg_price,
    (SELECT AVG(avg_annual_salary) 
     FROM t_adela_pecena_project_SQL_primary_final 
     WHERE industry_branch_code IS NULL AND payroll_year = price_year) AS avg_salary_cr,
    ROUND((SELECT AVG(avg_annual_salary) 
     FROM t_adela_pecena_project_SQL_primary_final 
     WHERE industry_branch_code IS NULL AND payroll_year = price_year) / avg_price) AS purchase_power
FROM t_adela_pecena_project_SQL_primary_final
WHERE category_code IN ('111301', '114201')
  AND price_year IN (2006, 2018)
GROUP BY price_year, food_name, avg_price
ORDER BY price_year, food_name;
