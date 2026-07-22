-- =====================================================
-- Project: IBM Telco Customer Churn Analysis
-- File: 02_load_data.sql
-- Description:
-- Loads the cleaned customer churn dataset into Snowflake.
-- =====================================================

USE WAREHOUSE ANALYTICS_WH;
USE DATABASE TELCO_CHURN_DB;
USE SCHEMA ANALYTICS;

-- Dataset
-- File: telco_churn_clean.csv
-- Source: data/processed/

-- Table created:
-- CUSTOMER_CHURN

-- Verify successful load
SELECT COUNT(*) AS total_rows
FROM CUSTOMER_CHURN;

-- Preview imported data
SELECT *
FROM CUSTOMER_CHURN
LIMIT 10;

-- Review inferred schema
DESCRIBE TABLE CUSTOMER_CHURN;