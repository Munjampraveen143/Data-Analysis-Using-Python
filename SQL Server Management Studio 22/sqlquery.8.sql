-- check if any product keys are there in sales details which are not in 
-- crm_prd_info table

select * from bronze.crm_sales_details
where sls_prd_key not in ( select prd_key from silver.crm_prd_info)

-- check if any cust id are there in sales details which are not in 
-- crm_cst_info table

select * from bronze.crm_sales_details
where sls_cust_id not in ( select cst_id from silver.crm_cust_info)


-- checking data consistency between sales , quantity, and price
-- business rule
-- sales = quantity * price
-- values must not be NULL, zero, Negative

select
sls_sales,
sls_quantity,
sls_price from
bronze.crm_sales_details 
where sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0
ORDER BY sls_sales,sls_quantity,sls_price;


-- checking unwanted spaces
select sls_ord_num from bronze.crm_sales_details
where sls_ord_num != trim(sls_ord_num) or sls_ord_num is null;


-- checking for invalid dates
select nullif(sls_order_dt,0)
from bronze.crm_sales_details
where  sls_order_dt <=0 
or len(sls_order_dt) != 8;


-- checking for invalid date orders
select *
from bronze.crm_sales_details
where sls_order_dt > sls_ship_dt or sls_order_dt > sls_due_dt;