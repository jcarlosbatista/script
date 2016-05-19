select inst_id, sid, serial, username,round(total_user_mem/1024/1024,2) "MEM_USADA(MB)",round(100 * total_user_mem/total_mem,2) "MEMORIA(%)"
from
   (select b.inst_id inst_id, b.sid sid,b.serial# serial, nvl(b.username,p.name) username, sum(value) total_user_mem
 from sys.v_$statname c, sys.v_$sesstat a, sys.gv$session b, sys.v_$bgprocess p
  where a.statistic#=c.statistic# 
   and p.paddr (+) = b.paddr 
   and b.sid=a.sid 
   and c.name in ('session pga memory','session uga memory')
 group by b.sid,b.inst_id, b.serial#, nvl(b.username,p.name)),
   (select sum(value) total_mem
   from sys.v_$statname c, sys.v_$sesstat a
     where a.statistic#=c.statistic# 
      and c.name in ('session pga memory','session uga memory'))
    order by 5 desc;

