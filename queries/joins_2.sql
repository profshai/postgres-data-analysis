
/* ----------- INNER Joining two tables 
There are no NULL values
--------- */
SELECT hs.country, hs.year, hs.happiness_score, cs.continent FROM happiness_scores hs
INNER JOIN country_stats cs
ON hs.country = cs.country;


/* ----------- LEFT Joining two tables --------- */
SELECT hs.country, hs.year, hs.happiness_score, cs.continent FROM happiness_scores hs
LEFT JOIN country_stats cs
ON hs.country = cs.country
WHERE cs.country IS NULL;


/* -----------  RIGHT Joining two tables --------- */
SELECT hs.country, hs.year, hs.happiness_score, cs.continent FROM happiness_scores hs
RIGHT JOIN country_stats cs
ON hs.country = cs.country
WHERE hs.country IS NULL;;


/* ----------- FULL OUTER Joining two tables --------- */
SELECT hs.country, hs.year, hs.happiness_score, cs.continent FROM happiness_scores hs
FULL OUTER JOIN country_stats cs
ON hs.country = cs.country;


-- Countries that exist in the left table but not the right table
SELECT DISTINCT (hs.country) FROM happiness_scores hs
LEFT JOIN country_stats cs
ON hs.country = cs.country
WHERE cs.country IS NULL;


-- Which products exists in one table but not the other?
SELECT * FROM products;
SELECT * FROM orders;

SELECT * FROM products p
LEFT JOIN orders o
ON p.product_id = o.product_id
WHERE o.product_id IS NULL; -- 3 products

SELECT * FROM products p
RIGHT JOIN orders o
ON p.product_id = o.product_id
WHERE p.product_id IS NULL; -- null


/* ------------------- JOINING ON MULTIPLE COLUMNS -------------------------- */

SELECT hs.country, hs.year, hs.happiness_score, hs.gdp_per_capita, ir.inflation_rate FROM happiness_scores hs
INNER JOIN inflation_rates ir 
ON hs.year = ir.year AND hs.country = ir.country_name;



/* ------------------- JOINING 3 TABLES -------------------------- */

SELECT * FROM happiness_scores;
SELECT * FROM country_stats;
SELECT * FROM inflation_rates;

SELECT hs.year, hs.country, hs.happiness_score,
	cs.continent, ir.inflation_rate 
FROM happiness_scores hs
	LEFT JOIN country_stats cs
		ON hs.country = cs.country
	LEFT JOIN inflation_rates ir
		ON hs.country = ir.country_name AND hs.year = ir.year;


/* ------------------- SELF JOINS -------------------------- */



