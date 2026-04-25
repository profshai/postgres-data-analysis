-- 07_joins.sql
-- Join practice with an optional region lookup table

SELECT
    p.state,
    p.year,
    r.region,
    p.rgsp / NULLIF(p.pop, 0) AS rgsp_pc
FROM state_panel p
LEFT JOIN state_region r
    ON p.state = r.state
ORDER BY p.state, p.year;

SELECT
    r.region,
    AVG(p.pi / NULLIF(p.pop, 0)) AS avg_pi_pc_pre
FROM state_panel p
LEFT JOIN state_region r
    ON p.state = r.state
WHERE p.year BETWEEN 2000 AND 2011
GROUP BY r.region
ORDER BY avg_pi_pc_pre DESC;

SELECT
    region,
    COUNT(DISTINCT state) AS n_states
FROM state_region
GROUP BY region
ORDER BY n_states DESC, region;
