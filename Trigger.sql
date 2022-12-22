-- Write a simple procedure to find the minimum of two numbers--

DECLARE
A NUMBER;
B NUMBER;
C NUMBER;
PROCEDURE FINDMIN(X IN NUMBER, Y IN NUMBER,Z OUT NUMBER) IS
BEGIN
IF X<Y THEN
Z:=X;
ELSE
Z:=Y;
END IF;
END;
BEGIN
A:=&A;
B:=&B;
FINDMIN(A,B,C);
DBMS_OUTPUT.PUT_LINE('MINIMUM OF A:'||A||'AND B:'||B||'IS:'||C);
END;
/


-- ---------------------------------------------------------------------------------------------------- --

-- Write a procedure that passes employee id and returns the employee’s full
-- name from the employee table to the calling program.Also write the
-- anonymous block with the procedure call.

CREATE OR REPLACE PROCEDURE SEARCH_EMP(EMP_ID IN NUMBER,EMP_NAME OUT VARCHAR2) IS
BEGIN
SELECT NAME INTO EMP_NAME FROM EMPLOYEE WHERE EMP_ID=ID;
EXCEPTION
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('EMPLOYEE ID'||EMP_ID||'DOES NOT EXIST');
END;
/

--------------------------------------------------------------------------------------------------------------
DECLARE
V_NAME EMPLOYEE.NAME%TYPE;
V_ID EMPLOYEE.ID%TYPE:=&EMP_ID;
BEGIN
SEARCH_EMP(V_ID,V_NAME);
IF V_NAME IS NOT NULL THEN
DBMS_OUTPUT.PUT_LINE('EMPLOYEE ID:'||V_ID);
DBMS_OUTPUT.PUT_LINE('NAME:'||V_NAME);
END IF;
END;
/


-- ---------------------------------------------------------------------------------------------------- --

-- FUNCTIONS


-- Write a function that returns the factorial of a number.

CREATE OR REPLACE FUNCTION FACT(N IN NUMBER)
RETURN NUMBER
IS
F NUMBER;
BEGIN
IF N=0 THEN
F:=1;
ELSE
F:=N*FACT(N-1);
END IF;
RETURN F;
END;
/


------------------------------------------------------------------------------------------------------------------



DECLARE
N NUMBER;
S NUMBER;
BEGIN
N:=&N;
S:=FACT(N);
DBMS_OUTPUT.PUT_LINE('FACTORIAL OF '||N||'IS: '||S);
END;
/

----------------------------------------------------------------------------------------------------------------------

-- Write a function to return the net BASIC given the employee number.

ALTER TABLE EMPLOYEE ADD COMMISION NUMBER(5);

------------------------------------------------------------------------------------------------------------------------

UPDATE EMPLOYEE SET COMMISION = 100 WHERE DEPTID = 1;
UPDATE EMPLOYEE SET COMMISION = 200 WHERE DEPTID = 2;
UPDATE EMPLOYEE SET COMMISION = 300 WHERE DEPTID = 3;
UPDATE EMPLOYEE SET COMMISION = 150 WHERE DEPTID = 4;
----------------------------------------------------------------------------------------------------------------------------

SELECT * FROM EMPLOYEE;

-----------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION NET_SAL(ENO IN NUMBER)
RETURN NUMBER
IS
COM NUMBER;
SAL NUMBER;
NET NUMBER;
BEGIN
SELECT COMMISION,BASIC INTO COM,SAL FROM EMPLOYEE WHERE ID=ENO;
NET:=COM+SAL;
RETURN NET;
END;
/

-----------------------------------------------------------------------------------------------------------------------


DECLARE
ID NUMBER:=&ID;
TOTAL NUMBER;
BEGIN
TOTAL:=NET_SAL(ID);
DBMS_OUTPUT.PUT_LINE('NET BASIC IS '||TOTAL);
END;
/

----------------------------------------------------------------------------------------------------------------

SELECT * FROM EMPLOYEE;

----------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION DEPTHIGHEST(DNUM IN NUMBER)
RETURN NUMBER
IS
SAL EMPLOYEE.BASIC%TYPE;
BEGIN
SELECT MAX(BASIC)INTO SAL FROM EMPLOYEE GROUP BY DEPTID HAVING EMPLOYEE.DEPTID=DNUM;
RETURN SAL;
END;
/
------------------------------------------------------------------------------------------------------------------------

