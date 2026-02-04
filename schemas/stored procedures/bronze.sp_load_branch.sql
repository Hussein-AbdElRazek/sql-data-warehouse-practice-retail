/*
===============================================================================
Stored Procedure: Load Bronze Branch (ERP -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads erp_sys_branch into the 'bronze' schema from erp database (retail). 

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_branch;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_branch AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	
	BEGIN TRY
		SET @start_time = GETDATE()
		PRINT '================================================';
		PRINT 'Loading Bronze branch';
		PRINT '================================================';

		PRINT '>> Inserting Data Into: bronze.erp_sys_branch';

		INSERT INTO h_db.bronze.erp_sys_branch (
			[company]
           ,[sector]
           ,[region]
           ,[branch]
           ,[branchtype]
           ,[activity]
           ,[a_name]
           ,[l_name]
           ,[country]
           ,[govern]
           ,[a_address]
           ,[l_address]
           ,[a_manager]
           ,[l_manager]
           ,[comm_no]
           ,[tax_file_no]
           ,[taxunit]
           ,[tax_status]
           ,[phone1]
           ,[phone2]
           ,[fax]
           ,[email]
           ,[area]
           ,[ownership]
           ,[a_ownername]
           ,[l_ownername]
           ,[rental_value]
           ,[rental_date]
           ,[storage_area]
           ,[license_date]
           ,[status]
           ,[me]
           ,[branch_weight]
           ,[waves_no]
           ,[store_class]
           ,[warehouse]
           ,[openning]
           ,[transdate]
           ,[mobile]
           ,[heirarchy]
           ,[p_sector]
           ,[tax_status_date]
           ,[last_modified_time])
		SELECT	
			[company]
           ,[sector]
           ,[region]
           ,[branch]
           ,[branchtype]
           ,[activity]
           ,[a_name]
           ,[l_name]
           ,[country]
           ,[govern]
           ,[a_address]
           ,[l_address]
           ,[a_manager]
           ,[l_manager]
           ,[comm_no]
           ,[tax_file_no]
           ,[taxunit]
           ,[tax_status]
           ,[phone1]
           ,[phone2]
           ,[fax]
           ,[email]
           ,[area]
           ,[ownership]
           ,[a_ownername]
           ,[l_ownername]
           ,[rental_value]
           ,[rental_date]
           ,[storage_area]
           ,[license_date]
           ,[status]
           ,[me]
           ,[branch_weight]
           ,[waves_no]
           ,[store_class]
           ,[warehouse]
           ,[openning]
           ,[transdate]
           ,[mobile]
           ,[heirarchy]
           ,[p_sector]
           ,[tax_status_date]
           ,[last_modified_time]
		FROM Retail.dbo.sys_branch

		SET @end_time = GETDATE()
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'

	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE branch'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END