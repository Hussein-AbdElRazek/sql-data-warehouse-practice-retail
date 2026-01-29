/*
===============================================================================
DDL Script: Create erp_sys_item Silver Table
===============================================================================
Script Purpose:
    This script creates erp_sys_item table in the 'silver' schema.
===============================================================================
*/


USE h_db
GO

CREATE TABLE silver.erp_sys_item
(
    itemean CHAR(13) PRIMARY KEY CLUSTERED (itemean ASC) NOT NULL,
    arabic_name VARCHAR(50) NOT NULL,
    latin_name VARCHAR(50) NOT NULL,
    sub_group SMALLINT NOT NULL,
    supplier INT NOT NULL,
);
