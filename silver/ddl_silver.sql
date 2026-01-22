/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'silver' Tables
===============================================================================
*/


USE h_db
GO

IF OBJECT_ID('silver.erp_sys_item', 'U') IS NOT NULL
    DROP TABLE silver.erp_sys_item;
GO

CREATE TABLE silver.erp_sys_item
(
    itemean                 CHAR(13),
    a_name                  VARCHAR(50),
    l_name                  VARCHAR(50),
    department              SMALLINT,
    producerno              INT,
    DateModified              DATETIME,
    -- 🔧 Silver technical columns
    silver_load_datetime    DATETIME DEFAULT GETDATE()
);
