--return the full_name and spending tier for orders placed after 8/1/2020 by customers in CA
--spending tier '1 - low' = order less than $20
--spending tier '2 - medium' = order total between $20 and $100
--spending tier '3 - high' = order total higher than $100
--else = '0 - no recent orders'

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

