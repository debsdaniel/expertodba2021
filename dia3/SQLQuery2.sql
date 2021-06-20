
SELECT TOP 5 orderid, productid, quantity
 FROM [order details]
10248	11	12
10248	42	10
10248	72	5
10249	14	9
10249	51	40

SELECT TOP 5 orderid, productid, quantity
 FROM [order details]
 ORDER BY orderid,quantity DESC

SELECT top 1 country,city
 FROM suppliers
 ORDER BY country desc,CITY desc

SELECT TOP 5 orderid, productid, quantity
 FROM [order details]
 ORDER BY quantity DESC
10764	39	130
11072	64	130
10398	55	120
10451	55	120
10515	27	120
SELECT TOP 5 WITH TIES orderid, productid, quantity
 FROM [order details]
 ORDER BY quantity DESC