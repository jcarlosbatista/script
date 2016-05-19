alter session set nls_date_format='dd/mm/yy hh24:mi:ss';
set pagesize 5555
set linesize 500
col host_name for a30
col status for a10
col instance_name for a20
col logins for a15
select sysdate, startup_time, host_name, instance_name, status, logins, v.sessions_current,v.sessions_highwater
from gv$instance, v$license v;





