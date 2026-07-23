# IBM Telco Customer Churn Analysis Final Report

## Project Overview

Customer retention is a critical business objective for subscription-based companies because acquiring new customers is significantly more expensive than retaining existing ones. Understanding why customers leave enables organizations to develop targeted retention strategies, improve customer satisfaction, and reduce revenue loss.

This project analyzes the IBM Telco Customer Churn dataset using an end-to-end analytics workflow that integrates data quality assessment, data cleaning, exploratory data analysis, SQL-based business intelligence, statistical hypothesis testing, and interactive Power BI visualization. The objective is to identify the primary drivers of customer churn and translate analytical findings into actionable business recommendations.

---

# Business Problem

Customer churn directly impacts recurring revenue and long-term business growth. The organization seeks to answer several key questions:

- Which customer segments are most likely to churn?
- Which products and services are associated with higher customer attrition?
- What operational improvements could reduce churn?
- Which customer groups should receive targeted retention efforts?

The findings from this project provide evidence-based recommendations that support customer retention initiatives.

---

# Dataset Overview

**Dataset:** IBM Telco Customer Churn

The dataset contains customer demographic information, subscribed services, billing characteristics, contract details, and churn outcomes.

**Dataset Summary**

| Attribute | Value |
|-----------|-------|
| Records | 7,043 |
| Features | 21 |
| Target Variable | Customer Churn |
| Source | IBM Sample Dataset |

Major feature categories include:

- Customer demographics
- Account information
- Internet services
- Support services
- Billing characteristics
- Contract details
- Customer tenure
- Churn status

---

# Project Workflow

The project followed a structured analytics workflow consisting of six major phases.

## Phase 1 — Data Quality Assessment

The original dataset was first examined using Microsoft Excel to identify potential data quality issues.

Quality checks included:

- Missing values
- Duplicate records
- Data consistency
- Invalid values
- Formatting verification

The results were documented before beginning preprocessing.

---

## Phase 2 — Data Cleaning and Preparation

Python was used to prepare the dataset for analysis.

Cleaning tasks included:

- Correcting data types
- Handling missing values
- Encoding categorical variables
- Creating tenure groups
- Standardizing feature values
- Exporting the cleaned dataset for SQL and Power BI

The cleaned dataset became the single source of truth for all subsequent analyses.

---

## Phase 3 — Exploratory Data Analysis

Exploratory Data Analysis (EDA) was conducted to understand customer behavior and identify potential churn patterns.

The analysis included:

- Distribution analysis
- Categorical comparisons
- Numerical feature analysis
- Correlation exploration
- Customer segmentation
- Business-oriented visualizations

The EDA identified several variables with strong relationships to customer churn that were later validated statistically.

---

## Phase 4 — SQL Business Intelligence

SQL was used to generate business-focused KPIs and operational metrics.

Examples include:

- Customer counts
- Churn rate
- Average monthly charges
- Average tenure
- Contract distribution
- Internet service distribution
- Payment method analysis
- Support service adoption

These metrics simulate the type of reporting commonly used in business intelligence environments.

---

## Phase 5 — Statistical Analysis

The exploratory findings were validated using formal statistical hypothesis testing.

Statistical methods included:

- Chi-Square Test of Independence
- Mann–Whitney U Test
- Assumption testing
- Effect size analysis

The results confirmed statistically significant relationships between customer churn and multiple customer characteristics.

---

## Phase 6 — Power BI Dashboard

An interactive Power BI dashboard was developed to communicate findings through business-friendly visualizations.

The dashboard includes:

- Executive KPIs
- Contract type analysis
- Internet service analysis
- Payment method analysis
- Technical support analysis
- Tenure group analysis
- Monthly charge comparison
- Interactive filtering

The dashboard enables stakeholders to explore customer churn across multiple dimensions.

---

# Key Findings

The analysis identified several major business insights.

## Contract Type

Contract type demonstrated the strongest relationship with customer churn.

Customers with month-to-month contracts exhibited substantially higher churn than customers with one-year or two-year agreements.

---

## Internet Service

Fiber Optic customers experienced significantly higher churn compared to DSL customers.

This finding may indicate opportunities for service improvements, pricing adjustments, or customer experience enhancements.

---

## Technical Support

Customers without technical support services were considerably more likely to churn.

Technical support appears to be an important customer retention mechanism.

---

## Payment Method

Electronic Check users exhibited the highest churn among payment methods.

Automatic payment options were associated with stronger customer retention.

---

## Customer Tenure

Customer churn was concentrated among customers with shorter tenure.

Retention improved significantly as customer tenure increased.

---

## Monthly Charges

Customers who churned paid higher monthly charges on average than retained customers.

Pricing and perceived customer value appear to influence retention decisions.

---

# Business Recommendations

Based on the analytical findings, the following recommendations are proposed.

### Increase Long-Term Contract Adoption

Develop promotional campaigns encouraging customers to transition from month-to-month agreements to longer-term contracts.

---

### Strengthen Early Customer Engagement

Implement onboarding programs during the first year of service when customers are most likely to churn.

---

### Promote Technical Support

Encourage adoption of technical support and related service packages as part of customer retention initiatives.

---

### Review Fiber Optic Customer Experience

Investigate service quality, pricing, and customer satisfaction among Fiber Optic subscribers.

---

### Encourage Automatic Payments

Promote automatic payment methods through incentives or simplified enrollment.

---

### Develop Predictive Retention Programs

Use predictive analytics to proactively identify high-risk customers before churn occurs.

---

# Technologies Used

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- SciPy
- SQL
- Microsoft Excel
- Power BI
- Jupyter Notebook
- Git
- GitHub

---

# Conclusion

This project demonstrates a complete end-to-end data analytics workflow, beginning with raw customer data and concluding with executive-level business intelligence.

By combining data preparation, exploratory analysis, SQL reporting, statistical validation, and interactive Power BI visualization, the project transforms customer data into actionable business insights that support strategic decision-making.

The resulting recommendations provide a practical framework for improving customer retention while showcasing modern analytics techniques used throughout the data analytics lifecycle.