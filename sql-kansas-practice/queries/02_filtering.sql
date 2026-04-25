-- 02_filtering.sql
-- Filtering examples using state, year, and unemployment

SELECT *
FROM state_panel
WHERE state = 'Kansas'
  AND year >= 2010
ORDER BY year;

SELECT
    state,
    year,
    uemp
FROM state_panel
WHERE year = 2012
  AND uemp > 6
ORDER BY uemp DESC;

SELECT *
FROM state_panel
WHERE year BETWEEN 2000 AND 2011
ORDER BY state, year;

SELECT
    state,
    year,
    rgsp,
    pi,
    prop_income,
    non_farm
FROM state_panel
WHERE state = 'Kansas'
  AND year >= 2012
ORDER BY year;
