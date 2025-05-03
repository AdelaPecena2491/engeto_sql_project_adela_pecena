-- Autorka: Adéla Pečená
-- Úkol 1: Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

-- Základní tabulka s meziročním růstem mezd podle odvětví
SELECT *
FROM (
	SELECT 
		payroll_year,
		industry_branch_code,
		industry_name,
		avg_payroll,
		LAG(avg_payroll) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) AS prev_avg_payroll,
		ROUND((avg_payroll - LAG(avg_payroll) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year)) * 100.0 / 
		      LAG(avg_payroll) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year), 2) AS growth_percent
	FROM t_adela_pecena_project_SQL_primary_final
	WHERE industry_branch_code IS NOT NULL
) a
WHERE payroll_year > 2006
ORDER BY industry_branch_code, payroll_year;

-- Průměrný růst mezd za celé období podle odvětví
SELECT
	industry_branch_code,
	industry_name,
	ROUND(AVG(growth_percent), 2) AS avg_growth_percent
FROM (
	SELECT 
		payroll_year,
		industry_branch_code,
		industry_name,
		avg_payroll,
		LAG(avg_payroll) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year) AS prev_avg_payroll,
		ROUND((avg_payroll - LAG(avg_payroll) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year)) * 100.0 / 
		      LAG(avg_payroll) OVER (PARTITION BY industry_branch_code ORDER BY payroll_year), 2) AS growth_percent
	FROM t_adela_pecena_project_SQL_primary_final
	WHERE industry_branch_code IS NOT NULL
) a
WHERE payroll_year > 2006
GROUP BY industry_branch_code, industry_name
ORDER BY avg_growth_percent DESC;
