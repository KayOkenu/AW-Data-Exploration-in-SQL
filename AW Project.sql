--FINDING NAMES OF DEPARTMENTS
SELECT DepartmentID,Name
FROM HumanResources.Department
ORDER BY DepartmentID ASC

-- SALESPERSON WITH THE HIGHEST SALES
SELECT *
FROM Sales.SalesPerson

SELECT BusinessEntityID, SUM(SalesYTD) AS TotalSales
FROM Sales.SalesPerson
GROUP BY BusinessEntityID
ORDER BY SUM(SalesYTD) DESC

--PERCENTAGE OF EMPLOYEES WHO ARE SINGLE VS MARRIED
SELECT* 
FROM HumanResources.Employee

SELECT MaritalStatus, COUNT(*) AS NumEmployees, 
COUNT(*)*100/(SELECT COUNT(*) FROM HumanResources.Employee)AS Percentage
FROM HumanResources.Employee
GROUP BY MaritalStatus

--MONTH WITH THE HIGHEST EMPLOYEE BIRTHDAYS*
SELECT*
FROM HumanResources.Employee

SELECT Month(CONVERT(Date,BirthDate,105)) AS Month, COUNT(*) AS Employees
FROM HumanResources.Employee
GROUP BY Month(CONVERT(Date,BirthDate,105))
ORDER BY Employees DESC

--EMPLOYEES WITH LEAST NUMBER OF VACATIONS
SELECT BusinessEntityID, VacationHours
FROM HumanResources.Employee
ORDER BY VacationHours ASC

--COMPARING TOTAL SALES OF THE CURRENT YEAR AND THE LAST YEAR
SELECT SUM(SalesYTD) as TotalSalesCurrent, SUM(SalesLastYear) as TotalSalesLast
FROM Sales.SalesPerson

--DEPARTMENT WITH THE MOST NUMBER OF EMPLOYEES
SELECT DEP.Name, COUNT(EDH.BusinessEntityID) AS NumEmployees 
FROM HumanResources.EmployeeDepartmentHistory EDH
JOIN HumanResources.Department DEP
ON EDH.DepartmentID=DEP.DepartmentID
GROUP BY DEP.Name
ORDER BY NumEmployees DESC

--EMPLOYEES WITH THE HIGHEST PAY
SELECT BusinessEntityID,Rate
FROM HumanResources.EmployeePayHistory
ORDER BY Rate DESC

--PERCENTAGE OF WOMEN TO MEN AMONG EMPLOYEES
SELECT Gender, COUNT(*) AS GenderCount, COUNT(*)*100/(SELECT COUNT(*) FROM HumanResources.Employee)AS PercentageGender
FROM HumanResources.Employee
GROUP BY Gender
ORDER BY PercentageGender DESC

--WHICH COUNTRY REGION MADE THE LEAST SALES:
     --IN THE LAST YEAR 
SELECT CR.Name,ST.SalesYTD
FROM Person.CountryRegion CR
JOIN Sales.SalesTerritory ST
ON CR.CountryRegionCode= ST.CountryRegionCode
GROUP BY CR.Name,ST.SalesYTD
ORDER BY SalesYTD ASC

     --IN THE CURRENT YEAR
SELECT CR.Name,ST.SalesLastYear
FROM Person.CountryRegion CR
JOIN Sales.SalesTerritory ST
ON CR.CountryRegionCode= ST.CountryRegionCode
GROUP BY CR.Name,ST.SalesLastYear
ORDER BY SalesLastYear ASC







