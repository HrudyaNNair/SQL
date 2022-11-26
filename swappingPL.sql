    DECLARE
    A NUMBER:=&A;
    B NUMBER:=&B;
    C NUMBER;
    BEGIN
    DBMS_OUTPUT.PUT_LINE('BEFORE SWAPPING A ='||A||'B='||B);
    C:=A;
    A:=B;
    B:=C;
    DBMS_OUTPUT.PUT_LINE('AFTER SWAPPING A ='||A||'B='||B);
    END;
    /
