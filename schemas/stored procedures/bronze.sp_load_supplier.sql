/*
===============================================================================
Stored Procedure: Load Bronze Items (ERP -> Bronze )
===============================================================================
Script Purpose:
    This stored procedure loads sys_supplier into the 'bronze' schema from erp database (retail). 

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_supplier;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_supplier AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	
	BEGIN TRY
		SET @start_time = GETDATE()
		PRINT '================================================';
		PRINT 'Loading Bronze Supplier';
		PRINT '================================================';

		PRINT '>> Inserting Data Into: bronze.erp_sys_supplier';

		INSERT INTO h_db.bronze.erp_sys_supplier (
			[supplierno]
           ,[a_name]
           ,[l_name]
           ,[suppliertype]
           ,[country]
           ,[govern]
           ,[city]
           ,[a_address]
           ,[l_address]
           ,[a_mailaddress]
           ,[l_mailaddress]
           ,[postalcode]
           ,[phone1]
           ,[phone2]
           ,[mobil]
           ,[email]
           ,[fax]
           ,[a_manager]
           ,[l_manager]
           ,[comm_record]
           ,[tax_file_no]
           ,[taxunit]
           ,[tax_status]
           ,[trademark]
           ,[bank]
           ,[customerno]
           ,[creditlimit]
           ,[ledger]
           ,[status]
           ,[status_date]
           ,[userid]
           ,[transtype]
           ,[transdate]
           ,[collection]
           ,[subledger]
           ,[delivery]
           ,[tax_end_date]
           ,[payment_type]
           ,[delivery_over]
           ,[update_price]
           ,[multi_delivery]
           ,[entry_date]
           ,[Create_account_entry]
           ,[Createdby]
           ,[Createddate]
           ,[Isdraft]
           ,[Modified_date]
           ,[Tax_registeration_no]
           ,[Payment_period]
           ,[Tax_exemption_amount]
           ,[Beneficiary]
           ,[Isloaded]
           ,[Invoice_due_date_method]
           ,[DuedayOfWeek]
           ,[DuedayOfWeekName]
           ,[Reserved1]
           ,[Reserved2]
           ,[Reserved3]
           ,[Reserved4]
           ,[Reserved5]
           ,[Reserved6]
           ,[Reserved7]
           ,[Reserved8]
           ,[Reserved9]
		)
		SELECT	
			[supplierno]
           ,[a_name]
           ,[l_name]
           ,[suppliertype]
           ,[country]
           ,[govern]
           ,[city]
           ,[a_address]
           ,[l_address]
           ,[a_mailaddress]
           ,[l_mailaddress]
           ,[postalcode]
           ,[phone1]
           ,[phone2]
           ,[mobil]
           ,[email]
           ,[fax]
           ,[a_manager]
           ,[l_manager]
           ,[comm_record]
           ,[tax_file_no]
           ,[taxunit]
           ,[tax_status]
           ,[trademark]
           ,[bank]
           ,[customerno]
           ,[creditlimit]
           ,[ledger]
           ,[status]
           ,[status_date]
           ,[userid]
           ,[transtype]
           ,[transdate]
           ,[collection]
           ,[subledger]
           ,[delivery]
           ,[tax_end_date]
           ,[payment_type]
           ,[delivery_over]
           ,[update_price]
           ,[multi_delivery]
           ,[entry_date]
           ,[Create_account_entry]
           ,[Createdby]
           ,[Createddate]
           ,[Isdraft]
           ,[Modified_date]
           ,[Tax_registeration_no]
           ,[Payment_period]
           ,[Tax_exemption_amount]
           ,[Beneficiary]
           ,[Isloaded]
           ,[Invoice_due_date_method]
           ,[DuedayOfWeek]
           ,[DuedayOfWeekName]
           ,[Reserved1]
           ,[Reserved2]
           ,[Reserved3]
           ,[Reserved4]
           ,[Reserved5]
           ,[Reserved6]
           ,[Reserved7]
           ,[Reserved8]
           ,[Reserved9]
		FROM Retail.dbo.sys_supplier

		SET @end_time = GETDATE()
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'

	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE SUPPLIER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END