
# Exploratory Data Analysis with SQL: Job Market Analysis

![Project 1 Overview](../Images/1_1_Project1_EDA.png)

An SQL project analysing the data engineer job market using real world job postings data.

## Executive Summary

- **Project Scope:** Built 3 analytical queries to answer key questions about the data engineering job market.
- **Data Modelling:** Used multi table joins across fact and dimension tables to extract insights
- **Analytics:** Applied aggregations, filtering and sorting to find top skills by demand, salary and overall value.

1. [`01_top_demanded_skills.sql`](01_top_demanded_skills.sql) - role demand analysis with multi table joins

2. [`02_top_paying_skills.sql`](02_top_paying_skills.sql) - salary analysis with aggregations

3. [`03_optimal_skills.sql`](03_optimal_skills.sql) - combined demand/salary optimisation

## Problem and Context

Job market analysis answers questions like -   
1. **Most in-demand:** Which skills are most in-demand for data engineers.
2. **Higest Paid:** Which skills have the highest salary

This project analyses the data warehouse built using star schema design. The warehouse structure consists of:  
![Data Warehouse](../Images/1_2_Data_Warehouse.png)

- **Fact Table:** `job_postings_fact` - Central table containing job posting details(job titles, locations, salaries, dates etc)
- **Dimension Tables:** -  
- `company_dim` - Company information linked to job postings
- `skills_dim` - Skills linked to job postings
- **Bridge Table** - `skills_job_dim` - Connection between skills and job postings and removes the many-to-many relationship

## Tech Stack
- **Query Engine:** - DuckDB for fast OLAP analytical queries
- **Language:** - SQL
- **Data Model:** - Star schema with fact + dimension + bridge tables
- **Development:** - VS Code for SQL editing + Terminal for DuckDB CLI
- **Version Control:** - Git/Github for version control

## Analysis

1. [`Top Demanded SKills`](01_top_demanded_skills.sql) - Identifies the top 10 demanded skills for Data Engineers
2. [`Top Paying Skills`](02_top_paying_skills.sql) - Identifies the top 25 paying skills for Data Engineer roles
3. [`Optimal Skills`](03_optimal_skills.sql) - Calculates an optimal score using natural log of demand combined with median salary to identify the most valuables skills.
