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
		
		MERGE gold.dim_supplier AS target
		USING silver.erp_sys_supplier AS source
		ON target.supplier = source.supplier
		WHEN MATCHED
			AND
				target.arabic_name != source.arabic_name OR
				target.latin_name != source.latin_name OR
			THEN
				UPDATE SET
					target.arabic_name = source.arabic_name,
					target.latin_name = source.latin_name,
					target.last_update = GETDATE()
		WHEN NOT MATCHED BY target
			THEN
				INSERT(
					arabic_name,
					latin_name,
					last_update
				)
				VALUES(
					source.arabic_name,
					source.latin_name,
					GETDATE()
				)
		WHEN NOT MATCHED BY source
			THEN
				DELETE;

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