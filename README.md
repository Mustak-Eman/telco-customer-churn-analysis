# IBM Telco Customer Churn Analysis

An end-to-end data analytics project that investigates customer churn using the IBM Telco Customer Churn dataset. The project follows a complete analytics workflow—from data quality assessment and preprocessing to statistical hypothesis testing, SQL business intelligence, and interactive Power BI dashboard development—to identify the primary drivers of customer attrition and provide actionable business recommendations.

---

## 📊 Dashboard Preview

![Power BI Dashboard](powerbi/screenshots/dashboard-overview.png)

---

# Project Overview

Customer churn is one of the most significant challenges for subscription-based businesses because retaining existing customers is generally more cost-effective than acquiring new ones. This project analyzes customer demographics, subscribed services, billing information, and contract characteristics to determine the factors most strongly associated with customer churn.

The project demonstrates a complete business analytics workflow that combines technical analysis with business interpretation and executive reporting.

---

# Business Objectives

The primary objectives of this project are to:

- Identify the customer characteristics associated with higher churn.
- Analyze how contracts, services, billing behavior, and tenure influence retention.
- Validate findings using statistical hypothesis testing.
- Develop business intelligence dashboards for executive reporting.
- Translate analytical findings into actionable business recommendations.

---

# Dataset

**Dataset:** IBM Telco Customer Churn Dataset

| Attribute | Value |
|-----------|------:|
| Records | 7,043 |
| Features | 21 |
| Target Variable | Customer Churn |
| Industry | Telecommunications |

The dataset contains customer demographic information, account details, subscribed services, billing characteristics, contract information, customer tenure, and churn outcomes.

---

# Analytics Workflow

The project follows an end-to-end analytics workflow:

```text
Raw Dataset
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
SQL Business Intelligence & KPI Analysis
      │
      ▼
Statistical Hypothesis Testing
      │
      ▼
Interactive Power BI Dashboard
      │
      ▼
Business Recommendations
```

---

# Repository Structure

```text
.
│ README.md
│ requirements.txt
│
├── data
│   ├── raw
│   ├── processed
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
│
├── notebooks
│   ├── 02_data_cleaning.ipynb
│   ├── 03_exploratory_data_analysis.ipynb
│   └── 04_statistical_analysis.ipynb
│
├── powerbi
│   ├── IBM_Telco_Customer_Churn.pbix
│   └── screenshots
│
├── reports
│   ├── executive_summary.md
│   └── final_report.md
│
└── sql
```

---

# Tools & Technologies

### Programming & Analytics

- Python
- Pandas
- NumPy
- SciPy

### Visualization

- Matplotlib
- Seaborn
- Microsoft Power BI

### Database

- SQL

### Productivity

- Microsoft Excel
- Jupyter Notebook

### Version Control

- Git
- GitHub

---

# Key Analytical Techniques

## Data Quality Assessment

- Missing value analysis
- Duplicate detection
- Data consistency validation
- Data type verification

---

## Data Cleaning

- Data preprocessing
- Missing value handling
- Feature engineering
- Tenure group creation
- Categorical encoding

---

## Exploratory Data Analysis

- Distribution analysis
- Customer segmentation
- Correlation analysis
- Churn trend visualization
- Business-oriented visual exploration

---

## SQL Business Intelligence

- KPI development
- Customer segmentation
- Churn reporting
- Contract analysis
- Service adoption metrics

---

## Statistical Analysis

The exploratory findings were validated using:

- Chi-Square Test of Independence
- Mann–Whitney U Test
- Assumption testing
- Effect size analysis

---

## Power BI Dashboard

The interactive dashboard includes:

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

The analysis identified several factors strongly associated with customer churn.

### Contract Type

Month-to-month customers exhibited substantially higher churn than customers with one-year or two-year contracts.

### Internet Service

Fiber Optic customers experienced considerably higher churn compared to DSL customers.

### Technical Support

Customers without technical support services were significantly more likely to churn.

### Payment Method

Electronic Check users demonstrated the highest churn among payment methods.

### Customer Tenure

Customer churn was concentrated among customers with shorter tenure.

### Monthly Charges

Customers who churned paid higher monthly charges on average than retained customers.

---

# Business Recommendations

Based on the analysis, the following recommendations are proposed:

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
- Exploratory Data Analysis Notebook
- SQL KPI Analysis
- Statistical Hypothesis Testing
- Interactive Power BI Dashboard
- Executive Summary
- Final Business Report
- Business Recommendations

---

# Running the Project

## Clone the repository

```bash
git clone https://github.com/<your-username>/telco-customer-churn-analysis.git
cd telco-customer-churn-analysis
```

## Install dependencies

```bash
pip install -r requirements.txt
```

## Launch Jupyter Notebook

```bash
jupyter notebook
```

Open the notebooks in numerical order:

1. Data Cleaning
2. Exploratory Data Analysis
3. Statistical Analysis

The Power BI dashboard can be opened using:

```text
powerbi/IBM_Telco_Customer_Churn.pbix
```

---

# Learning Outcomes

This project demonstrates practical experience with:

- Data cleaning and preprocessing
- Exploratory data analysis
- SQL business analytics
- Statistical hypothesis testing
- Business intelligence reporting
- Interactive Power BI dashboard development
- Business communication
- Version control using Git and GitHub

---

# Author

**Mustak Eman**

Computer Science Student | Data Analytics | Business Intelligence | AI & Machine Learning

- GitHub: https://github.com/Mustak-Eman
- LinkedIn: https://www.linkedin.com/in/mustak-eman-6517b2198

---

# License

This project is intended for educational and portfolio purposes.