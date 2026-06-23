/*
-- BUSINESS Q2: Which loan products are the riskiest ?


-- INSIGHT:
-- Personal Loans have the highest defualts (1,323),
    more than Mortgage and Auto Loans combined.

    RECOMMENDATIONS:
-- 1. Review Personal Loan Underwriting criteria
-- 2. Consider Lowering LIV (LOAN TO VALUE) ratios for this product
-- 3. Auto Loans & Mortgage are medium risk,
    current policy can be maintained.


*/


SELECT loan_type_cleaned, COUNT(loan_status) AS LOAN_STATUS
FROM loans

WHERE loan_status = 'Defaulted'

GROUP BY loan_type_cleaned
ORDER BY LOAN_STATUS DESC




