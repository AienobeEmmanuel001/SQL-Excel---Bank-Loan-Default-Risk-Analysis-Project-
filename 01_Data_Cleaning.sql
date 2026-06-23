-- DATA CLEANING - ALL TABLES

-- TABLE: customers 
-- Created a new column called gender_cleaned to clean errors in gender column.
-- Standardized 'F' to 'Female', 'M' to 'Male', 'male' to 'Male', and 'female' to 'Female'.
-- Created a new column and merged first_name & last_name columns together using CONCAT().
-- Created a new column and rounded the annual income column to whole numbers using ROUND ().
-- Made use of ALTER TABLE, ADD COLUMN, UPDATE & CASE.


ALTER TABLE customers
ADD COLUMN gender_cleaned VARCHAR (20);

UPDATE customers
    SET gender_cleaned = CASE
        WHEN gender = 'F' THEN 'Female'
        WHEN gender = 'M' THEN 'Male'
        WHEN gender = 'male' THEN 'Male'
        WHEN gender = 'female' THEN 'Female'
      ELSE gender
    END
FROM customers



ALTER TABLE customers
ADD COLUMN Full_name VARCHAR (100);

UPDATE customers
SET Full_name = CONCAT (first_name, ' ', last_name);




ALTER TABLE customers
ADD COLUMN Annual_income_rounded INTEGER;

UPDATE customers
SET Annual_income_rounded = ROUND(annual_income, 0)




SELECT customer_id, first_name, last_name, Full_name, 
        gender_cleaned, age, marital_status, employment_status, 
        Annual_income_rounded, annual_income,
        city, customer_since, credit_score

FROM customers






-- TABLE: loans
-- Created new columns and rounded the loan_amount & monthly_installment column to whole numbers using ROUND ().
-- Created a new column and capitalized the first letter of each word in the Loan_type column using INITCAP.

/* I noticed the monhly installments didn't match simple interest calculations.
    After inveestigation, i confirmed these are correct amortization calculations 
    used by banks. I documented this findings rather than altering the data,
    because changing it would introduce errors */

ALTER TABLE loans
ADD COLUMN Loan_type_cleaned VARCHAR(20); 

UPDATE loans
SET Loan_type_cleaned = INITCAP(Loan_Type)


ALTER TABLE loans
ADD COLUMN Loan_amount_rounded INTEGER;

UPDATE loans
SET Loan_amount_rounded =  ROUND(loan_amount, 0) 


ALTER TABLE loans
ADD COLUMN Monthly_installment_rounded INTEGER;

UPDATE loans
SET Monthly_installment_rounded = ROUND(monthly_installment, 0)




SELECT loan_id, customer_id, branch_id, Loan_type_cleaned, loan_amount, 
        Loan_amount_rounded, interest_rate, loan_term_months, 
        loan_issue_date, Monthly_installment_rounded, monthly_installment,
        loan_status

FROM loans




-- TABLE: branches
-- Nothing was cleaned as data was in the right condition for analysis

SELECT branch_id, branch_name, city, region, manager_name

FROM branches
