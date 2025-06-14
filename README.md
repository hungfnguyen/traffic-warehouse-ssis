# Traffic Accident Data Warehouse (SSIS)

This project implements a complete ETL pipeline using **SQL Server Integration Services (SSIS)** to build a star-schema data warehouse for analyzing **traffic accident data**.

## 📊 Overview

* **Source**: Raw traffic accident data from `TrafficAccidents.csv`
* **ETL Pipeline**: CSV → Dataset → Source → Stage → Data Warehouse
* **Tools Used**: SSIS, SQL Server, T-SQL

The solution enables structured, clean, and analytical-ready data for downstream reporting and dashboarding.

## ⚙️ ETL Architecture

```
             +----------------------+       
             | TrafficAccidents.csv |
             +----------------------+
                      ↓
           [01] Load to Dataset (Raw)
                      ↓
           [02] Normalize into Source Tables
                      ↓
           [03] Transform to Stage
                      ↓
           [04] Load to Data Warehouse (Star Schema)
```

### 📦 Key Packages

| Package                                 | Description                                            |
| --------------------------------------- | ------------------------------------------------------ |
| `01_load_csv_to_dataset.dtsx`           | Load raw CSV into staging table                        |
| `02_load_dataset_to_source_tables.dtsx` | Normalize into dimension & event tables                |
| `03_load_source_to_stage.dtsx`          | Prepare cleaned, joined data for DW                    |
| `04_load_stage_to_dwh.dtsx`             | Final load into DW with surrogate keys, SCD, and audit |

## 🏗️ Data Warehouse Schema

* **Fact Tables**:

  * `FactTime`: crash time facts
  * `FactCause`: cause-related facts

* **Dimension Tables**:

  * `DimDate`
  * `DimCrashType`
  * `DimLighting`
  * `DimWeather`
  * `DimTrafficControl`
  * `DimAudit`

* Surrogate keys are used across all tables, and slowly changing dimensions (SCD Type 2) are implemented where applicable.

## 📌 Features

* Data type normalization (Unicode → non-Unicode)
* Derived fields: Hour, Day, Month, Year
* Surrogate Key and Audit Key management
* Error handling, logging, and SCD Type 2 implementation
* Ready for reporting and visualization

## 📁 Project Structure

```
traffic-warehouse-ssis/
├── source_data/
├── sql/
├── traffic-warehouse-project/
│   ├── 01_load_csv_to_dataset.dtsx
│   ├── 02_load_dataset_to_source_tables.dtsx
│   ├── 03_load_source_to_stage.dtsx
│   └── 04_load_stage_to_dwh.dtsx
├── traffic-warehouse-project.sln
```

## ✅ How to Run

1. Open `traffic-warehouse-project.sln` in Visual Studio with SSIS plugin.
2. Set up connection managers for:

   * `CSV_TrafficAccidents`
   * `Traffic_Source`, `Traffic_Stage`, `Traffic_DW`
3. Run packages in order: 01 → 04

## 📈 Outcome

The final Data Warehouse allows accurate, fast, and scalable analysis of traffic accidents, supporting KPIs such as:

* Accidents by weather condition
* Accidents by lighting or time of day
* Time-series trends of accident causes
