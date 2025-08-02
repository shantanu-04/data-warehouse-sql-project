/*
CREATE DATABASE AND SCHEMAS

script purpose: To create a database named 'DataWarehouse' and three schemas within it named 'bronze', 'silver' and 'gold' respectively.

warning: This scripts drops and recreates the database. Re-running will permanently delete all the data stored in an existing database and recreate it.
*/

USE master;
GO

-- drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE NAME = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

-- create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO
USE DataWarehouse;
GO

-- create schemas 'bronze', 'silver' and 'gold'
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
