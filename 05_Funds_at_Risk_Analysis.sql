/*

BUSINESS Q4: How much money is exposed due to loan defaults ?


-- INSIGHT:
    Total amount at risk: NGN 11,558,983,918 (From loan defaults)
    Total loan defaults: 2,239
    Loan default percentage stands at 14.93%

-- RECOMMENDATIONS:
    1. Though loan default percentage is less than 15% and within a safe
    percentage rate, the amount at risk due to loan defaults is large
    and this represent significant exposure - Prioritize recovery efforts
    2. Consider increasing loan loss reserves 
    3. Strengthen underwriting criteria for high-risk segments
    

*/


SELECT 
    COUNT(loan_status) AS TOTAL_DEFAULTED_LOANS,
    SUM(loan_amount_rounded) AS LOAN_AMOUNT_AT_RISK,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM loans), 2) AS LOAN_DEFAULT_PERCENTAGE 

FROM loans

WHERE loan_status = 'Defaulted'