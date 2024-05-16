-- FILE: 04_04.sql
-- Video: Query processing order
---------------------------------------------------------------------------------------------------------
USE sandbox; -- to update the Database Name in this Query file or notebook. ()

---------------------------------------------------------------------------------------------------------
-- Query processing order (PRIORITY OF EXECUTION IN THE QUERY)
-- 
-- 1. FROM + JOINS
-- 2. WHERE
-- 3. GROUP BY   (4.Having) When is requiered
-- 4. SELECT
-- 5. ORDER BY
-- 6. TOP 
---------------------------------------------------------------------------------------------------------

select 
	c.full_name,
	order_count = count(*)
from dbo.customer c
inner join dbo.product_order o
	on c.customer_id = o.customer_id
group by c.full_name
order by c.full_name  -- or We can use  the order alias e.g. order_count


--  for special case we need to include the  positions  4. are Having
-- clause should be used to filter conditions involving the results of an aggregate function
select 
	customer_name = c.full_name,
	order_count = SUM(o.order_total)
from dbo.customer c
inner join dbo.product_order o
	on c.customer_id = o.customer_id
group by c.full_name
HAVING SUM(o.order_total) > 500


