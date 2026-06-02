# E-Commerce Analytics Dashboard (SQL + Power BI)
## Overview
This project analyses e-commerce transaction data using SQL and Power BI to uncover business insights around revenue performance, customer behaviour, payment reliability, and product performance.

The primary focus of the project is SQL-driven analytics, with Power BI used to visualise insights generated through analytical queries.

## Key SQL Analysis
📄 View full queries: `/sql/kpi_queries.sql`

### Business Problems Solved
* Identify **top customers by revenue contribution**
* Analyse **revenue distribution across product categories**
* Track **order lifecycle** (Delivered, Pending, Cancelled)
* Measure **payment success rates across payment methods**
* Monitor **monthly revenue trends**
* Calculate **running revenue using SQL window functions**
* Identify **top-performing products within each category**

## SQL Concepts Demonstrated
* Joins (INNER JOIN)
* Aggregations (`SUM`, `COUNT`)
* Filtering and grouping (`WHERE`, `GROUP BY`)
* KPI calculations
* Common Table Expressions (CTEs)
* Window Functions (`OVER`)
* Running Totals
* Ranking with `RANK() OVER (PARTITION BY ...)`

## Key Insights
* Total Revenue (Delivered Orders): ₹77K
* Payment Success Rate: 80%
* Revenue declined across the analysed period while cumulative revenue continued to grow
* Revenue is concentrated among a small group of high-value customers
* Significant variation exists across product categories
* Top-performing products differ substantially between categories
* Pending and cancelled orders highlight operational bottlenecks

## Sample SQL Query
```sql
WITH product_sales AS (
    SELECT
        p.category,
        p.product_name,
        SUM(oi.quantity * p.price) AS revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.status = 'Delivered'
    GROUP BY
        p.category,
        p.product_name
)

SELECT *,
       RANK() OVER (
           PARTITION BY category
           ORDER BY revenue DESC
       ) AS product_rank
FROM product_sales;
```

## Dashboard Highlights
### Business Dashboard
* Revenue by Month
* Category Revenue Analysis
* Customer Revenue Contribution
* Order Status Distribution

### Advanced SQL Analysis
* Monthly Revenue vs Running Revenue
* Payment Success Rate by Payment Method
* Top Products by Category

## Workflow
1. Created and populated relational e-commerce datasets
2. Performed KPI and business analysis using SQL
3. Applied CTEs and Window Functions for advanced analytics
4. Exported analytical datasets for reporting
5. Built interactive Power BI dashboards for visualisation

## Tech Stack
* MySQL
* Power BI
* DAX
* CSV Data Sources

## Project Structure
```text
data/
├── customers.csv
├── products.csv
├── orders.csv
├── order_items.csv
├── payments.csv

sql/
├── schema.sql
├── sample_data.sql
└── kpi_queries.sql

powerbi/
└── ecommerce_dashboard.pbix
```

## Dashboard
Power BI dashboard available in `/powerbi/` for visualisation of SQL-derived insights and advanced analytical reporting.

<img width="1389" height="790" alt="Screenshot 2026-06-02 230412" src="https://github.com/user-attachments/assets/3a24ab43-3e4f-4a1c-ad24-62b1202f933e" />
<img width="1273" height="714" alt="Screenshot 2026-06-02 225828" src="https://github.com/user-attachments/assets/b288411c-33a0-4ff4-a80d-4a17661ce7ab" />
