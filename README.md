# IBM Telco Customer Churn Analysis

An end-to-end data analytics and business intelligence project that investigates customer churn using the IBM Telco Customer Churn dataset. This project follows a complete analytics lifecycle—from data quality assessment and preprocessing to cloud-based SQL analytics, statistical hypothesis testing, and interactive Power BI dashboard development—to identify the primary drivers of customer attrition and provide actionable business recommendations.

---

## Dashboard Preview

![Power BI Dashboard](powerbi/screenshots/dashboard-overview.png)

---

# Project Overview

Customer churn is one of the most significant challenges facing subscription-based businesses. Retaining existing customers is considerably more cost-effective than acquiring new ones, making churn analysis an essential component of business strategy.

This project analyzes customer demographics, subscribed services, billing behavior, contract information, and account history to identify the factors most strongly associated with customer churn. The project demonstrates a complete business analytics workflow using Python, Snowflake SQL, statistical analysis, and Microsoft Power BI to transform raw customer data into actionable business insights.

---

# Business Objectives

The primary objectives of this project are to:

- Identify customer segments with elevated churn risk.
- Analyze how contracts, services, billing behavior, and tenure influence customer retention.
- Validate analytical findings using statistical hypothesis testing.
- Develop business intelligence dashboards for executive reporting.
- Translate analytical findings into practical business recommendations.

---

# Dataset

**Dataset:** IBM Telco Customer Churn

| Attribute | Value |
|-----------|------:|
| Records | 7,043 |
| Features | 21 |
| Industry | Telecommunications |
| Target Variable | Customer Churn |

The dataset contains customer demographic information, subscribed services, billing characteristics, contract details, tenure, and churn outcomes.

---

# Project Architecture

```text
IBM Telco Customer Churn Dataset
                │
                ▼
Excel Data Quality Assessment
                │
                ▼
Python Data Cleaning & Preprocessing
                │
                ▼
Exploratory Data Analysis (EDA)
                │
                ▼
Snowflake SQL Business Intelligence
                │
                ▼
Statistical Hypothesis Testing
                │
                ▼
Interactive Power BI Dashboard
                │
                ▼
Business Reports & Recommendations
```

---

# Repository Structure

```text
.
│   README.md
│   requirements.txt
│   project_brief.md
│
├── data
│   ├── raw
│   │   └── WA_Fn-UseC_-Telco-Customer-Churn.csv
│   ├── processed
│   │   └── telco_churn_clean.csv
│   └── sql_exports
│
├── docs
│   ├── analytical_methodology.md
│   ├── business_case.md
│   ├── business_recommendations.md
│   ├── data_quality_report.md
│   └── statistical_analysis.md
│
├── excel
│   └── telco_churn_raw.xlsx
│
├── notebooks
│   ├── 02_data_cleaning.ipynb
│   ├── 03_exploratory_data_analysis.ipynb
│   └── 04_statistical_analysis.ipynb
│
├── powerbi
│   ├── IBM_Telco_Customer_Churn.pbix
│   └── screenshots
│       └── dashboard-overview.png
│
├── reports
│   ├── executive_summary.md
│   └── final_report.md
│
└── sql
    ├── 01_schema.sql
    ├── 02_load_data.sql
    ├── 03_data_validation.sql
    ├── 04_transformations.sql
    ├── 05_business_queries.sql
    ├── 06_kpi_queries.sql
    └── 07_dashboard_views.sql
```

---

# Technologies Used

## Programming

- Python
- SQL

## Python Libraries

- Pandas
- NumPy
- SciPy
- Matplotlib
- Seaborn

## Cloud Data Warehouse

- Snowflake

## Business Intelligence

- Microsoft Power BI

## Productivity & Analysis

- Microsoft Excel
- Jupyter Notebook

## Version Control

- Git
- GitHub

---

# Analytics Workflow

## 1. Data Quality Assessment

The raw dataset was examined using Microsoft Excel to identify:

- Missing values
- Duplicate records
- Data consistency issues
- Formatting errors
- Invalid entries

A formal data quality report was produced before preprocessing began.

---

## 2. Data Cleaning & Preparation

Python was used to prepare the dataset for downstream analytics.

Key preprocessing tasks included:

- Data type corrections
- Missing value handling
- Feature engineering
- Customer tenure grouping
- Categorical encoding
- Exporting a cleaned dataset

---

## 3. Exploratory Data Analysis

EDA was conducted to understand customer behavior through:

- Distribution analysis
- Customer segmentation
- Correlation analysis
- Service utilization analysis
- Business-oriented visualizations

The exploratory analysis identified variables with strong relationships to customer churn that were later validated statistically.

---

## 4. Snowflake SQL Business Intelligence

The cleaned dataset was analyzed using Snowflake to simulate a modern cloud data warehouse workflow.

SQL development included:

- Database schema creation
- Data loading
- Data validation
- Feature transformations
- Business queries
- KPI calculations
- Dashboard reporting views

This stage demonstrates how SQL can be used to support executive reporting and business decision-making in a cloud analytics environment.

---

## 5. Statistical Analysis

The exploratory findings were validated using statistical hypothesis testing.

Methods included:

- Chi-Square Test of Independence
- Mann–Whitney U Test
- Effect size analysis
- Assumption testing

The statistical results confirmed significant relationships between customer churn and several customer characteristics.

---

## 6. Power BI Dashboard

An interactive dashboard was developed to communicate analytical findings through executive-friendly visualizations.

Dashboard features include:

- Executive KPI cards
- Customer churn by contract type
- Customer churn by internet service
- Customer churn by payment method
- Customer churn by technical support
- Customer churn by tenure group
- Monthly charge comparison
- Interactive slicers

---

# Key Findings

The analysis identified several business insights strongly associated with customer churn.

## Contract Type

Customers with month-to-month contracts exhibited substantially higher churn than customers with one-year or two-year agreements.

## Internet Service

Fiber Optic customers experienced significantly higher churn than DSL customers.

## Technical Support

Customers without technical support services were considerably more likely to churn.

## Payment Method

Electronic Check users demonstrated the highest churn among available payment methods.

## Customer Tenure

Customer churn was concentrated among customers with shorter tenure.

## Monthly Charges

Customers who churned paid higher monthly charges on average than retained customers.

---

# Business Recommendations

Based on the analytical findings, the following recommendations are proposed:

- Increase adoption of long-term contracts.
- Improve customer onboarding during the first year.
- Promote technical support services.
- Investigate Fiber Optic customer satisfaction.
- Encourage automatic payment methods.
- Develop predictive churn monitoring for high-risk customers.

---

# Project Deliverables

- Excel Data Quality Assessment
- Python Data Cleaning Pipeline
- Exploratory Data Analysis
- Snowflake SQL Analytics
- Statistical Hypothesis Testing
- Interactive Power BI Dashboard
- Executive Summary
- Final Business Report
- Business Recommendations

---

# Skills Demonstrated

This project demonstrates practical experience with:

- Data Cleaning & Preprocessing
- Exploratory Data Analysis (EDA)
- SQL Query Development
- Snowflake Cloud Data Warehousing
- Business Intelligence Reporting
- Statistical Hypothesis Testing
- Data Visualization
- KPI Development
- Power BI Dashboard Design
- Business Communication
- Version Control with Git & GitHub

---

# Documentation

Additional project documentation is available within the repository.

## Project Documentation

- `project_brief.md`
- `docs/business_case.md`
- `docs/analytical_methodology.md`
- `docs/data_quality_report.md`
- `docs/statistical_analysis.md`
- `docs/business_recommendations.md`

## Business Reports

- `reports/executive_summary.md`
- `reports/final_report.md`

---

# Running the Project

## Clone the Repository

```bash
git clone https://github.com/Mustak-Eman/<YOUR_REPOSITORY_NAME>.git
cd <YOUR_REPOSITORY_NAME>
```

## Install Dependencies

```bash
pip install -r requirements.txt
```

## Launch Jupyter Notebook

```bash
jupyter notebook
```

Run the notebooks in order:

1. `02_data_cleaning.ipynb`
2. `03_exploratory_data_analysis.ipynb`
3. `04_statistical_analysis.ipynb`

Open the Power BI dashboard:

```text
powerbi/IBM_Telco_Customer_Churn.pbix
```

Execute the SQL scripts sequentially within Snowflake:

1. `01_schema.sql`
2. `02_load_data.sql`
3. `03_data_validation.sql`
4. `04_transformations.sql`
5. `05_business_queries.sql`
6. `06_kpi_queries.sql`
7. `07_dashboard_views.sql`

---

# Author

**Mustak Eman**

Computer Science Student | Data Analytics | Business Intelligence | AI & Machine Learning

**GitHub:** https://github.com/Mustak-Eman

**LinkedIn:** https://www.linkedin.com/in/mustak-eman-6517b2198

---

# License

This repository is intended for educational, research, and professional portfolio purposes.