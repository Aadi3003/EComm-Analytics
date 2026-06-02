-- running window function
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(oi.quantity * p.price) AS monthly_revenue,
    SUM(
        SUM(oi.quantity * p.price)
    ) OVER (
        ORDER BY DATE_FORMAT(o.order_date, '%Y-%m')
    ) AS running_revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY month
ORDER BY month;

-- top product by category
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
),

ranked_products AS (
    SELECT
        category,
        product_name,
        revenue,
        RANK() OVER (
            PARTITION BY category
            ORDER BY revenue DESC
        ) AS product_rank
    FROM product_sales
)

SELECT
    category,
    product_name,
    revenue
FROM ranked_products
WHERE product_rank = 1;