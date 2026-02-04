/*
===============================================================================
DDL Script: Create erp_sys_doctype Silver Table
===============================================================================
Script Purpose:
    This script creates erp_sys_doctype table in the 'silver' schema.
===============================================================================
*/


USE h_db
GO

CREATE TABLE silver.erp_sys_doctype
(
    doctype SMALLINT NOT NULL,
    arabic_name VARCHAR(50) NOT NULL,
    latin_name VARCHAR(50) NOT NULL,
	CONSTRAINT [pk_sys_doctype] PRIMARY KEY NONCLUSTERED ([doctype] ASC)
);
