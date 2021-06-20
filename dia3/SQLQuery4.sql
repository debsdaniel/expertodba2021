--ROLLUP
USE northwind
SELECT ShipCountry,EmployeeID,shipcity,COUNT(OrderID)
    FROM Orders
    GROUP BY ShipCountry,EmployeeID,shipcity
    WITH ROLLUP
    ORDER BY ShipCountry,EmployeeID,shipcity


select ShipCountry,EmployeeID,* from orders

--CUBE
SELECT ShipCountry,ShipCity,COUNT(OrderID)
    FROM Orders
    GROUP BY ShipCountry,ShipCity
    WITH CUBE
    ORDER BY ShipCountry,ShipCity

--GROUPING
SELECT ShipCountry,EmployeeID,
    GROUPING(ShipCountry) as pais,
    GROUPING(EmployeeID) as emp,
	COUNT(OrderID)
    FROM Orders
    GROUP BY ShipCountry,EmployeeID
    WITH ROLLUP
    ORDER BY ShipCountry,EmployeeID


--GROUPING ROLLUP,HAVING
SELECT ShipCountry,EmployeeID,
    GROUPING(ShipCountry) as pais,
    GROUPING(EmployeeID) as emp,
    COUNT(OrderID)
    FROM Orders
    GROUP BY ShipCountry,EmployeeID
    WITH CUBE
    HAVING ShipCountry IS NULL --OR EmployeeID IS NULL
    ORDER BY ShipCountry,EmployeeID


SELECT ShipCountry,EmployeeID,ORDERID,*
    FROM Orders
	ORDER BY ShipCountry,EmployeeID
	COMPUTE SUM(ORDERID)

SELECT ShipCountry,EmployeeId
FROM orders
ORDER BY ShipCountry,EmployeeId
--COMPUTE SUM(orderid) by employeeid

select @@version