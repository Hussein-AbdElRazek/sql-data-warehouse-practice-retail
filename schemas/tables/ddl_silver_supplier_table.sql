/*
===============================================================================
DDL Script: Create erp_sys_supplier Silver Table
===============================================================================
Script Purpose:
    This script creates erp_sys_supplier table in the 'silver' schema.
===============================================================================
*/


USE h_db
GO

CREATE TABLE silver.erp_sys_supplier
(
    supplier INT  NOT NULL,
    arabic_name VARCHAR(50) NOT NULL,
    latin_name VARCHAR(50) NOT NULL,
CONSTRAINT [pk_erp_sys_supplier] PRIMARY KEY NONCLUSTERED ([supplierno] ASC)
);
