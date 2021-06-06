USE northwind
GO
SELECT AVG (unitprice) AS AvgPrice FROM products

select * from products
--UnitPrice  - Promedio    - avgPrice
--UnitsInStock - Promedio   - avgStock
--Total UnitPrice * UnitsInStock - avgTotal = avgPrice * avgStock
--UnitPrice, UnitsInStock, Total
--select avgPrice,avgStock,avgTotal
Declare @avgPrice numeric(20,2),@avgStock smallint,@avgTotal numeric(20,2)

--SELECT @avgPrice=avg(UnitPrice)	FROM products
--SELECT @avgStock=avg(UnitsInStock)	FROM products
SELECT @avgPrice=avg(UnitPrice),@avgStock=avg(UnitsInStock)	FROM products

SET @avgTotal = @avgPrice * @avgStock
SELECT @avgPrice,@avgStock,@avgTotal
