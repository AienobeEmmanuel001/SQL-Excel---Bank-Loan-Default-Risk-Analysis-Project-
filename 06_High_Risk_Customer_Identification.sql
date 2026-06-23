/*
 -- BUSINESS Q5: What are the list of customers to be monitored (Loan Defaulters) ?


-- INSIGHTS:
    1. 1,790 customers have defaulted on loans 
    2. Top Defaulters: 3 customers with customer_id 640, 852 & 3773
        are the top 3 defaulters with 4 defaults each from various loan products. 
        Also customer_id 1838, 1914 & 3773 are the top 3 customers with the highest total
        debt amount owed.
    3. Many customers have multiple loan types (Personal loan + Mortgage + Auto loan)
        as wells multiple loans of the same type (Personal loan + Personal loan)


-- RECOMMENDATIONS:
    1. Initiate collateral seizure for 3+ loans defaults
    2. Reduce credit limits for customers with 2+ loan defaults
    3. Monitor all 1,790 defaulters monthly.


*/



SELECT customers.customer_id, customers.full_name, 
        age, employment_status, 
        STRING_AGG(Loan_type_cleaned, ', ') AS LOAN_TYPE,
        COUNT(loan_status) AS DEFAULTED_LOANS_COUNT,
        SUM(Loan_amount_rounded) AS TOTAL_DEBT_OWED

FROM customers

LEFT JOIN loans
ON customers.customer_id = loans.customer_id

WHERE loan_status = 'Defaulted'

GROUP BY customers.customer_id, customers.full_name

ORDER BY TOTAL_DEBT_OWED DESC
LIMIT 10
