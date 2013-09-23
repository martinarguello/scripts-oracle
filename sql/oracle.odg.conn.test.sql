DECLARE
    objdesc      PGM.MQOD;
    objectHandle PGM.MQOH;
    QUEUENAME    VARCHAR2(100) := '&queuename';
    DBLINKNAME   VARCHAR2(100) := '&dblinkname';
BEGIN
    
    dbms_output.put_line('MQTEST> Fecha:  ' || to_char(sysdate,'YYYY/MM/DD HH24:MI:SS'));
    dbms_output.put_line('MQTEST> Modo:   OUTPUT');
    dbms_output.put_line('MQTEST> Queue:  ' || QUEUENAME);
    dbms_output.put_line('MQTEST> Dblink: ' || DBLINKNAME);

    objdesc.objectname := QUEUENAME;
    objdesc.dblinkname := DBLINKNAME;     
    pgm.mqopen(objdesc, PGM_SUP.MQOO_OUTPUT, objectHandle);
        
    dbms_output.put_line('MQTEST> Open:   MQOPEN OK');
       
    pgm.mqclose(objectHandle, PGM_SUP.MQCO_NONE);
        
    dbms_output.put_line('MQTEST> Close:  MQCLOSE OK');
        
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('MQTEST> Error:  ' || REPLACE(REPLACE(REPLACE(SQLERRM, CHR(10), ' / '), CHR(13)), CHR(9)));
        PGM.MQCLOSE(objectHandle, PGM_SUP.MQCO_NONE);
END;