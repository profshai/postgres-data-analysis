
/* ----------------------------------- SUBQUERIES ---------------------------------
-- Subqueries are queries inside a main query (outer query).
-- They make your code more efficient because they can do more in a single query.
-- Makes queries more readable because they can be more self-contained. */


/* ----------- [1] Subqueries within the SELECT clause ------------------------ */
-- Show countries and the difference in their happiness_scores from the average
SELECT
	year, country, happiness_score,
	ROUND(happiness_score - (SELECT AVG(happiness_score) FROM happiness_scores), 2) AS diff_from_avg
FROM happiness_scores;


-- Can you give me a list of our products from most to least expensive,
-- along with how much each product differs from the average unit price.
SELECT
	product_id, product_name, unit_price,
	ROUND((SELECT AVG(unit_price) FROM products), 2) AS avg_unit_price,
	ROUND(unit_price - (SELECT AVG(unit_price) FROM products), 2) AS price_difference
FROM products
WHERE unit_price IS NOT NULL
ORDER BY unit_price DESC;



/* ----------- [2] Subqueries in the FROM clause ------------------------ 

Return each country's happiness score for the year
alongside the country's average happiness score. */
SELECT hs.year, hs.country, hs.happiness_score,
	   country_hs.avg_hs 
FROM happiness_scores hs LEFT JOIN
		(SELECT country, ROUND(AVG(happiness_score), 2) AS avg_hs 
		FROM happiness_scores
		GROUP BY country) AS country_hs
		ON hs.country = country_hs.country
WHERE hs.country = 'United States';



/* ----------- [3] Multiple Subqueries ------------------------ 

 */






		

/* ----------- [2] Common Table Expressions (CTE) ------------------------ 
-- They provide a way to break down complex queries and make them easier to understand
-- They create tables that only exist for a single query
-- CTEs can be reused in a single query
-- Good for performing complex, multi-step calculations
*/

-- Can you give me a list of our products from most to least expensive,
-- along with how much each product differs from the average unit price.
WITH avg_price AS (
    SELECT AVG(unit_price) AS avg_unit_price
    FROM products
)
SELECT
    p.product_id,
    p.product_name,
    p.unit_price,
    ROUND(a.avg_unit_price, 2) AS avg_unit_price,
    ROUND(p.unit_price - a.avg_unit_price, 2) AS price_difference
FROM products p
CROSS JOIN avg_price a
ORDER BY p.unit_price DESC;
;




/* --------------------------- [3] Subqueries for Comparisons  ---------------------------------
-- We can use subqueries in WHERE and HAVING clauses
-- They are useful for writing comparisons against values not known beforehand
WITH 
	top_counties AS (
	SELECT county, COUNT(*) AS num_patients
	FROM patients
	GROUP BY county
	HAVING COUNT(*) > 1500
	),
	county_patients AS (
		SELECT
			p.master_patient_id,
			p.county
		FROM patients p
		INNER JOIN top_counties t
		ON p.county = t.county
	)

	SELECT p.county, COUNT(s.surgery_id) AS num_surguries
FROM surgical_encounters s
INNER JOIN county_patients p 
ON s.master_patient_id = p.master_patient_id
GROUP BY p.county
*/















