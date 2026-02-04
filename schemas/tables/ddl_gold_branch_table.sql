/*
===============================================================================
DDL Script: Create gold.dim_branch Table
===============================================================================
Script Purpose:
    This script creates dim_branch table in the 'gold' schema.
===============================================================================
*/


USE h_db
GO


CREATE TABLE gold.dim_branch
(
        branch INT NOT NULL,
	arabic_name CHAR(50) NOT NULL,
	latin_name CHAR(50) NOT NULL,
	branchtype SMALLINT NOT NULL,
	last_update DATETIME DEFAULT(GETDATE()) NOT NULL,
	CONSTRAINT [pk_sys_branch_xx] PRIMARY KEY NONCLUSTERED (branch ASC)
);
