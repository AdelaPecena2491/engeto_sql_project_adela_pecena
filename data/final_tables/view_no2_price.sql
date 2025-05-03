CREATE OR REPLACE VIEW view_no2_price AS
SELECT 
	ROUND(AVG(cp.value), 2) AS avg_price,
	cp.category_code,
	YEAR(cp.date_from) AS price_year,
	cpc.name AS food_name,
	CONCAT(cpc.price_value, ' ', cpc.price_unit) AS units
FROM czechia_price cp
JOIN czechia_price_category cpc 
	ON cp.category_code = cpc.code
WHERE cp.region_code IS NULL
GROUP BY cp.category_code, YEAR(cp.date_from);
