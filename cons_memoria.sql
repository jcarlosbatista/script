--
--
--  NAME
--    eclic.sql
--
--  DESCRIPTION
--    Mostra alocações de memória dos usuários do Oracle
--
--  HISTORY
--    02/06/2008 => Eduardo Chinelatto 
--
-----------------------------------------------------------------------------
SET LINESIZE 200

COLUMN username FORMAT A20
COLUMN module FORMAT A20
set wrap off
set lines 130
set pages 100



SELECT NVL(a.username,'(oracle)') AS username,
       a.module,
       a.program,
       Trunc(b.value/1024) AS memory_kb
FROM   gv$session a,
       gv$sesstat b,
       gv$statname c
WHERE  a.sid = b.sid
AND    b.statistic# = c.statistic#
AND    c.name = 'session pga memory'
AND    a.program IS NOT NULL
ORDER BY b.value DESC;