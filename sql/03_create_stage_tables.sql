USE Traffic_Stage;
GO

-- Schema stg
CREATE SCHEMA stg;
GO

-- Dim Staging Tables
CREATE TABLE stg.DimDate (
    DateKey bigint,
    [Date] datetime2,
    [Hour] int,
    [DayOfWeek] varchar(50),
    [DayOfWeekNumber] int,
    [Day] int,
    [Month] int
);

CREATE TABLE stg.DimLighting (
    LightingID int,
    Lighting varchar(50)
);

CREATE TABLE stg.DimWeather (
    WeatherID int,
    Weather varchar(50)
);

CREATE TABLE stg.DimTrafficControlDevice (
    ControlDeviceID int,
    TrafficControlDevice varchar(60)
);

CREATE TABLE stg.DimAlignment (
    AlignmentID int,
    Alignment varchar(60)
);

CREATE TABLE stg.DimCrashType (
    CrashTypeID int,
    CrashType varchar(100)
);

CREATE TABLE stg.DimTrafficWayType (
    TrafficWayTypeID int,
    TrafficWayType varchar(100)
);

CREATE TABLE stg.DimRoadWayDefect (
    RoadWayDefectID int,
    RoadWayDefect varchar(20)
);

CREATE TABLE stg.DimContributoryCause (
    ContributoryCauseID int,
    PrimContributoryCause varchar(100)
);

CREATE TABLE stg.DimRoadWaySurface (
    RoadWaySurfaceID int,
    RoadWaySurface varchar(50)
);

-- Fact Staging Tables
CREATE TABLE stg.FactTime (
    CrashID int,
    DateKey bigint,
    CrashTypeKey int,
    InjuriesTotal int,
    InjuriesFatal int,
    InjuriesIncapacitating int,
    InjuriesNonIncapacitating int,
    DameLevel varchar(50),
    NumberUnits int,
    MostSevereInjury varchar(50)
);

CREATE TABLE stg.FactCause (
    CrashID int,
    LightingKey int,
    WeatherKey int,
    TrafficControlDeviceKey int,
    AlignmentKey int,
    CrashTypeKey int,
    TrafficWayTypeKey int,
    RoadWayDefectKey int,
    RoadWaySurfaceKey int,
    ContributoryCauseKey int
);
