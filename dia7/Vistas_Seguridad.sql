SELECT * FROM dbo.MarcaView

CREATE TABLE Marca(
	id int IDENTITY(1,1) NOT null PRIMARY KEY,
	nombre nvarchar(50)
)
GO
CREATE VIEW MarcaView AS
	SELECT nombre FROM dbo.Marca m
GO

INSERT INTO dbo.MarcaView (nombre) VALUES ('DELL'),('CANNON'),('HP')

ALTER TABLE dbo.Marca ADD estado bit;

SELECT * FROM dbo.Marca m
UPDATE dbo.Marca
SET
    estado = 1

UPDATE dbo.MarcaView
SET
    estado = 0

alter VIEW MarcaView AS
	SELECT nombre AS nb,estado AS st FROM dbo.Marca m
GO

SELECT * FROM dbo.MarcaView mv

UPDATE dbo.MarcaView
SET
    estado = 0

CREATE TABLE Producto(
	id int identity(1,1) PRIMARY KEY,
	nombre nvarchar(50),
	id_marca int NOT NULL FOREIGN KEY REFERENCES Marca(id)
)

INSERT INTO dbo.Producto (nombre,id_marca)
VALUES (N'Producto1', 1),('Producto2',2),('Producto3',3)

CREATE VIEW ProductoList
AS
SELECT p.id,p.nombre,m.nombre AS marca
	FROM dbo.Producto p INNER JOIN dbo.Marca m
	ON p.id_marca = m.id

INSERT INTO dbo.ProductoList (id,nombre,marca)
VALUES (4,N'Producto4', 'Otra Marca')

INSERT INTO dbo.ProductoList (nombre,id_marca)
VALUES (N'Producto4',1)
GO
alter VIEW ProductoList
AS
SELECT p.id,p.nombre,p.id_marca,m.nombre AS marca
	FROM dbo.Producto p INNER JOIN dbo.Marca m
	ON p.id_marca = m.id

INSERT INTO dbo.ProductoList (nombre,id_marca)
VALUES (N'Producto4',1)

GO
alter VIEW ProductoList
AS
SELECT p.id,p.nombre,m.id AS id_marca,m.nombre AS marca
	FROM dbo.Producto p INNER JOIN dbo.Marca m
	ON p.id_marca = m.id
GO
SELECT * FROM dbo.ProductoList

INSERT INTO dbo.ProductoList (nombre,id_marca)
VALUES (N'Producto4',1)

GO
alter VIEW ProductoList
AS
SELECT p.nombre,p.id_marca,m.nombre AS marca
	FROM dbo.Producto p INNER JOIN dbo.Marca m
	ON p.id_marca = m.id

GO
INSERT INTO dbo.ProductoList (nombre,id_marca)
VALUES (N'Producto4',1)

GO
SELECT pl.* FROM dbo.ProductoList pl
alter VIEW ProductoList
AS
SELECT p.nombre,m.id as id_marca,m.nombre AS marca
	FROM dbo.Producto p INNER JOIN dbo.Marca m
	ON p.id_marca = m.id

INSERT INTO dbo.ProductoList (nombre)
VALUES (N'Producto5')

UPDATE dbo.ProductoList
SET
    dbo.ProductoList.nombre = N'Producto5'

alter VIEW ProductoList
AS
SELECT p.nombre AS nb,m.id as id_marca,m.nombre AS marca
	FROM dbo.Producto p INNER JOIN dbo.Marca m
	ON p.id_marca = m.id

UPDATE dbo.ProductoList
SET
    dbo.ProductoList.nb = N'Producto6'

SELECT * FROM dbo.Producto p

UPDATE dbo.ProductoList
SET
    marca = 'Otra Marca'

SELECT * FROM dbo.Marca m
