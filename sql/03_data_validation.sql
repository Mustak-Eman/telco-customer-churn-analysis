-- =====================================================
-- Project: IBM Telco Customer Churn Analysis
-- File: 03_data_validation.sql
-- Description:
-- Validates row counts, missing values, categorical values,
-- numerical ranges, and target distribution after loading.
-- =====================================================

USE WAREHOUSE ANALYTICS_WH;
USE DATABASE TELCO_CHURN_DB;
USE SCHEMA ANALYTICS;

----------------------------------------------------------
-- 1. Confirm table size
----------------------------------------------------------

SELECT
    COUNT(*) AS total_records
FROM CUSTOMER_CHURN;


----------------------------------------------------------
-- 2. Confirm expected column count
----------------------------------------------------------

SELECT
    COUNT(*) AS total_columns
FROM TELCO_CHURN_DB.INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'ANALYTICS'
  AND TABLE_NAME = 'CUSTOMER_CHURN';


----------------------------------------------------------
-- 3. Check missing values across all columns
----------------------------------------------------------

SELECT
    COUNT_IF(GENDER IS NULL) AS gender_nulls,
    COUNT_IF(SENIORCITIZEN IS NULL) AS seniorcitizen_nulls,
    COUNT_IF(PARTNER IS NULL) AS partner_nulls,
    COUNT_IF(DEPENDENTS IS NULL) AS dependents_nulls,
    COUNT_IF(TENURE IS NULL) AS tenure_nulls,
    COUNT_IF(PHONESERVICE IS NULL) AS phoneservice_nulls,
    COUNT_IF(MULTIPLELINES IS NULL) AS multiplelines_nulls,
    COUNT_IF(INTERNETSERVICE IS NULL) AS internetservice_nulls,
    COUNT_IF(ONLINESECURITY IS NULL) AS onlinesecurity_nulls,
    COUNT_IF(ONLINEBACKUP IS NULL) AS onlinebackup_nulls,
    COUNT_IF(DEVICEPROTECTION IS NULL) AS deviceprotection_nulls,
    COUNT_IF(TECHSUPPORT IS NULL) AS techsupport_nulls,
    COUNT_IF(STREAMINGTV IS NULL) AS streamingtv_nulls,
    COUNT_IF(STREAMINGMOVIES IS NULL) AS streamingmovies_nulls,
    COUNT_IF(CONTRACT IS NULL) AS contract_nulls,
    COUNT_IF(PAPERLESSBILLING IS NULL) AS paperlessbilling_nulls,
    COUNT_IF(PAYMENTMETHOD IS NULL) AS paymentmethod_nulls,
    COUNT_IF(MONTHLYCHARGES IS NULL) AS monthlycharges_nulls,
    COUNT_IF(TOTALCHARGES IS NULL) AS totalcharges_nulls,
    COUNT_IF(CHURN IS NULL) AS churn_nulls,
    COUNT_IF(TENURE_GROUP IS NULL) AS tenure_group_nulls
FROM CUSTOMER_CHURN;


----------------------------------------------------------
-- 4. Validate numerical ranges
----------------------------------------------------------

SELECT
    MIN(TENURE) AS minimum_tenure,
    MAX(TENURE) AS maximum_tenure,
    MIN(MONTHLYCHARGES) AS minimum_monthly_charges,
    MAX(MONTHLYCHARGES) AS maximum_monthly_charges,
    MIN(TOTALCHARGES) AS minimum_total_charges,
    MAX(TOTALCHARGES) AS maximum_total_charges
FROM CUSTOMER_CHURN;


----------------------------------------------------------
-- 5. Validate binary columns
----------------------------------------------------------

SELECT DISTINCT SENIORCITIZEN
FROM CUSTOMER_CHURN
ORDER BY SENIORCITIZEN;

SELECT DISTINCT CHURN
FROM CUSTOMER_CHURN
ORDER BY CHURN;

SELECT DISTINCT ONLINESECURITY
FROM CUSTOMER_CHURN
ORDER BY ONLINESECURITY;


----------------------------------------------------------
-- 6. Validate categorical values
----------------------------------------------------------

SELECT DISTINCT GENDER
FROM CUSTOMER_CHURN
ORDER BY GENDER;

SELECT DISTINCT INTERNETSERVICE
FROM CUSTOMER_CHURN
ORDER BY INTERNETSERVICE;

SELECT DISTINCT CONTRACT
FROM CUSTOMER_CHURN
ORDER BY CONTRACT;

SELECT DISTINCT PAYMENTMETHOD
FROM CUSTOMER_CHURN
ORDER BY PAYMENTMETHOD;

SELECT DISTINCT TENURE_GROUP
FROM CUSTOMER_CHURN
ORDER BY TENURE_GROUP;


----------------------------------------------------------
-- 7. Validate churn distribution
----------------------------------------------------------

SELECT
    CHURN,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_customers
FROM CUSTOMER_CHURN
GROUP BY CHURN
ORDER BY CHURN;


----------------------------------------------------------
-- 8. Check apparent duplicates after customerID removal
----------------------------------------------------------

SELECT
    COUNT(*) AS repeated_feature_groups,
    SUM(record_count - 1) AS additional_matching_rows
FROM (
    SELECT
        GENDER,
        SENIORCITIZEN,
        PARTNER,
        DEPENDENTS,
        TENURE,
        PHONESERVICE,
        MULTIPLELINES,
        INTERNETSERVICE,
        ONLINESECURITY,
        ONLINEBACKUP,
        DEVICEPROTECTION,
        TECHSUPPORT,
        STREAMINGTV,
        STREAMINGMOVIES,
        CONTRACT,
        PAPERLESSBILLING,
        PAYMENTMETHOD,
        MONTHLYCHARGES,
        TOTALCHARGES,
        CHURN,
        TENURE_GROUP,
        COUNT(*) AS record_count
    FROM CUSTOMER_CHURN
    GROUP BY ALL
    HAVING COUNT(*) > 1
);