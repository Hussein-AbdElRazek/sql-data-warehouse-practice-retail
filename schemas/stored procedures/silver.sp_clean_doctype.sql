/*
===============================================================================
Stored Procedure: Clean doctype in silver Layer 
===============================================================================
Script Purpose:
    This stored procedure truncate silver.erp_sys_doctype. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.


Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC silver.sp_clean_doctype;
===============================================================================
*/

CREATE OR ALTER PROCEDURE silver.sp_clean_doctype AS
BEGIN
	
	BEGIN TRY
		PRINT '>> Truncating Table: silver.erp_sys_doctype';
		
		TRUNCATE TABLE silver.erp_sys_doctype;
		
	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING TRUNCATING SILVER doctype'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END