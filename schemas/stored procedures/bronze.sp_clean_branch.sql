/*
===============================================================================
Stored Procedure: Clean Branch in Bronze Layer 
===============================================================================
Script Purpose:
    This stored procedure truncate bronze.erp_sys_branch. 


Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.sp_clean_branch;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.sp_clean_branch AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	
	BEGIN TRY
		PRINT '>> Truncating Table: bronze.erp_sys_branch';

		TRUNCATE TABLE bronze.erp_sys_branch;

		PRINT '>> Truncated "bronze.erp_sys_branch" completed successfully.' 
	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING TRUNCATING BRONZE branch'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END