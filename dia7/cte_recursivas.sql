--CTE RECURSIVOS
SELECT e.EmployeeID, e.LastName, e.FirstName, e.ReportsTo
FROM dbo.Employees e
GO
WITH CteEmp as (
	SELECT EmployeeID,ReportsTo,FirstName,LastName,FirstName+' '+LastName AS jefe
	FROM Employees
	WHERE EmployeeID = 2
	UNION ALL
	SELECT e.EmployeeID,e.ReportsTo, e.FirstName, e.LastName,
		p.FirstName + ' ' + p.LastName
		FROM CteEmp AS p
		inner join dbo.Employees e ON 
		e.reportsTo = p.EmployeeID
)
SELECT ce.EmployeeID, ce.ReportsTo, 
	ce.FirstName, ce.LastName, ce.jefe
	from CteEmp ce
	ORDER BY ce.ReportsTo

SELECT EmployeeID,ReportsTo,FirstName,LastName,FirstName+' '+LastName AS jefe
	FROM Employees