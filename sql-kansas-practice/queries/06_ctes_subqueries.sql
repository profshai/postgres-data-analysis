-- 06_ctes_subqueries.sql
-- CTE and subquery practice

WITH pre_avg AS (
    SELECT
        state,
        AVG(rgsp / NULLIF(pop, 0)) AS avg_rgsp_pc_pre
    FROM state_panel
    WHERE year BETWEEN 2000 AND 2011
    GROUP BY state
)
SELECT *
FROM pre_avg
ORDER BY avg_rgsp_pc_pre DESC
LIMIT 10;

SELECT
    state,
    AVG(uemp) AS avg_uemp_pre
FROM state_panel
WHERE year BETWEEN 2000 AND 2011
GROUP BY state
HAVING AVG(uemp) > (
    SELECT AVG(uemp)
    FROM state_panel
    WHERE year BETWEEN 2000 AND 2011
)
ORDER BY avg_uemp_pre DESC;

SELECT
    year,
    pi / NULLIF(pop, 0) AS pi_pc
FROM state_panel
WHERE state = 'Kansas'
  AND (pi / NULLIF(pop, 0)) > (
      SELECT AVG(pi / NULLIF(pop, 0))
      FROM state_panel
      WHERE state = 'Kansas'
  )
ORDER BY year;
