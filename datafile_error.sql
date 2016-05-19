set lines 500 pages 9999
col name for a60
col online_status for a20
col error for a50
select name, online_status,error 
from v$datafile 
join v$recover_file 
using(file#);