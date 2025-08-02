/*
QUALITY CHECKS FOR SILVER

Script Purpose: This script performs various quality checks for data consistency, accuracy, and standardization across the 'silver' layer. It includes checks for:
    - null or duplicate primary keys.
    - unwanted spaces in string fields.
    - data standardization and consistency.
    - invalid date ranges and orders.
    - data consistency between related fields.
*/

-- checking 'silver.crm_cust_info'
-- checking for NULLs or duplicates in primary key
SELECT 
    cst_id,
    COUNT(*) 
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;
-- checking for Unwanted Spaces
SELECT 
    cst_key 
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key);
-- cehcking for data standardization & consistency
SELECT DISTINCT 
    cst_marital_status 
FROM silver.crm_cust_info;

-- checking 'silver.crm_prd_info'
-- checking for NULLs or duplicates in primary key
SELECT 
    prd_id,
    COUNT(*) 
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;
-- checking for unwanted spaces
SELECT 
    prd_nm 
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);
-- checking for NULLs or negative cost values
SELECT 
    prd_cost 
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;
-- checking for data standardization & consistency
SELECT DISTINCT 
    prd_line 
FROM silver.crm_prd_info;
-- checking for invalid date orders (start date > end date)
SELECT 
    * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-- checking 'silver.crm_sales_details'
-- checking for invalid dates
SELECT 
    NULLIF(sls_due_dt, 0) AS sls_due_dt 
FROM bronze.crm_sales_details
WHERE sls_due_dt <= 0 
    OR LEN(sls_due_dt) != 8 
    OR sls_due_dt > 20500101 -- date chosen arbitrarily
    OR sls_due_dt < 19000101; -- date chosen arbitrarily
-- checking for invalid date orders (order date > shipping/due dates)
SELECT 
    * 
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt;
-- checking data consistency: sales = quantity * price
SELECT DISTINCT 
    sls_sales,
    sls_quantity,
    sls_price 
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL 
   OR sls_quantity IS NULL 
   OR sls_price IS NULL
   OR sls_sales <= 0 
   OR sls_quantity <= 0 
   OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;

-- checking 'silver.erp_cust_az12'
-- identifying out-of-range dates
SELECT DISTINCT 
    bdate 
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' 
   OR bdate > GETDATE();
-- checking data standardization & consistency
SELECT DISTINCT 
    gen 
FROM silver.erp_cust_az12;

-- checking 'silver.erp_loc_a101'
-- checking data standardization & consistency
SELECT DISTINCT 
    cntry 
FROM silver.erp_loc_a101
ORDER BY cntry;

-- checking 'silver.erp_px_cat_g1v2'
-- checking for unwanted spaces
SELECT 
    * 
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
   OR subcat != TRIM(subcat) 
   OR maintenance != TRIM(maintenance);
-- checking data standardization & consistency
SELECT DISTINCT 
    maintenance 
FROM silver.erp_px_cat_g1v2;
