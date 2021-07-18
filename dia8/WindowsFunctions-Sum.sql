--Windows Function SUM
-----Sum Normal
SELECT ShipCity,SUM(fREIGHT) AS TOTAL
	FROM Orders
	GROUP BY ShipCity

--Sum con Windows Function
select OrderID,ShipName,ShipCity,Freight,
	sum(Freight) over( PARTITION BY ShipCity ) as Gran_Total
	from Orders

