# 📖 Project Overview

## Introduction

Supply chain management plays a critical role in ensuring products are delivered to customers efficiently, accurately, and on time. Organizations receive thousands of customer orders daily, making manual processing inefficient and prone to errors.

This project demonstrates an end-to-end Supply Chain Analytics solution that automates the complete process — from receiving sales data through email to generating business insights using cloud databases and AI-assisted analytics.

The solution integrates workflow automation, database management, and business analytics into a single pipeline.

## Project Background

Many organizations still receive operational data through email attachments in CSV format. Analysts often spend considerable time downloading files, validating data, cleaning datasets, importing records into databases, and generating reports.

These repetitive manual tasks:

- Consume valuable analyst time
- Introduce human errors
- Delay reporting
- Reduce operational efficiency

To address these challenges, this project automates the complete data ingestion and analytics process using modern low-code and cloud technologies.

## Solution Overview

The project combines three major technologies:

### 1. n8n

n8n automates the complete workflow. Responsibilities include:

- Monitoring Gmail for incoming sales reports
- Downloading CSV attachments
- Extracting and transforming records
- Loading data into Supabase PostgreSQL

### 2. Supabase (PostgreSQL)

Supabase serves as the centralized cloud database. It stores customer information, product information, order details, delivery information, and target values, acting as the single source of truth for business reporting.

### 3. Quadratic

Quadratic provides an AI-assisted analytics environment. It is used to connect directly to PostgreSQL, query relational data, generate date and exchange-rate tables, merge datasets, calculate KPIs, and produce the final dashboards.

## End-to-End Workflow

1. Daily sales reports arrive via Gmail.
2. n8n automatically detects new emails matching the "Daily sales" subject line.
3. CSV attachments are downloaded and parsed.
4. Records are inserted into Supabase PostgreSQL.
5. Quadratic connects to the database.
6. Additional analytical tables (date, exchange rate) are created.
7. KPIs are calculated.
8. Business insights and dashboards are generated.

See [`06_Data_Model.md`](06_Data_Model.md) for the full schema and [`../workflow.json`](../workflow.json) for the importable n8n workflow.

## Business Value

- Eliminates manual data processing
- Reduces reporting time
- Improves data quality
- Standardizes KPI calculations
- Enables faster decision making
- Creates a reusable analytics workflow

## Skills Demonstrated

Workflow Automation · Data Analytics · SQL · PostgreSQL · Data Transformation · Cloud Databases · Business Intelligence · KPI Reporting · Supply Chain Analytics · AI-assisted Analytics · Documentation · GitHub Project Management

## Conclusion

This project demonstrates how workflow automation, cloud databases, and AI-assisted analytics can be combined to build a scalable Supply Chain Analytics solution — reducing manual effort, improving reporting accuracy, and providing actionable business insights for supply chain decision makers.
