use northwind;
BEGIN TRAN
SELECT * FROM CATEGORIES
INSERT INTO CATEGORIES
	VALUES('Tipicos','Comidas Tipicas',NULL)
DELETE FROM CATEGORIES
	WHERE CATEGORYID=9
SELECT * FROM CATEGORIES
COMMIT


BEGIN TRAN
SELECT * FROM CATEGORIES
INSERT INTO CATEGORIES
	VALUES('Tipicos','Comidas Tipicas',NULL)
SELECT * FROM CATEGORIES
--ROLLBACK
COMMIT

BEGIN TRAN
SELECT * FROM CATEGORIES
UPDATE CATEGORIES
	SET CategoryName = 'TipicOs'
	WHERE CategoryName = 'Tipicas'
SELECT * FROM CATEGORIES
ROLLBACK
SELECT * FROM CATEGORIES