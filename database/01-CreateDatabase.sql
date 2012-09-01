/*
 * Cross System Reconciliation ETL
 * Project #81 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: SSIS
 * Created: 2014
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'CrossSystemETL')
BEGIN
    ALTER DATABASE CrossSystemETL SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE CrossSystemETL;
END
GO

CREATE DATABASE CrossSystemETL
ON PRIMARY
(
    NAME = 'CrossSystemETL_Data',
    FILENAME = 'C:\SQLData\CrossSystemETL_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'CrossSystemETL_Log',
    FILENAME = 'C:\SQLData\CrossSystemETL_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE CrossSystemETL SET RECOVERY SIMPLE;
ALTER DATABASE CrossSystemETL SET AUTO_UPDATE_STATISTICS ON;
GO

USE CrossSystemETL;
GO

PRINT 'Database CrossSystemETL created successfully';
PRINT 'Project: Cross System Reconciliation ETL';
PRINT 'Description: Data consistency assurance';
GO
