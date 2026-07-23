# Statistical Analysis

## Overview

Following exploratory data analysis (EDA), formal statistical hypothesis testing was conducted to determine whether observed relationships between customer characteristics and churn were statistically significant. While EDA identifies potential trends, hypothesis testing provides evidence to distinguish meaningful relationships from random variation.

The analysis focused on both categorical and numerical variables using appropriate statistical methods based on the data type and distribution. Effect size metrics were also reported to evaluate the practical significance of each finding in addition to statistical significance.

---

# Research Objectives

The statistical analysis addressed the following research questions:

1. Is customer churn associated with contract type?
2. Is customer churn associated with internet service type?
3. Is customer churn associated with payment method?
4. Is customer churn associated with paperless billing?
5. Is customer churn associated with senior citizen status?
6. Is customer churn associated with support service adoption?
7. Do monthly charges differ between customers who churn and those who remain?
8. Do total charges differ between customers who churn and those who remain?
9. Does customer tenure differ between customers who churn and those who remain?

---

# Statistical Methodology

## Categorical Variables

Associations between categorical variables and customer churn were evaluated using the Chi-Square Test of Independence.

The null hypothesis assumed no relationship between the variable and churn, while the alternative hypothesis assumed a statistically significant association.

To measure the practical strength of each relationship, Cramer's V was calculated for every significant result.

### Statistical Tests

- Chi-Square Test of Independence
- Cramer's V (Effect Size)

---

## Numerical Variables

Before comparing customer groups, statistical assumptions were evaluated.

Normality was assessed using the Shapiro-Wilk Test, while equality of variances was assessed using Levene's Test.

Because these assumptions were not satisfied, non-parametric testing was selected.

### Statistical Tests

- Shapiro-Wilk Test
- Levene's Test
- Mann-Whitney U Test
- Rank-Biserial Correlation (Effect Size)

This approach provides robust statistical inference without assuming normally distributed data.

---

# Summary of Categorical Results

| Variable | Significant | Effect Size (Cramer's V) | Interpretation |
|-----------|------------|-------------------------:|----------------|
| Contract Type | Yes | 0.410 | Strong |
| Support Services | Yes | 0.369 | Moderate-Strong |
| Internet Service | Yes | 0.322 | Moderate |
| Payment Method | Yes | 0.303 | Moderate |
| Paperless Billing | Yes | 0.191 | Weak |
| Senior Citizen | Yes | 0.150 | Weak |

Among all categorical variables, contract type demonstrated the strongest association with customer churn, followed by support service adoption and internet service type.

---

# Summary of Numerical Results

| Variable | Statistical Test | Effect Size | Interpretation |
|-----------|-----------------|------------:|----------------|
| Customer Tenure | Mann-Whitney U | 0.480 | Moderate (Strongest) |
| Total Charges | Mann-Whitney U | 0.301 | Moderate |
| Monthly Charges | Mann-Whitney U | 0.242 | Small |

Although all three numerical variables showed statistically significant differences between churned and retained customers, customer tenure exhibited the largest practical effect.

---

# Key Findings

The statistical analysis confirmed several important drivers of customer churn.

- Contract type demonstrated the strongest categorical association with churn.
- Customers using month-to-month contracts were significantly more likely to leave the company.
- Customers without technical support or online security services experienced substantially higher churn rates.
- Fiber optic customers exhibited higher churn despite purchasing premium internet services.
- Electronic check users experienced significantly higher churn than customers using automatic payment methods.
- Customers who churned had significantly shorter tenures than retained customers.
- Total accumulated customer value (Total Charges) was substantially higher among retained customers, reflecting longer customer lifetimes.
- Monthly charges alone were statistically significant but represented a weaker predictor than customer tenure or contract type.

---

# Statistical Conclusions

The statistical evidence indicates that operational and service-related variables are considerably more influential than demographic characteristics in explaining customer churn.

Contract structure, service adoption, payment behavior, and customer tenure consistently demonstrated stronger relationships with churn than age-related demographic variables.

These findings suggest that customer retention efforts should prioritize improving long-term customer engagement, increasing adoption of value-added support services, and reducing churn among month-to-month subscribers.

Overall, the statistical analysis validates the patterns identified during exploratory data analysis and provides quantitative evidence supporting targeted business interventions aimed at reducing customer attrition.