USE NORTHWIND
go

DECLARE @n tinyint
SET @n = 10
IF (@n BETWEEN 4 and 6)
 BEGIN
  WHILE (@n > 0)
   BEGIN
	print(@n)
    /*SELECT  @n AS 'Number'
      ,CASE
        WHEN (@n % 2) = 1
          THEN 'ODD'
        ELSE 'EVEN'
       END AS 'Type'*/
	IF @n % 2 =0
	BEGIN
		print('Par')
	END
	ELSE
	BEGIN
		PRINT('Inpar')
	END
    SET @n = @n - 1
   END
 END
ELSE
 PRINT 'NO ANALYSIS'
 print('¿Cuàndo se ejecuta?')
