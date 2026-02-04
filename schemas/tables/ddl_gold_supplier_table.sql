/*
===============================================================================
DDL Script: Create gold.dim_supplier Table
===============================================================================
Script Purpose:
    This script creates dim_supplier table in the 'gold' schema.
===============================================================================
*/


USE h_db
GO


CREATE TABLE gold.dim_supplier
(
    supplier INT  NOT NULL,
    arabic_name VARCHAR(50) NOT NULL,
    latin_name VARCHAR(50) NOT NULL,
	last_update DATETIME DEFAULT(GETDATE()) NOT NULL,
	CONSTRAINT [pk_erp_sys_supplier] PRIMARY KEY NONCLUSTERED (supplier ASC)
);
