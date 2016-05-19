----------------------------------------------------------------------------------------
-- VERIFICAR ESPACO LIVRE NAS TABLESPACES
----------------------------------------------------------------------------------------
set pagesize 5555
break   on report
compute sum of mbytes on report
compute sum of mbytes2 on report
select        mbytes_alloc mbytes
from ( select sum(bytes)/1024/1024 mbytes_free,
              round(max(bytes)/1024/1024,2) mbytes_largest,
              tablespace_name
       from  sys.dba_free_space
       group by tablespace_name ) a,
     ( select sum(bytes)/1024/1024 mbytes_alloc,
              tablespace_name
       from sys.dba_data_files
       group by tablespace_name )b
where a.tablespace_name (+) = b.tablespace_name;
select        mbytes_alloc mbytes2
from ( select sum(bytes)/1024/1024 mbytes_free,
              round(max(bytes)/1024/1024,2) mbytes_largest,
              tablespace_name
       from  sys.dba_temp_files
       group by tablespace_name ) a,
     ( select sum(bytes)/1024/1024 mbytes_alloc,
              tablespace_name
       from sys.dba_temp_files
       group by tablespace_name )b
where a.tablespace_name (+) = b.tablespace_name;
select Count(*) from dba_db_links;
