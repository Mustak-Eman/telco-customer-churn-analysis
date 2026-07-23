# Methodology

## Overview

This project follows a structured end-to-end data analytics workflow designed to transform raw customer data into actionable business insights. The methodology emphasizes reproducibility, data quality, statistical validity, and business relevance by combining Excel-based quality assurance, Python data preprocessing, exploratory data analysis, SQL analytics, statistical hypothesis testing, and business reporting.

### Analytical Workflow

```
Raw Dataset
      │
      ▼
Excel Quality Assurance
      │
      ▼
Python Data Cleaning
      │
      ▼
Exploratory Data Analysis
      │
      ▼
SQL Business Analytics
      │
      ▼
Statistical Hypothesis Testing
      │
      ▼
Business Recommendations
```

---

# 1. Data Source

The project uses the **IBM Telco Customer Churn** dataset obtained from Kaggle. The dataset contains customer demographic information, account characteristics, subscribed services, billing information, and customer churn status.

### Dataset Characteristics

| Attribute | Value |
|-----------|-------|
| Dataset | IBM Telco Customer Churn |
| Source | Kaggle |
| Records | 7,043 |
| Variables | 21 |
| Target Variable | Churn |

---

# 2. Data Quality Assurance

Before performing any analysis, the raw dataset underwent an initial quality assessment using Microsoft Excel to identify potential data quality issues.

### Quality Assurance Checks

- Duplicate customer ID verification
- Missing value inspection
- Row and column count validation
- Basic data type consistency review

### Findings

- No duplicate customer IDs were identified.
- Missing values were found only in the **TotalCharges** column.
- All missing **TotalCharges** values corresponded to customers with a tenure of zero months, indicating newly enrolled customers with no accumulated charges.

### Outcome

The dataset successfully passed the initial quality assessment and was approved for reproducible preprocessing in Python.

---

# 3. Data Cleaning

Following the Excel quality assessment, the dataset was cleaned and transformed using Python to create a reproducible preprocessing pipeline.

### Cleaning Workflow

- Loaded the validated raw dataset
- Corrected data types
- Converted `TotalCharges` to a numeric variable
- Handled missing values
- Binary encoded categorical variables
- Removed the non-predictive identifier (`customerID`)
- Standardized variable formats
- Exported a cleaned dataset for downstream analysis

### Output

The cleaned dataset was exported to:

```text
data/processed/telco_churn_clean.csv
```

---

# 4. Exploratory Data Analysis

Exploratory Data Analysis (EDA) was conducted to understand the characteristics of the dataset and identify potential relationships with customer churn.

### Analysis Performed

- Summary statistics
- Churn distribution analysis
- Categorical variable analysis
- Numerical variable analysis
- Correlation analysis
- Customer segmentation
- Business-focused visualizations

The findings generated during EDA served as hypotheses that were later validated using inferential statistical testing.

---

# 5. SQL Business Analytics

SQL was used to validate business metrics and answer operational questions commonly encountered in customer analytics and business intelligence environments.

### SQL Workflow

- Database schema creation
- Data loading
- Data validation
- Data transformation
- Business KPI calculations
- Customer segmentation queries
- Dashboard-ready SQL views

The SQL scripts demonstrate practical querying techniques for customer analytics and reporting.

---

# 6. Statistical Analysis

Exploratory findings were validated using inferential statistical methods to determine whether observed differences between customer groups were statistically significant.

## Categorical Variables

Relationships between categorical variables and customer churn were evaluated using the **Chi-Square Test of Independence**.

Effect sizes were measured using **Cramer's V** to quantify the practical strength of each relationship.

### Variables Evaluated

- Contract Type
- Internet Service
- Payment Method
- Paperless Billing
- Senior Citizen Status
- Support-Service Adoption

---

## Numerical Variables

Numerical variables were evaluated using either:

- Independent Samples t-Test (when assumptions were satisfied)
- Mann–Whitney U Test (when assumptions were violated)

Prior to selecting the appropriate statistical test, assumptions were evaluated using:

- Shapiro–Wilk Test for normality
- Levene's Test for equality of variances

Effect sizes were reported using:

- Cohen's *d* (parametric tests)
- Rank-Biserial Correlation (non-parametric tests)

### Variables Evaluated

- Monthly Charges
- Total Charges
- Customer Tenure

---

# 7. Business Interpretation

Statistical significance alone does not necessarily imply business importance. Therefore, each statistical analysis included:

- Statistical interpretation
- Effect size interpretation
- Business insight
- Actionable business recommendation

This approach ensures that analytical findings are translated into meaningful recommendations that support customer retention strategies and evidence-based business decision-making.

---

# 8. Tools and Technologies

The following tools and technologies were used throughout the project.

| Category | Technologies |
|----------|--------------|
| Programming | Python |
| Libraries | pandas, NumPy, SciPy, Matplotlib, Seaborn |
| Notebook Environment | Jupyter Notebook |
| Database | SQL |
| Business Intelligence | Power BI |
| Spreadsheet Software | Microsoft Excel |
| Version Control | Git & GitHub |

---

# 9. Reproducibility

All preprocessing, analysis, and statistical procedures are fully reproducible.

The repository contains:

- Raw dataset
- Processed dataset
- Jupyter notebooks
- SQL scripts
- Project documentation
- Business reports

This structure enables other analysts to reproduce the complete analytical workflow from raw data through final business recommendations while maintaining transparency and reproducibility throughout the project.
