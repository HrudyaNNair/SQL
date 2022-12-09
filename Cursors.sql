CREATE TABLE INCSAL(ID NUMBER PRIMARY KEY,NAME
VARCHAR2(15),OLD_SAL NUMBER,NEW_SAL NUMBER);


DECLARE
CURSOR ECUR IS SELECT ID,NAME,SALARY FROM EMP10 WHERE D_NO=1;
NID EMP10.ID%TYPE;
NNAME EMP10.NAME%TYPE;
NSAL EMP10.SALARY%TYPE;
BEGIN
OPEN ECUR;
LOOP
FETCH ECUR INTO NID,NNAME,NSAL;
EXIT WHEN(ECUR%NOTFOUND);
UPDATE EMP10 SET SALARY=SALARY+1000 WHERE ID=NID;
INSERT INTO INCSAL VALUES(NID,NNAME,NSAL,NSAL+1000);
END LOOP;
CLOSE ECUR;
END;
/
