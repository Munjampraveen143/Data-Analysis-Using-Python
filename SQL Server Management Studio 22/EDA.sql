
select * from gold.dim_customers;
select * from gold.dim_products;
select * from gold.fact_sales;





--EDA Analysis


-- exploring database

select * from INFORMATION_SCHEMA.tables;

select * from INFORMATION_SCHEMA.columns;





--retrive unique martital_status and gender
select distinct marital_status from gold.dim_customers;
select distinct gender from gold.dim_customers;


-- dimension exploration
-- retrieve list of unique countries
select distinct country from gold.dim_customers;



-- date exploration

-- show the first and last order and total duration in months
select min(order_date) as first_order, max(order_date) as last_order,
datediff(month,min(order_date), max(order_date)) as month_differ
from gold.fact_sales;
-- find the youngest and oldest customers and age
select min(birthdate) as oldest_customer, max(birthdate) as youngest_customer,
datediff(year,min(birthdate),getdate()) as old_age,
datediff(year,max(birthdate),getdate()) as young_age
from gold.dim_customers;  



-- total customers by country
select country,count(customer_key) as total_customers
from gold.dim_customers
group by country
order by count(customer_key) desc;




-- find total customer by gender
select gender,count(customer_key) as total_customers
from gold.dim_customers
group by gender
order by count(customer_key) desc;



-- find total products by category
select category,count(product_key) as total_products
from gold.dim_products
where category is not null
group by category
order by count(product_key) desc;



-- what is the avg and total revenue genarated by each category
select p.category as product_category,
avg(p.cost) as avg_amount,
sum(f.sales_amount) as total_revenue
from gold.dim_products as p
left join gold.fact_sales as f
on p.product_key = f.product_key
group by p.category
order by  total_revenue desc;


-- what is the total revenue genarated by each customer
select c.customer_key,
c.first_name,
sum(f.sales_amount) as total_revenue
from gold.dim_customers as c
left join gold.fact_sales as f
on c.customer_key = f.customer_key
group by c.customer_key,
c.first_name
order by total_revenue desc;


-- what is  the distribution of sold items across countries
select 
c.country,
sum(f.quantity) as total_sold
from gold.dim_customers as c
left join gold.fact_sales as f
on c.customer_key = f.customer_key
group by c.country
order by total_sold desc;




-- top 10 customers who have genarated highest revenue
select  TOP 10 c.customer_key,
c.first_name,
sum(f.sales_amount) as total_revenue
from gold.dim_customers as c
left join gold.fact_sales as f
on c.customer_key = f.customer_key
group by c.customer_key,
c.first_name
order by total_revenue desc;





-- Which 5 products generate the Highest revenue ?
SELECT top 5 p.product_name,
sum(f.sales_amount) as total_sales_prod
from gold.dim_products p
left join gold.fact_sales f
on p.product_key = f.product_key
group by p.product_name
order by sum(f.sales_amount) desc;








-- to display all key metrics of business  in one report
SELECT  'Total Sales' as measure_name,SUM(sales_amount) as measure_values from gold.fact_sales
union all
SELECT  'Total Qty' as measure_name,SUM(quantity) as measure_value from gold.fact_sales
union all
SELECT 'Total Price' as measure_name, SUM(price) as measure_value from gold.fact_sales
union all
SELECT 'Total Orders' as measure_name, count(distinct order_number) as measure_value from gold.fact_sales
union all
SELECT 'Avg Price' as measure_name, avg(price) as measure_value from gold.fact_sales





