/*
===============================================================================
Stored Procedure: Load GOLD supplier 
===============================================================================

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC gold.load_supplier;
===============================================================================
*/

CREATE OR ALTER PROCEDURE gold.load_supplier AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	
	BEGIN TRY
		SET @start_time = GETDATE()
		PRINT '================================================';
		PRINT 'Loading gold supplier';
		PRINT '================================================';

		INSERT INTO h_db.gold.dim_supplier (
			supplier,
    			arabic_name,
    			latin_name
		)
		
		SELECT	
			supplier,
    			arabic_name,
    			latin_name
		FROM h_db.silver.erp_sys_supplier

		SET @end_time = GETDATE()
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'

	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING GOLD SUPPLIER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END