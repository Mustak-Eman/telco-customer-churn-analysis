-- =====================================================
-- Project: IBM Telco Customer Churn Analysis
-- File: 04_transformations.sql
-- Description:
-- Creates an analysis-ready view with standardized fields,
-- business-friendly labels, and derived metrics.
-- =====================================================

USE WAREHOUSE ANALYTICS_WH;
USE DATABASE TELCO_CHURN_DB;
USE SCHEMA ANALYTICS;

----------------------------------------------------------
-- 1. Create analysis-ready customer view
----------------------------------------------------------

CREATE OR REPLACE VIEW VW_CUSTOMER_CHURN_ANALYTICS AS
SELECT
    GENDER,
    SENIORCITIZEN,

    CASE
        WHEN SENIORCITIZEN = 1 THEN 'Senior Citizen'
        ELSE 'Non-Senior Citizen'
    END AS SENIOR_STATUS,

    PARTNER,
    DEPENDENTS,
    TENURE,
    TENURE_GROUP,
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

    CASE
        WHEN CHURN = 1 THEN 'Churned'
        ELSE 'Retained'
    END AS CHURN_STATUS,

    CASE
        WHEN CONTRACT = 'Month-to-month' THEN 'Short-Term'
        WHEN CONTRACT = 'One year' THEN 'Medium-Term'
        WHEN CONTRACT = 'Two year' THEN 'Long-Term'
        ELSE 'Unknown'
    END AS CONTRACT_CATEGORY,

    CASE
        WHEN MONTHLYCHARGES < 40 THEN 'Low'
        WHEN MONTHLYCHARGES < 80 THEN 'Medium'
        ELSE 'High'
    END AS MONTHLY_CHARGE_BAND,

    ROUND(TOTALCHARGES / NULLIF(TENURE, 0), 2) AS AVG_MONTHLY_REVENUE_ESTIMATE

FROM CUSTOMER_CHURN;


----------------------------------------------------------
-- 2. Verify view creation
----------------------------------------------------------

SELECT COUNT(*) AS total_records
FROM VW_CUSTOMER_CHURN_ANALYTICS;


----------------------------------------------------------
-- 3. Preview transformed data
----------------------------------------------------------

SELECT *
FROM VW_CUSTOMER_CHURN_ANALYTICS
LIMIT 10;


----------------------------------------------------------
-- 4. Validate derived categories
----------------------------------------------------------

SELECT
    SENIOR_STATUS,
    COUNT(*) AS customer_count
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY SENIOR_STATUS
ORDER BY SENIOR_STATUS;


SELECT
    CHURN_STATUS,
    COUNT(*) AS customer_count
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY CHURN_STATUS
ORDER BY CHURN_STATUS;


SELECT
    CONTRACT_CATEGORY,
    COUNT(*) AS customer_count
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY CONTRACT_CATEGORY
ORDER BY CONTRACT_CATEGORY;


SELECT
    MONTHLY_CHARGE_BAND,
    COUNT(*) AS customer_count
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY MONTHLY_CHARGE_BAND
ORDER BY MONTHLY_CHARGE_BAND;


----------------------------------------------------------
-- 5. Validate estimated average monthly revenue
----------------------------------------------------------

SELECT
    MIN(AVG_MONTHLY_REVENUE_ESTIMATE) AS minimum_estimated_monthly_revenue,
    MAX(AVG_MONTHLY_REVENUE_ESTIMATE) AS maximum_estimated_monthly_revenue,
    ROUND(AVG(AVG_MONTHLY_REVENUE_ESTIMATE), 2) AS average_estimated_monthly_revenue
FROM VW_CUSTOMER_CHURN_ANALYTICS
WHERE AVG_MONTHLY_REVENUE_ESTIMATE IS NOT NULL;