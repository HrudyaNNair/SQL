--Create a new table department with fields deptid,dname.makedeptid as the
primary key--

CREATE TABLE DEPARTMENT (DEPTID INT PRIMARY KEY,DNAME VARCHAR(8));

--Insert values to the department table--

 INSERT INTO DEPARTMENT VALUES (1,'DESIGN');
 INSERT INTO DEPARTMENT VALUES (2,'CODING');
 INSERT INTO DEPARTMENT VALUES (3,'TESTING');
 INSERT INTO DEPARTMENT VALUES (4,'RESEARCH');
  
  
  --Makedeptid in employee table refer to department table--
  
 ALTER TABLE EMPLOYEE ADD FOREIGN KEY (DEPTID) REFERENCES DEPARTMENT (DEPTID);
  
  --Display the employee name and department name--
  
   SELECT EMPLOYEE.NAME, DEPARTMENT.DNAME FROM EMPLOYEE INNER JOIN DEPARTMENT ON EMPLOYEE.DEPTID=DEPARTMENT.DEPTID;
   
  --Display the department name of employee ‘Ram’--
  
   SELECT EMPLOYEE.NAME,DEPARTMENT.DNAME FROM EMPLOYEE INNER JOIN DEPARTMENT ON EMPLOYEE.DEPTID = DEPARTMENT.DEPTID WHERE EMPLOYEE.NAME='RAM';
  
  --Display the names of employees getting salary greater than the average salary of their department--
  
SELECT E.NAME , E.BASIC FROM EMPLOYEE E WHERE BASIC>(SELECT AVG(BASIC) FROM EMPLOYEE WHERE E.DEPTID = DEPTID) ORDER BY DEPTID;

--Display the names of the employees working under the manager RAM--
SELECT NAME FROM EMPLOYEE WHERE MANAGER_ID = 101;

--Display the deptid and total no.of employees as ‘NO_OF _DEPARTMENT_EMPLOYEES’ for only those department with more than 3 employees--

SELECT DEPTID AS DEPARTMENT, COUNT(ID) AS NO_OF_EMPLOYEE FROM EMPLOYEE GROUP BY DEPTID HAVING COUNT(ID)>3;

--Display deptid and minimum salary as lowest salary for those department with minimum salary above 2500--

 SELECT DEPTID, MIN(BASIC) AS LOWEST_SALARY FROM EMPLOYEE GROUP BY DEPTID HAVING MIN(BASIC)>2500;
 
 --Display the names of employees whose salary is the maximum given by
their department--

SELECT NAME, BASIC FROM EMPLOYEE WHERE BASIC IN( SELECT MAX(BASIC) FROM EMPLOYEE GROUP BY DEPTID);
