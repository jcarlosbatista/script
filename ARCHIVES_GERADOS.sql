alter session set nls_date_format = 'dd-mm-yy'
/

PROMPT =================================ARCHIVES GERADOS DE HORA EM HORA=================================
PROMPT
set lines 500
set pages 9999
col "Day" for a3
col " " for a9
col "Total" for 9999
col "00h" for 9999
col "01h" for 9999
col "02h" for 9999
col "03h" for 9999
col "04h" for 9999
col "05h" for 9999
col "06h" for 9999
col "07h" for 9999
col "08h" for 9999
col "09h" for 9999
col "10h" for 9999
col "11h" for 9999
col "12h" for 9999
col "13h" for 9999
col "14h" for 9999
col "15h" for 9999
col "16h" for 9999
col "17h" for 9999
col "18h" for 9999
col "19h" for 9999
col "20h" for 9999
col "21h" for 9999
col "22h" for 9999
col "23h" for 9999

select
to_char(first_time,'DY')"Day", to_date(to_char(first_time,'dd-mm-yy'),'dd-mm-yy')" ", count(*)"Total",
sum(decode(to_char(first_time,'hh24'),'00',1,0)) "00h",
sum(decode(to_char(first_time,'hh24'),'01',1,0)) "01h",
sum(decode(to_char(first_time,'hh24'),'02',1,0)) "02h",
sum(decode(to_char(first_time,'hh24'),'03',1,0)) "03h",
sum(decode(to_char(first_time,'hh24'),'04',1,0)) "04h",
sum(decode(to_char(first_time,'hh24'),'05',1,0)) "05h",
sum(decode(to_char(first_time,'hh24'),'06',1,0)) "06h",
sum(decode(to_char(first_time,'hh24'),'07',1,0)) "07h",
sum(decode(to_char(first_time,'hh24'),'08',1,0)) "08h",
sum(decode(to_char(first_time,'hh24'),'09',1,0)) "09h",
sum(decode(to_char(first_time,'hh24'),'10',1,0)) "10h",
sum(decode(to_char(first_time,'hh24'),'11',1,0)) "11h",
sum(decode(to_char(first_time,'hh24'),'12',1,0)) "12h",
sum(decode(to_char(first_time,'hh24'),'13',1,0)) "13h",
sum(decode(to_char(first_time,'hh24'),'14',1,0)) "14h",
sum(decode(to_char(first_time,'hh24'),'15',1,0)) "15h",
sum(decode(to_char(first_time,'hh24'),'16',1,0)) "16h",
sum(decode(to_char(first_time,'hh24'),'17',1,0)) "17h",
sum(decode(to_char(first_time,'hh24'),'18',1,0)) "18h",
sum(decode(to_char(first_time,'hh24'),'19',1,0)) "19h",
sum(decode(to_char(first_time,'hh24'),'20',1,0)) "20h",
sum(decode(to_char(first_time,'hh24'),'21',1,0)) "21h",
sum(decode(to_char(first_time,'hh24'),'22',1,0)) "22h",
sum(decode(to_char(first_time,'hh24'),'23',1,0)) "23h"
from v$log_history
where trunc(first_time) >= sysdate -45
group by
to_char(first_time,'DY'), to_date(to_char(first_time,'dd-mm-yy'),'dd-mm-yy')
order by to_date(to_char(first_time,'dd-mm-yy'),'dd-mm-yy')
/

PROMPT ====================================FIM DA EXECUCAO==========================================


