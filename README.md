## ✍️ Autor
Adéla Pečená  
Studentka kurzu **Datová analytika** na platformě **Engeto Academy**, 2025.

### ❓ Proč jsou v repozitáři i `VIEW` soubory?
Součástí zadání bylo vytvořit přehledné datové pohledy (view), které slouží jako mezikrok k vytvoření finální primární tabulky. `view_no1_payroll` a `view_no2_price` obsahují agregovaná data:

- `view_no1_payroll` – průměrné mzdy podle odvětví a let
- `view_no2_price` – průměrné roční ceny potravin

Obě view jsou následně sloučeny do `t_adela_pecena_project_SQL_primary_final`, která slouží jako hlavní datový podklad pro odpovědi na otázky projektu.

## 🗃️ Popis dat
Data byla čerpána z veřejně dostupných datových sad platformy Engeto:

- `czechia_payroll` – průměrné mzdy v jednotlivých odvětvích
- `czechia_price` – ceny vybraných potravin
- `economies` – HDP a populace evropských zemí
- `countries` – seznam evropských států

## 📌 Použité technologie
- **SQL (MySQL)**
- **DBeaver** – nástroj pro práci s databázemi
- **GitHub** – správa verzí a sdílení projektu

## 🧠 Otázky, na které projekt odpovídá
1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední dostupné období?
3. Která kategorie potravin zdražuje nejpomaleji?
4. Existuje rok, kdy byl nárůst cen výrazně vyšší než nárůst mezd (více než 10 %)?
5. Má výška HDP vliv na změny ve mzdách a cenách potravin?

## Struktura repozitáře
- `data/final_tables/`: SQL skripty pro vytvoření finálních tabulek
- `sql_queries/`: SQL dotazy k výzkumným otázkám
- `README.md`: Tento soubor
