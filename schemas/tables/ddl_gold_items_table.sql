/*
===============================================================================
DDL Script: Create gold.dim_item Table
===============================================================================
Script Purpose:
    This script creates tables in the 'gold' schema.
===============================================================================
*/


USE h_db
GO


CREATE TABLE gold.dim_item
(
    itemean CHAR(13) PRIMARY KEY CLUSTERED (itemean ASC) NOT NULL,
    arabic_name VARCHAR(50) NOT NULL,
    latin_name VARCHAR(50) NOT NULL,
    sub_group SMALLINT NOT NULL,
    supplier INT NOT NULL,
	last_update DATETIME DEFAULT(GETDATE()) NOT NULL
);
