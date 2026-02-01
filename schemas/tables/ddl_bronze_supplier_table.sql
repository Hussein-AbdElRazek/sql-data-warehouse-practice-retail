/*
===============================================================================
DDL Script: Create Bronze Table (erp_sys_supplier)
===============================================================================
Script Purpose:
    This script creates erp_sys_supplier table in the 'bronze' schema.
===============================================================================
*/


USE h_db
GO

CREATE TABLE bronze.erp_sys_supplier
(
    [supplierno] [int] NOT NULL,
	[a_name] [varchar](50) NOT NULL,
	[l_name] [varchar](50) NULL,
	[suppliertype] [smallint] NULL,
	[country] [smallint] NULL,
	[govern] [smallint] NULL,
	[city] [smallint] NULL,
	[a_address] [varchar](50) NULL,
	[l_address] [varchar](50) NULL,
	[a_mailaddress] [varchar](60) NULL,
	[l_mailaddress] [varchar](60) NULL,
	[postalcode] [varchar](15) NULL,
	[phone1] [varchar](15) NULL,
	[phone2] [varchar](15) NULL,
	[mobil] [varchar](12) NULL,
	[email] [varchar](50) NULL,
	[fax] [varchar](15) NULL,
	[a_manager] [varchar](50) NULL,
	[l_manager] [varchar](50) NULL,
	[comm_record] [varchar](20) NULL,
	[tax_file_no] [varchar](20) NULL,
	[taxunit] [smallint] NULL,
	[tax_status] [smallint] NULL,
	[trademark] [varchar](30) NULL,
	[bank] [int] NULL,
	[customerno] [int] NULL,
	[creditlimit] [decimal](12, 2) NULL,
	[ledger] [char](7) NULL,
	[status] [smallint] NULL,
	[status_date] [smalldatetime] NULL,
	[userid] [int] NULL,
	[transtype] [smallint] NULL,
	[transdate] [smalldatetime] NULL,
	[collection] [smallint] NULL,
	[subledger] [int] NULL,
	[delivery] [smallint] NULL,
	[tax_end_date] [smalldatetime] NULL,
	[payment_type] [smallint] NULL,
	[delivery_over] [smallint] NULL,
	[update_price] [smallint] NULL,
	[multi_delivery] [smallint] NULL,
	[entry_date] [datetime] NULL,
	[Create_account_entry] [smallint] NULL,
	[Createdby] [int] NULL,
	[Createddate] [datetime] NULL,
	[Isdraft] [smallint] NULL,
	[Modified_date] [date] NULL,
	[Tax_registeration_no] [varchar](40) NULL,
	[Payment_period] [smallint] NULL,
	[Tax_exemption_amount] [numeric](12, 3) NULL,
	[Beneficiary] [varchar](100) NULL,
	[Isloaded] [smallint] NULL,
	[Invoice_due_date_method] [smallint] NULL,
	[DuedayOfWeek] [smallint] NULL,
	[DuedayOfWeekName] [varchar](50) NULL,
	[Reserved1] [varchar](80) NULL,
	[Reserved2] [varchar](80) NULL,
	[Reserved3] [int] NULL,
	[Reserved4] [numeric](12, 3) NULL,
	[Reserved5] [numeric](12, 3) NULL,
	[Reserved6] [smallint] NULL,
	[Reserved7] [datetime] NULL,
	[Reserved8] [int] NULL,
	[Reserved9] [int] NULL,
    CONSTRAINT [pk_erp_sys_supplier] PRIMARY KEY NONCLUSTERED ([supplierno] ASC)
)
