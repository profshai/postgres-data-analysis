-- 00_create_state_panel.sql
-- Main table for state-year panel analysis

DROP TABLE IF EXISTS state_panel;

CREATE TABLE state_panel (
    state TEXT,
    id INTEGER,
    year INTEGER,
    rgsp NUMERIC,
    pop NUMERIC,
    pi NUMERIC,
    state_income_tax NUMERIC,
    prop_income NUMERIC,
    non_farm NUMERIC,
    business_services NUMERIC,
    manufacturing NUMERIC,
    sal_emp NUMERIC,
    prop_emp NUMERIC,
    uemp NUMERIC
);
