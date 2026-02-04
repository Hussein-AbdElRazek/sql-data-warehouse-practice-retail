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

		MERGE gold.dim_item AS target
		USING silver.erp_sys_item AS source
		ON target.itemean = source.itemean
		WHEN MATCHED
			AND 
				target.arabic_name != source.arabic_name OR
				target.latin_name != source.latin_name OR
				target.sub_group != source.sub_group OR
				target.supplier != source.supplier 
			THEN
				UPDATE SET
					target.arabic_name = source.arabic_name,
					target.latin_name = source.latin_name,
					target.sub_group = source.sub_group,
					target.supplier = source.supplier
					target.last_update = GETDATE()
		WHEN NOT MATCHED BY target 
			THEN
				INSERT(
					itemean,
					arabic_name,
					latin_name,
					sub_group,
					supplier,
					last_update
				)
				VALUES(
					source.branch,
					source.arabic_name,
					source.latin_name,
					source.sub_group,
					source.supplier,
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
		PRINT 'ERROR OCCURED DURING LOADING GOLD ITEMS'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END