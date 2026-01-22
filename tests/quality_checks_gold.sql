/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs various quality checks for data consistency, accuracy, 
    and standardization across the 'gold' layer. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid dates.

Usage Notes:
    - Run these checks after data loading Gold Layer.
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/

-- ====================================================================
-- Checking 'gold.dim_item'
-- ====================================================================


-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Results

SELECT itemean, COUNT(*) FROM gold.dim_item
GROUP BY itemean
HAVING itemean IS NULL OR COUNT(*) > 1


-- Check for NULLs in Subgroup
-- Expectation: No Results

SELECT sub_group, COUNT(*) FROM gold.dim_item
GROUP BY sub_group
HAVING sub_group IS NULL 

-- Check for invalid dates
-- Expectation: No Results

SELECT last_update FROM gold.dim_item
WHERE last_update IS NULL OR last_update > GETDATE()
