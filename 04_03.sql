-- FILE: 04_03.sql
-- Video: Built-in functions
---------------------------------------------------------------------------------------------------------
USE sandbox; -- to update the Database Name in this Query file or notebook. ()
---------------------------------------------------------------------------------------------------------
select *  -- ORIGINAL
from dbo.customer c
inner join dbo.product_order o
	on c.customer_id = o.customer_id
---------------------------------------------------------------------------------------------------------
-- WORKING- Group by 

select  COUNT(*) , c.full_name
from dbo.customer c
inner join dbo.product_order o
	on c.customer_id = o.customer_id
GROUP BY C.full_name


-- Sum  Total amount spend by customer 

SELECT   c.full_name, SUM(o.order_total) as Total_spend_by_customer
from dbo.customer c
inner join dbo.product_order o
	on c.customer_id = o.customer_id
GROUP BY C.full_name


-- We ge the highest value in order total per Year, per Customer
-- Check for Agreagete Functions 

SELECT   c.full_name,
		 yr = year(o.order_date),
		 highest_order_total =MAX(o.order_total) 
from dbo.customer c
inner join dbo.product_order o
	on c.customer_id = o.customer_id
GROUP BY c.full_name , year(o.order_date)