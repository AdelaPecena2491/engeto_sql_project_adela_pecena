CREATE OR REPLACE VIEW view_no1_payroll AS
SELECT 
	ROUND(AVG(cpay.value), 2) AS avg_payroll,
	cpay.industry_branch_code,
	cpib.name AS industry_name,
	cpay.payroll_year
FROM czechia_payroll cpay
LEFT JOIN czechia_payroll_industry_branch cpib 
	ON cpay.industry_branch_code = cpib.code
WHERE cpay.value_type_code = 5958
  AND cpay.calculation_code = 200
GROUP BY cpay.industry_branch_code, cpay.payroll_year
ORDER BY cpay.payroll_year, cpay.industry_branch_code;




