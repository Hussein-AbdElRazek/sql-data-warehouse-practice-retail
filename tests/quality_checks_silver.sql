/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs various quality checks for data consistency, accuracy, 
    and standardization across the 'silver' layer. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid dates.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/

-- ====================================================================
-- Checking 'silver.erp_sys_item'
-- ====================================================================


-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Results

SELECT itemean, COUNT(*) FROM silver.erp_sys_item
GROUP BY itemean
HAVING itemean IS NULL OR COUNT(*) > 1


-- Check for NULLs in Subgroup
-- Expectation: No Results

SELECT department, COUNT(*) FROM silver.erp_sys_item
GROUP BY department
HAVING department IS NULL 

-- Check for invalid dates
-- Expectation: No Results

SELECT DateModified FROM silver.erp_sys_item
WHERE DateModified IS NULL OR DateModified > GETDATE()
