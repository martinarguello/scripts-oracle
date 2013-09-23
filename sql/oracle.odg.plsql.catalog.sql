alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS';

set linesize 200
set pagesize 50

col host_name format a10

col owner format a5
col object_type format a13
col object_name format a20
col created format a20
col last_ddl_time format a20
col timestamp format a20
col status format a8

select instance_name, host_name, sysdate from v$instance;

select owner, object_type, object_name, created, last_ddl_time, timestamp, status 
from dba_objects 
where owner = 'SYS' and object_name like '%PGM%'
order by 1,2,3;