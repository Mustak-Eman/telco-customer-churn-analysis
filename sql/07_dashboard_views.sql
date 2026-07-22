-- =====================================================
-- Project: IBM Telco Customer Churn Analysis
-- File: 07_dashboard_views.sql
-- Description:
-- Creates reusable dashboard views for Power BI and other
-- business intelligence tools.
-- =====================================================

USE WAREHOUSE ANALYTICS_WH;
USE DATABASE TELCO_CHURN_DB;
USE SCHEMA ANALYTICS;

-- =====================================================
-- VIEW 1
-- Executive Dashboard Summary
-- =====================================================

CREATE OR REPLACE VIEW VW_DASHBOARD_SUMMARY AS

SELECT
    COUNT(*) AS total_customers,

    SUM(CHURN) AS churned_customers,

    COUNT(*) - SUM(CHURN) AS retained_customers,

    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct,

    ROUND((1 - AVG(CHURN)) * 100, 2) AS retention_rate_pct,

    ROUND(AVG(TENURE),2) AS average_tenure_months,

    ROUND(AVG(MONTHLYCHARGES),2) AS average_monthly_charge,

    ROUND(SUM(MONTHLYCHARGES),2) AS total_monthly_charge_exposure,

    ROUND(AVG(TOTALCHARGES),2) AS average_total_charges

FROM VW_CUSTOMER_CHURN_ANALYTICS;


-- =====================================================
-- VIEW 2
-- Contract Performance
-- =====================================================

CREATE OR REPLACE VIEW VW_CONTRACT_PERFORMANCE AS

SELECT

    CONTRACT,

    COUNT(*) AS customer_count,

    SUM(CHURN) AS churned_customers,

    ROUND(AVG(CHURN) * 100,2) AS churn_rate_pct,

    ROUND(AVG(TENURE),2) AS average_tenure,

    ROUND(AVG(MONTHLYCHARGES),2) AS average_monthly_charge

FROM VW_CUSTOMER_CHURN_ANALYTICS

GROUP BY CONTRACT;


-- =====================================================
-- VIEW 3
-- Tenure Analysis
-- =====================================================

CREATE OR REPLACE VIEW VW_TENURE_ANALYSIS AS

SELECT

    TENURE_GROUP,

    COUNT(*) AS customer_count,

    SUM(CHURN) AS churned_customers,

    ROUND(AVG(CHURN) * 100,2) AS churn_rate_pct,

    ROUND(AVG(MONTHLYCHARGES),2) AS average_monthly_charge

FROM VW_CUSTOMER_CHURN_ANALYTICS

GROUP BY TENURE_GROUP;


-- =====================================================
-- VIEW 4
-- Internet Service Analysis
-- =====================================================

CREATE OR REPLACE VIEW VW_INTERNET_SERVICE_ANALYSIS AS

SELECT

    INTERNETSERVICE,

    COUNT(*) AS customer_count,

    SUM(CHURN) AS churned_customers,

    ROUND(AVG(CHURN) * 100,2) AS churn_rate_pct,

    ROUND(AVG(MONTHLYCHARGES),2) AS average_monthly_charge

FROM VW_CUSTOMER_CHURN_ANALYTICS

GROUP BY INTERNETSERVICE;


-- =====================================================
-- VIEW 5
-- Payment Method Analysis
-- =====================================================

CREATE OR REPLACE VIEW VW_PAYMENT_METHOD_ANALYSIS AS

SELECT

    PAYMENTMETHOD,

    COUNT(*) AS customer_count,

    SUM(CHURN) AS churned_customers,

    ROUND(AVG(CHURN) * 100,2) AS churn_rate_pct

FROM VW_CUSTOMER_CHURN_ANALYTICS

GROUP BY PAYMENTMETHOD;


-- =====================================================
-- VIEW 6
-- Monthly Charge Band Analysis
-- =====================================================

CREATE OR REPLACE VIEW VW_MONTHLY_CHARGE_ANALYSIS AS

SELECT

    MONTHLY_CHARGE_BAND,

    COUNT(*) AS customer_count,

    SUM(CHURN) AS churned_customers,

    ROUND(AVG(CHURN) * 100,2) AS churn_rate_pct,

    ROUND(AVG(MONTHLYCHARGES),2) AS average_monthly_charge

FROM VW_CUSTOMER_CHURN_ANALYTICS

GROUP BY MONTHLY_CHARGE_BAND;


-- =====================================================
-- VIEW 7
-- Senior Citizen Analysis
-- =====================================================

CREATE OR REPLACE VIEW VW_SENIOR_ANALYSIS AS

SELECT

    SENIOR_STATUS,

    COUNT(*) AS customer_count,

    SUM(CHURN) AS churned_customers,

    ROUND(AVG(CHURN) * 100,2) AS churn_rate_pct,

    ROUND(AVG(TENURE),2) AS average_tenure

FROM VW_CUSTOMER_CHURN_ANALYTICS

GROUP BY SENIOR_STATUS;


-- =====================================================
-- VIEW 8
-- Household Analysis
-- =====================================================

CREATE OR REPLACE VIEW VW_HOUSEHOLD_ANALYSIS AS

SELECT

    PARTNER,

    DEPENDENTS,

    COUNT(*) AS customer_count,

    SUM(CHURN) AS churned_customers,

    ROUND(AVG(CHURN) * 100,2) AS churn_rate_pct

FROM VW_CUSTOMER_CHURN_ANALYTICS

GROUP BY
    PARTNER,
    DEPENDENTS;


-- =====================================================
-- VIEW 9
-- Support Service Adoption
-- =====================================================

CREATE OR REPLACE VIEW VW_SUPPORT_SERVICE_ANALYSIS AS

SELECT

    ONLINESECURITY
    + ONLINEBACKUP
    + DEVICEPROTECTION
    + TECHSUPPORT
        AS support_service_count,

    COUNT(*) AS customer_count,

    SUM(CHURN) AS churned_customers,

    ROUND(AVG(CHURN) * 100,2) AS churn_rate_pct

FROM VW_CUSTOMER_CHURN_ANALYTICS

WHERE INTERNETSERVICE <> 'No'

GROUP BY support_service_count;


-- =====================================================
-- VIEW 10
-- Dashboard Risk Segments
-- =====================================================

CREATE OR REPLACE VIEW VW_HIGH_RISK_CUSTOMERS AS

SELECT *

FROM VW_CUSTOMER_CHURN_ANALYTICS

WHERE
    CONTRACT='Month-to-month'
    AND INTERNETSERVICE='Fiber optic'
    AND TENURE_GROUP='0-12 months';


-- =====================================================
-- Validation Queries
-- =====================================================

SELECT * FROM VW_DASHBOARD_SUMMARY;

SELECT * FROM VW_CONTRACT_PERFORMANCE;

SELECT * FROM VW_TENURE_ANALYSIS;

SELECT * FROM VW_INTERNET_SERVICE_ANALYSIS;

SELECT * FROM VW_PAYMENT_METHOD_ANALYSIS;

SELECT * FROM VW_MONTHLY_CHARGE_ANALYSIS;

SELECT * FROM VW_SENIOR_ANALYSIS;

SELECT * FROM VW_HOUSEHOLD_ANALYSIS;

SELECT * FROM VW_SUPPORT_SERVICE_ANALYSIS;

SELECT COUNT(*) AS high_risk_customers
FROM VW_HIGH_RISK_CUSTOMERS;