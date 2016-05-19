select sid,username,round(total_user_mem/1024/1024,2) "MEM_USADA(MB)",round(100 * total_user_mem/total_mem,2) "MEMORIA(%)"
from
   (select b.sid sid, nvl(b.username,p.name) username, sum(value) total_user_mem
 from sys.v_$statname c, sys.v_$sesstat a, sys.v_$session b, sys.v_$bgprocess p
  where a.statistic#=c.statistic# 
   and p.paddr (+) = b.paddr 
   and b.sid=a.sid 
   and c.name in ('session pga memory','session uga memory')
 group by b.sid, nvl(b.username,p.name)),
   (select sum(value) total_mem
   from sys.v_$statname c, sys.v_$sesstat a
     where a.statistic#=c.statistic# 
      and c.name in ('session pga memory','session uga memory'))
    order by 3 desc;


/*
COLUMN username FORMAT A20
COLUMN module FORMAT A30

SELECT NVL(a.username,'(oracle)') AS username,
       a.module,
       A.OSUSER,
       a.program,
       Trunc(b.value/1024/1024) AS memory_MB
FROM   gv$session a,
       v$sesstat b,
       v$statname c
WHERE  a.sid = b.sid
AND    b.statistic# = c.statistic#
AND    c.name = 'session pga memory'
AND    a.program IS NOT NULL AND Trunc(b.value/1024/1024) > 0 and a.inst_id=1
ORDER BY b.value DESC;
*/