/*
CREATE DDL(Data Definition Language) SCRIPT: BRONZE LAYER

script purpose: To create tables in the bronze schema, and drop existing tables if they already exist.

warning: This script re-defines the DDL structure of the 'bronze' tables
*/

-- table: crm_cust_info
IF OBJECT_ID ('bronze.crm_cust_info', 'U') IS NOT NULL -- dropping the table if it already exists
	DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info ( -- defining the columns and data types
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);
GO

-- table: crm_prd_info
IF OBJECT_ID ('bronze.crm_prd_info', 'U') IS NOT NULL -- dropping the table if it already exists
	DROP TABLE bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info ( -- defining the columns and data types
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
);
GO

-- table: crm_sales_details
IF OBJECT_ID ('bronze.crm_sales_details', 'U') IS NOT NULL -- dropping the table if it already exists
	DROP TABLE bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details ( -- defining the columns and data types
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);
GO

-- table: erp_cust_az12
IF OBJECT_ID ('bronze.erp_cust_az12', 'U') IS NOT NULL -- dropping the table if it already exists
	DROP TABLE bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12 ( -- defining the columns and data types
	cid NVARCHAR(50),
	bdate DATE,
	gen NVARCHAR(50)
);
GO

-- table: erp_loc_a101
IF OBJECT_ID ('bronze.erp_loc_a101', 'U') IS NOT NULL -- dropping the table if it already exists
	DROP TABLE bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101 ( -- defining the columns and data types
	cid NVARCHAR(50),
	cntry NVARCHAR(50)
);
GO

-- table: erp_px_cat_g1v2
IF OBJECT_ID ('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL -- dropping the table if it already exists
	DROP TABLE bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2 ( -- defining the columns and data types
	id VARCHAR(50),
	cat VARCHAR(50),
	subcat VARCHAR(50),
	maintenance VARCHAR(50)
);
GO
