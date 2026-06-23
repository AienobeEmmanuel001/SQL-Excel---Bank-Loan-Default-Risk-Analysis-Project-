# 🏦 Bank Loan Default Risk Analysis

# INTRODUCTION 

This project analyzes bank loan data to identify patterns in loan defaults and provide insights that can support better lending decisions. 
Using PostgreSQL for data analysis and Excel for visualization, the project investigates customer behavior, loan performance, branch-level risk, 
and financial exposure to defaults.

---

# BACKGROUND

The bank has experienced rising loan defaults and wants to understand:

* Which customer segments are most likely to default?
* Which loan products are riskiest?
* Which branches generate the highest-risk loans?
* How much money is exposed to default risk?
* Which customers should be monitored more closely?

The goal is to uncover actionable insights that can help reduce future loan losses and improve risk management.

---

## TOOLS I USED 

* PostgreSQL – Data storage and SQL analysis
* VS Code – Query development and project organization
* Excel – Dashboard creation and visualization
* PowerPoint – Creation Of Dashboard Wireframe
* GitHub – Project documentation and version control

---

# THE ANALYSIS

### Data Cleaning

The following data preparation steps were performed:

* Created a new column called gender_cleaned to clean errors in gender column.
* Standardized 'F' to 'Female', 'M' to 'Male', 'male' to 'Male', and 'female' to 'Female'.
* Created a new column and merged first_name & last_name columns together using CONCAT().
* Created a new column and rounded the annual income column to whole numbers using ROUND ().
* Made use of ALTER TABLE, ADD COLUMN, UPDATE & CASE.
* Created new columns and rounded the loan_amount & monthly_installment column to whole numbers using ROUND ().
* Created a new column and capitalized the first letter of each word in the Loan_type column using INITCAP.
* Checked for duplicate records
* Performed data quality checks before analysis

**SQL Queries:**
👉 See `01_Data_Cleaning.sql`


### Business Question 1: Which customer segments default the most?

Analysis performed:

* Default Rate by Employment Status
* Default Rate by Age Group
* Default Rate by Income Band

**SQL Queries:**
👉 See `02_Customer_Default_analysis.sql`


### Business Question 2: Which loan products are riskiest?

Analysis performed:

* Loan Default Count by Loan Type

**SQL Queries:**
👉 See `03_Loan_Product_Risk_Analysis.sql`


### Business Question 3: Which branches generate the highest-risk loans?

Analysis performed:

* Branch Loan Default Analysis
* Total Loan Defaults Per Branch
* Fund At Risk Per Branch

**SQL Queries:**
👉 See `04_Branch_Risk_analysis.sql`


### Business Question 4: How much money is exposed to default?

Analysis performed:

* Total Funds at Risk
* Total defaulted Loans
* Loan Default Percentage

**SQL Queries:**
👉 See `05_Funds_at_Risk_Analysis.sql`


### Business Question 5: Which customers should be monitored closely?

Analysis performed:

* Top High-Risk Customers By Total Debt Owed
* Total Debt Owed Per Customer

**SQL Queries:**
👉 See `06_High_Risk_Customer_Identification.sql`


### Dashboard

![Dashboard](BANK%20LOAN%20DEFAULT%20RISK%20ANALYSIS%20DASHBOARD.png)
---



## Key Insights

### 1. Customer Default Risk Is Concentrated in Specific Segments

The analysis revealed significant variation in loan default rates across customer segments. Certain age groups, employment categories, and income bands consistently exhibited higher default rates than others, indicating that borrower characteristics play an important role in repayment behavior. This suggests that a one-size-fits-all lending strategy may expose the bank to unnecessary credit risk.

### 2. Personal Loans Represent the Highest Credit Risk

Among all loan products analyzed, Personal Loans recorded the highest number of defaults. This indicates that unsecured lending products may carry a greater risk profile compared to other loan categories. The finding highlights the importance of strengthening credit assessment procedures for applicants seeking personal loans.

### 3. Default Risk Is Not Uniform Across Branches

Branch-level analysis revealed that certain branches generated significantly more defaulted loans than others. This suggests differences in lending practices, customer quality, economic conditions, or risk management effectiveness across locations. High-risk branches should be reviewed to identify the underlying causes of poor loan performance.

### 4. Significant Financial Exposure Exists Across the Loan Portfolio

The funds-at-risk analysis showed that a substantial amount of the bank's loan portfolio is exposed to default. While default counts provide insight into borrower behavior, financial exposure highlights the potential monetary impact on the institution. This underscores the importance of proactive risk monitoring and portfolio management.

### 5. A Small Group of Customers Accounts for a Large Share of Risk Exposure

The high-risk customer analysis identified borrowers with substantial outstanding balances and elevated risk profiles. These customers represent a disproportionate share of potential losses and should be prioritized for monitoring and intervention. Early engagement with these borrowers may reduce future defaults and improve recovery outcomes.

---

## Recommendations

### 1. Strengthen Credit Assessment for High-Risk Customer Segments

The bank should incorporate customer risk indicators such as age, employment status, income level, and historical borrowing behavior into its lending decisions. Enhanced screening procedures can help reduce exposure to borrowers with a higher likelihood of default.

### 2. Review and Tighten Personal Loan Approval Policies

Given the elevated default levels observed within personal loans, management should reassess approval criteria for this product. Measures such as stricter income verification, improved affordability assessments, and enhanced credit score requirements may help reduce future losses.

### 3. Conduct Branch-Level Performance Reviews

Branches exhibiting higher default rates should undergo detailed performance evaluations. Management should assess underwriting standards, approval processes, and portfolio quality at these locations to identify opportunities for improvement.

### 4. Implement Continuous Portfolio Risk Monitoring

The bank should establish a structured monitoring framework to track default trends, exposure levels, and emerging risks. Regular reporting and dashboard reviews will enable management to identify risk concentrations before they become significant financial problems.

### 5. Develop an Early Warning System for High-Risk Customers

Customers identified as high risk should be monitored through an early warning framework that tracks missed payments, deteriorating financial conditions, and increasing debt burdens. Proactive intervention strategies can improve repayment outcomes and reduce default losses.

### 6. Improve Risk-Based Lending Practices

Rather than applying uniform lending standards across all borrowers, the bank should adopt a risk-based lending approach. Customers with stronger credit profiles can receive more favorable terms, while higher-risk borrowers may require additional safeguards or closer monitoring.

### 7. Use Data Analytics to Support Strategic Decision-Making

The findings from this analysis demonstrate the value of data-driven decision-making. Management should continue leveraging analytics and dashboard reporting to optimize lending policies, improve portfolio quality, and enhance overall risk management performance.

---


## What I Learned

Through this project, I strengthened my skills in:

* SQL data cleaning
* Joins across multiple tables
* Common Table Expressions (CTEs)
* Subqueries
* Window Functions
* Business-focused data analysis
* Risk analytics
* Dashboard design in Excel
* Communicating insights through data visualization

---

## Conclusion

The analysis identified key customer segments, loan products, and branches contributing to loan default risk. 
It also quantified the bank's financial exposure and highlighted customers requiring closer monitoring. 
These insights can help the bank improve lending policies, strengthen risk controls, and make more informed credit decisions.
