/*
-- BUSIESS Q3: What branches generated the most highest risk loans 
            (Loans Defaulted) ? 


-- INSIGHTS:
-- 1. Branch_18 & Branch_40 have the highest loan defaults with 61 each
        and each branch having over ₦300M of funds at risk due to loan 
        defaults by customers 
-- 2. All top 10 branches have 50+ loan defaults - risk is spread

-- RECOMENDATION:
-- 1. Audit all top 10 branches which issued the most high risk loans -
    investigate loan approval process
-- 2. Review staff training: ensure consistent underwriting across 
    all branhches
-- Monitor top 10 branches monthly for early warning signs.

*/



WITH RISKIEST_LOANS AS(

SELECT *
FROM loans

WHERE loan_status = 'Defaulted'
)

SELECT branch_name, COUNT(loan_status) AS TOTAL_LOAN_DEFAULTS, 
    SUM(loan_amount_rounded) AS FUNDS_AT_RISK_BY_BRANCH
FROM branches

JOIN RISKIEST_LOANS
ON branches.branch_id = RISKIEST_LOANS.branch_id

GROUP BY branch_name
ORDER BY FUNDS_AT_RISK_BY_BRANCH DESC
LIMIT 10



