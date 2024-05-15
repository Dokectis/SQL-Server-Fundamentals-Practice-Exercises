
--CAST([column name] AS [data type])
--CONVERT([data type], [column name], [style number (optional)])
select
	f.flavor_name
	,pt.product_type
	,p.price
	--,cast_price = cast(p.price as int),
	--,convert_price = convert(decimal(6,3), p.price)
from dbo.product p
inner join dbo.oil_flavor f
	on p.flavor_id = f.flavor_id
inner join dbo.product_type pt
	on p.product_type_id = pt.product_type_id









--CONCAT([string],[string],[string]...) or [string] + [string]
declare @price_prefix varchar(20) = '$'

select
	f.flavor_name
	,pt.product_type
	,p.price
	--,dollar_sign = @price_prefix + p.price
	--,concat_price = concat(@price_prefix,p.price)
from dbo.product p
inner join dbo.oil_flavor f
	on p.flavor_id = f.flavor_id
inner join dbo.product_type pt
	on p.product_type_id = pt.product_type_id










--FORMAT([column name],'[custom format]') or FORMAT([column name], [format code], [culture code])
select
	f.flavor_name
	,pt.product_type
	,p.price
	--,format_price = FORMAT(p.price,'C','en-US')
from dbo.product p
inner join dbo.oil_flavor f
	on p.flavor_id = f.flavor_id
inner join dbo.product_type pt
	on p.product_type_id = pt.product_type_id


select 
	c.full_name
	,o.order_date
	--,format_order_date = format(o.order_date,'MMM dd, yyyy')
from dbo.product_order o
inner join dbo.customer c
	on o.customer_id = c.customer_id






--GETDATE() or SYSDATETIME()









--DATEADD([interval],[number],[date value])
select 
	c.full_name,
	o.order_date
from dbo.product_order o
inner join dbo.customer c
	on o.customer_id = c.customer_id
where o.order_date > dateadd(month,-1,sysdatetime())








--COALESCE([first choice],[second choice],[third choice]...)
--ISNULL([first choice],[second choice])
declare @override int

select
	srvc_name
	,min_participants
	--,isnull_participants = ISNULL(min_participants,0)
	--,coalesce_participants = coalesce(min_participants,@override,0)
	--,coalesce_participants = coalesce(min_participants,@override,'n/a')
from dbo.additional_service

	


