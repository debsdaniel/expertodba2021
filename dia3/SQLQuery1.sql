USE northwind
SELECT productid, productname, categoryid, unitprice
 FROM products
 ORDER BY categoryid, unitprice DESC
GO


--DISTINCT
--USE northwind
SELECT --DISTINCT country
	distinct country,city
 FROM suppliers
 ORDER BY country,CITY
GO
select * from suppliers

/*insert into suppliers(CompanyName,Country,City) 
	values ('Bigfoot Breweries','Francia','Paris')
*/
select * from suppliers where country = 'Francia'
--update suppliers set country='France' where country = 'Francia'
SELECT  firstname, lastname
     ,'Número de identificación:', employeeid
FROM employees
select 'sucursal 2' as sucursal,firstname from employees
union all
select 'sucursal 2',firstname from employees