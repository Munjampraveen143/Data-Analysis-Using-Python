-- checking any duplicates in primarykey column
SELECT prd_id ,COUNT(*) 
FROM 
bronze.crm_prd_info
GROUP BY prd_id
having count(*) >1 or prd_id is null;


-- invalid date orders
select * from bronze.crm_prd_info
where prd_end_dt < prd_start_dt;


-- data standarization and consistency
 select distinct prd_line from bronze.crm_prd_info;


 -- checking for negative numbers or null values
 select prd_cost from bronze.crm_prd_info
 where prd_cost <=0 or prd_cost is null


 -- checking for unwanted spaces
 select prd_nm from bronze.crm_prd_info
 where prd_nm != TRIM(prd_nm);

 
