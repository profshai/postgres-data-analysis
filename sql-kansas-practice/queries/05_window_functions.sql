-- 05_window_functions.sql
-- Window functions for panel-style analysis

SELECT
    state,
    year,
    prop_income,
    LAG(prop_income) OVER (PARTITION BY state ORDER BY year) AS prop_income_lag
FROM state_panel
ORDER BY state, year;

SELECT
    state,
    year,
    non_farm,
    non_farm - LAG(non_farm) OVER (PARTITION BY state ORDER BY year) AS d_non_farm
FROM state_panel
ORDER BY state, year;

SELECT
    state,
    year,
    rgsp / NULLIF(pop, 0) AS rgsp_pc,
    100.0 * (
        (rgsp / NULLIF(pop, 0)) -
        LAG(rgsp / NULLIF(pop, 0)) OVER (PARTITION BY state ORDER BY year)
    ) / NULLIF(
        LAG(rgsp / NULLIF(pop, 0)) OVER (PARTITION BY state ORDER BY year),
        0
    ) AS rgsp_pc_growth_pct
FROM state_panel
ORDER BY state, year;

SELECT
    state,
    year,
    pi / NULLIF(pop, 0) AS pi_pc,
    AVG(pi / NULLIF(pop, 0)) OVER (PARTITION BY state) AS state_avg_pi_pc
FROM state_panel
ORDER BY state, year;

SELECT
    state,
    year,
    prop_income / NULLIF(pop, 0) AS prop_income_pc,
    RANK() OVER (PARTITION BY year ORDER BY prop_income / NULLIF(pop, 0) DESC) AS rank_in_year
FROM state_panel
WHERE year = 2012
ORDER BY rank_in_year, state;
