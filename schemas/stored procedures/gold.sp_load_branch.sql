/*
===============================================================================
Stored Procedure: Load GOLD branch 
===============================================================================

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC gold.load_branch;
===============================================================================
*/

CREATE OR ALTER PROCEDURE gold.load_branch AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	
	BEGIN TRY
		SET @start_time = GETDATE()
		PRINT '================================================';
		PRINT 'Loading gold branch';
		PRINT '================================================';

		MERGE gold.dim_branch AS target 
		USING silver.erp_sys_branch AS source
		ON
			target.branch = source.branch
		WHEN MATCHED
			AND 
				target.arabic_name != source.arabic_name OR
				target.latin_name != source.latin_name OR
				target.branchtype != source.branchtype 
			THEN 
				UPDATE SET
					target.arabic_name = source.arabic_name,
					target.latin_name = source.latin_name,
					target.branchtype = source.branchtype,
					target.last_update = GETDATE()

		WHEN NOT MATCHED BY target 
			THEN
				INSERT(
					branch,
					arabic_name,
					latin_name,
					branchtype,
					last_update
				)
				VALUES(
					source.branch,
					source.arabic_name,
					source.latin_name,
					source.branchtype,
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
		PRINT 'ERROR OCCURED DURING LOADING GOLD branch'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END