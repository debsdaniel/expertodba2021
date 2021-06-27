--script creación del proyecto
/*
DDL : Crear Objetos : Data Definition Language : Lenguaje de Defición de Datos
DML : Operar Registros:  Data Managment Language : Lenguaje de Manejo de Datos
DCL : Permisos a Objetos:  Data Control Language : Lenguaje de Control de Datos
*/
CREATE DATABASE DB_EXPERTODBA
GO
USE DB_EXPERTODBA
GO

--Crear Tabla Marca
--DROP TABLE Marca
CREATE TABLE Marca(
	id int identity(1,1) PRIMARY KEY NOT NULL,
	nombre nvarchar(50)
)
GO
/*
3 STORE PROCEDURE:
 1 - INSERT/UPDATE  CU
 2 - CONSULTAR 1/TODOS  R
 3 - BORRAR  D
*/

/*
Fecha: 20210613-1646
Autor: Yo
*/
CREATE PROCEDURE sp_Marca_Guardar(
	@id int=-1,
	@nombre nvarchar(50)
) AS
BEGIN
	DECLARE @id_tmp INT
	SET @ID_TMP = @ID
	IF @ID=-1
	BEGIN
		INSERT INTO Marca (nombre) values (@nombre)
		SET @id_tmp =  @@IDENTITY
		--SELECT IDENT_CURRENT('Marca')
	END
	ELSE
	BEGIN
		UPDATE Marca SET nombre=@nombre WHERE id=@id
	END
	SELECT @id_tmp
END
go
EXEC sp_Marca_Guardar -1,'GENIUS'
EXEC sp_Marca_Guardar -1,'DELL'
GO
/*
Fecha: 20210613-1654
Autor: Yo
*/
CREATE PROCEDURE sp_Marca_Devolver(
 @id int = null
) AS
BEGIN
	IF @ID IS NULL
	BEGIN
		SELECT * FROM Marca ORDER BY ID
	END
	ELSE
	BEGIN
		SELECT * FROM Marca WHERE ID=@ID
	END
END

go
EXEC sp_Marca_Devolver
EXEC sp_Marca_Devolver 1