# Data Quality Assessment

## 1. Overview

This report documents the data quality assessment and preparation process performed on the Telco Customer Churn dataset. The objective was to identify and resolve data quality issues before conducting SQL analysis, statistical testing, exploratory data analysis, and dashboard development.

The cleaned dataset serves as the analytical foundation for the remainder of the project.

---

## 2. Dataset Overview

**Dataset:** IBM Telco Customer Churn

**Records:** 7,043 customers

**Features (Raw):** 21

**Target Variable:** Churn

The dataset contains customer demographics, subscribed services, billing information, contract details, and customer churn status.

---

## 3. Data Quality Assessment

### Missing Values

Describe:

- Which columns contained missing values
- Why they occurred
- How they were handled

Example:

The `TotalCharges` column contained blank values that were converted to missing values during numeric conversion. Investigation showed these records belonged to customers with zero tenure. The missing values were handled during data cleaning to ensure numerical consistency.

---

### Duplicate Records

State exactly what you found.

Example:

A duplicate record assessment was performed using the full dataset.

Result:

- Duplicate records found: 0

No duplicate customer records required removal.

---

### Data Type Validation

Explain every conversion.

Example:

| Column | Original Type | Final Type | Reason |
|---------|---------------|------------|--------|
| TotalCharges | Object | Float | Required numerical analysis |

---

### Invalid Values

Examples:

- Blank strings
- Leading/trailing whitespace
- Incorrect categorical values

Explain each issue.

---

## 4. Data Cleaning Process

Summarize every transformation.

| Transformation | Reason |
|---------------|--------|
| Standardized column names | Improve consistency |
| Converted TotalCharges to numeric | Enable calculations |
| Removed CustomerID | Unique identifier only |
| Created Tenure Group | Improve business reporting |

---

## 5. Feature Engineering

Document new features.

Example:

### Tenure Group

Customers were grouped into tenure ranges to simplify segmentation and support business reporting.

Groups:

- 0–12 months
- 13–24 months
- 25–48 months
- 49–72 months

Explain why:

Rather than analyzing hundreds of individual tenure values, grouped categories provide more meaningful business insights and simplify dashboard development.

---

## 6. Validation

Describe how the cleaned dataset was verified.

Validation included:

- Missing value check
- Duplicate record check
- Data type verification
- Category validation
- Dataset shape verification

---

## 7. Final Dataset Summary

Summarize the completed dataset.

Example:

| Metric | Value |
|---------|------:|
| Records | 7,043 |
| Features | 21 (or the final count after feature engineering) |
| Missing Values | 0 |
| Duplicate Records | 0 |
| Target Variable | Churn |
| Ready for SQL | ✓ |
| Ready for Power BI | ✓ |

---

## 8. Limitations

Although the dataset was successfully cleaned, several limitations remain.

Examples:

- Historical snapshot only
- No geographic information
- No customer interaction history
- Limited behavioral variables

These limitations should be considered when interpreting the analytical results.

---

## 9. Conclusion

The dataset successfully passed all quality checks after preprocessing and is suitable for exploratory analysis, SQL querying, statistical analysis, KPI development, machine learning, and business intelligence reporting.