use datawarehouse;

insert into silver.crm_cust_info (
cst_id,
cst_key,
cst_firstname,
cst_lastname,
cst_marital_status,
cst_gndr,
cst_create_date
)
SELECT 
cst_id,
cst_key,
TRIM(cst_firstname) as cst_firstname,
TRIM(cst_lastname) as cst_lastname,
CASE 
WHEN UPPER(TRIM(cst_marital_status)) ='S' THEN 'Married'
WHEN UPPER(TRIM(cst_marital_status)) ='M' THEN 'Single'
ELSE 'n/a'
END AS cst_marital_status,
CASE 
WHEN UPPER(TRIM(cst_gndr)) ='F' THEN 'Female'
WHEN UPPER(TRIM(cst_gndr)) ='M' THEN 'Male'
ELSE 'n/a'
END AS cst_gndr,
cst_create_date
FROM
(
select *,
ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
 from bronze.crm_cust_info
 ) AS t
 WHERE flag_last = 1 and cst_id is not null

 
 select * from silver.crm_cust_info;


 