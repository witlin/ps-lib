--CREATE LOGIN vsmolinski_login
--  WITH PASSWORD = 'D1st3ch!!!';
--USE AdventureWorks2019;
--CREATE USER vsmolinski FOR LOGIN vsmolinski_login
--  WITH DEFAULT_SCHEMA = dbo;
--GO

--CREATE LOGIN TS01_SqlLogin
--  WITH PASSWORD = 'D1st3ch!!!';
--USE Niagara_TS01;
--CREATE USER TS01_SqlUser FOR LOGIN TS01_SqlLogin
--  WITH DEFAULT_SCHEMA = dbo;
--GO

-- CREATE DATABASE [Niagara_TS02]
-- CONTAINMENT = NONE
-- ON PRIMARY
-- (NAME='Niagara_TS02', FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL15.BMSSQL_SRV01\MSSQL\DATA\Niagara_TS02.mdf', SIZE=100MB, MAXSIZE=1GB, FILEGROWTH=10MB)
-- LOG ON
-- (NAME='Niagara_TS01_log', FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL15.BMSSQL_SRV01\MSSQL\DATA\Niagara_TS02.ldf', SIZE=100MB, MAXSIZE=5GB, FILEGROWTH=10MB)
-- GO

------------------------------------------------------------

-- USE Niagara_TS02
-- create table STALE_DATA_SAMPLES
-- (
--     ID int identity(1,1) primary key not null,
--     TBL_NAME varchar (200) null,
--     TIMESTAMP datetime not null,
--     TRENDFLAGS int null,
--     STATUS int null,
--     VALUE float null,
--     TRENDFLAGS_TAG varchar (500) null,
--     STATUS_TAG varchar (500) null
-- )
-- GO

------------------------------------------------------------

-- USE [master]
-- GO

-- CREATE LOGIN [niagara] WITH PASSWORD=N'D1st3ch!!!', DEFAULT_DATABASE=[Niagara_TS02], CHECK_POLICY=OFF
-- GO

-- USE [Niagara_TS02]
-- GO

-- CREATE USER [niagara] FOR LOGIN [niagara]
-- GO

-- EXEC sp_addsrvrolemember N'niagara', N'sysadmin'
-- GO

------------------------------------------------------------

-- use Niagara_TS02

-- SELECT *
-- FROM dbo.STALE_DATA_SAMPLES

------------------------------------------------------------

-- SELECT name, database_id
-- FROM sys.databases

-- SELECT DB_ID('Niagara_TS02') AS DATABASE_ID;

-- SELECT OBJECT_ID('dbo.STALE_DATA_SAMPLES') AS OBJECT_ID;

------------------------------------------------------------

-- USE Niagara_TS02
-- create table FAULT_DATA_SAMPLES
-- (
--     ID int identity(1,1) primary key not null,
--     TBL_NAME varchar (200) null,
--     TIMESTAMP datetime not null,
--     TRENDFLAGS int null,
--     STATUS int null,
--     VALUE float null,
--     TRENDFLAGS_TAG varchar (500) null,
--     STATUS_TAG varchar (500) null
-- )
-- GO

------------------------------------------------------------

USE Niagara_TS02
create table TCE_DATA_SAMPLES
(
    ID int identity(1,1) primary key not null,
    TBL_NAME varchar (200) null,
    TIMESTAMP datetime not null,
    TRENDFLAGS int null,
    STATUS int null,
    VALUE float null,
    TRENDFLAGS_TAG varchar (500) null,
    STATUS_TAG varchar (500) null
)
GO
