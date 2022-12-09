CREATE TABLE INCSAL2(ID NUMBER PRIMARY KEY,NAME
VARCHAR2(15),OLD_SAL NUMBER,NEW_SAL NUMBER);

-----------------------------------------------------------------------------------------------------------------------------

DECLARE
CURSOR ECUR IS SELECT ID,NAME,BASIC FROM EMPLOYEE WHERE DEPTID=1;
NID EMPLOYEE.ID%TYPE;
NNAME EMPLOYEE.NAME%TYPE;
NSAL EMPLOYEE.BASIC%TYPE;
BEGIN
OPEN ECUR;
LOOP
FETCH ECUR INTO NID,NNAME,NSAL;
EXIT WHEN(ECUR%NOTFOUND);
UPDATE EMPLOYEE SET BASIC=BASIC+1000 WHERE ID=NID;
INSERT INTO INCSAL VALUES(NID,NNAME,NSAL,NSAL+1000);
END LOOP;
CLOSE ECUR;
END;
/

----------------------------------------------------------------------------------------------------------------------------

SELECT * FROM INCSAL;

----------------------------------------------------------------------------------------------------------------------------
--Repeat exercise1 by reading department no inter relatively from the user--

DECLARE
CURSOR ECUR(V_DNO EMPLOYEE.ID%TYPE) IS SELECT ID,NAME,BASIC FROM EMPLOYEE WHERE DEPTID=V_DNO;
NID EMPLOYEE.ID%TYPE;
NNAME EMPLOYEE.NAME%TYPE;
NSAL EMPLOYEE.BASIC%TYPE;
BEGIN
OPEN ECUR(&D_NO);
LOOP
FETCH ECUR INTO NID,NNAME,NSAL;
EXIT WHEN(ECUR%NOTFOUND);
UPDATE EMPLOYEE SET BASIC=BASIC+1000 WHERE ID=NID;
INSERT INTO INCSAL2 VALUES(NID,NNAME,NSAL,NSAL+1000);
END LOOP;
CLOSE ECUR;
END;
/

-----------------------------------------------------------------------------------------------------------------------

SELECT * FROM INCSAL2;

-----------------------------------------------------------------------------------------------------------------------
--Repeat exercise 1 by using cursor for loops--

DECLARE
CURSOR C IS SELECT ID,NAME,BASIC FROM EMPLOYEE WHERE DEPTID=1;
BEGIN
FOR EMP_REC IN C
LOOP
UPDATE EMPLOYEE SET BASIC=EMP_REC.BASIC+1000 WHERE ID=EMP_REC.ID;
INSERT INTO INCSAL2
VALUES(EMP_REC.ID,EMP_REC.NAME,EMP_REC.BASIC,EMP_REC.BASIC+1000);
END LOOP;
END;
/
