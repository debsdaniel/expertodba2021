USE Northwind;
GO

WITH CteUsa AS
(
SELECT c.CustomerID,c.ContactName
	from dbo.Customers c
	WHERE c.Country = 'USA'
)
SELECT * FROM CteUsa cu

SELECT *
from (SELECT c.CustomerID,c.ContactName
	from dbo.Customers c
	WHERE c.Country = 'USA') c

--Alias
WITH c as
(
	select year(o.OrderDate) AS orderyear,o.CustomerId
		from orders o
)
SELECT orderyear,count( distinct CustomerId) AS Conteo
	from c
	GROUP BY orderyear

GO
WITH c (orderyear,CustomerId) as
(
	select year(o.OrderDate),o.CustomerId
		from orders o
)
SELECT orderyear,count( DISTINCT CustomerId) AS Conteo
	from c
	GROUP BY orderyear
