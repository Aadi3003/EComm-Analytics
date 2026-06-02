# E-Commerce Analytics Dashboard (SQL + Power BI)
## Overview
This project analyses e-commerce transaction data using SQL and Power BI to uncover business insights related to revenue performance, customer behaviour, product performance, payment reliability, and order fulfilment.

The project demonstrates how SQL can be used to transform raw transactional data into actionable business metrics, while Power BI provides interactive dashboards, drill-through analysis, and KPI reporting for deeper business exploration.

## Problem Statement
An e-commerce company wants to better understand its sales performance, customer purchasing behaviour, product performance, and payment reliability.
The objective is to transform raw transactional data into actionable business insights by:
* Measuring revenue performance
* Identifying high-value customers
* Understanding category and product trends
* Monitoring order fulfilment performance
* Evaluating payment success rates
* Building interactive dashboards for business decision-making

## SQL Analytics & Business Questions
📄 View full queries: `/sql/kpi_queries.sql`
### Business Problems Solved
* Identify top customers by revenue contribution
* Analyse revenue distribution across product categories
* Track order lifecycle performance (Delivered, Pending, Cancelled)
* Measure payment success rates across payment methods
* Monitor monthly revenue trends
* Calculate cumulative revenue using SQL window functions
* Rank top-performing products within each category
* Compare category-level and product-level performance

## SQL Concepts Demonstrated
* INNER JOINs across relational datasets
* Aggregations (`SUM`, `COUNT`, `AVG`)
* Filtering and grouping (`WHERE`, `GROUP BY`)
* KPI calculations
* Common Table Expressions (CTEs)
* Window Functions (`OVER`)
* Running Totals
* Ranking with `RANK() OVER (PARTITION BY ...)`
* Multi-table analytical queries

## Data Preparation
Before analysis, the data model was reviewed and structured to support relational analysis.
Key preparation steps included:
* Establishing relationships between customers, orders, products, payments, and order items
* Validating primary and foreign key relationships
* Creating revenue calculations using quantity and product pricing
* Filtering business KPIs to delivered orders where appropriate
* Preparing aggregated datasets for advanced SQL analysis and dashboard reporting

## Key Insights
* Total Delivered Revenue: ₹121K
* Payment Success Rate: 65%
* Revenue is concentrated among a small group of high-value customers
* Product performance varies significantly across categories
* Monthly revenue trends reveal fluctuations in sales activity
* Payment failures represent a measurable source of revenue leakage
* Cancelled and pending orders highlight operational bottlenecks
* Top-selling products differ substantially between categories

## Business Recommendations
Based on the analysis:
1. Improve payment reliability by investigating payment methods with lower success rates.
2. Focus retention efforts on high-value customers who contribute a disproportionate share of revenue.
3. Expand inventory and marketing support for top-performing products within each category.
4. Investigate causes of cancelled and pending orders to reduce revenue leakage.
5. Monitor category-level performance regularly to identify changing customer demand patterns.

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

## Dashboard Features
### Executive Business Dashboard
* Revenue KPI cards
* Monthly Revenue Trend Analysis
* Revenue by Product Category
* Top Customers by Revenue
* Order Status Distribution
* Interactive slicers and filtering

### Advanced SQL Analytics Dashboard
* Monthly Revenue vs Running Revenue
* Payment Success Rate by Payment Method
* Top Products by Category
* Window Function-based KPI reporting

### Drill-Through Analysis
#### Customer Detail Page
* Revenue contribution
* Order history
* Customer-specific performance metrics

#### Product Detail Page
* Product revenue analysis
* Sales performance breakdown
* Product-level drill-through reporting

## Workflow
1. Designed and populated relational e-commerce datasets
2. Performed KPI and business analysis using SQL
3. Applied CTEs and Window Functions for advanced analytics
4. Created analytical datasets for reporting
5. Built interactive Power BI dashboards
6. Implemented drill-through reporting and DAX measures

## Challenges Faced
* Designing an efficient relational schema across multiple datasets
* Ensuring revenue calculations correctly reflected delivered orders only
* Building advanced SQL queries using CTEs and Window Functions
* Creating drill-through pages that maintained context across dashboard navigation
* Balancing SQL-driven analysis with Power BI visualisation requirements

## Future Improvements
Potential future enhancements include:
* Customer segmentation using RFM analysis
* Profitability analysis using product cost data
* Geographic sales analysis
* Forecasting future revenue trends
* Automated ETL pipelines for larger datasets
* Enhanced dashboard interactivity and advanced DAX measures

## Key Learnings
Through this project, I strengthened my understanding of:
* Writing business-focused SQL queries
* Using CTEs and Window Functions for analytical reporting
* Building KPI-driven dashboards in Power BI
* Designing drill-through reports for detailed investigation
* Creating DAX measures and calculated columns
* Translating business questions into measurable metrics
* Presenting technical analysis through data visualisation

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
├── running_revenue.csv
└── top_products_by_category.csv

sql/
├── adv_queries.sql
└── kpi_queries.sql

powerbi/
└── ecommerce_dashboard.pbix
```

## Dashboard
The Power BI dashboard provides interactive business reporting built on SQL-derived datasets, including KPI monitoring, trend analysis, ranking, drill-through exploration, and customer/product-level performance analysis.

### Executive Business Dashboard
<img width="1383" height="779" alt="Screenshot 2026-06-03 000318" src="https://github.com/user-attachments/assets/c418a864-d903-4009-8552-379998d347f0" />

### Advanced SQL Analytics Dashboard
<img width="1386" height="787" alt="Screenshot 2026-06-03 000332" src="https://github.com/user-attachments/assets/059af570-34a5-4eca-9111-59cc2d1770cc" />

### Customer Details Drill-Through Page
<img width="1385" height="793" alt="Screenshot 2026-06-03 000342" src="https://github.com/user-attachments/assets/a5128fb0-4392-4445-b00c-9496969c6699" />
```
