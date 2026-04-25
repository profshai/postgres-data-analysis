/* ----------- [7] Common Table Expression (CTE) ------------------------ 
-- Creates a named, temporary output that can be referenced within another query

Why use CTE instead of subqueries:
1. Readability: complex queries are much easier to read
2. Reusability: CTEs can be referenced multiple times within a query
3. Recursiveness: CTEs can handle recursive queries
*/

---------------------------------- READABILITY
-- Regions whose average happiness score is above the global average
WITH overall_avg AS (
    SELECT AVG(happiness_score) AS avg_score
    FROM happiness_scores
)
SELECT
    region,
    AVG(happiness_score) AS reg_avg_score
FROM happiness_scores, overall_avg
GROUP BY region, avg_score
HAVING AVG(happiness_score) > avg_score;


-- Return each country's happiness score for the year alongside the country's average happiness score
WITH country_hs AS (SELECT country, 
							AVG(happiness_score) AS avg_hs_by_country
					FROM happiness_scores
					GROUP BY country)
SELECT hs.year, hs.country, hs.happiness_score,
	   country_hs.avg_hs_by_country
FROM happiness_scores hs LEFT JOIN country_hs 
	 ON country_hs.country = hs.country;


---------------------------------- REUSABILITY
-- For each country, return countries from the same region with a lower happiness score in 2023
WITH hs AS (SELECT * FROM happiness_scores
			WHERE year = 2023)
SELECT hs1.region, hs1.country, hs1.happiness_score,
	   hs2.country, hs2.happiness_score
FROM hs hs1 INNER JOIN hs hs2
	   ON hs1.region = hs2.region
WHERE hs1.happiness_score < hs2.happiness_score;


/* The sales director wants a list of our biggest orders. In addition to sending over a list of all
the orders over $200, could you also tell him the number of orders over $200? */

WITH tas AS (
    SELECT
        o.order_id,
        SUM(o.units * p.unit_price) AS amount_spent
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY o.order_id
    HAVING SUM(o.units * p.unit_price) > 200
)
SELECT COUNT(*) AS number_of_large_orders
FROM tas;



---------------------------------- MULTIPLE CTEs



















