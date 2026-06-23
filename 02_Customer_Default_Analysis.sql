--BUSINESS Q1: Which customers default the most ?


/*
-- ANALYSIS 1: EMPLOYMENT STATUS 

--INSIGHT: Employed customers have the highest default percentage (34.84%), 
            followed by Self-Employed customers (32.65%) and Unemployed customers
            (32.51%).

-- RECOMMENDATION: Do not rely on employment status alone for risk assessment.

*/

SELECT employment_status,
        COUNT (*) AS TOTAL_DEFAULTS,
ROUND(100.0 * COUNT(loan_status) / SUM(COUNT(loan_status)) OVER(), 2) AS Defualt_Percentage

FROM Customers

LEFT JOIN loans
ON Customers.customer_id = loans.customer_id

WHERE loan_status = 'Defaulted'

GROUP BY employment_status
ORDER BY Defualt_Percentage DESC




/*
-- ANALYSIS 2: INCOME BAND 

-- INSIGHT: Higher income earners (₦15M+) have the highest default percentage 
            (27.42%). Lower income bands (₦1M - 3M) have the lowest loan defaulters (10.05%).
            This suggests that high earners take larger loans they may struggle to repay.

-- RECOMMENDATION: Scrutinize high income loan applications more closely. Large loan amounts
                    amounts do not guarantee repayment. 

*/

SELECT
    CASE
    WHEN annual_income BETWEEN 1000000 AND 3000000 THEN '₦1M - 3M'
     WHEN annual_income BETWEEN 3000000 AND 5000000 THEN '₦3M - 5M'
      WHEN annual_income BETWEEN 5000000 AND 8000000 THEN '₦5M - 8M'
       WHEN annual_income BETWEEN 8000000 AND 12000000 THEN '₦8M - 12M'
        WHEN annual_income BETWEEN 12000000 AND 15000000 THEN '₦12M - 15M'
    ELSE '₦15M+'
    END AS INCOME_BAND,

COUNT (*) AS TOTAL_DEFAULTS,
ROUND(100.0 * COUNT(loan_status) / SUM(COUNT(loan_status)) OVER(), 2) AS Defualt_Percentage

FROM Customers

LEFT JOIN loans
ON Customers.customer_id = loans.customer_id

WHERE loan_status = 'Defaulted'

GROUP BY INCOME_BAND
ORDER BY Defualt_Percentage DESC




/*
-- ANALYSIS 3: AGE GROUP

-- INSIGHT: Customers aged 40 - 49 have the highest default percentage(21.75), followed by
            30 - 39 (20.90%). Younger customers (20 - 29) have the lowest (17.78).

-- RECOMMENDATION: Middle aged customers (30 - 49) should be monitored closely as they have 
                    the highest default risk.

*/

SELECT
    CASE
    WHEN age BETWEEN 20 AND 29 THEN '20 - 29'
    WHEN age BETWEEN 30 AND 39 THEN '30 - 39'
    WHEN age BETWEEN 40 AND 49 THEN '40 - 49'
    WHEN age BETWEEN 50 AND 59 THEN '50 - 59'
    WHEN age BETWEEN 60 AND 69 THEN '60 - 69'
    ELSE '70+'
    END AS Age_Group,

COUNT (*) AS TOTAL_DEFAULTS,
ROUND(100.0 * COUNT(loan_status) / SUM(COUNT(loan_status)) OVER(), 2) AS Defualt_Percentage

FROM Customers

LEFT JOIN loans
ON Customers.customer_id = loans.customer_id

WHERE loan_status = 'Defaulted'

GROUP BY Age_Group
ORDER BY Defualt_Percentage DESC


/* 

FINAL ACTION: CREATE A RISK SCORING MODEL USING INCOME + AGE + LOAN TYPE 
            TO BETTER PREDICT LOAN DEFAULTS 

*/