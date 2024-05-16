-------------------------------------------------------------------------------------------------
-- file 03_04.sql
-- Data Exploration with Queries and where
-- Video: Subqueries
-------------------------------------------------------------------------------------------------
--give the names of all of the customers who live in Boston

SELECT  top 10 * FROM customer
SELECT  top 10 * FROM city_state_zip
-------------------------------------------------------------------------------------------------
-- In the EDA. Exploratory Data Analysis We Found the relation ship is Between 
-- customer table and city_state_zip_id table. using the id PK

SELECT * 
FROM customer c
--WHERE city_state_zip_id 

SELECT * 
FROM city_state_zip
WHERE city_name = 'Boston'  -- (9, 10)
-------------------------------------------------------------------------------------------------
-- We procce to create the relationship between the tables.
-- This reslve the question. using Subqueries

SELECT  c.full_name
FROM customer c
WHERE  city_state_zip_id IN (  
                            SELECT city_state_zip_id
                            FROM city_state_zip
                            WHERE city_name = 'Boston'
                         )


-- Bonus Track using the JOIN
-------------------------------------------------------------------------------------------------
SELECT  c.full_name
FROM customer c
INNER JOIN city_state_zip sn ON c.city_state_zip_id = sn.city_state_zip_id
WHERE sn.city_name = 'Boston'
-------------------------------------------------------------------------------------------------
-- Using CTE as a Subquery, Modern query way.
-- Reference https://www.sqlshack.com/sql-server-common-table-expressions-cte/
-- Need to run the all query

WITH CTE_CITY_ID AS -- RETURN THE ID FOR THE CITY REQUESTED, e.g.  Boston 
    ( 
    SELECT city_state_zip_id  -- (We pass the Columns requested or usefull for our proposal as a subset of data)
    FROM city_state_zip
    WHERE city_name = 'Boston' 
    )
SELECT  c.full_name  -- (We can add any Column from customer)
FROM customer c
INNER JOIN CTE_CITY_ID sn ON c.city_state_zip_id = sn.city_state_zip_id;

-- Also We can use the CTE result to pass the cities ID as query in the where.

WITH CTE_CITY_ID AS -- RETURN THE ID FOR THE CITY REQUESTED, e.g.  Boston 
    ( 
    SELECT city_state_zip_id
    FROM city_state_zip
    WHERE city_name = 'Boston' 
    )
SELECT  c.full_name
FROM customer c
WHERE  city_state_zip_id IN (  
                           SELECT * FROM CTE_CITY_ID
                         );



