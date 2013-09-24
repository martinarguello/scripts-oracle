SET ECHO ON
DECLARE
    objdesc      PGM.MQOD;
    objectHandle PGM.MQOH;
    INSTANCENAME varchar2(100);
    QUEUENAME    VARCHAR2(100) := 'SCOMP.QUEUE.COMPROBANTES.PUSH';
    DBLINKNAME   VARCHAR2(100) := 'TEST_DESA96H';
BEGIN

    SELECT instance_name INTO INSTANCENAME
    FROM  v$instance;
    
    dbms_output.put_line('MQTEST> Instancia:  ' || INSTANCENAME);
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