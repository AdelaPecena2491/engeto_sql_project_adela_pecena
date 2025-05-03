CREATE OR REPLACE TABLE t_adela_pecena_project_SQL_primary_final AS
SELECT 
	*
FROM view_no1_payroll v1
JOIN view_no2_price v2
	ON v1.payroll_year = v2.price_year;
