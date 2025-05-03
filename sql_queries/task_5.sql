-- Autorka: Adéla Pečená
-- Úkol 5: Vývoj HDP, mezd a cen v čase pro vizuální porovnání vlivu HDP

WITH wage_price_growth AS (
	SELECT 
		payroll_year AS year,
		ROUND(AVG(avg_payroll), 2) AS avg_wage,
		LAG(ROUND(AVG(avg_payroll), 2)) OVER (ORDER BY payroll_year) AS prev_wage,
		ROUND(AVG(avg_price), 2) AS avg_price,
		LAG(ROUND(AVG(avg_price), 2)) OVER (ORDER BY payroll_year) AS prev_price
	FROM t_adela_pecena_project_SQL_primary_final
	GROUP BY payroll_year
),
growth_summary AS (
	SELECT 
		wp.year,
		wp.avg_wage,
		wp.prev_wage,
		ROUND(((wp.avg_wage - wp.prev_wage) / wp.prev_wage) * 100, 2) AS wage_growth_pct,
		wp.avg_price,
		wp.prev_price,
		ROUND(((wp.avg_price - wp.prev_price) / wp.prev_price) * 100, 2) AS price_growth_pct,
		ed.GDP,
		LAG(ed.GDP) OVER (ORDER BY ed.year) AS prev_gdp,
		ROUND(((ed.GDP - LAG(ed.GDP) OVER (ORDER BY ed.year)) / LAG(ed.GDP) OVER (ORDER BY ed.year)) * 100, 2) AS gdp_growth_pct
	FROM wage_price_growth wp
	JOIN economies ed ON wp.year = ed.year
	WHERE wp.prev_wage IS NOT NULL AND wp.prev_price IS NOT NULL
)
SELECT *
FROM growth_summary
ORDER BY year;
