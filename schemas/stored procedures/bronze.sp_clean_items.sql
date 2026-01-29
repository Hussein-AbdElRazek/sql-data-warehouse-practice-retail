/*
===============================================================================
Stored Procedure: Clean Items in Bronze Layer 
===============================================================================
Script Purpose:
    This stored procedure truncate bronze.erp_sys_item. 


Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.sp_clean_items;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.sp_clean_items AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	
	BEGIN TRY
		PRINT '>> Truncating Table: bronze.erp_sys_item';
		TRUNCATE TABLE bronze.erp_sys_item;
		PRINT '>> Truncated "bronze.erp_sys_item" completed successfully.' 
	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING TRUNCATING BRONZE ITEMS'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END