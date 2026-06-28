insert into silver.erp_cust_az12(
cid,
bdate,
gen)
SELECT
case 
 when cid like 'NAS%' then SUBSTRING(cid,4,len(cid)) 
 else cid
 end as cid_,
case
 when bdate > getdate() then NULL
 else bdate
 end as bdate,
case 
 when UPPER(TRIM(GEN)) in ('M','MALE') then 'Male'
 when upper(trim(GEN)) in ('F','FEMALE') then 'Female'
 else 'n/a'
end as gen
FROM bronze.erp_cust_az12