-- =====================================================
-- Project: IBM Telco Customer Churn Analysis
-- File: 05_business_queries.sql
-- Description:
-- Answers key business questions related to customer
-- churn, contracts, services, billing, and segmentation.
-- =====================================================

USE WAREHOUSE ANALYTICS_WH;
USE DATABASE TELCO_CHURN_DB;
USE SCHEMA ANALYTICS;


-- =====================================================
-- 1. CUSTOMER OVERVIEW
-- =====================================================

----------------------------------------------------------
-- Business Question 1:
-- What is the overall customer churn rate?
----------------------------------------------------------

SELECT
    COUNT(*) AS total_customers,
    SUM(CHURN) AS churned_customers,
    COUNT(*) - SUM(CHURN) AS retained_customers,
    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct,
    ROUND((1 - AVG(CHURN)) * 100, 2) AS retention_rate_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- The company has an overall churn rate of 26.54%, meaning
-- approximately one in four customers have discontinued
-- service while 73.46% remain active.

-- Business Recommendation:
-- Prioritize retention strategies for high-risk customer
-- segments to reduce overall churn and improve customer
-- lifetime value.
----------------------------------------------------------

----------------------------------------------------------
-- Business Question 2:
-- How do monthly charges, total charges, and tenure differ
-- between churned and retained customers?
----------------------------------------------------------

SELECT
    CHURN_STATUS,
    COUNT(*) AS customer_count,
    ROUND(AVG(TENURE), 2) AS average_tenure_months,
    ROUND(AVG(MONTHLYCHARGES), 2) AS average_monthly_charge,
    ROUND(AVG(TOTALCHARGES), 2) AS average_total_charge
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY CHURN_STATUS
ORDER BY customer_count DESC;
----------------------------------------------------------
-- Business Insight:
-- Churned customers average 17.98 months of tenure and
-- higher monthly charges ($74.44), while retained customers
-- average 37.57 months and lower monthly charges ($61.27).
-- Retained customers also accumulate substantially higher
-- lifetime charges due to longer customer relationships.

-- Business Recommendation:
-- Focus retention efforts during customers' early lifecycle
-- while improving the value proposition for customers with
-- higher monthly charges.
----------------------------------------------------------

-- =====================================================
-- 2. CONTRACT AND CUSTOMER LIFECYCLE ANALYSIS
-- =====================================================

----------------------------------------------------------
-- Business Question 3:
-- Which contract types have the highest churn rates?
----------------------------------------------------------

SELECT
    CONTRACT,
    COUNT(*) AS total_customers,
    SUM(CHURN) AS churned_customers,
    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct,
    ROUND(AVG(TENURE), 2) AS average_tenure_months,
    ROUND(AVG(MONTHLYCHARGES), 2) AS average_monthly_charge
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY CONTRACT
ORDER BY churn_rate_pct DESC;
----------------------------------------------------------
-- Business Insight:
-- Month-to-month customers experience the highest churn
-- rate (42.71%), compared with 11.27% for one-year and
-- only 2.83% for two-year contracts, demonstrating the
-- strong relationship between contract commitment and
-- customer retention.

-- Business Recommendation:
-- Encourage month-to-month customers to transition into
-- longer-term contracts using loyalty discounts, bundled
-- services, or promotional pricing.
----------------------------------------------------------

----------------------------------------------------------
-- Business Question 4:
-- At which customer lifecycle stage is churn highest?
----------------------------------------------------------

SELECT
    TENURE_GROUP,
    COUNT(*) AS total_customers,
    SUM(CHURN) AS churned_customers,
    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct,
    ROUND(AVG(MONTHLYCHARGES), 2) AS average_monthly_charge
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY TENURE_GROUP
ORDER BY
    CASE TENURE_GROUP
        WHEN '0-12 months' THEN 1
        WHEN '13-24 months' THEN 2
        WHEN '25-48 months' THEN 3
        WHEN '49-72 months' THEN 4
        ELSE 5
    END;
----------------------------------------------------------
-- Business Insight:
-- Customer churn is highest during the first 12 months of
-- service (47.44%) and declines consistently as customer
-- tenure increases, indicating that retention improves as
-- relationships mature.

-- Business Recommendation:
-- Strengthen onboarding, proactive customer support, and
-- engagement initiatives during customers' first year.
----------------------------------------------------------

----------------------------------------------------------
-- Business Question 5:
-- How does churn vary across broader contract categories?
----------------------------------------------------------

SELECT
    CONTRACT_CATEGORY,
    COUNT(*) AS total_customers,
    SUM(CHURN) AS churned_customers,
    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY CONTRACT_CATEGORY
ORDER BY churn_rate_pct DESC;
----------------------------------------------------------
-- Business Insight:
-- Short-term contract categories consistently experience
-- substantially higher churn than customers committed to
-- long-term agreements.

-- Business Recommendation:
-- Promote longer contract commitments through personalized
-- retention campaigns and contract renewal incentives.
----------------------------------------------------------

-- =====================================================
-- 3. SERVICE ANALYSIS
-- =====================================================

----------------------------------------------------------
-- Business Question 6:
-- Which internet service has the highest churn rate?
----------------------------------------------------------

SELECT
    INTERNETSERVICE,
    COUNT(*) AS total_customers,
    SUM(CHURN) AS churned_customers,
    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct,
    ROUND(AVG(MONTHLYCHARGES), 2) AS average_monthly_charge
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY INTERNETSERVICE
ORDER BY churn_rate_pct DESC;
----------------------------------------------------------
-- Business Insight:
-- Fiber optic customers experience the highest churn rate
-- (41.89%) despite representing a significant portion of
-- internet subscribers, suggesting opportunities to improve
-- customer satisfaction within this segment.

-- Business Recommendation:
-- Investigate pricing, service reliability, and customer
-- experience for Fiber Optic customers to reduce churn.
----------------------------------------------------------

----------------------------------------------------------
-- Business Question 7:
-- Is online security associated with lower churn?
----------------------------------------------------------

SELECT
    CASE
        WHEN INTERNETService = 'No' THEN 'No Internet Service'
        WHEN ONLINESECURITY = 1 THEN 'Has Online Security'
        ELSE 'No Online Security'
    END AS online_security_status,
    COUNT(*) AS total_customers,
    SUM(CHURN) AS churned_customers,
    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY online_security_status
ORDER BY churn_rate_pct DESC;
----------------------------------------------------------
-- Business Insight:
-- Customers without Online Security experience significantly
-- higher churn than customers who subscribe to the service,
-- indicating that security adoption is associated with
-- stronger customer retention.

-- Business Recommendation:
-- Promote Online Security through bundled offerings and
-- targeted cross-selling campaigns.
----------------------------------------------------------

----------------------------------------------------------
-- Business Question 8:
-- Is technical support associated with lower churn?
----------------------------------------------------------

SELECT
    CASE
        WHEN INTERNETSERVICE = 'No' THEN 'No Internet Service'
        WHEN TECHSUPPORT = 1 THEN 'Has Tech Support'
        ELSE 'No Tech Support'
    END AS tech_support_status,
    COUNT(*) AS total_customers,
    SUM(CHURN) AS churned_customers,
    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY tech_support_status
ORDER BY churn_rate_pct DESC;
----------------------------------------------------------
-- Business Insight:
-- Customers using Technical Support demonstrate considerably
-- lower churn than customers without the service, suggesting
-- that ongoing support improves customer loyalty.

-- Business Recommendation:
-- Increase Technical Support adoption through bundled
-- service packages and proactive customer outreach.
----------------------------------------------------------

----------------------------------------------------------
-- Business Question 9:
-- How does churn vary by the number of selected digital
-- support and protection services?
----------------------------------------------------------

SELECT
    ONLINESECURITY
        + ONLINEBACKUP
        + DEVICEPROTECTION
        + TECHSUPPORT AS support_service_count,

    COUNT(*) AS total_customers,
    SUM(CHURN) AS churned_customers,
    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS
WHERE INTERNETSERVICE <> 'No'
GROUP BY support_service_count
ORDER BY support_service_count;
----------------------------------------------------------
-- Business Insight:
-- Among customers with internet service, churn decreases
-- consistently as support-service adoption increases.
-- Customers using no support services experience the highest
-- churn rate (56.67%), compared with only 5.32% for
-- customers using all four services.

-- Business Recommendation:
-- Encourage customers to adopt multiple support services
-- through bundled packages and personalized recommendations.
----------------------------------------------------------

-- =====================================================
-- 4. BILLING AND PAYMENT ANALYSIS
-- =====================================================

----------------------------------------------------------
-- Business Question 10:
-- Which payment methods have the highest churn rates?
----------------------------------------------------------

SELECT
    PAYMENTMETHOD,
    COUNT(*) AS total_customers,
    SUM(CHURN) AS churned_customers,
    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct,
    ROUND(AVG(MONTHLYCHARGES), 2) AS average_monthly_charge
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY PAYMENTMETHOD
ORDER BY churn_rate_pct DESC;
----------------------------------------------------------
-- Business Insight:
-- Electronic check customers experience the highest churn
-- rate (45.29%), while automatic payment methods exhibit
-- substantially lower customer attrition.

-- Business Recommendation:
-- Encourage customers to transition from electronic checks
-- to automatic payment methods through convenience and
-- loyalty incentives.
----------------------------------------------------------

----------------------------------------------------------
-- Business Question 11:
-- Does paperless billing correspond with higher churn?
----------------------------------------------------------

SELECT
    CASE
        WHEN PAPERLESSBILLING THEN 'Paperless Billing'
        ELSE 'Traditional Billing'
    END AS billing_type,
    COUNT(*) AS total_customers,
    SUM(CHURN) AS churned_customers,
    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY billing_type
ORDER BY churn_rate_pct DESC;
----------------------------------------------------------
-- Business Insight:
-- Paperless Billing customers experience higher churn
-- (33.57%) than customers using traditional billing
-- (16.33%), indicating that paperless enrollment alone
-- does not improve retention.

-- Business Recommendation:
-- Pair paperless billing with additional value-added
-- services rather than relying on paperless adoption
-- as a retention strategy.
----------------------------------------------------------

----------------------------------------------------------
-- Business Question 12:
-- How does churn vary across monthly charge bands?
----------------------------------------------------------

SELECT
    MONTHLY_CHARGE_BAND,
    COUNT(*) AS total_customers,
    SUM(CHURN) AS churned_customers,
    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct,
    ROUND(AVG(MONTHLYCHARGES), 2) AS average_monthly_charge
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY MONTHLY_CHARGE_BAND
ORDER BY
    CASE MONTHLY_CHARGE_BAND
        WHEN 'Low' THEN 1
        WHEN 'Medium' THEN 2
        WHEN 'High' THEN 3
        ELSE 4
    END;
----------------------------------------------------------
-- Business Insight:
-- Customers with higher monthly charges consistently exhibit
-- higher churn rates, suggesting that pricing and perceived
-- value influence customer retention.

-- Business Recommendation:
-- Improve value perception among higher-paying customers
-- through bundled services and personalized offers.
----------------------------------------------------------

-- =====================================================
-- 5. DEMOGRAPHIC SEGMENTATION
-- =====================================================

----------------------------------------------------------
-- Business Question 13:
-- Do senior citizens experience a higher churn rate?
----------------------------------------------------------

SELECT
    SENIOR_STATUS,
    COUNT(*) AS total_customers,
    SUM(CHURN) AS churned_customers,
    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct,
    ROUND(AVG(MONTHLYCHARGES), 2) AS average_monthly_charge
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY SENIOR_STATUS
ORDER BY churn_rate_pct DESC;
----------------------------------------------------------
-- Business Insight:
-- Senior citizens experience a higher churn rate (41.68%)
-- than non-senior customers (23.61%), making them an
-- important at-risk customer segment.

-- Business Recommendation:
-- Develop retention initiatives tailored specifically for
-- senior customers, including proactive support and simpler
-- service experiences.
----------------------------------------------------------

----------------------------------------------------------
-- Business Question 14:
-- How do partner and dependent status relate to churn?
----------------------------------------------------------

SELECT
    CASE
        WHEN PARTNER AND DEPENDENTS THEN 'Partner and Dependents'
        WHEN PARTNER AND NOT DEPENDENTS THEN 'Partner, No Dependents'
        WHEN NOT PARTNER AND DEPENDENTS THEN 'No Partner, Has Dependents'
        ELSE 'No Partner or Dependents'
    END AS household_segment,

    COUNT(*) AS total_customers,
    SUM(CHURN) AS churned_customers,
    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY household_segment
ORDER BY churn_rate_pct DESC;
----------------------------------------------------------
-- Business Insight:
-- Customers without partners or dependents experience the
-- highest churn (34.24%), while customers with both partners
-- and dependents demonstrate the strongest retention
-- (14.24%).

-- Business Recommendation:
-- Target customers living alone with personalized offers
-- and engagement campaigns to strengthen retention.
----------------------------------------------------------

-- =====================================================
-- 6. CHARGE EXPOSURE AND HIGH-RISK SEGMENTS
-- =====================================================

----------------------------------------------------------
-- Business Question 15:
-- What monthly charge amount is associated with customers
-- who have churned?
--
-- This is a charge-exposure estimate, not verified lost
-- revenue, because the dataset does not include churn dates
-- or post-churn revenue history.
----------------------------------------------------------

SELECT
    CHURN_STATUS,
    COUNT(*) AS customer_count,
    ROUND(SUM(MONTHLYCHARGES), 2) AS total_monthly_charge_exposure,
    ROUND(AVG(MONTHLYCHARGES), 2) AS average_monthly_charge
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY CHURN_STATUS
ORDER BY total_monthly_charge_exposure DESC;
----------------------------------------------------------
-- Business Insight:
-- Retained customers account for most monthly charge
-- exposure, while churned customers represent a substantial
-- amount of recurring billing that is potentially at risk.
-- This represents charge exposure rather than confirmed
-- revenue loss.

-- Business Recommendation:
-- Prioritize retaining higher-value customers to protect
-- recurring monthly charge exposure.
----------------------------------------------------------

----------------------------------------------------------
-- Business Question 16:
-- Which multi-factor customer segments have the highest
-- churn rates?
--
-- A minimum of 50 customers is required to avoid ranking
-- very small segments as the highest-risk groups.
----------------------------------------------------------

SELECT
    CONTRACT,
    INTERNETSERVICE,
    PAYMENTMETHOD,
    TENURE_GROUP,
    COUNT(*) AS total_customers,
    SUM(CHURN) AS churned_customers,
    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct,
    ROUND(AVG(MONTHLYCHARGES), 2) AS average_monthly_charge
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY
    CONTRACT,
    INTERNETSERVICE,
    PAYMENTMETHOD,
    TENURE_GROUP
HAVING COUNT(*) >= 50
ORDER BY
    churn_rate_pct DESC,
    total_customers DESC
LIMIT 15;
----------------------------------------------------------
-- Business Insight:
-- Customers combining month-to-month contracts, Fiber Optic
-- internet service, early tenure, and certain payment
-- methods represent the highest-risk customer segments,
-- with churn rates exceeding 70% and reaching as high as
-- 81.61% for the most vulnerable group.

-- Business Recommendation:
-- Prioritize these multi-factor high-risk segments for
-- proactive retention campaigns, personalized outreach,
-- and targeted promotional offers before churn occurs.
----------------------------------------------------------