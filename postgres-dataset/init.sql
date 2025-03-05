-- This dataset simulates People team related issues raised by various teams 
CREATE SCHEMA IF NOT EXISTS raw_data;
CREATE TABLE raw_data.issues_data (
    created_by TEXT,
    created_by_id INT,
    created_by_team TEXT,
    created_by_management_level INT,
    severity TEXT,
    issue_type TEXT,
    issue_status TEXT,
    created_date TEXT,
    moved_to_in_progress TEXT,
    end_date TEXT
);


COPY raw_data.issues_data
FROM '/docker-entrypoint-initdb.d/data.csv'
DELIMITER ';'
CSV HEADER;

CREATE SCHEMA IF NOT EXISTS stg_data;
CREATE SCHEMA IF NOT EXISTS agg_data;

DROP SCHEMA IF EXISTS public CASCADE;