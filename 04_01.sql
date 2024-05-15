declare @number int

select
	divisible = case	
		when @number % 2 = 0
			then 'divisible by 2'
		when @number % 3 = 0
			then 'divisible by 3'
		else 'does not meet the criteria'
	end