-- 04_case_when.sql
-- Treatment, post, and interaction indicators

SELECT
    state,
    year,
    CASE WHEN state = 'Kansas' THEN 1 ELSE 0 END AS treated,
    CASE WHEN year >= 2012 THEN 1 ELSE 0 END AS post,
    CASE WHEN state = 'Kansas' AND year >= 2012 THEN 1 ELSE 0 END AS treated_post
FROM state_panel
ORDER BY state, year;

SELECT
    CASE WHEN state = 'Kansas' THEN 1 ELSE 0 END AS treated,
    CASE WHEN year >= 2012 THEN 1 ELSE 0 END AS post,
    AVG(prop_income / NULLIF(pop, 0)) AS avg_prop_income_pc
FROM state_panel
GROUP BY treated, post
ORDER BY treated, post;

SELECT
    state,
    year,
    CASE
        WHEN year < 2012 THEN 'Pre-policy'
        WHEN year = 2012 THEN 'Policy year'
        ELSE 'Post-policy'
    END AS policy_period
FROM state_panel
ORDER BY state, year;
