set pages 500
set linesize 150

break on report on day skip 2
compute sum label 'Sum by day ' - 
of MB on day

column hora format a15
column day format a15
column MB format 999,999,999,999

select to_char(COMPLETION_TIME,'dd/mm/yyyy') day, to_char(COMPLETION_TIME,'hh24') hora, trunc(sum(BLOCKS*BLOCK_SIZE)/1024/1024) MB
from v$archived_log where to_char(COMPLETION_TIME,'dd/mm/yyyy') like '%16/06/2015%'
-- where to_char(COMPLETION_TIME, 'Day') like '%Sunday%'
group by to_char(COMPLETION_TIME,'dd/mm/yyyy'), to_char(COMPLETION_TIME,'hh24')
order by to_char(COMPLETION_TIME,'dd/mm/yyyy'), to_char(COMPLETION_TIME,'hh24')
/