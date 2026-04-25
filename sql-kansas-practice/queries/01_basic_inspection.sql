-- 01_basic_inspection.sql
-- Basic inspection queries for the state-year panel

SELECT *
FROM state_panel
LIMIT 10;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT state) AS n_states
FROM state_panel;

SELECT
    MIN(year) AS min_year,
    MAX(year) AS max_year
FROM state_panel;

SELECT
    COUNT(*) FILTER (WHERE rgsp IS NULL) AS missing_rgsp,
    COUNT(*) FILTER (WHERE pop IS NULL) AS missing_pop,
    COUNT(*) FILTER (WHERE pi IS NULL) AS missing_pi,
    COUNT(*) FILTER (WHERE state_income_tax IS NULL) AS missing_state_income_tax
FROM state_panel;
