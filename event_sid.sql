set linesize 300
col event for a30
undef sid
undef serial
select s.sid,s.serial#,s.inst_id,s.sql_id, w.event, w.seconds_in_wait, w.state
from gv$session_wait w, gv$session s
where s.sid=&sid
and s.sid = w.sid
and s.inst_id=w.inst_id
and s.serial#=&serial;

