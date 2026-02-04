/*
===============================================================================
Stored Procedure: Load Silver doctype (Bronze -> Silver)
===============================================================================
Script Purpose:
	This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema doctype from the 'bronze' schema.
	Actions Performed:
		- Inserts transformed and cleaned doctype from Bronze into Silver doctype table.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC silver.load_doctype;
===============================================================================
*/

CREATE OR ALTER PROCEDURE silver.load_doctype AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	
	BEGIN TRY
		SET @start_time = GETDATE()
		PRINT '================================================';
		PRINT 'Loading silver doctype';
		PRINT '================================================';

		INSERT INTO h_db.silver.erp_sys_doctype
		SELECT DISTINCT
			doctype,
			ISNULL(TRIM(a_name), 'N/A'),
			ISNULL(TRIM(l_name), 'N/A')
		FROM h_db.bronze.erp_sys_doctype
		where
			systemcode IN (10) --and usage = 1-- sales

		INSERT INTO h_db.silver.erp_sys_doctype
		SELECT DISTINCT
			doctype,
			ISNULL(TRIM(a_name), 'N/A'),
			ISNULL(TRIM(l_name), 'N/A')
		FROM h_db.bronze.erp_sys_doctype
		WHERE
			systemcode IN (2) AND usage = 1 -- stock
			AND doctype NOT IN (SELECT doctype FROM h_db.silver.erp_sys_doctype)

		SET @end_time = GETDATE()
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'

	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING SILVER doctype'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END