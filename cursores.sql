-- quantidade de cursores

select max(a.value) as highest_open_cur, p.value as max_open_cur
from gv$sesstat a, gv$statname b, gv$parameter p
where a.statistic# = b.statistic#
and b.name = 'opened cursors current'
and p.name = 'open_cursors'
group by p.value;


-- quantidade de cursores por sessão

select a.value, s.username, s.sid, s.serial#
from v$sesstat a, v$statname b, v$session s
where a.statistic# = b.statistic#
and s.sid = a.sid
and b.name = 'opened cursors current'
and s.username is not null order by value;