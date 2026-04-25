-- 01_create_state_region.sql
-- Optional lookup table for region-level analysis

DROP TABLE IF EXISTS state_region;

CREATE TABLE state_region (
    state TEXT,
    region TEXT
);
