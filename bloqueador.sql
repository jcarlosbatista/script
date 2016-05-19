SELECT substr(DECODE(request,0,'Bloqueador: ','Bloqueado: ')||sid,1,20) sessao,
       --id1, id2, lmode, request, type,
       inst_id instance
 FROM GV$LOCK
WHERE (id1, id2, type) IN
   (SELECT id1, id2, type FROM GV$LOCK WHERE request>0)
     ORDER BY id1, request;



	





-- select count(*) from gv$session where LOCKWAIT <> NULL;
-- select count(*) from v$session where LOCKWAIT <> NULL;




/*
select SQL_TEXT 
from gV$sql sql, v$session s
where sql.sql_id = s.sql_id
and s.sid=402;

col osuser for a15
col machine for a20	 
select SID,SERIAL#,USERNAME,OSUSER,LOCKWAIT,machine,STATUS,to_char(LOGON_TIME,'dd/mm/yyyy HH24:MI:SS') as "Tempo logado", last_call_et 
from gv$session where sid=439;
*/



select SID,USERNAME,OSUSER,PROGRAM,MODULE,STATUS,to_char(LOGON_TIME,'dd/mm/yyyy HH24:MI:SS') as "Tempo logado", last_call_et, 
ROW_WAIT_OBJ#,BLOCKING_SESSION_STATUS,BLOCKING_SESSION from v$session where BLOCKING_SESSION_STATUS='VALID';