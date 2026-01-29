/*
===============================================================================
Stored Procedure: Load Bronze Layer (ERP -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from erp database (retail). 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from erp db (retail) to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	
	BEGIN TRY
		SET @start_time = GETDATE()
		PRINT '================================================';
		PRINT 'Loading Bronze Layer';
		PRINT '================================================';

		PRINT '>> Truncating Table: bronze.erp_sys_item';
		TRUNCATE TABLE bronze.erp_sys_item;
		PRINT '>> Inserting Data Into: bronze.erp_sys_item';

		INSERT INTO h_db.bronze.erp_sys_item (
			itemean,
			itemclass,
			section,
			itemgroup,
			department,
			a_name,
			l_name,
			shortname,
			flavor,
			brand,
			producerno,
			category,
			referenceno,
			color,
			size,
			measure,
			hyper_market,
			class_a,
			home_delivery,
			storeinterval,
			shelfinterval,
			goodstype,
			itemtype,
			profit,
			loss_rate,
			expirycheck,
			class_c,
			range_cal,
			ordered_from,
			zone,
			bin_location,
			class_b,
			status,
			statusdate,
			userid,
			transid,
			pluupd,
			transdate,
			purchase_date,
			whole_sale,
			nationalty,
			big_supermarket,
			module_group,
			module_no,
			basic_item,
			entry_date,
			active,
			price_class,
			transtype,
			item_image,
			sales_tax,
			add_tax,
			Tax_level,
			Season,
			Isdraft,
			IsConsumed,
			Modified_date,
			Isloaded,
			Loadedby,
			Loadeddate,
			IsSalesOnLine,
			AdditionalInfo,
			Notes,
			Isserialized,
			IsMaterial_Internal,
			IsMaterial_Outside,
			IsFinalProduct,
			IstemperatureNeed,
			Internal_manufacturing,
			Outside_manufacturing,
			Material,
			Warranty_Period,
			Warranty_Type,
			Warranty_percentage,
			Over_Rate,
			Item_Unit,
			Item_Piece,
			Item_Put_ReorderQty,
			ItemPartNo,
			ISBN,
			Author,
			Publisher,
			Createdby,
			Reserved1,
			Reserved2,
			Reserved3,
			Reserved4,
			Reserved5,
			Reserved6,
			Reserved7,
			Reserved8,
			Reserved9,
			Reserved10,
			Reserved11,
			Reserved12,
			Reserved13,
			Reserved14,
			Reserved15,
			SourceRowVersion,
			CreatedRowVersion,
			CreatedAt,
			ModifiedAt,
			DateCreated,
			DateModified,
			Data
		)
		SELECT	
			itemean,
			itemclass,
			section,
			itemgroup,
			department,
			a_name,
			l_name,
			shortname,
			flavor,
			brand,
			producerno,
			category,
			referenceno,
			color,
			size,
			measure,
			hyper_market,
			class_a,
			home_delivery,
			storeinterval,
			shelfinterval,
			goodstype,
			itemtype,
			profit,
			loss_rate,
			expirycheck,
			class_c,
			range_cal,
			ordered_from,
			zone,
			bin_location,
			class_b,
			status,
			statusdate,
			userid,
			transid,
			pluupd,
			transdate,
			purchase_date,
			whole_sale,
			nationalty,
			big_supermarket,
			module_group,
			module_no,
			basic_item,
			entry_date,
			active,
			price_class,
			transtype,
			item_image,
			sales_tax,
			add_tax,
			Tax_level,
			Season,
			Isdraft,
			IsConsumed,
			Modified_date,
			Isloaded,
			Loadedby,
			Loadeddate,
			IsSalesOnLine,
			AdditionalInfo,
			Notes,
			Isserialized,
			IsMaterial_Internal,
			IsMaterial_Outside,
			IsFinalProduct,
			IstemperatureNeed,
			Internal_manufacturing,
			Outside_manufacturing,
			Material,
			Warranty_Period,
			Warranty_Type,
			Warranty_percentage,
			Over_Rate,
			Item_Unit,
			Item_Piece,
			Item_Put_ReorderQty,
			ItemPartNo,
			ISBN,
			Author,
			Publisher,
			Createdby,
			Reserved1,
			Reserved2,
			Reserved3,
			Reserved4,
			Reserved5,
			Reserved6,
			Reserved7,
			Reserved8,
			Reserved9,
			Reserved10,
			Reserved11,
			Reserved12,
			Reserved13,
			Reserved14,
			Reserved15,
			SourceRowVersion,
			CreatedRowVersion,
			CreatedAt,
			ModifiedAt,
			DateCreated,
			DateModified,
			Data
		FROM Retail.dbo.sys_item

		SET @end_time = GETDATE()
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'

	END TRY

	BEGIN CATCH
		PRINT '=========================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================='
	END CATCH
END