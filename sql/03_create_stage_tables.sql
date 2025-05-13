-- =======================================
-- 03_create_stage_tables.sql
-- Mục đích: Tạo các bảng trong schema Traffic_Stage
-- Dùng để staging dữ liệu từ Source → chuẩn hóa để Load lên DW
-- =======================================



-- 0. Tạo schema nếu chưa tồn tại
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Traffic_Stage')
BEGIN
    EXEC('CREATE SCHEMA Traffic_Stage');
END
GO

-- =======================================
-- 1. Stage cho bảng FactTime
-- =======================================
CREATE TABLE Traffic_Stage.FactTime (
    CrashID INT PRIMARY KEY,
    CrashDate DATETIME2,
    CrashType VARCHAR(100),
    InjuriesTotal INT,
    InjuriesFatal INT,
    InjuriesIncapacitating INT,
    InjuriesNonIncapacitating INT,
    DameLevel VARCHAR(50),
    NumberUnits INT,
    MostSevereInjury VARCHAR(50)
);
GO

-- =======================================
-- 2. Stage cho bảng FactCause
-- =======================================
CREATE TABLE Traffic_Stage.FactCause (
    CrashID INT PRIMARY KEY,
    Lighting VARCHAR(50),
    Weather VARCHAR(50),
    TrafficControlDevice VARCHAR(60),
    Alignment VARCHAR(60),
    CrashType VARCHAR(100),
    TrafficWayType VARCHAR(100),
    RoadWayDefect VARCHAR(20),
    RoadWaySurface VARCHAR(50),
    PrimContributoryCause VARCHAR(100)
);
GO

-- =======================================
-- 3. Stage cho bảng DimDate (tách từ CrashDate)
-- =======================================
CREATE TABLE Traffic_Stage.DimDate (
	[CrashID] [int] NOT NULL,
	[CrashDate] [datetime2](7) NULL,
	[CrashHour] [int] NULL,
	[CrashDayOfWeek] [varchar](50) NULL,
	[CrashDayOfWeekNumber] [int] NULL,
	[CrashDay] [int] NULL,
	[CrashMonth] [int] NULL,
);
GO

-- =======================================
-- 4. Stage cho các Dimension riêng biệt (phục vụ kiểm tra, lookup)
-- =======================================

CREATE TABLE Traffic_Stage.DimLighting (
    Lighting VARCHAR(50)
);
GO

CREATE TABLE Traffic_Stage.DimWeather (
    Weather VARCHAR(50)
);
GO

CREATE TABLE Traffic_Stage.DimTrafficControlDevice (
    TrafficControlDevice VARCHAR(60)
);
GO

CREATE TABLE Traffic_Stage.DimAlignment (
    Alignment VARCHAR(60)
);
GO

CREATE TABLE Traffic_Stage.DimCrashType (
    CrashType VARCHAR(100)
);
GO

CREATE TABLE Traffic_Stage.DimTrafficWayType (
    TrafficWayType VARCHAR(100)
);
GO

CREATE TABLE Traffic_Stage.DimRoadWayDefect (
    RoadWayDefect VARCHAR(20)
);
GO

CREATE TABLE Traffic_Stage.DimRoadWaySurface (
    RoadWaySurface VARCHAR(50)
);
GO

CREATE TABLE Traffic_Stage.DimContributoryCause (
    PrimContributoryCause VARCHAR(100)
);
GO
