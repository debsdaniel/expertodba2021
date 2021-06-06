USE northwind
GO

DECLARE  @EmpID int
        ,@vlName char(20)
SET @vlname = 'Dodsworth'
SELECT @EmpID = employeeid 
 FROM  employees
 WHERE LastName = @vlname

SELECT @EmpID AS EmployeeID 
GO

DECLARE @EmpId int,@vlName char(20)
SET @EmpId = 5
SELECT @vlName = FirstName
	FROM employees
	WHERE employeeid=@EmpId

--Select @vlName
print('Hola ' + @vlName)