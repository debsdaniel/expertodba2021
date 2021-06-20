USE northwind
SELECT * 
	--COUNT (*)
 FROM employees
GO
USE northwind
SELECT reportsto,*
	--COUNT(reportsto)
 FROM employees

 select count(*) from employees
 select count(reportsto) from  employees