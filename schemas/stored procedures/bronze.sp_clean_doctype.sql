/*
===============================================================================
Stored Procedure: Clean doctype in Bronze Layer 
===============================================================================
Script Purpose:
    This stored procedure truncate bronze.erp_sys_doctype. 


Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.sp_clean_doctype;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.sp_clean_doctype AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	
	BEGIN TRY
		PRINT '>> Truncating Table: bronze.erp_sys_doctype';
		
		TRUNCATE TABLE bronze.erp_sys_doctype;
		
		PRINT '>> Truncated "bronze.erp_sys_doctype" completed successfully.' 
	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING TRUNCATING BRONZE doctype'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END