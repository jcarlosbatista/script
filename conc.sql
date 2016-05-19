set lines 200
col username for a10
col module for a10
col USER_CONCURRENT_PROGRAM_NAME for a80

alter session set nls_date_format = 'DD-MM-YYYY HH24:MI:SS';


select p.spid, s.SID, s.USERNAME,s.STATUS,s.ACTION,s.MODULE,logon_time 
from v$session s, v$process p 
where ACTION like '%Concu%' 
and s.paddr    = p.addr;

select a.user_concurrent_program_name, b.request_id, b.request_date, b.last_update_date
from apps.fnd_concurrent_programs_tl a, apps.fnd_concurrent_requests b
where b.status_code = 'R'
and a.concurrent_program_id=b.concurrent_program_id;

