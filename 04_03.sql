select *
from dbo.customer c
inner join dbo.product_order o
	on c.customer_id = o.customer_id
