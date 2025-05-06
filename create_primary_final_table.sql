-- Vytvoreni tabulky s prumernymi mzdami, cenami potravin a HDP
CREATE OR REPLACE TABLE t_adela_pecena_project_SQL_primary_final AS
WITH avg_payroll AS (
    SELECT 
        payroll_year,
        industry_branch_code,
        cpib.name AS industry_name,
        ROUND(AVG(value), 2) AS avg_annual_salary
    FROM czechia_payroll cp
    LEFT JOIN czechia_payroll_industry_branch cpib 
        ON cp.industry_branch_code = cpib.code
    WHERE value_type_code = 5958 
      AND calculation_code = 200
    GROUP BY payroll_year, industry_branch_code, cpib.name
),
avg_price AS (
    SELECT 
        category_code,
        cpc.name AS food_name,
        YEAR(date_from) AS price_year,
        ROUND(AVG(value), 2) AS avg_price
    FROM czechia_price cp
    JOIN czechia_price_category cpc 
        ON cp.category_code = cpc.code
    WHERE region_code IS NULL
    GROUP BY category_code, cpc.name, YEAR(date_from)
),
gdp_cz AS (
    SELECT 
        year,
        GDP
    FROM economies
    WHERE country = 'Czech Republic'
      AND year BETWEEN 2006 AND 2018
)
SELECT 
    ap.payroll_year,
    ap.industry_branch_code,
    ap.industry_name,
    pr.category_code,
    pr.food_name,
    pr.price_year,
    pr.avg_price,
    ap.avg_annual_salary,
    gdp.GDP
FROM avg_payroll ap
JOIN avg_price pr
    ON ap.payroll_year = pr.price_year
JOIN gdp_cz gdp
    ON ap.payroll_year = gdp.year
ORDER BY ap.payroll_year, ap.industry_branch_code, pr.category_code;

