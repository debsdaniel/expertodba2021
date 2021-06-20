USE northwind
SELECT  (firstname + ' ' + lastname) AS name        ,city, postalcode,title
 FROM employees
UNION
SELECT companyname, city, postalcode,customerid
 FROM customers
GO

select * from employees

USE northwind
SELECT productname AS products,
       unitprice AS price,
       (unitprice * 1.1) AS tax
--INTO #pricetable
FROM products
select * from #pricetable

