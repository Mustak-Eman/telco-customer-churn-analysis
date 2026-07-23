# Executive Summary

## Project Overview

Customer churn is a major challenge for subscription-based businesses because retaining existing customers is generally more cost-effective than acquiring new ones. This project analyzes the IBM Telco Customer Churn dataset to identify the primary factors associated with customer attrition and provide data-driven recommendations to improve customer retention.

The analysis follows a complete analytics workflow, including data quality assessment, data cleaning, exploratory data analysis (EDA), SQL-based business intelligence, statistical hypothesis testing, and interactive dashboard development using Power BI.

---

## Business Objective

The primary objective of this project was to identify the customer characteristics, service attributes, and business factors most strongly associated with churn while translating analytical findings into actionable business recommendations.

The analysis focuses on answering questions such as:

- Which customers are most likely to churn?
- Which products or services are associated with higher churn?
- What customer segments should be prioritized for retention efforts?
- Which operational improvements could reduce customer loss?

---

## Dataset Overview

- **Dataset:** IBM Telco Customer Churn
- **Records:** 7,043 customers
- **Features:** 21 customer and service variables
- **Target Variable:** Customer Churn

The dataset includes customer demographics, subscribed services, contract information, billing characteristics, tenure, and churn status.

---

## Analytical Workflow

The project was completed using a structured analytics workflow:

1. Data Quality Assessment (Excel)
2. Data Cleaning and Preprocessing (Python)
3. Exploratory Data Analysis (Python)
4. SQL Business Analytics and KPI Development
5. Statistical Hypothesis Testing
6. Interactive Power BI Dashboard Development
7. Business Recommendations

---

## Key Findings

The analysis identified several factors that have strong relationships with customer churn.

### Contract Type

Contract type was the strongest predictor of churn. Customers with month-to-month contracts exhibited substantially higher churn rates than customers with one-year or two-year contracts.

---

### Internet Service

Customers using Fiber Optic internet services experienced considerably higher churn than DSL customers, suggesting opportunities for service quality improvements or pricing optimization.

---

### Technical Support

Customers without technical support services were significantly more likely to churn than customers who subscribed to technical support, highlighting customer support as an important retention strategy.

---

### Payment Method

Customers using Electronic Check payment methods demonstrated higher churn than customers using automatic payment options, indicating that payment behavior may serve as an early indicator of customer dissatisfaction.

---

### Customer Tenure

Customers with shorter tenure represented the highest-risk segment. Churn decreased substantially as customer tenure increased, emphasizing the importance of early customer engagement and onboarding.

---

### Monthly Charges

Customers who churned paid higher monthly charges on average than retained customers, suggesting that pricing and perceived value influence customer retention.

---

## Statistical Validation

All major analytical findings were validated using statistical hypothesis testing.

Methods included:

- Chi-Square Tests of Independence
- Mann–Whitney U Tests
- Effect Size Analysis
- Assumption Testing

The statistical analysis confirmed that contract type, internet service, support services, payment method, tenure, and monthly charges all demonstrate statistically significant relationships with customer churn.

---

## Business Recommendations

Based on the analysis, the following recommendations are proposed:

- Encourage customers to transition from month-to-month contracts to longer-term agreements.
- Improve customer onboarding during the first year of service.
- Promote technical support and related value-added services.
- Investigate customer satisfaction among Fiber Optic subscribers.
- Encourage automatic payment methods to improve retention.
- Develop predictive churn monitoring for high-risk customer segments.

---

## Conclusion

This project demonstrates an end-to-end data analytics workflow that combines data preparation, statistical analysis, SQL reporting, business intelligence, and interactive visualization to transform raw customer data into actionable business insights.

The resulting recommendations provide a data-driven foundation for customer retention strategies while illustrating the value of modern analytics techniques in business decision-making.