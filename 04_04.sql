select 
	c.full_name,
	order_count = count(*)
from dbo.customer c
inner join dbo.product_order o
	on c.customer_id = o.customer_id
group by c.full_name