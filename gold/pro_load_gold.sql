/*
===============================================================================
Stored Procedure: Load Gold Layer (Silver -> Gold)
===============================================================================
Script Purpose:
	This stored procedure send data from silver to gold 
	Actions Performed:
		- Truncates Gold tables.
		- Inserts data from Silver into Gold tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC gold.load_gold;
===============================================================================
*/

CREATE OR ALTER PROCEDURE gold.load_gold AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	
	BEGIN TRY
		SET @start_time = GETDATE()
		PRINT '================================================';
		PRINT 'Loading gold Layer';
		PRINT '================================================';

		PRINT '>> Truncating Table: gold.dim_item';
		TRUNCATE TABLE gold.dim_item;
		PRINT '>> Inserting Data Into: gold.dim_item';

		INSERT INTO h_db.gold.dim_item (
			itemean,
			arabic_name,
			latin_name,
			sub_group,
			supplier,
			last_update
		)
		
		SELECT	
			itemean,
			a_name AS arabic_name,
			l_name AS latin_name,
			department AS sub_group,
			producerno AS supplier,
			DateModified AS last_update
		FROM h_db.silver.erp_sys_item		

		SET @end_time = GETDATE()
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'

	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING GOLD LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END
