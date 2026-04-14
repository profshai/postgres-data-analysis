/*----------------------- ADVANCED SQL COMMANDS ------------------- */

/* --------------------------------------- Timestamps and Extract
TIME - Contains only (h,m,s)
DATE - Contains only date (y, m, d)
TIMESTAMP - Contains date and time
TIMESTAMPZ - Contains date, time and timezone

These are more useful when creating a database
*/

-- Check timezone
SHOW TIMEZONE;

-- Check Timestamp
SELECT NOW();

-- String
SELECT TIMEOFDAY();

-- Current time
SELECT CURRENT_TIME;

-- Current date
SELECT CURRENT_DATE;


/* 
EXTRACT() - Allows you to extract or obtain a sub-component of a date value
AGE() - Calculates and returns the current age given a timestamp
TO_CHAR() - General function to convert data types to text. It is useful for timestamp formatting
*/

-- Extract year
SELECT EXTRACT(YEAR FROM payment_date) AS year
FROM payment;

-- Extract month
SELECT EXTRACT(MONTH FROM payment_date) AS pay_month
FROM payment;


-- Extract quarter
SELECT EXTRACT(QUARTER FROM payment_date) AS quarter
FROM payment;


-- Extract age
SELECT AGE(payment_date)
FROM payment;


-- To_char
SELECT TO_CHAR(payment_date, 'YYYY-MM-DD')
FROM payment;


SELECT TO_CHAR(payment_date, 'mon/dd/YYYY')
FROM payment;

SELECT TO_CHAR(payment_date, 'MM/dd/YYYY')
FROM payment;

SELECT TO_CHAR(payment_date, 'MM-dd-YYYY')
FROM payment;


/* ---------------------- CHALLENGES -------------------------


*/













