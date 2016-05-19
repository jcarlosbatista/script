set lines 1000
set pages 1000
col sql_id for a17
col username for a10
col username for a10
col status for a10
col osuser for a10
col program for a45
col event for a30
col machine for a20
col inst_id format 9999999
col tempo format 99999
col serial# format 9999999
col sid format 99999
SELECT inst_id,sid,serial#,username, sql_id,event,status,trunc(last_call_et/60)Tempo,blocking_session,program
FROM gv$session
WHERE username is not null
and username not in ('DBSNMP','SYSMAN')
and status = 'ACTIVE'
order by last_call_et;
