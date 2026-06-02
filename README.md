# E-Commerce Analytics Dashboard (SQL + Power BI)
## Overview
This project analyses e-commerce transaction data using SQL and Power BI to uncover business insights related to revenue performance, customer behaviour, product performance, payment reliability, and order fulfilment.

The project demonstrates how SQL can be used to transform raw transactional data into actionable business metrics, while Power BI provides interactive dashboards and drill-through analysis for deeper exploration.

## Key SQL Analysis
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

## Key Insights
* Total Delivered Revenue: ₹121K
* Payment Success Rate: 65%
* Revenue is concentrated among a small group of high-value customers
* Product performance varies significantly across categories
* Monthly revenue trends reveal fluctuations in sales activity
* Payment failures represent a measurable source of revenue leakage
* Cancelled and pending orders highlight operational bottlenecks
* Top-selling products differ substantially between categories

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
* Customer Detail Page
  * Revenue contribution
  * Order history
  * Customer-specific performance metrics

* Product Detail Page
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
└── top_products_by_category

sql/
├── adv_queries.sql
└── kpi_queries.sql

powerbi/
└── ecommerce_dashboard.pbix
```

## Dashboard
The Power BI dashboard provides interactive business reporting built on SQL-derived datasets, including KPI monitoring, trend analysis, ranking, drill-through exploration, and customer/product-level performance analysis.

<img width="1383" height="779" alt="Screenshot 2026-06-03 000318" src="https://github.com/user-attachments/assets/c418a864-d903-4009-8552-379998d347f0" />
<img width="1386" height="787" alt="Screenshot 2026-06-03 000332" src="https://github.com/user-attachments/assets/059af570-34a5-4eca-9111-59cc2d1770cc" />

Customer Details Drill-Down page: 
<img width="1385" height="793" alt="Screenshot 2026-06-03 000342" src="https://github.com/user-attachments/assets/a5128fb0-4392-4445-b00c-9496969c6699" />
