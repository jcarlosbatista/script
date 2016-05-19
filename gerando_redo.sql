col MACHINE for a20
col osuser for a15
col username for a20
col PROGRAM for a40
SELECT s.sid, s.serial#, s.username,s.osuser, s.machine, s.program, i.block_changes
FROM gv$session s, gv$sess_io i
WHERE s.sid = i.sid and username is not null
ORDER BY block_changes desc;