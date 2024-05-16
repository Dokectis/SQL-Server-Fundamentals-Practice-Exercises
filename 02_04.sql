-- file 02_04.sql
--  Video: Filtering on multiple conditions in SQL

use sandbox; -- Add this one to change to the databse by default


select 
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service


-------------------------------------------------------------------------------------------------
--find the rows for services that require no more than 6 participants and costs no more than $25 per person
-- Using AND operator
select 
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
WHERE min_participants <= 6 AND per_person_price <=25

--filter again to just show the catering services that meet the last criteria
-- Using multiples AND operators
-------------------------------------------------------------------------------------------------
select 
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
WHERE min_participants <= 6 
	AND per_person_price <=25
	AND srvc_name LIKE 'Catering%'

-------------------------------------------------------------------------------------------------
--find the rows for either catering services, gift baskets, or the Two Trees Tasting Party  
-- The Word (either) given us a idea about or. also the word 'or' Content in the question.


select 
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
WHERE srvc_name LIKE 'Catering%'
	OR srvc_name LIKE 'Gift%'
	OR srvc_name LIKE 'Two Trees Tasting Party'
	
	-- OR srvc_name LIKE 'Gift Basket%'
	-- OR srvc_name LIKE 'Two Trees Tasting Party'

-- The query returns a complete set of results from the table where the conditions are met.
-------------------------------------------------------------------------------------------------
--find the rows for services that cost less than $30 that are either catering or gift baskets

select 
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
WHERE per_person_price < 30
	AND ( srvc_name LIKE 'Catering%' OR srvc_name LIKE 'Gift%' )

-- OPT 2. (take care how organize the group by the request with combination of condictions "OR" , "AND")
select 
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
WHERE per_person_price < 30
	AND ( 
		srvc_name LIKE 'Catering%' 
		OR 
		srvc_name LIKE 'Gift%' 
		)	
-------------------------------------------------------------------------------------------------
-- END OF EXERCISE


