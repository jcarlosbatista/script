undef nomedoobjeto
set pagesize 5555
set linesize 500
col object_name for a40
col owner for a25
col status for a20
select owner, object_name, object_type, status, created
from dba_objects
where object_name =upper('&&nomedoobjeto')
order by owner;
