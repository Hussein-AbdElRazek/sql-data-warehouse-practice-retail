/*
===============================================================================
DDL Script: Create Bronze Table (erp_sys_doctype)
===============================================================================
Script Purpose:
    This script creates erp_sys_doctype table in the 'bronze' schema.
===============================================================================
*/


USE h_db
GO

CREATE TABLE bronze.erp_sys_doctype
(
    [systemcode] [SMALLINT] NOT NULL,
	[transtype] [SMALLINT] NOT NULL,
	[doctype] [SMALLINT] NOT NULL,
	[a_name] [VARCHAR](50) NULL,
	[l_name] [VARCHAR](50) NULL,
	[document] [VARCHAR](20) NULL,
	[site_serial] [SMALLINT] NULL,
	[manual_serial] [SMALLINT] NULL,
	[period] [SMALLINT] NULL,
	[program_name] [VARCHAR](50) NULL,
	[program_type] [VARCHAR](10) NULL,
	[nature] [SMALLINT] NULL,
	[doc_group] [SMALLINT] NULL,
	[usage] [SMALLINT] NULL,
	[transdate] [SMALLDATETIME] NULL,
	[status] [SMALLINT] NULL,
	[currency] [SMALLINT] NULL,
	CONSTRAINT [pk_sys_doctype] PRIMARY KEY NONCLUSTERED 
	(
		[systemcode] ASC,
		[transtype] ASC,
		[doctype] ASC
	)
)
