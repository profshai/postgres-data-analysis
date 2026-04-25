-- 08_policy_analysis.sql
-- Policy-style analysis queries inspired by Kansas SCM work

SELECT
    state,
    year,
    year - 2012 AS event_time
FROM state_panel
ORDER BY state, year;

WITH donor_avg AS (
    SELECT
        year,
        AVG(prop_income / NULLIF(pop, 0)) AS donor_avg_prop_income_pc
    FROM state_panel
    WHERE state <> 'Kansas'
    GROUP BY year
),
kansas AS (
    SELECT
        year,
        prop_income / NULLIF(pop, 0) AS kansas_prop_income_pc
    FROM state_panel
    WHERE state = 'Kansas'
)
SELECT
    k.year,
    k.kansas_prop_income_pc,
    d.donor_avg_prop_income_pc,
    k.kansas_prop_income_pc - d.donor_avg_prop_income_pc AS gap
FROM kansas k
JOIN donor_avg d
    ON k.year = d.year
ORDER BY k.year;

SELECT
    state,
    COUNT(DISTINCT year) AS n_years
FROM state_panel
WHERE year BETWEEN 2000 AND 2017
GROUP BY state
HAVING COUNT(DISTINCT year) = 18
ORDER BY state;

WITH pre_avg AS (
    SELECT
        state,
        AVG(uemp) AS avg_uemp_pre
    FROM state_panel
    WHERE year BETWEEN 2000 AND 2011
    GROUP BY state
),
kansas_avg AS (
    SELECT avg_uemp_pre AS ks_avg
    FROM pre_avg
    WHERE state = 'Kansas'
)
SELECT
    p.state,
    p.avg_uemp_pre,
    ABS(p.avg_uemp_pre - k.ks_avg) AS distance_from_kansas
FROM pre_avg p
CROSS JOIN kansas_avg k
WHERE p.state <> 'Kansas'
ORDER BY distance_from_kansas
LIMIT 10;

WITH donor_avg AS (
    SELECT
        year,
        AVG(non_farm / NULLIF(pop, 0)) AS donor_avg_non_farm_pc
    FROM state_panel
    WHERE state <> 'Kansas'
    GROUP BY year
),
kansas_gap AS (
    SELECT
        p.year,
        p.year - 2012 AS event_time,
        (p.non_farm / NULLIF(p.pop, 0)) - d.donor_avg_non_farm_pc AS gap
    FROM state_panel p
    JOIN donor_avg d
        ON p.year = d.year
    WHERE p.state = 'Kansas'
)
SELECT *
FROM kansas_gap
ORDER BY year;
