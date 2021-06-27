--Sub Consulta como Tabla Derivada
use northwind
go
select T.orderid,T.customerId
	from (
		select o.orderid,o.customerid
			from Orders as O 
			where O.customerid like 'A%') as T
	where T.customerid like '%R'

select T.orderid,T.customerId
from (select o.orderid,o.customerid	from Orders as O where O.customerid like 'A%') as T
where T.customerid like '%R'

--Sub Consulta como Expresión
USE pubs
SELECT title, price
     ,(SELECT AVG(price) FROM titles) AS average
     ,price-(SELECT AVG(price) FROM titles) AS difference
 FROM titles
 WHERE type='popular_comp'
GO
--Consulta Optimizada
USE pubs
declare @promedio numeric(14,2)
select @promedio = AVG(price) FROM titles
select title,price,@promedio as average,
	price -@promedio as difference
	from titles
	WHERE type='popular_comp'
--
GO
USE pubs
declare @promedio numeric(14,2)
select @promedio = AVG(price) FROM titles
select t.title,t.price,@promedio as average,
	t.price -@promedio as difference
	from (select * from titles
	WHERE type='popular_comp' ) as t

--Sub Consultas Correlacionadas
USE northwind
SELECT orderid, customerid
 FROM orders AS or1
 WHERE 20 < (SELECT quantity
             FROM [order details] AS od
             WHERE or1.orderid = od.orderid
              AND  od.productid = 23)

select * from [Order Details]
	where orderid=10337 and productid=23

--SubConsultas simulación JOIN
USE pubs
SELECT DISTINCT t1.type
 FROM titles AS t1
 WHERE t1.type IN
   (SELECT t2.type
     FROM titles AS t2
     WHERE t1.pub_id <> t2.pub_id)
GO

--Simulación Having (Sub Consultas)
USE pubs
SELECT t1.type, t1.title, t1.price
 FROM titles AS t1
 WHERE t1.price > ( SELECT AVG(t2.price)  FROM titles AS t2
                     WHERE t1.type = t2.type )
GO
USE pubs
SELECT t1.type, t1.title, t1.price
 FROM titles AS t1
 INNER JOIN titles AS t2  ON t1.type = t2.type
 GROUP BY t1.type, t1.title, t1.price
  HAVING t1.price > AVG(t2.price)
GO
---EXISTS  / NOT EXISTS
USE northwind
SELECT lastname, employeeid
 FROM employees AS e
 WHERE EXISTS (SELECT * FROM orders AS o
                WHERE e.employeeid = o.employeeid
                 AND  o.orderdate = '19970905')
GO
SELECT distinct E.lastname, E.employeeid--,O.ORDERID
	FROM EMPLOYEES E 
		INNER JOIN ORDERS O ON e.employeeid = o.employeeid
	--WHERE o.orderdate = '19970905'


