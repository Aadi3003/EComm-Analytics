## Overview
This project analyses e-commerce transaction data using SQL to extract business insights around revenue, customer behaviour, and order lifecycle.

## Key SQL Analysis
The core of this project lies in SQL-based KPI generation.

📄 View full queries: `/sql/kpi_queries.sql`

### Business Problems Solved
* Identify **top customers by revenue contribution**
* Analyse **revenue distribution across product categories**
* Track **order lifecycle (delivered, pending, cancelled)**
* Measure **payment success rate**

## Key Insights
* Total Revenue (Delivered Orders): ₹77K
* Payment Success Rate: 80%
* High revenue concentration among top customers
* Category-level revenue variation observed
* Pending and cancelled orders highlight operational gaps

## Sample SQL Query

```sql
-- Top Customers by Revenue
SELECT 
    u.name,
    SUM(o.total_amount) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
WHERE o.status = 'delivered'
GROUP BY u.name
ORDER BY total_spent DESC;
```

## Workflow
1. Data cleaned and structured using SQL
2. KPIs derived through analytical queries
3. Results visualised using Power BI

## Tech Stack

* SQL (MySQL)
* Power BI (Data modelling, DAX, visualisation)

## Project Structure

* `data/` → Raw datasets (CSV)
* `sql/` → SQL queries for KPI analysis
* `powerbi/` → Dashboard file (.pbix)

## Dashboard (Supporting)
Power BI dashboard available in `/powerbi/` for visualisation of SQL-derived insights.

<img width="1311" height="732" alt="Screenshot 2026-04-24 190358" src="https://github.com/user-attachments/assets/0b95dae3-3db3-4dda-9f1f-f25e496077a7" />
<img width="1543" height="874" alt="image" src="https://github.com/user-attachments/assets/a2185dd5-485e-4f75-8d14-5cda377d3587" />

