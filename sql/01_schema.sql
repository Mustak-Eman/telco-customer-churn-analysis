-- =====================================================
-- Project: IBM Telco Customer Churn Analysis
-- File: 01_database_setup.sql
-- Description:
-- Creates the Snowflake environment for the analytics project.
-- =====================================================

----------------------------------------------------------
-- 1. Create Compute Warehouse
----------------------------------------------------------

CREATE WAREHOUSE IF NOT EXISTS ANALYTICS_WH
WITH
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'Compute warehouse for the Telco Customer Churn analytics project';

USE WAREHOUSE ANALYTICS_WH;

----------------------------------------------------------
-- 2. Create Project Database
----------------------------------------------------------

CREATE DATABASE IF NOT EXISTS TELCO_CHURN_DB
COMMENT = 'Database for IBM Telco Customer Churn Analysis portfolio project';

USE DATABASE TELCO_CHURN_DB;

----------------------------------------------------------
-- 3. Create Analytics Schema
----------------------------------------------------------

CREATE SCHEMA IF NOT EXISTS ANALYTICS
COMMENT = 'Schema containing tables, views, and SQL objects';

USE SCHEMA ANALYTICS;

----------------------------------------------------------
-- 4. Verify Environment
----------------------------------------------------------

SELECT
    CURRENT_ACCOUNT()     AS ACCOUNT,
    CURRENT_ROLE()        AS ROLE,
    CURRENT_WAREHOUSE()   AS WAREHOUSE,
    CURRENT_DATABASE()    AS DATABASE_NAME,
    CURRENT_SCHEMA()      AS SCHEMA_NAME;
