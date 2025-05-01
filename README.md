# Engeto SQL Projekt – Adéla Pečená

## Úvod
Cílem projektu je analyzovat dostupnost základních potravin v České republice v závislosti na průměrných mzdách a ekonomických ukazatelích.

## Datové zdroje
- [czechia_payroll](https://data.gov.cz/dataset/...)
- [czechia_price](https://data.gov.cz/dataset/...)
- [economies](https://datahub.io/core/economy/...)

## Výzkumné otázky
1. Rostou v průběhu let mzdy ve všech odvětvích nebo v některých klesají?
2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období?
3. Která kategorie potravin zdražuje nejpomaleji?
4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd?
5. Má výška HDP vliv na změny ve mzdách a cenách potravin?

## Struktura repozitáře
- `data/final_tables/`: SQL skripty pro vytvoření finálních tabulek
- `sql_queries/`: SQL dotazy k výzkumným otázkám
- `README.md`: Tento soubor
