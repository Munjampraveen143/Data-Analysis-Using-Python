
-- identifying duplicate values in primarykey column cst_id
SELECT cst_id ,COUNT(*) 
FROM 
bronze.crm_cust_info
GROUP BY cst_id
having count(*) >1;

select * from bronze.crm_cust_info;

-- identifing unwanted spaces in cst_firstname
select cst_firstname from
bronze.crm_cust_info
where cst_firstname != trim(cst_firstname);


-- identifing unwanted spaces in cst_lastname
select cst_lastname from
bronze.crm_cust_info
where cst_lastname != trim(cst_lastname);

-- identifing unwanted spaces in marital_status
select cst_marital_status from
bronze.crm_cust_info
where cst_marital_status != trim(cst_marital_status);

-- identifing unwanted spaces in gndr column
select cst_gndr from
bronze.crm_cust_info
where cst_gndr != trim(cst_gndr);


-- identifying any null values in firstname
select cst_firstname from bronze.crm_cust_info where
cst_firstname is null;

-- identifying any null values in laststname
select cst_lastname from bronze.crm_cust_info where
cst_lastname is null;


-- identifing distinct values in marital status column
select  distinct cst_marital_status from
bronze.crm_cust_info;


-- identifing distinct values in cst_gndr column
select  distinct cst_gndr from
bronze.crm_cust_info;

