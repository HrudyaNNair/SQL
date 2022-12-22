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

