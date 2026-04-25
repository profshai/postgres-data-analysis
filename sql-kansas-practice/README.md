# Kansas-Style Panel Data SQL Project

## Overview
This repository is a portfolio-style SQL project built around a Kansas-style state-year panel dataset. It is designed to practice the SQL skills most relevant for data analyst, decision scientist, research analyst, and junior data scientist roles.

The project focuses on:
- data inspection
- filtering
- aggregation
- case expressions
- window functions
- common table expressions
- subqueries
- joins
- policy-style panel data analysis

## Recommended Table Structure

This project assumes a table called `state_panel` with columns like:

- `state`
- `id`
- `year`
- `rgsp`
- `pop`
- `pi`
- `state_income_tax`
- `prop_income`
- `non_farm`
- `business_services`
- `manufacturing`
- `sal_emp`
- `prop_emp`
- `uemp`

Optional lookup table:
- `state_region(state, region)`

## Project Structure

```text
sql-kansas-practice/
├── queries/
│   ├── 01_basic_inspection.sql
│   ├── 02_filtering.sql
│   ├── 03_groupby.sql
│   ├── 04_case_when.sql
│   ├── 05_window_functions.sql
│   ├── 06_ctes_subqueries.sql
│   ├── 07_joins.sql
│   └── 08_policy_analysis.sql
├── schema/
│   ├── 00_create_state_panel.sql
│   └── 01_create_state_region.sql
├── data/
│   └── sample_data_note.txt
└── README.md
```

## How to Use

1. Create your database and connect in pgAdmin or `psql`.
2. Run the schema files in the `schema/` folder.
3. Load your own panel dataset into `state_panel`.
4. Run the query files in order.

## Skills Demonstrated

- `SELECT`, `WHERE`, `ORDER BY`
- `GROUP BY`, `HAVING`
- `CASE WHEN`
- `LAG`, `RANK`, `AVG() OVER`
- CTEs with `WITH`
- subqueries
- joins
- panel-style analysis logic

## Notes

- The queries are written in PostgreSQL-friendly SQL.
- They are also useful for interview preparation and portfolio building.
- You can adapt the variables to your own Kansas or Ghana policy datasets.

## Author

Shaibu Yahaya  
PhD Economics | Causal Inference | Data Science
