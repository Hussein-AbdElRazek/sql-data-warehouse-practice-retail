
/*
===============================================================================
DDL Script: Create gold.dim_documents_types Table
===============================================================================
Script Purpose:
    This script creates dim_documents_types table in the 'gold' schema.
===============================================================================
*/


USE h_db
GO


CREATE TABLE gold.dim_documents_types
(
    doctype SMALLINT NOT NULL,
    arabic_name VARCHAR(50) NOT NULL,
    latin_name VARCHAR(50) NOT NULL,
	last_update DATETIME DEFAULT(GETDATE()) NOT NULL,
	CONSTRAINT [pk_dim_doctype] PRIMARY KEY NONCLUSTERED (doctype ASC)
);
