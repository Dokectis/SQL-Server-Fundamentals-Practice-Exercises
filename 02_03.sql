-------------------------------------------------------------------------------------------------
-- file 02_03.sql
-- Data Exploration with Queries and where
-- Video: Filtering on a single condition in SQL
-------------------------------------------------------------------------------------------------

use sandbox; -- Add this one to change to the databse by default.
-------------------------------------------------------------------------------------------------
-- find the rows FOR THE SELECTED COLUMNS IN THE TABLE. 

select
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service


-------------------------------------------------------------------------------------------------
--find the rows where the service name is 'Catering - Lunch'

select
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
where srvc_name = 'Catering - Lunch'


-------------------------------------------------------------------------------------------------
--find the rows where the service name is not 'Catering - Lunch'
-- 1. Option
select
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
where srvc_name != 'Catering - Lunch'

-- 2. Option

select
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
where srvc_name <> 'Catering - Lunch'


-------------------------------------------------------------------------------------------------
--find the rows where the service name is 'Gift Basket Delivery - Small', 'Gift Basket Delivery - Medium', or 'Gift Basket Delivery - Large'

select
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
where srvc_name IN ('Gift Basket Delivery - Small', 'Gift Basket Delivery - Medium', 'Gift Basket Delivery - Large')
-------------------------------------------------------------------------------------------------
--find the rows where the service name is not 'Gift Basket Delivery - Small', 'Gift Basket Delivery - Medium', or 'Gift Basket Delivery - Large'

select
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
where srvc_name NOT IN ('Gift Basket Delivery - Small', 'Gift Basket Delivery - Medium', 'Gift Basket Delivery - Large')

-------------------------------------------------------------------------------------------------
--find the rows where the service name starts with 'Gift Basket Delivery'

select
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
where srvc_name IN ('Gift Basket Delivery - Small', 'Gift Basket Delivery - Medium', 'Gift Basket Delivery - Large')


-------------------------------------------------------------------------------------------------
--find the rows where the service name contains 'Party'

select
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
where srvc_name LIKE '%Party%'


-------------------------------------------------------------------------------------------------
--find the rows where the service name does not start with 'Gift Basket Delivery'

select
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
where srvc_name LIKE 'Gift Basket Delivery%'
-------------------------------------------------------------------------------------------------
--find the rows where the price per person is between $75 and $125

select
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
where per_person_price BETWEEN 75 AND 125
-------------------------------------------------------------------------------------------------
--find the rows where the price per person is less than $75

select
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
where per_person_price < 75
-------------------------------------------------------------------------------------------------
--find the rows where the price per person is $125 or more

select
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
where per_person_price >= 125

-------------------------------------------------------------------------------------------------
--when are NULL values returned?

select
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
where min_participants is NULL
-------------------------------------------------------------------------------------------------
-- To avoid the Columns with null Values, when We know the Columns that are having Null

select
	srvc_name,
	min_participants,
	per_person_price
from dbo.additional_service
-------------------------------------------------------------------------------------------------
-- END OF EXERCISE
-- Bonus
/* 
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'additional_service';
*/
-- To add IN THE DATABASE , We Want to know if the table "XX" has Any column with NULLS, VALUE.
-- The initial recommendations it's to check Column by Column but, for Small tables,
-- please don't try to kill the db. with Heavy queries.

-- This result is going to show the rows in the table that has NUll or NULLS.

/*
DECLARE @sql NVARCHAR(MAX) = N'';
SELECT @sql = @sql + N' OR [' + COLUMN_NAME + '] IS NULL'
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'additional_service';

SET @sql = N'SELECT * FROM additional_service WHERE ' + SUBSTRING(@sql, 5, LEN(@sql));

EXEC sp_executesql @sql; 

*/