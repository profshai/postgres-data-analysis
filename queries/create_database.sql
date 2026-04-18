/* --------- CREATING TABLES AND DATABASES ----------------------- 
SERIAL is used for the primary key column.. makes sure the values are unique
NOT NULL means the column cannot be blank
*/

-- First Table: account
CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	age SMALLINT NOT NULL,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
)


-- Second Table: job
CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
)


-- Third Table: account_job.. Same user_id as in account table.
CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP NOT NULL
)





