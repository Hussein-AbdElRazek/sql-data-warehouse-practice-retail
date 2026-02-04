/*
===============================================================================
DDL Script: Create erp_sys_branch Silver Table
===============================================================================
Script Purpose:
    This script creates erp_sys_branch table in the 'silver' schema.
===============================================================================
*/


USE h_db
GO

CREATE TABLE silver.erp_sys_branch
(
    branch INT NOT NULL,
    arabic_name CHAR(50) NOT NULL,
    latin_name CHAR(50) NOT NULL,
       branchtype SMALLINT NOT NULL,
CONSTRAINT [pk_sys_branch_xx] PRIMARY KEY NONCLUSTERED (branch ASC)

);
