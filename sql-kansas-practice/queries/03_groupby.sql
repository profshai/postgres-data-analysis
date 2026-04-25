-- 03_groupby.sql
-- Aggregation and grouping examples

SELECT
    state,
    AVG(uemp) AS avg_uemp
FROM state_panel
GROUP BY state
ORDER BY avg_uemp DESC;

SELECT
    state,
    AVG(pi / NULLIF(pop, 0)) AS avg_pi_pc_pre
FROM state_panel
WHERE year BETWEEN 2000 AND 2011
GROUP BY state
ORDER BY avg_pi_pc_pre DESC;

SELECT
    CASE
        WHEN year BETWEEN 2000 AND 2011 THEN 'Pre'
        ELSE 'Post'
    END AS period,
    AVG(non_farm / NULLIF(pop, 0)) AS avg_non_farm_pc
FROM state_panel
WHERE state = 'Kansas'
GROUP BY period
ORDER BY period;

SELECT
    year,
    AVG(manufacturing) AS avg_manufacturing
FROM state_panel
GROUP BY year
ORDER BY year;
