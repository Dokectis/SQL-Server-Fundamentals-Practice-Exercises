-------------------------------------------------------------------------------------------------
-- file 03_02.sql
-- Data Exploration with Queries and where
-- Video: Multiple inner joins
-------------------------------------------------------------------------------------------------
--product ID (product)
--flavor ID (product/oil_flavor)
--flavor name (oil_flavor)
--price (product)

--ADD
--product type ID 
--product type
-------------------------------------------------------------------------------------------------
-- Step 01 add the new table and the Columns requested
select 
	p.product_id,
	f.flavor_id,
	f.flavor_name,
	p.price,
	pt.* -- initial We Return the all columns from the table product_type pt
from dbo.product p
inner join dbo.oil_flavor f
	on p.flavor_id = f.flavor_id
inner join dbo.product_type pt
	on p.product_type_id = pt.product_type_id
-------------------------------------------------------------------------------------------------
-- Step 02 Just retuirning the Columns that are requested.
	select 
	p.product_id,
	f.flavor_id,
	f.flavor_name,
	p.price,
	pt.product_type_id,
	pt.product_type
from dbo.product p
inner join dbo.oil_flavor f
	on p.flavor_id = f.flavor_id
inner join dbo.product_type pt
	on p.product_type_id = pt.product_type_id

-------------------------------------------------------------------------------------------------
-- Step 03 : just Returning the rows for the product_type = Case

	select 
	p.product_id,
	f.flavor_id,
	f.flavor_name,
	p.price,
	pt.product_type_id,
	pt.product_type
from dbo.product p
inner join dbo.oil_flavor f
	on p.flavor_id = f.flavor_id
inner join dbo.product_type pt
	on p.product_type_id = pt.product_type_id
WHERE product_type = 'Case'


-------------------------------------------------------------------------------------------------
-- In a Big Tables, is better to include the Where (Filter) at the beginning to reduce the time to response
-- the query 