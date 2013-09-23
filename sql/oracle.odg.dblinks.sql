alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS';

set linesize 200
set pagesize 50

col host_name format a10

col owner format a10
col db_link format a14
col username format a8
col host format a7
col created format a20

select instance_name, host_name, sysdate from v$instance;

select * 
from dba_db_links 
where username is null
order by 1,2,4;