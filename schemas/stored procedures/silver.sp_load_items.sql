/*
===============================================================================
Stored Procedure: Load Silver Items (Bronze -> Silver)
===============================================================================
Script Purpose:
	This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema items from the 'bronze' schema.
	Actions Performed:
		- Inserts transformed and cleaned items from Bronze into Silver tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC silver.load_items;
===============================================================================
*/

CREATE OR ALTER PROCEDURE silver.load_items AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	
	BEGIN TRY
		SET @start_time = GETDATE()
		PRINT '================================================';
		PRINT 'Loading silver items';
		PRINT '================================================';

		INSERT INTO h_db.silver.erp_sys_item (
			itemean,
			arabic_name,
			latin_name,
			sub_group,
			supplier
		)
		SELECT	
			itemean,
			ISNULL(TRIM(a_name), 'N/A')  AS a_name,
			ISNULL(TRIM(l_name), 'N/A') AS l_name,
			department,
			producerno
		FROM h_db.bronze.erp_sys_item

		SET @end_time = GETDATE()
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'

	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING SILVER ITEMS'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END