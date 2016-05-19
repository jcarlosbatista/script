set feedback off 
set lines 180
set head on
col "Create Time" format a20
col name format a30
col curr_size_mb format 99999999
col growth_per_day format 99999999.9
col growth_30_days format 99999999.9
col growth_120_days format 99999999.9
col growth_240_days format 99999999.9
col projection_365_days_mb format 99999999
select min(creation_time) "Create Time", ts.name, round(sum(df.bytes)/1024/1024) curr_size_mb,
round( (sum(df.bytes)/1024/1024)/round(sysdate-min(creation_time)),1) growth_per_day,
round( (sum(df.bytes)/1024/1024)/round(sysdate-min(creation_time)) * 30,1) growth_30_days,
round( (sum(df.bytes)/1024/1024)/round(sysdate-min(creation_time)) * 120,1) growth_120_days,
round( (sum(df.bytes)/1024/1024)/round(sysdate-min(creation_time)) * 240,1) growth_240_days,
round( (sum(bytes)/1024/1024)+((sum(df.bytes)/1024/1024)/round(sysdate-min(creation_time))*365) ) projection_365_days_mb
from v$datafile df ,v$tablespace ts where df.ts#=ts.ts# group by df.ts#,ts.name order by df.ts#;
