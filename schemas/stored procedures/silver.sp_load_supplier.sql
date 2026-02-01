/*
===============================================================================
Stored Procedure: Load Silver Supplier (Bronze -> Silver)
===============================================================================
Script Purpose:
	This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema items from the 'bronze' schema.
	Actions Performed:
		- Inserts transformed and cleaned items from Bronze into Silver Supplier table.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC silver.load_supplier;
===============================================================================
*/

CREATE OR ALTER PROCEDURE silver.load_supplier AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	
	BEGIN TRY
		SET @start_time = GETDATE()
		PRINT '================================================';
		PRINT 'Loading silver supplier';
		PRINT '================================================';

		INSERT INTO h_db.silver.erp_sys_supplier (
			supplier,
    			arabic_name,
    			latin_name
		)
		SELECT	
			supplierno,
			ISNULL(TRIM(a_name), 'N/A'),
			ISNULL(TRIM(l_name), 'N/A')
		FROM h_db.bronze.erp_sys_supplier

		SET @end_time = GETDATE()
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'

	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING SILVER SUPPLIER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END