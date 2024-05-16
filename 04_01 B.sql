-- FILE: 04_01_B.sql
-- Video: Case statements, Part 2
---------------------------------------------------------------------------------------------------------
use sandbox; -- to update the Database Name in this Query file or notebook.

-- Rquest:
--return the full_name and spending tier for orders placed after 8/1/2020 by customers in CA (CALIFORNIA)
--spending tier '1 - low' = order less than $20
--spending tier '2 - medium' = order total between $20 and $100
--spending tier '3 - high' = order total higher than $100
--else = '0 - no recent orders'

-- Initial EDA , check Each table for your case
---------------------------------------------------------------------------------------------------------
SELECT TOP 2 * FROM dbo.customer c
SELECT TOP 2 * FROM dbo.product_order po
SELECT TOP 2 * FROM city_state_zip

-- qyery as is
select
	c.full_name,
	po.order_total
from dbo.customer c
 join dbo.product_order po
	on c.customer_id = po.customer_id
where c.city_state_zip_id in (
	select z.city_state_zip_id
	from dbo.city_state_zip z
	where z.state_name = 'California'
	)

---------------------------------------------------------------------------------------------------------
-- Implement the Column with the Business logic (Requirement) requested.

select
	c.full_name,
	po.order_total,
	spending_tier = CASE
						WHEN po.order_total < 20 THEN '1 - low'
						WHEN po.order_total between 20  and 100 THEN '1 - medium'
						WHEN po.order_total > 100 THEN '1 - high'
				    ELSE '0 - no recent orders'
				    END
from dbo.customer c
 join dbo.product_order po
	on c.customer_id = po.customer_id
	AND po.order_date > '8/1/2020'
where c.city_state_zip_id in (
	select z.city_state_zip_id
	from dbo.city_state_zip z
	where z.state_name = 'California'
	)


---------------------------------------------------------------------------------------------------------
-- Implement the ordering and Distinct to avoi duplicates

select
	DISTINCT
	c.full_name,
	po.order_total,
	spending_tier = CASE
						WHEN po.order_total < 20 THEN '1 - low'
						WHEN po.order_total between 20  and 100 THEN '1 - medium'
						WHEN po.order_total > 100 THEN '1 - high'
				    ELSE '0 - no recent orders'
				    END
from dbo.customer c
 join dbo.product_order po
	on c.customer_id = po.customer_id
	AND po.order_date > '8/1/2020'
where c.city_state_zip_id in (
	select z.city_state_zip_id
	from dbo.city_state_zip z
	where z.state_name = 'California'
	)
ORDER BY C.full_name DESC 

-- ORDER BY C.full_name ASC  -- try this one as well.
-- order by 1    -- This is base in the Columns order that are returning, In the Select (1,2,3)



---------------------------------------------------------------------------------------------------------
-- Exercise: for future implement testing to check the Request.
