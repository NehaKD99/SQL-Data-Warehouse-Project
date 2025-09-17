/*
=============================================================
Create Database and Schemas
=============================================================
Purpose:
    This script creates a new database called 'DataWarehouse'. 
    If the database is already there, it will be deleted first 
    and then created again. 
    
    After that, it will create three schemas inside the database: 
    'bronze', 'silver', and 'gold'.

Note:
    Running this script will remove the 'DataWarehouse' database 
    if it already exists. All the data will be lost forever. 
    Please make sure you have backups before using this script.
*/

USE master;
GO

-- If 'DataWarehouse' exists, drop it and create a new one
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create fresh 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Add Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
