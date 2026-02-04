/*
===============================================================================
Stored Procedure: Clean Branch in Silver Layer 
===============================================================================
Script Purpose:
    This stored procedure truncate silver.erp_sys_branch. 


Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC silver.sp_clean_branch;
===============================================================================
*/

CREATE OR ALTER PROCEDURE silver.sp_clean_branch AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	
	BEGIN TRY
		PRINT '>> Truncating Table: silver.erp_sys_branch';

		TRUNCATE TABLE silver.erp_sys_branch;

		PRINT '>> Truncated "silver.erp_sys_branch" completed successfully.' 
	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING TRUNCATING silver branch'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END