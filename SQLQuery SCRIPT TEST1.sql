CREATE TABLE EmployeeDetails (EmpID INT PRIMARY KEY NOT NULL, FullName varchar (50) NOT NULL, ManagerID INT not null, DateOfJoining DATE not null);
INSERT into EmployeeDetails (EmpID, FullName, ManagerID, DateOfJoining)
VALUES (121, 'John' + ' ' + 'Snow', 321, '01/31/2014');
INSERT INTO EmployeeDetails (EmpID, FullName, ManagerID, DateOfJoining)
VALUES (321, 'Walter' + ' ' + 'White', 986, '01/30/2015');
INSERT INTO EmployeeDetails (EmpID, FullName, ManagerID, DateOfJoining)
VALUES (421, 'Kuldeep' + ' ' + 'Rana', 876, '11/27/2016');


CREATE TABLE EmployeeSalary (EmpID Int not null foreign key references EmployeeDetails (EmpID), Project NVarchar (50) not null, Salary money not null);
Insert into EmployeeSalary (EmpID, Project, Salary)
VALUES (121, 'P1', 8000);
INSERT INTO EmployeeSalary (EmpID, Project, Salary)
VALUES (321, 'P2', 1000);
Insert into EmployeeSalary (EmpID, Project, Salary)
VALUES (421, 'P1', 12000);


SELECT COUNT (*) AS 'Number of Employees' from EmployeeDetails D
JOIN EmployeeSalary S on D.EmpID = S.EmpID
WHERE S.Project = 'P1'


SELECT D.FullName from EmployeeDetails D
JOIN EmployeeSalary S on D.EmpID = S.EmpID
WHERE S.Salary >= 5000 and S.Salary <= 10000;


SELECT COUNT (D.EmpID) AS 'COUNT OF EMPLOYEES' , S.Project
FROM EmployeeDetails D
JOIN EmployeeSalary S on D.EmpID = S.EmpID
GROUP BY S.Project
ORDER by S.Project Desc;


SELECT SUBSTRING (FullName, 0, CHARINDEX (' ', FullName, 0)) AS 'FIRST NAME'
FROM EmployeeDetails;


SELECT D.FullName, S.Salary
FROM EmployeeDetails D
LEFT JOIN EmployeeSalary S on D.EmpID = S.EmpID


SELECT D.FullName from EmployeeDetails D
JOIN EmployeeDetails S
ON D.EmpID = S.ManagerID;


SELECT D.FullName, S.Salary
FROM EmployeeDetails D
JOIN EmployeeSalary S on D.EmpID = S.EmpID


SELECT D.EmpID, D.FullName, S.Project, COUNT (*) AS 'NUMBER OF OCCURENCES'
FROM EmployeeDetails D
JOIN EmployeeSalary S on D.EmpID = S.EmpID
GROUP BY D.EmpID, D.FullName, S.Project
HAVING COUNT (*) >1;


DELETE R2 FROM EmployeeDetails R1, EmployeeDetails R2
WHERE R2.EmpID < R1.EmpID
AND R2.FullName = R1.FullName
AND R2.ManagerID = R1.ManagerID
AND R2.DateOfJoining = R1.DateOfJoining;


SELECT * FROM EmployeeDetails
WHERE (EmpID % 2) = 1;


SELECT * FROM EmployeeDetails
WHERE (EmpID % 2) = 0;


SELECT EmpID,FullName, ManagerID, DateOfJoining
INTO EmployeeDetailsDuplicate
FROM EmployeeDetails


SELECT TOP 0 * INTO EmployeeSalaryNew FROM EmployeeSalary


SELECT EmpID FROM EmployeeDetails
INTERSECT 
SELECT EmpID FROM EmployeeSalary


SELECT D.EmpID, D.FullName, D.ManagerID, D.DateOfJoining FROM EmployeeDetails D
WHERE NOT EXISTS
(SELECT * FROM EmployeeSalary S JOIN EmployeeDetails D ON D.EmpID = S.EmpID);

SELECT D.EmpID, D.FullName, D.ManagerID, D.Dateofjoining FROM EmployeeDetails D
RIGHT JOIN EmployeeSalary S ON D.EmpID=S.EmpID
WHERE D.FullName = NULL 


SELECT GETDATE() AS 'DATE OF TODAY'


SELECT * FROM EmployeeDetails 
WHERE YEAR (DateOfJoining) = 2016


SELECT TOP 2 * FROM EmployeeDetailsDuplicate


SELECT TOP 2 Salary
FROM (SELECT DISTINCT TOP 2 Salary
FROM EmployeeSalary ORDER BY Salary DESC)
AS TEMP
ORDER BY Salary;


SELECT Salary from EmployeeSalary
ORDER BY Salary DESC OFFSET 3-1 ROW
FETCH NEXT 1 ROW ONLY;