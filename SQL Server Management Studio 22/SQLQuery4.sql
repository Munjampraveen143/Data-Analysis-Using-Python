

CREATE PROCEDURE bronze.bronze_load AS
BEGIN
BEGIN TRY
PRINT'==========================================================';
PRINT'Loading Bronze Layer';
PRINT'==========================================================';


PRINT'----------------------------------------------------';
PRINT'Loading CRM Table';
PRINT'----------------------------------------------------';

PRINT'>> Truncating Table: bronze.crm_cust_info';
TRUNCATE TABLE bronze.crm_cust_info;

PRINT'>> Inserting Data into: bronze.crm_cust_info';
BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\user\OneDrive\Desktop\datasets\source_crm\cust_info.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR =',',
TABLOCK
);


PRINT'>> Truncating Table: bronze.crm_prd_info';
TRUNCATE TABLE bronze.crm_prd_info;

PRINT'>> Inserting Data into: bronze.crm_prd_info';
BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\user\OneDrive\Desktop\datasets\source_crm\prd_info.CSV'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR =',',
TABLOCK
);


PRINT'>> Truncating Table: bronze.crm_Sales_details';
TRUNCATE TABLE bronze.crm_sales_details;

PRINT'>> Inserting Data into: bronze.crm_Sales_details';
BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\user\OneDrive\Desktop\datasets\source_crm\sales_details.CSV'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
TABLOCK
);

PRINT'----------------------------------------------------';
PRINT'Loading Erp Table';
PRINT'----------------------------------------------------';

PRINT'>> Truncating Table: bronze.erp_cust_az12';
TRUNCATE TABLE bronze.erp_cust_az12;

PRINT'>> Inserting Data into: bronze.erp_cust_az12';
BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\user\OneDrive\Desktop\datasets\source_erp\cust_az12.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR =',',
TABLOCK
);


PRINT'Truncating Table: bronze.erp_loc_a101';
TRUNCATE TABLE bronze.erp_loc_a101;

PRINT'Inserting Data Into: bronze.erp_loc_a101';
BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\user\OneDrive\Desktop\datasets\source_erp\loc_a101.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR=',',
TABLOCK
);

PRINT'Truncating Table: bronze.erp_px_cat_g1v2';
TRUNCATE TABLE bronze.erp_px_cat_g1v2;


PRINT'Inserting Data Into: bronze.erp_px_cat_g1v2';
BULK INSERT  bronze.erp_px_cat_g1v2
FROM 'C:\Users\user\OneDrive\Desktop\datasets\source_erp\px_cat_g1v2.CSV'
WITH
(
FIRSTROW=2,
FIELDTERMINATOR = ',',
TABLOCK
);
END TRY
BEGIN CATCH
PRINT'===============================================';
PRINT'Error occured during loading bronze layer';
PRINT'===============================================';
END CATCH

END