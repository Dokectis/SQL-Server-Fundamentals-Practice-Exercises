-- FILE: 04_01_B.sql
-- Video: Built-in functions
---------------------------------------------------------------------------------------------------------
USE sandbox; -- to update the Database Name in this Query file or notebook. ()

---------------------------------------------------------------------------------------------------------
--CAST([column name] AS [data type]) |  CAST   is the ANSI standart
--CONVERT([data type], [column name], [style number (optional)])

select
	f.flavor_name
	,pt.product_type
	,p.price --Price as is
	,cast_price = cast(p.price as int) -- price cast to Int
	,convert_price = convert(decimal(6,3), p.price) -- price  with three decimals
from dbo.product p
inner join dbo.oil_flavor f
	on p.flavor_id = f.flavor_id
inner join dbo.product_type pt
	on p.product_type_id = pt.product_type_id








---------------------------------------------------------------------------------------------------------
--CONCAT([string],[string],[string]...) or [string] + [string]
-- declare @price_prefix varchar(20) in this way  is going to check null

declare @price_prefix varchar(20) = '$'

select
	f.flavor_name
	,pt.product_type
	,p.price
	,dollar_sign = @price_prefix + CAST(p.price as varchar(10))
	,concat_price = concat(@price_prefix,p.price)
from dbo.product p
inner join dbo.oil_flavor f
	on p.flavor_id = f.flavor_id
inner join dbo.product_type pt
	on p.product_type_id = pt.product_type_id








---------------------------------------------------------------------------------------------------------
--FORMAT([column name],'[custom format]') or FORMAT([column name], [format code], [culture code])
select
	f.flavor_name
	,pt.product_type
	,p.price
	,format_price = FORMAT(p.price,'C','en-US')
	,format_price2 = FORMAT(p.price,'C','en-GB') -- I add GB as a New Columns to see the <>
from dbo.product p
inner join dbo.oil_flavor f
	on p.flavor_id = f.flavor_id
inner join dbo.product_type pt
	on p.product_type_id = pt.product_type_id
---------------------------------------------------------------------------------------------------------
-- FORMAT the date
select 
	c.full_name
	,o.order_date
	,format_order_date = format(o.order_date,'MMM dd, yyyy')
from dbo.product_order o
inner join dbo.customer c
	on o.customer_id = c.customer_id
---------------------------------------------------------------------------------------------------------




---------------------------------------------------------------------------------------------------------
-- Timestamp - this one return the current date and time

SELECT GETDATE() , SYSDATETIME()








---------------------------------------------------------------------------------------------------------
--DATEADD([interval],[number],[date value])  (Original)
select 
	c.full_name,
	o.order_date
from dbo.product_order o
inner join dbo.customer c
	on o.customer_id = c.customer_id
where o.order_date > dateadd(month,-1,sysdatetime())


-- ModiFY
--DATEADD([interval],[number],[date value])
SELECT DATEADD(MONTH, - 1, SYSDATETIME()) --  ()WITH NEGATIVE IS GOING TO SHOW ONE MONTH BEHIND , ONE MONTH ago. (SUSB ONE MONTH)
-- tHIS eXERCISE NEED TO CHECK
select 
	c.full_name,
	o.order_date
from dbo.product_order o
inner join dbo.customer c
	on o.customer_id = c.customer_id
where o.order_date > dateadd(month,-1,sysdatetime())

---------------------------------------------------------------------------------------------------------
--COALESCE([first choice],[second choice],[third choice]...)
--ISNULL([first choice],[second choice])
/*declare @override int

select
	srvc_name
	,min_participants
	--,isnull_participants = ISNULL(min_participants,0)
	--,coalesce_participants = coalesce(min_participants,@override,0)
	--,coalesce_participants = coalesce(min_participants,@override,'n/a')
from dbo.additional_service
*/
	

-- MODIFICATION:
--COALESCE([first choice],[second choice],[third choice]...)
--ISNULL([first choice],[second choice])

-- Need to check the the datatype
-- Look in MS Doc  for Scalar Functions for SQL SERVER

declare @override int = 500

select
	srvc_name
	,min_participants
	,isnull_participants = ISNULL(min_participants,0)
	,coalesce_participants = coalesce(min_participants,@override,0)
	,coalesce_participants = coalesce(min_participants,@override,'n/a')
from dbo.additional_service


