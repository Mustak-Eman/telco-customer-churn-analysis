# Data Quality Assessment

## 1. Overview

This report documents the data quality assessment and preprocessing performed on the IBM Telco Customer Churn dataset. The objective was to identify and resolve data quality issues before conducting SQL analysis, exploratory data analysis (EDA), statistical testing, machine learning, and Power BI dashboard development.

The cleaned dataset serves as the analytical foundation for all subsequent phases of this project.

---

## 2. Dataset Overview

| Attribute | Value |
|-----------|-------|
| Dataset | IBM Telco Customer Churn |
| Source | Kaggle |
| Initial Records | 7,043 |
| Initial Features | 21 |
| Final Features | 21 |
| Target Variable | Churn |

The dataset contains customer demographic information, subscribed telecommunication services, billing details, contract information, and customer churn status. Each row represents one unique customer.

---

## 3. Data Quality Assessment

### Missing Values

A missing value assessment was performed across all columns.

The `TotalCharges` column contained blank values that were converted to missing values during numeric conversion. Investigation showed these records belonged to customers with zero months of tenure who had not yet accumulated charges.

These missing values were replaced with **0** to preserve valid customer records and maintain numerical consistency.

After preprocessing:

- Remaining missing values: **0**

---

### Duplicate Records

Duplicate validation was performed before removing the unique customer identifier (`customerID`).

Results:

- Duplicate customer IDs: **0**
- Duplicate records in the raw dataset: **0**

After removing `customerID`, 22 observations shared identical analytical features. These records were retained because the original dataset confirmed that every customer identifier was unique. The matching feature combinations represent different customers with identical characteristics rather than duplicate records.

Therefore, no customer records were removed during preprocessing.

---

### Data Type Validation

The following data type transformations were applied during preprocessing.

| Column | Original Type | Final Type | Reason |
|---------|---------------|------------|--------|
| TotalCharges | Object | Float64 | Enable numerical analysis and calculations |
| Churn | Object (Yes/No) | Integer (0/1) | Support statistical analysis and machine learning |
| tenure_group | N/A | Category | Improve customer segmentation and reporting |

---

### Data Standardization

Several preprocessing steps were applied to improve consistency across Python, SQL, and Power BI.

These included:

- Standardizing column names
- Converting categorical values into analysis-friendly formats
- Removing the unique customer identifier
- Creating an additional categorical feature for customer tenure segmentation

---

## 4. Data Cleaning Process

The following preprocessing transformations were performed.

| Transformation | Purpose |
|---------------|---------|
| Standardized column names | Improve consistency across analysis tools |
| Converted `TotalCharges` to numeric | Enable mathematical calculations |
| Replaced missing values in `TotalCharges` | Preserve valid customer records |
| Encoded `Churn` (Yes/No → 1/0) | Support statistical analysis and machine learning |
| Removed `customerID` | Identifier provides no analytical value |
| Created `tenure_group` | Simplify customer lifecycle analysis |

---

## 5. Feature Engineering

### Customer Tenure Groups

A new categorical feature, `tenure_group`, was created to segment customers according to their subscription length.

The following tenure ranges were used:

- 0–12 months
- 13–24 months
- 25–48 months
- 49–72 months

Grouping tenure into business-friendly categories improves interpretability, simplifies dashboard development, and supports customer lifecycle analysis by allowing churn trends to be compared across meaningful retention stages.

---

## 6. Validation

Following preprocessing, the cleaned dataset was validated to ensure analytical readiness.

Validation included:

- Missing value verification
- Duplicate record verification
- Data type validation
- Dataset shape verification
- Engineered feature validation
- Target variable verification

All validation checks were successfully completed.

---

## 7. Final Dataset Summary

| Metric | Value |
|---------|------:|
| Records | 7,043 |
| Features | 21 |
| Missing Values | 0 |
| Duplicate Records (Raw Dataset) | 0 |
| Duplicate Customer IDs | 0 |
| Target Variable | Churn |
| Ready for SQL Analysis | ✓ |
| Ready for Statistical Analysis | ✓ |
| Ready for Power BI | ✓ |

---

## 8. Limitations

Although the dataset successfully passed all quality checks, several limitations remain.

- The dataset represents a historical snapshot rather than longitudinal customer behavior.
- Geographic information is not included.
- Customer interaction history (support tickets, call logs, complaints) is unavailable.
- Marketing campaign exposure and customer engagement metrics are not provided.
- External economic and competitive market factors are not represented.

These limitations should be considered when interpreting analytical results and business recommendations.

---

## 9. Conclusion

The IBM Telco Customer Churn dataset successfully passed all data quality validation checks after preprocessing. No duplicate customer records were identified, missing values were resolved, data types were standardized, and an additional tenure-based feature was engineered to improve business reporting.

The resulting dataset is clean, consistent, and suitable for SQL analysis, exploratory data analysis, statistical testing, machine learning, KPI development, and Power BI dashboard creation.