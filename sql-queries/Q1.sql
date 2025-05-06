SELECT 
    payroll_year,
    industry_branch_code,
    industry_name,
    avg_annual_salary,
    LAG(avg_annual_salary) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) AS previous_salary,
    ROUND(avg_annual_salary - LAG(avg_annual_salary) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year), 2) AS difference
FROM t_adela_pecena_project_SQL_primary_final
GROUP BY payroll_year, industry_branch_code, industry_name, avg_annual_salary
ORDER BY industry_branch_code, payroll_year;
