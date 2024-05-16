--get the full name and order total for every customer named in Sydney
-------------------------------------------------------------------------------------------------
-- file 03_03.sql
-- Data Exploration with Queries and where
-- Video: Outer joins
-------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------
-- EVALUATE EACH TABLE 
SELECT  top 10 * FROM customer
SELECT top 10 * FROM product_order

-------------------------------------------------------------------------------------------------
-- EVALUATE all Columns
SELECT *
FROM customer c
LEFT OUTER JOIN  product_order po
    ON c.customer_id = po.customer_id
 WHERE c.first_name = 'Sydney'  

-------------------------------------------------------------------------------------------------
-- EVALUATE all Columns

SELECT c.full_name,
po.order_total
FROM customer c
LEFT OUTER JOIN  product_order po
    ON c.customer_id = po.customer_id
 WHERE c.first_name = 'Sydney'  

-- Just Customer that have Orders ( Eliminate the nulls)
 SELECT c.full_name,
po.order_total
FROM customer c
LEFT OUTER JOIN  product_order po
    ON c.customer_id = po.customer_id
 WHERE c.first_name = 'Sydney'  
 AND order_total IS NOT NULL

 -- In the video, She look for the all customer taht Does not have orders yet.  order_total is null

--end exercise
-------------------------------------------------------------------------------------------------
-- EVALUATE total by Customer This case,"Sydney"

SELECT c.full_name,
        sum(po.order_total) as Total_order_by_Customer
FROM customer c
LEFT OUTER JOIN  product_order po
    ON c.customer_id = po.customer_id
 WHERE c.first_name = 'Sydney'  
GROUP BY c.full_name
