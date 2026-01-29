/*
===============================================================================
Stored Procedure: Load GOLD Items 
===============================================================================

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC gold.load_items;
===============================================================================
*/

CREATE OR ALTER PROCEDURE gold.load_items AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	
	BEGIN TRY
		SET @start_time = GETDATE()
		PRINT '================================================';
		PRINT 'Loading gold items';
		PRINT '================================================';

		INSERT INTO h_db.gold.dim_item (
			itemean,
			arabic_name,
			latin_name,
			sub_group,
			supplier
		)
		
		SELECT	
			itemean,
			arabic_name,
			latin_name,
			sub_group,
			supplier
		FROM h_db.silver.erp_sys_item

		SET @end_time = GETDATE()
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'

	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING GOLD ITEMS'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END