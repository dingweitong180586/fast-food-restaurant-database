# Fast Food Restaurant Database System

## Overview
This project designs a relational database system for a fast-food restaurant to manage customer records, order history, kitchen operations, front counter pickup, and employee roles.

## My Role
I contributed to business rule analysis, relational data modeling, SQL query design, and physical database design.

## Technologies
- SQL
- EER Modeling
- Relational Database Design
- Primary Keys and Foreign Keys
- B-Tree Indexing
- Query Optimization

## Key Features
- Designed an EER model based on restaurant business rules
- Converted the EER model into a relational data model
- Modeled customers, orders, kitchens, front counters, employees, chefs, cashiers, and managers
- Defined primary keys and foreign keys to support data integrity
- Proposed B-tree indexing strategies for frequently queried fields
- Designed representative SQL queries for order tracking, customer order history, kitchen workload, and employee-supervisor reporting

## Business Rules
- A customer can place multiple orders
- Each order belongs to one customer
- Each order is handled by one kitchen
- Each order is linked to one front counter
- Each front counter can hold multiple orders
- Managers can supervise multiple employees

## Project Structure

```text
fast-food-restaurant-database/
├── README.md
└── sql/
    ├── 00_schema.sql
    ├── 01_indexes.sql
    └── 02_queries.sqlw'w'w'w'w'w'w'w'w'w'w'w'w'w
