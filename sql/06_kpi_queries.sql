-- =====================================================
-- Project: IBM Telco Customer Churn Analysis
-- File: 06_kpi_queries.sql
-- Description:
-- Calculates executive-level customer, revenue, contract,
-- service adoption, and risk KPIs for dashboard reporting.
-- =====================================================

USE WAREHOUSE ANALYTICS_WH;
USE DATABASE TELCO_CHURN_DB;
USE SCHEMA ANALYTICS;


-- =====================================================
-- 1. EXECUTIVE CUSTOMER KPIs
-- =====================================================

----------------------------------------------------------
-- KPI 1: Customer Summary
--
-- Purpose:
-- Provides the headline customer metrics for executive
-- dashboard KPI cards.
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
-- The customer base consists of 7,043 customers with an
-- overall churn rate of 26.54%, meaning approximately one
-- in four customers have discontinued service.

-- Business Recommendation:
-- Focus retention initiatives on the highest-risk customer
-- segments to reduce overall churn and improve customer
-- lifetime value.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 2: Customer Tenure Summary
--
-- Purpose:
-- Measures the average customer relationship length and
-- the observed tenure range in the dataset.
----------------------------------------------------------

SELECT
    ROUND(AVG(TENURE), 2) AS average_customer_tenure_months,
    ROUND(MEDIAN(TENURE), 2) AS median_customer_tenure_months,
    MIN(TENURE) AS minimum_tenure_months,
    MAX(TENURE) AS maximum_tenure_months
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- Customer tenure ranges from newly acquired customers to
-- long-term subscribers, providing opportunities to analyze
-- churn across different lifecycle stages.

-- Business Recommendation:
-- Develop onboarding and engagement programs that improve
-- retention during customers' early months of service.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 3: Churned vs Retained Customer Tenure
--
-- Purpose:
-- Compares customer lifetime between churned and retained
-- groups to assess how early churn tends to occur.
----------------------------------------------------------

SELECT
    CHURN_STATUS,
    COUNT(*) AS customer_count,
    ROUND(AVG(TENURE), 2) AS average_tenure_months,
    ROUND(MEDIAN(TENURE), 2) AS median_tenure_months
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY CHURN_STATUS
ORDER BY customer_count DESC;
----------------------------------------------------------
-- Business Insight:
-- Churned customers have substantially shorter average
-- tenure than retained customers, indicating that customer
-- attrition occurs primarily during the early relationship.

-- Business Recommendation:
-- Prioritize retention campaigns during the first year of
-- service when customers are most vulnerable to churn.
----------------------------------------------------------

-- =====================================================
-- 2. REVENUE AND CHARGE KPIs
-- =====================================================

----------------------------------------------------------
-- KPI 4: Monthly Charge Summary
--
-- Purpose:
-- Measures the current monthly charge exposure associated
-- with the customer base.
--
-- Note:
-- Monthly charges are used as a revenue proxy because the
-- dataset does not contain confirmed monthly revenue.
----------------------------------------------------------

SELECT
    ROUND(SUM(MONTHLYCHARGES), 2) AS total_monthly_charge_exposure,
    ROUND(AVG(MONTHLYCHARGES), 2) AS average_monthly_charge,
    ROUND(MEDIAN(MONTHLYCHARGES), 2) AS median_monthly_charge,
    ROUND(MIN(MONTHLYCHARGES), 2) AS minimum_monthly_charge,
    ROUND(MAX(MONTHLYCHARGES), 2) AS maximum_monthly_charge
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- Monthly charges vary considerably across customers,
-- reflecting differences in subscribed products and service
-- bundles.

-- Business Recommendation:
-- Regularly evaluate pricing strategies to ensure customers
-- perceive sufficient value for higher monthly charges.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 5: Total Charges Summary
--
-- Purpose:
-- Summarizes accumulated customer charges and provides a
-- proxy for historical customer value.
----------------------------------------------------------

SELECT
    ROUND(SUM(TOTALCHARGES), 2) AS cumulative_total_charges,
    ROUND(AVG(TOTALCHARGES), 2) AS average_total_charges,
    ROUND(MEDIAN(TOTALCHARGES), 2) AS median_total_charges,
    ROUND(MAX(TOTALCHARGES), 2) AS highest_total_charges
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- Total charges primarily reflect customer longevity,
-- making them a useful proxy for accumulated customer value.

-- Business Recommendation:
-- Increase customer lifetime value by improving long-term
-- retention rather than relying solely on new acquisitions.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 6: Monthly Charge Exposure by Churn Status
--
-- Purpose:
-- Compares monthly charge exposure between retained and
-- churned customers.
--
-- Note:
-- The churned amount is not confirmed lost revenue because
-- the dataset does not contain churn dates or future billing.
----------------------------------------------------------

SELECT
    CHURN_STATUS,
    COUNT(*) AS customer_count,
    ROUND(SUM(MONTHLYCHARGES), 2) AS total_monthly_charge_exposure,
    ROUND(AVG(MONTHLYCHARGES), 2) AS average_monthly_charge,
    ROUND(
        SUM(MONTHLYCHARGES) * 100.0
        / SUM(SUM(MONTHLYCHARGES)) OVER (),
        2
    ) AS percentage_of_monthly_charge_exposure
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY CHURN_STATUS
ORDER BY total_monthly_charge_exposure DESC;
----------------------------------------------------------
-- Business Insight:
-- Retained customers account for the majority of monthly
-- charge exposure, while churned customers represent a
-- meaningful portion of recurring billing at risk.

-- Business Recommendation:
-- Prioritize retaining higher-value customers to protect
-- recurring monthly revenue exposure.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 7: Estimated Annualized Charge Exposure
--
-- Purpose:
-- Annualizes current monthly charges to create a high-level
-- estimate of the customer base's annual charge exposure.
--
-- Note:
-- This is a run-rate estimate and does not account for churn,
-- discounts, new customers, or future pricing changes.
----------------------------------------------------------

SELECT
    ROUND(SUM(MONTHLYCHARGES) * 12, 2)
        AS estimated_annual_charge_exposure
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- Annualized charge exposure provides a high-level estimate
-- of the current customer portfolio's recurring value.

-- Business Recommendation:
-- Use this KPI to monitor overall business growth and
-- evaluate the financial impact of retention initiatives.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 8: Average Charge by Churn Status
--
-- Purpose:
-- Identifies whether churned customers carry a different
-- average monthly charge profile than retained customers.
----------------------------------------------------------

SELECT
    CHURN_STATUS,
    ROUND(AVG(MONTHLYCHARGES), 2) AS average_monthly_charge,
    ROUND(AVG(TOTALCHARGES), 2) AS average_total_charges
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY CHURN_STATUS
ORDER BY average_monthly_charge DESC;
----------------------------------------------------------
-- Business Insight:
-- Churned customers pay higher average monthly charges,
-- while retained customers accumulate higher lifetime
-- charges due to longer tenure.

-- Business Recommendation:
-- Improve value perception among higher-paying customers
-- through service enhancements and loyalty programs.
----------------------------------------------------------

-- =====================================================
-- 3. CONTRACT KPIs
-- =====================================================

----------------------------------------------------------
-- KPI 9: Contract Distribution
--
-- Purpose:
-- Measures the percentage of customers in each contract
-- type.
----------------------------------------------------------

SELECT
    CONTRACT,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS customer_percentage
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY CONTRACT
ORDER BY customer_percentage DESC;
----------------------------------------------------------
-- Business Insight:
-- Month-to-month contracts represent the largest customer
-- segment, exposing a substantial portion of the customer
-- base to elevated churn risk.

-- Business Recommendation:
-- Encourage migration toward longer-term contracts through
-- targeted promotions and bundled incentives.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 10: Churn Rate by Contract
--
-- Purpose:
-- Tracks customer retention risk across contract types.
----------------------------------------------------------

SELECT
    CONTRACT,
    COUNT(*) AS total_customers,
    SUM(CHURN) AS churned_customers,
    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY CONTRACT
ORDER BY churn_rate_pct DESC;
----------------------------------------------------------
-- Business Insight:
-- Month-to-month customers experience the highest churn
-- rate (42.71%), compared with 11.27% for one-year and
-- 2.83% for two-year contracts.

-- Business Recommendation:
-- Increase adoption of longer-term contracts to strengthen
-- customer retention and reduce voluntary churn.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 11: Month-to-Month Customer Share
--
-- Purpose:
-- Measures the percentage of the customer base exposed to
-- the highest-risk contract category.
----------------------------------------------------------

SELECT
    COUNT_IF(CONTRACT = 'Month-to-month') AS month_to_month_customers,
    ROUND(
        COUNT_IF(CONTRACT = 'Month-to-month') * 100.0
        / COUNT(*),
        2
    ) AS month_to_month_customer_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- A significant share of customers remain on month-to-month
-- contracts, representing the organization's largest
-- retention opportunity.

-- Business Recommendation:
-- Target this segment with personalized retention offers
-- before contract renewal decisions occur.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 12: Long-Term Contract Share
--
-- Purpose:
-- Measures the percentage of customers committed to one-
-- or two-year contracts.
----------------------------------------------------------

SELECT
    COUNT_IF(CONTRACT IN ('One year', 'Two year'))
        AS long_term_contract_customers,

    ROUND(
        COUNT_IF(CONTRACT IN ('One year', 'Two year')) * 100.0
        / COUNT(*),
        2
    ) AS long_term_contract_customer_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- Customers with one- and two-year contracts generally
-- demonstrate stronger retention and lower churn rates.

-- Business Recommendation:
-- Continue expanding long-term contract adoption through
-- loyalty rewards and pricing incentives.
----------------------------------------------------------

-- =====================================================
-- 4. SERVICE ADOPTION KPIs
-- =====================================================

----------------------------------------------------------
-- KPI 13: Internet Service Distribution
--
-- Purpose:
-- Measures the customer mix across fiber optic, DSL, and
-- customers without internet service.
----------------------------------------------------------

SELECT
    INTERNETSERVICE,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS customer_percentage,
    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY INTERNETSERVICE
ORDER BY customer_percentage DESC;
----------------------------------------------------------
-- Business Insight:
-- Fiber optic customers exhibit the highest churn rate
-- despite representing a major portion of internet
-- subscribers.

-- Business Recommendation:
-- Investigate pricing, service quality, and customer
-- satisfaction among fiber optic subscribers.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 14: Online Security Adoption
--
-- Purpose:
-- Measures adoption of online security among customers
-- who have internet service.
----------------------------------------------------------

SELECT
    COUNT_IF(INTERNETSERVICE <> 'No') AS internet_customers,

    COUNT_IF(
        INTERNETSERVICE <> 'No'
        AND ONLINESECURITY = 1
    ) AS online_security_customers,

    ROUND(
        COUNT_IF(
            INTERNETSERVICE <> 'No'
            AND ONLINESECURITY = 1
        ) * 100.0
        / NULLIF(COUNT_IF(INTERNETSERVICE <> 'No'), 0),
        2
    ) AS online_security_adoption_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- Customers adopting Online Security experience
-- substantially lower churn than customers without the
-- service.

-- Business Recommendation:
-- Increase Online Security adoption through bundled
-- packages and customer education campaigns.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 15: Technical Support Adoption
--
-- Purpose:
-- Measures adoption of technical support among customers
-- who have internet service.
----------------------------------------------------------

SELECT
    COUNT_IF(INTERNETSERVICE <> 'No') AS internet_customers,

    COUNT_IF(
        INTERNETSERVICE <> 'No'
        AND TECHSUPPORT = 1
    ) AS tech_support_customers,

    ROUND(
        COUNT_IF(
            INTERNETSERVICE <> 'No'
            AND TECHSUPPORT = 1
        ) * 100.0
        / NULLIF(COUNT_IF(INTERNETSERVICE <> 'No'), 0),
        2
    ) AS tech_support_adoption_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- Technical Support adoption is associated with stronger
-- customer retention and lower churn rates.

-- Business Recommendation:
-- Promote Technical Support as part of premium service
-- bundles to improve customer loyalty.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 16: Support Service Adoption Distribution
--
-- Purpose:
-- Measures the number of protection and support services
-- adopted by each internet customer.
----------------------------------------------------------

SELECT
    ONLINESECURITY
        + ONLINEBACKUP
        + DEVICEPROTECTION
        + TECHSUPPORT AS support_service_count,

    COUNT(*) AS customer_count,

    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS customer_percentage,

    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS
WHERE INTERNETSERVICE <> 'No'
GROUP BY support_service_count
ORDER BY support_service_count;
----------------------------------------------------------
-- Business Insight:
-- Customer churn decreases consistently as support-service
-- adoption increases. Customers using no support services
-- experience the highest churn (56.67%), while customers
-- using all four services experience only 5.32% churn.

-- Business Recommendation:
-- Encourage customers to adopt multiple support services
-- through bundled offerings and targeted cross-selling.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 17: Customers with No Support Services
--
-- Purpose:
-- Measures the share of internet customers who do not use
-- any of the four protection or support services.
----------------------------------------------------------

SELECT
    COUNT_IF(
        INTERNETSERVICE <> 'No'
        AND ONLINESECURITY = 0
        AND ONLINEBACKUP = 0
        AND DEVICEPROTECTION = 0
        AND TECHSUPPORT = 0
    ) AS customers_with_no_support_services,

    ROUND(
        COUNT_IF(
            INTERNETSERVICE <> 'No'
            AND ONLINESECURITY = 0
            AND ONLINEBACKUP = 0
            AND DEVICEPROTECTION = 0
            AND TECHSUPPORT = 0
        ) * 100.0
        / NULLIF(COUNT_IF(INTERNETSERVICE <> 'No'), 0),
        2
    ) AS no_support_service_customer_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- A substantial portion of internet customers use none of
-- the available protection or support services, placing
-- them at significantly greater churn risk.

-- Business Recommendation:
-- Target these customers with bundled support offerings to
-- improve engagement and long-term retention.
----------------------------------------------------------

-- =====================================================
-- 5. BILLING AND PAYMENT KPIs
-- =====================================================

----------------------------------------------------------
-- KPI 18: Payment Method Distribution and Churn
--
-- Purpose:
-- Tracks customer payment behavior and churn risk across
-- payment methods.
----------------------------------------------------------

SELECT
    PAYMENTMETHOD,
    COUNT(*) AS customer_count,

    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS customer_percentage,

    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY PAYMENTMETHOD
ORDER BY customer_percentage DESC;
----------------------------------------------------------
-- Business Insight:
-- Electronic check customers experience the highest churn
-- rate among all payment methods.

-- Business Recommendation:
-- Encourage customers to transition toward automatic
-- payment methods through convenience incentives.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 19: Automatic Payment Adoption
--
-- Purpose:
-- Measures the percentage of customers using automatic
-- bank transfer or automatic credit card payments.
----------------------------------------------------------

SELECT
    COUNT_IF(
        PAYMENTMETHOD IN (
            'Bank transfer (automatic)',
            'Credit card (automatic)'
        )
    ) AS automatic_payment_customers,

    ROUND(
        COUNT_IF(
            PAYMENTMETHOD IN (
                'Bank transfer (automatic)',
                'Credit card (automatic)'
            )
        ) * 100.0 / COUNT(*),
        2
    ) AS automatic_payment_adoption_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- Automatic payment adoption represents an opportunity to
-- improve customer convenience and strengthen retention.

-- Business Recommendation:
-- Promote automatic payment enrollment during onboarding
-- and account management interactions.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 20: Electronic Check Customer Share
--
-- Purpose:
-- Measures the share of customers using the payment method
-- associated with the highest observed churn rate.
----------------------------------------------------------

SELECT
    COUNT_IF(PAYMENTMETHOD = 'Electronic check')
        AS electronic_check_customers,

    ROUND(
        COUNT_IF(PAYMENTMETHOD = 'Electronic check')
        * 100.0 / COUNT(*),
        2
    ) AS electronic_check_customer_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- Electronic check remains the payment method most closely
-- associated with elevated customer churn.

-- Business Recommendation:
-- Incentivize migration to automatic payment methods to
-- reduce churn risk.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 21: Paperless Billing Adoption
--
-- Purpose:
-- Measures paperless billing adoption and the associated
-- churn rate.
----------------------------------------------------------

SELECT
    CASE
        WHEN PAPERLESSBILLING THEN 'Paperless Billing'
        ELSE 'Traditional Billing'
    END AS billing_type,

    COUNT(*) AS customer_count,

    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS customer_percentage,

    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS
GROUP BY billing_type
ORDER BY customer_percentage DESC;
----------------------------------------------------------
-- Business Insight:
-- Paperless billing customers exhibit higher churn than
-- customers using traditional billing, suggesting paperless
-- adoption alone does not improve retention.

-- Business Recommendation:
-- Combine paperless billing with additional loyalty or
-- service benefits rather than promoting it independently.
----------------------------------------------------------

-- =====================================================
-- 6. CUSTOMER RISK KPIs
-- =====================================================

----------------------------------------------------------
-- KPI 22: Early-Tenure Customer Share
--
-- Purpose:
-- Measures the percentage of customers in their first year,
-- where the highest tenure-based churn rate was observed.
----------------------------------------------------------

SELECT
    COUNT_IF(TENURE_GROUP = '0-12 months')
        AS early_tenure_customers,

    ROUND(
        COUNT_IF(TENURE_GROUP = '0-12 months')
        * 100.0 / COUNT(*),
        2
    ) AS early_tenure_customer_pct,

    ROUND(
        AVG(
            CASE
                WHEN TENURE_GROUP = '0-12 months'
                THEN CHURN
            END
        ) * 100,
        2
    ) AS early_tenure_churn_rate_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- Customers within their first 12 months experience the
-- highest observed tenure-based churn rate.

-- Business Recommendation:
-- Strengthen onboarding, customer success, and early
-- engagement programs during the first year of service.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 23: Senior Citizen Customer Share
--
-- Purpose:
-- Measures the size and churn rate of the senior citizen
-- segment.
----------------------------------------------------------

SELECT
    COUNT_IF(SENIORCITIZEN = 1) AS senior_customers,

    ROUND(
        COUNT_IF(SENIORCITIZEN = 1)
        * 100.0 / COUNT(*),
        2
    ) AS senior_customer_pct,

    ROUND(
        AVG(
            CASE
                WHEN SENIORCITIZEN = 1
                THEN CHURN
            END
        ) * 100,
        2
    ) AS senior_customer_churn_rate_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- Senior customers experience higher churn than the overall
-- customer population.

-- Business Recommendation:
-- Develop support programs tailored to senior customers,
-- including proactive assistance and simplified services.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 24: High Monthly Charge Customer Share
--
-- Purpose:
-- Measures the share and churn rate of customers in the
-- high monthly charge band.
----------------------------------------------------------

SELECT
    COUNT_IF(MONTHLY_CHARGE_BAND = 'High')
        AS high_charge_customers,

    ROUND(
        COUNT_IF(MONTHLY_CHARGE_BAND = 'High')
        * 100.0 / COUNT(*),
        2
    ) AS high_charge_customer_pct,

    ROUND(
        AVG(
            CASE
                WHEN MONTHLY_CHARGE_BAND = 'High'
                THEN CHURN
            END
        ) * 100,
        2
    ) AS high_charge_churn_rate_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- Customers with higher monthly charges demonstrate
-- increased churn risk compared with lower-charge segments.

-- Business Recommendation:
-- Improve perceived value through bundled services and
-- personalized retention incentives.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 25: Fiber Optic Customer Risk
--
-- Purpose:
-- Measures the size, monthly charge profile, and churn rate
-- of the fiber optic customer segment.
----------------------------------------------------------

SELECT
    COUNT_IF(INTERNETSERVICE = 'Fiber optic')
        AS fiber_optic_customers,

    ROUND(
        COUNT_IF(INTERNETSERVICE = 'Fiber optic')
        * 100.0 / COUNT(*),
        2
    ) AS fiber_optic_customer_pct,

    ROUND(
        AVG(
            CASE
                WHEN INTERNETSERVICE = 'Fiber optic'
                THEN MONTHLYCHARGES
            END
        ),
        2
    ) AS fiber_optic_average_monthly_charge,

    ROUND(
        AVG(
            CASE
                WHEN INTERNETSERVICE = 'Fiber optic'
                THEN CHURN
            END
        ) * 100,
        2
    ) AS fiber_optic_churn_rate_pct
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- Fiber optic customers pay higher monthly charges while
-- also experiencing the highest churn among internet
-- service categories.

-- Business Recommendation:
-- Review pricing, service quality, and customer experience
-- for fiber optic subscribers.
----------------------------------------------------------

----------------------------------------------------------
-- KPI 26: High-Risk Customer Segment
--
-- Definition:
-- A high-risk customer meets all of the following:
-- - Month-to-month contract
-- - Fiber optic internet
-- - Tenure of 0-12 months
--
-- Purpose:
-- Measures a broad, actionable risk group identified from
-- the business analysis.
----------------------------------------------------------

SELECT
    COUNT_IF(
        CONTRACT = 'Month-to-month'
        AND INTERNETSERVICE = 'Fiber optic'
        AND TENURE_GROUP = '0-12 months'
    ) AS high_risk_customers,

    ROUND(
        COUNT_IF(
            CONTRACT = 'Month-to-month'
            AND INTERNETSERVICE = 'Fiber optic'
            AND TENURE_GROUP = '0-12 months'
        ) * 100.0 / COUNT(*),
        2
    ) AS high_risk_customer_pct,

    ROUND(
        AVG(
            CASE
                WHEN CONTRACT = 'Month-to-month'
                 AND INTERNETSERVICE = 'Fiber optic'
                 AND TENURE_GROUP = '0-12 months'
                THEN CHURN
            END
        ) * 100,
        2
    ) AS high_risk_segment_churn_rate_pct,

    ROUND(
        SUM(
            CASE
                WHEN CONTRACT = 'Month-to-month'
                 AND INTERNETSERVICE = 'Fiber optic'
                 AND TENURE_GROUP = '0-12 months'
                THEN MONTHLYCHARGES
                ELSE 0
            END
        ),
        2
    ) AS high_risk_monthly_charge_exposure
FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- Customers combining month-to-month contracts, fiber optic
-- internet, and early tenure represent the highest-risk
-- customer segment identified in this analysis.

-- Business Recommendation:
-- Prioritize this segment for proactive outreach, targeted
-- incentives, and personalized retention campaigns.
----------------------------------------------------------

-- =====================================================
-- 7. DASHBOARD SUMMARY KPI OUTPUT
-- =====================================================

----------------------------------------------------------
-- KPI 27: Single-Row Executive Dashboard Summary
--
-- Purpose:
-- Produces one reusable row containing the main KPI card
-- values for Power BI or another reporting tool.
----------------------------------------------------------

SELECT
    COUNT(*) AS total_customers,
    SUM(CHURN) AS churned_customers,
    COUNT(*) - SUM(CHURN) AS retained_customers,

    ROUND(AVG(CHURN) * 100, 2) AS churn_rate_pct,
    ROUND((1 - AVG(CHURN)) * 100, 2) AS retention_rate_pct,

    ROUND(AVG(TENURE), 2) AS average_tenure_months,
    ROUND(AVG(MONTHLYCHARGES), 2) AS average_monthly_charge,
    ROUND(SUM(MONTHLYCHARGES), 2) AS total_monthly_charge_exposure,

    ROUND(
        SUM(
            CASE
                WHEN CHURN = 1
                THEN MONTHLYCHARGES
                ELSE 0
            END
        ),
        2
    ) AS churned_monthly_charge_exposure,

    ROUND(
        COUNT_IF(CONTRACT = 'Month-to-month')
        * 100.0 / COUNT(*),
        2
    ) AS month_to_month_customer_pct,

    ROUND(
        COUNT_IF(TENURE_GROUP = '0-12 months')
        * 100.0 / COUNT(*),
        2
    ) AS early_tenure_customer_pct,

    ROUND(
        COUNT_IF(
            PAYMENTMETHOD IN (
                'Bank transfer (automatic)',
                'Credit card (automatic)'
            )
        ) * 100.0 / COUNT(*),
        2
    ) AS automatic_payment_adoption_pct,

    ROUND(
        COUNT_IF(
            CONTRACT = 'Month-to-month'
            AND INTERNETSERVICE = 'Fiber optic'
            AND TENURE_GROUP = '0-12 months'
        ) * 100.0 / COUNT(*),
        2
    ) AS high_risk_customer_pct

FROM VW_CUSTOMER_CHURN_ANALYTICS;
----------------------------------------------------------
-- Business Insight:
-- This summary consolidates the project's primary business
-- KPIs into a single record for executive dashboards and
-- management reporting.

-- Business Recommendation:
-- Refresh this KPI regularly to monitor retention trends
-- and evaluate the effectiveness of customer retention
-- initiatives over time.
----------------------------------------------------------