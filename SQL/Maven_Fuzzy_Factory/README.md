# Maven Fuzzy Factory SQL Analysis

## Project Overview

This project analyzes the Maven Fuzzy Factory e-commerce dataset using PostgreSQL.

The goal was to explore website traffic, marketing performance, sales, products, refunds, and customer behavior using SQL.

## Tools

- PostgreSQL
- pgAdmin 4
- SQL

## Dataset

The dataset used in this project is the **Toy Store E-Commerce Database (Maven Fuzzy Factory)** from Maven Analytics.

It contains six related tables:

- website_sessions
- website_pageviews
- orders
- order_items
- order_item_refunds
- products

**Source:** [Maven Analytics - Toy Store E-Commerce Database](https://mavenanalytics.io/data-playground/toy-store-e-commerce-database)

## Analysis

The project is divided into:

1. Database Setup
2. Data Exploration
3. Website & Marketing Analysis
4. Sales Analysis
5. Product & Refund Analysis
6. Customer Analysis

## SQL Skills Demonstrated

- SELECT, WHERE, GROUP BY, ORDER BY
- Aggregate functions
- JOINs
- CASE statements
- CTEs
- Date functions
- Conversion rate calculations
- Revenue, profit, and margin analysis
- Customer segmentation
- Refund rate analysis

## Data Quality

Some missing marketing attribution values were stored as the literal text `'NULL'` rather than SQL NULL values. These records were treated as unattributed traffic during analysis.

## Future Improvements

Future analysis may include more advanced SQL techniques such as window functions, month-over-month growth analysis, and customer purchase timing.
