-------------------------------------------------------------------------------------------------
-- file 03_01.sql
-- Data Exploration with Queries and where
-- Video: Inner joins
-------------------------------------------------------------------------------------------------

--product ID (product)
--flavor ID (product/oil_flavor)
--flavor name (oil_flavor)
--price (product)

-------------------------------------------------------------------------------------------------
-- EVALUATE EACH TABLE 
SELECT * FROM DBO.product
SELECT * FROM DBO.oil_flavor
-------------------------------------------------------------------------------------------------
-- RETURNING ALL COLUMNS USING THE INNER JOIN, Columns from both tables P adn F 
SELECT * 
FROM dbo.product P
INNER JOIN dbo.oil_flavor F
        ON P.flavor_id = F.flavor_id

-------------------------------------------------------------------------------------------------
-- Sellecting a specify columns , use Alias to avoid Ambiguos error

SELECT  p.product_id,
        F.flavor_id,
        F.flavor_name,
        P.price
FROM dbo.product P
INNER JOIN dbo.oil_flavor F
        ON P.flavor_id = F.flavor_id



