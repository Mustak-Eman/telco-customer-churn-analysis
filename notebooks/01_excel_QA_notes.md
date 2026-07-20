# Excel QA Summary — Telco Customer Churn

## Dataset Overview
- Dataset name: Telco Customer Churn
- Source: Kaggle
- Rows: 
- Columns: 

## QA Checks Performed
- Duplicate customerID check using PivotTable
- Missing values scan across all columns
- Row and column count validation
- Basic data type sanity check

## Key Findings
- No duplicate customerID values found
- Missing values identified in TotalCharges
- Missing TotalCharges correspond to customers with tenure = 0

## Decision
Data passed Excel-level QA and is ready for reproducible data cleaning in Python.