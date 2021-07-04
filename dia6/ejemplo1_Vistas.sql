CREATE VIEW dbo.OrderSubtotalsView1 --(OrderID, Subtotal)
AS
SELECT OD.OrderID,OD.ProductID, OD.UnitPrice, OD.Quantity, OD.Discount
--OD.OrderID
 --SUM(CONVERT(money,(OD.UnitPrice*Quantity*(1-Discount)/100))*100)
FROM [Order Details] OD
--GROUP BY OD.OrderID
--ORDER BY OD.OrderID
GO
SELECT * FROM dbo.Categories c
SELECT * FROM dbo.OrderSubtotalsView1 osv
GO
-----
USE Northwind
GO
CREATE VIEW dbo.ShipStatusView
AS
SELECT OrderID, ShippedDate, ContactName
FROM Customers c INNER JOIN Orders o   ON c.CustomerID = O.CustomerID
WHERE RequiredDate < ShippedDate
GO
SELECT * FROM dbo.ShipStatusView ssv WHERE ssv.ContactName LIKE 'M%' ORDER BY ssv.OrderID

GO
USE Northwind
GO
CREATE VIEW dbo.[Order Subtotals encriptada]   WITH ENCRYPTION
AS
SELECT OrderID, Sum(CONVERT(money,(UnitPrice*Quantity*(1-Discount)/100))*100)   AS Subtotal
FROM [Order Details]
GROUP BY OrderID
GO

SELECT * FROM dbo.[Order Subtotals encriptada]
select * from syscomments WHERE text LIKE '%enc%'
GO
-----
ALTER VIEW dbo.[Order Subtotals encriptada]
AS
SELECT OrderID 
FROM [Order Details]
-----
GO