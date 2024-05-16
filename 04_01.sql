-- FILE: 04_01.sql
-- Video: Case statements
---------------------------------------------------------------------------------------------------------
use sandbox; -- to update the Database Name in this Query file or notebook.

declare @number int

select
	divisible = case	
		when @number % 2 = 0
			then 'divisible by 2'
		when @number % 3 = 0
			then 'divisible by 3'
		else 'does not meet the criteria'
	end
---------------------------------------------------------------------------------------------------------
-- add the concept to variable, scalar Variable 
-- Playing with the int value
-- WHEN CASE , Statement

declare @number int = 5867  -- ( Change here the value or number adn run it)

select
	divisible = case	
		when @number % 2 = 0
			then 'divisible by 2'
		when @number % 3 = 0
			then 'divisible by 3'
		else 'does not meet the criteria'
	end
	