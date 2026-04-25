/* ----------------------------------- SUBQUERIES ---------------------------------
-- Subqueries are queries inside queries.
-- They make your code more efficient because they can do more in a single query.
-- Makes queries more readable because they can be more self-contained.

-------- Types:
1. BASIC - Using FROM Clause
2. Common Table Expressions (CTE) - Using WITH Clauses
3. Comparisons with the main data set
*/
SET search_path TO general_hospital; -- There are two schema-qualified table references


/* ----------- Subqueries in FROM clauses ------------------------ */
-- Select patient whose name starts with m and date of birth after 2000
SELECT *
FROM (
	SELECT *
	FROM patients
	WHERE date_of_birth >= '2000-01-01'
	ORDER BY master_patient_id
	) p
WHERE p.name ilike'm%';


-- Select surgeries during the month of Nov, 2016, joining that to patients born after 1990
SELECT se.*
FROM (
	SELECT * 
	FROM surgical_encounters
	WHERE surgical_admission_date 
		BETWEEN '2016-11-01' AND '2016-11-30'
	) se
INNER JOIN (
	SELECT master_patient_id
	FROM patients
	WHERE date_of_birth >= '1990-01-01'
	) p
ON se.master_patient_id = p.master_patient_id;



/* ----------- Common Table Expressions (CTE) ------------------------ 
-- They provide a way to break down complex queries and make them easier to understand
-- They create tables that only exist for a single query
-- CTEs can be reused in a single query
-- Good for performing complex, multi-step calculations
*/

-- Select patient whose name starts with m and date of birth after 2000
WITH young_patients AS (
	SELECT * 
	FROM patients
	WHERE date_of_birth >= '2000-01-01'
) 
SELECT * 
FROM young_patients
WHERE name ilike 'm%';


-- Select surgeries by counties for counties with more than 1500 patients
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
;


/* --------------------------- Subqueries for Comparisons  ---------------------------------
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
-- Select surgeries by counties for counties with more than 1500 patients
WITH 
	total_patients AS (
		SELECT p.county, COUNT(*) AS num_patients
		FROM patients
		GROUP BY county
		HAVING COUNT(*) > 1500
		),
	total_counties AS (
		SELECT p.master_patient_id, p.county
		FROM patients p
		INNER JOIN total_patients AS t
		ON p.county = t.county
		)
	SELECT p.county, COUNT(surgery_id) AS total_surgeries
	FROM total_counties p
	INNER JOIN surgical_encounters AS s
	ON p.master_patient_id = s.master_patient_id
;






