/*
QUALITY CHECKS FOR GOLD LAYER

Script Purpose: This script performs quality checks to validate the integrity, consistency, and accuracy of the gold Layer. These checks look after the:
    - uniqueness of surrogate keys in dimension tables.
    - referential integrity between fact and dimension tables.
    - validation of relationships in the data model for analytical purposes.
*/

-- checking 'gold.dim_customers'
-- checking for uniqueness of customer key in gold.dim_customers
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- checking 'gold.product_key'
-- checking for uniqueness of product key in gold.dim_products
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- checking 'gold.fact_sales'
-- checking the data model connectivity between the fact and the dimensions
SELECT * 
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_customers AS c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products AS p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL  
