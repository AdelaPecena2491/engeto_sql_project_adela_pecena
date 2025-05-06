-- Tabulka pro HDP, GINI a populaci evropskych statu
CREATE OR REPLACE TABLE t_adela_pecena_project_SQL_secondary_final AS
SELECT 
    e.country,
    e.year,
    e.GDP,
    e.GINI,
    e.population
FROM economies e
JOIN countries c
    ON e.country = c.country
WHERE c.continent = 'Europe'
  AND e.year BETWEEN 2006 AND 2018
ORDER BY e.country, e.year;
