USE DB_EXPERTODBA
GO

--Agregar Campo Activo de Tipo Bit en tabla Marca
ALTER TABLE Marca ADD Activo BIT;
--ALTER TABLE Marca ALTER COLUMN Activo BIT DEFAULT 1;
GO

--Crear Tabla Tipo
--DROP TABLE Tipo
CREATE TABLE Tipo(
	id int identity(1,1) PRIMARY KEY NOT NULL,
	nombre nvarchar(50),
	activo BIT Default 1
)
GO
/*
Fecha: 20210620-1646
Autor: Yo
*/
CREATE PROCEDURE sp_Tipo_Guardar(
	@id int=-1,
	@nombre nvarchar(50)
) AS
BEGIN
	DECLARE @id_tmp INT
	SET @ID_TMP = @ID
	IF @ID=-1
	BEGIN
		INSERT INTO Tipo (nombre) values (@nombre)
		SET @id_tmp =  @@IDENTITY
		--SELECT IDENT_CURRENT('Marca')
	END
	ELSE
	BEGIN
		UPDATE Tipo SET nombre=@nombre WHERE id=@id
	END
	SELECT @id_tmp
END
go
EXEC sp_Tipo_Guardar -1,'PERIFERICO'
EXEC sp_Tipo_Guardar -1,'PARTES'
GO
/*
Fecha: 20210620-1654
Autor: Yo
*/
CREATE PROCEDURE sp_Tipo_Devolver(
 @id int = null
) AS
BEGIN
	IF @ID IS NULL
	BEGIN
		SELECT * FROM Tipo ORDER BY ID
	END
	ELSE
	BEGIN
		SELECT * FROM Tipo WHERE ID=@ID
	END
END
go
EXEC sp_Tipo_Devolver
EXEC sp_Tipo_Devolver 1
GO
/**** Productos *****/
CREATE TABLE Productos(
	ID int identity(1,1) not null PRIMARY KEY,
	Nombre nvarchar(50) not null,
	IdTipo int FOREIGN KEY REFERENCES Tipo(Id),
	Codigo nvarchar(50) not null,
	Codigo_Barra nvarchar(150),
	IdMarca int FOREIGN KEY REFERENCES Marca(Id),
	Activo bit Default 1
)
GO
/*
Fecha: 20210620-1636
Autor: Yo
*/
CREATE PROCEDURE sp_Producto_Guardar(
	@id int=-1 output,
	@Nombre nvarchar(50),
	@IdTipo int,
	@Codigo nvarchar(50),
	@Codigo_Barra nvarchar(150)=null,
	@IdMarca int
) AS
BEGIN
	DECLARE @id_tmp INT
	SET @ID_TMP = @ID
	IF @ID=-1
	BEGIN
		INSERT INTO Productos (nombre,idtipo,codigo,codigo_barra,idmarca)
			values (@Nombre,@idTipo,@codigo,@codigo_barra,@idMarca)
		--SET @id_tmp =  @@IDENTITY
		SET @id_tmp = IDENT_CURRENT('Productos')
		SET @id = @id_tmp
	END
	ELSE
	BEGIN
		UPDATE Productos SET
			nombre=@nombre,idtipo = @idtipo,
			codigo = @codigo,codigo_barra = @codigo_barra,
			idmarca = @idMarca
			WHERE id=@id
	END
END
GO
EXEC sp_Producto_Guardar @id=-1,@nombre='Teclado',@idtipo = 1,
		@codigo='123',@idmarca = 1
EXEC sp_Producto_Guardar -1,'Mouse',1,'321',null,1
--
GO
CREATE PROCEDURE sp_Productos_Devolver(
 @id int = null
) AS
BEGIN
	IF @ID IS NULL
	BEGIN
		SELECT * FROM Productos ORDER BY ID
	END
	ELSE
	BEGIN
		SELECT * FROM Productos WHERE ID=@ID
	END
END
go
EXEC sp_Productos_Devolver
go
CREATE PROCEDURE sp_Productos_Inactivar
(
@id int,@estado bit = 0
) as
BEGIN
	BEGIN TRAN
	BEGIN TRY
		UPDATE Productos SET activo = @estado
			WHERE id = @ID
		COMMIT
	END TRY
	BEGIN CATCH
		PRINT('Error actualizando')
		ROLLBACK	
	END CATCH
END
GO
exec sp_Productos_Inactivar 1
exec sp_Productos_Devolver 1
exec sp_Productos_Inactivar 1,1
exec sp_Productos_Devolver 1