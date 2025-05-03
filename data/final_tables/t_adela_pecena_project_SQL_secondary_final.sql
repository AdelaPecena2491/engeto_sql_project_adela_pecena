CREATE OR REPLACE TABLE t_adela_pecena_project_SQL_secondary_final AS 
SELECT 
	c.country,
	e.`year`,
	e.GDP,
	e.population
FROM economies e 
JOIN countries c 
	ON e.country = c.country 	
WHERE c.country = 'Czech Republic'
	AND e.`year` BETWEEN 2006 AND 2018
ORDER BY e.country, e.`year`;

SELECT * FROM t_adela_pecena_project_SQL_secondary_final;
