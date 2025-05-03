-- Autorka: Adéla Pečená
-- Úkol 4: Roky, kdy růst cen potravin převýšil růst mezd o více než 10 %

WITH wages_growth AS (
	SELECT 
		payroll_year,
		ROUND(AVG(avg_payroll), 2) AS avg_wage,
		LAG(ROUND(AVG(avg_payroll), 2)) OVER (ORDER BY payroll_year) AS prev_wage
	FROM t_adela_pecena_project_SQL_primary_final
	GROUP BY payroll_year
),
prices_growth AS (
	SELECT 
		price_year,
		ROUND(AVG(avg_price), 2) AS avg_price,
		LAG(ROUND(AVG(avg_price), 2)) OVER (ORDER BY price_year) AS prev_price
	FROM t_adela_pecena_project_SQL_primary_final
	GROUP BY price_year
),
growth_comparison AS (
	SELECT 
		w.payroll_year AS year,
		ROUND(((p.avg_price - p.prev_price) / p.prev_price) * 100, 2) AS price_growth_pct,
		ROUND(((w.avg_wage - w.prev_wage) / w.prev_wage) * 100, 2) AS wage_growth_pct,
		ROUND(((p.avg_price - p.prev_price) / p.prev_price) * 100 - ((w.avg_wage - w.prev_wage) / w.prev_wage) * 100, 2) AS difference_pct
	FROM wages_growth w
	JOIN prices_growth p ON w.payroll_year = p.price_year
	WHERE w.prev_wage IS NOT NULL AND p.prev_price IS NOT NULL
)
SELECT *
FROM growth_comparison
WHERE difference_pct > 10
ORDER BY difference_pct DESC;


