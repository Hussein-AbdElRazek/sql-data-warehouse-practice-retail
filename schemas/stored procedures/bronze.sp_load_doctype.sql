/*
===============================================================================
Stored Procedure: Load Bronze doctype (ERP -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads sys_doctype into the 'bronze' schema from erp database (retail). 

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_doctype;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_doctype AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	
	BEGIN TRY
		SET @start_time = GETDATE()
		PRINT '================================================';
		PRINT 'Loading Bronze doctype';
		PRINT '================================================';

		PRINT '>> Inserting Data Into: bronze.erp_sys_doctype';

		INSERT INTO h_db.bronze.erp_sys_doctype (
			[systemcode]
           ,[transtype]
           ,[doctype]
           ,[a_name]
           ,[l_name]
           ,[document]
           ,[site_serial]
           ,[manual_serial]
           ,[period]
           ,[program_name]
           ,[program_type]
           ,[nature]
           ,[doc_group]
           ,[usage]
           ,[transdate]
           ,[status]
           ,[currency]
		)
		SELECT	
			[systemcode]
           ,[transtype]
           ,[doctype]
           ,[a_name]
           ,[l_name]
           ,[document]
           ,[site_serial]
           ,[manual_serial]
           ,[period]
           ,[program_name]
           ,[program_type]
           ,[nature]
           ,[doc_group]
           ,[usage]
           ,[transdate]
           ,[status]
           ,[currency]
		FROM Retail.dbo.sys_doctype

		SET @end_time = GETDATE()
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'

	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE doctype'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END