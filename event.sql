set pages 9999
set lines 500
col p1 for 9999999999999999999
col p2 for 9999999999999999999
col event for a60
col username for a15

select a.sid,b.serial#,b.username,a.event,a.seconds_in_wait,a.p1,a.p2,b.last_call_et
 from v$session_wait a, v$session b
 where a.sid=b.sid
 and a.event not in('rdbms ipc message','pmon timer','smon timer','SQL*Net message from client');