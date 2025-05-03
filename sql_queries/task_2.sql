-- Autorka: Adéla Pečená
-- Úkol 2: Kolik si lze koupit litrů mléka a kilogramů chleba za první a poslední společný rok (např. 2006 vs 2018)?

SELECT 
    food_name,
    price_year,
    avg_payroll,
    avg_price,
    ROUND(avg_payroll / avg_price, 2) AS amount_possible_to_buy
FROM t_adela_pecena_project_SQL_primary_final
WHERE food_name IN ('Mléko polotučné pasterované', 'Chléb konzumní kmínový')
    AND price_year IN (
        (SELECT MIN(price_year) FROM t_adela_pecena_project_SQL_primary_final),
        (SELECT MAX(price_year) FROM t_adela_pecena_project_SQL_primary_final)
    )
ORDER BY food_name, price_year;
