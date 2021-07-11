---USANDO VISTAS PARA MODIFICAR DATA
CREATE TABLE Marca(
	id int IDENTITY(1,1) NOT null PRIMARY KEY,
	nombre nvarchar(50)
)
GO
CREATE VIEW MarcaView AS
	SELECT nombre FROM dbo.Marca m
GO
SELECT * FROM dbo.MarcaView mv

INSERT INTO dbo.MarcaView (nombre) VALUES ('DELL'),('CANNON'),('HP')
SELECT * FROM dbo.Marca m
GO
UPDATE dbo.MarcaView
SET
    dbo.MarcaView.nombre = N'CANON' 
	WHERE nombre = 'CANNON'
GO
CREATE VIEW dbo.[Order Subtotals 2]
AS
SELECT OrderID, Sum(CONVERT(money,(UnitPrice*Quantity*(1-Discount)/100))*100)   AS Subtotal
FROM [Order Details]
GROUP BY OrderID
GO
INSERT INTO dbo.[Order Subtotals 2] (OrderID,Subtotal) VALUES (25,54877)

INSERT INTO dbo.Marca (nombre)
SELECT orderid FROM dbo.[Order Subtotals 2] AS v WHERE v.Subtotal >= 2490
SELECT * FROM dbo.MarcaView mv
------
GO
----
alter VIEW MarcaView AS
	SELECT descripcion FROM dbo.Marca m
GO

ALTER TABLE dbo.Marca ADD descripcion nvarchar(50)
GO
------
alter VIEW MarcaView AS
	SELECT nombre FROM dbo.Marca m
GO
ALTER TABLE dbo.Marca DROP COLUMN descripcion;
GO
DROP TABLE dbo.Marca
SELECT * FROM dbo.MarcaView mv

