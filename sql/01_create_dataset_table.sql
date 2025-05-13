USE Traffic_Source;
GO

CREATE TABLE Dataset (
    crash_date DATETIME2,
    traffic_control_device VARCHAR(100),
    weather_condition VARCHAR(50),
    lighting_condition VARCHAR(60),
    first_crash_type VARCHAR(100),
    trafficway_type VARCHAR(100),
    alignment VARCHAR(100),
    roadway_surface_cond VARCHAR(50),
    road_defect VARCHAR(50),
    crash_type VARCHAR(100),
    intersection_related_i VARCHAR(5),
    damage VARCHAR(50),
    prim_contributory_cause VARCHAR(100),
    num_units INT,
    most_severe_injury VARCHAR(50),
    injuries_total FLOAT,
    injuries_fatal FLOAT,
    injuries_incapacitating FLOAT,
    injuries_non_incapacitating FLOAT,
    injuries_reported_not_evident FLOAT,
    injuries_no_indication FLOAT,
    crash_hour INT,
    crash_day_of_week INT,
    crash_month INT
);
