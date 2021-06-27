BEGIN TRAN
SELECT 'Inicial',@@trancount,* from categories where categoryId=11
save transaction sp1;
delete from categories where categoryId=11
SELECT 'SP1',@@trancount,* from categories
save transaction sp2;
UPDATE CATEGORIES SET description='Pezcado y Mariscos' WHERE CATEGORYID=8
SELECT 'SP2',@@trancount,* from categories
save transaction sp3;
INSERT INTO CATEGORIES (CategoryName,Description,picture)
	values('SP','Probar SP',null)
SELECT 'SP3',@@trancount,* from categories
ROLLBACK TRANSACTION SP3
SELECT 'Final',@@trancount,* from categories
rollback

