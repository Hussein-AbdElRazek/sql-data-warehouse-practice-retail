/*
===============================================================================
DDL Script: Create Gold Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'gold' schema, dropping existing tables 
    if they already exist.
	Run this script to re-define the DDL structure of 'gold' Tables
===============================================================================
*/


USE h_db
GO

IF OBJECT_ID('gold.dim_item', 'U') IS NOT NULL
    DROP TABLE gold.dim_item;
GO

CREATE TABLE gold.dim_item
(
    itemean CHAR(13) PRIMARY KEY CLUSTERED (itemean ASC),
    arabic_name VARCHAR(50),
    latin_name VARCHAR(50),
    sub_group SMALLINT,
    supplier INT,
    last_update DATETIME,

    -- 🔧 gold technical columns
    gold_load_datetime DATETIME DEFAULT GETDATE()
);
