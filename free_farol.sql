----------------------------------------------------------------------------------------
-- VERIFICAR ESPACO LIVRE NAS TABLESPACES
----------------------------------------------------------------------------------------
set pagesize 5555
column dummy noprint
column  UTILIZADO              format 999,999,999 heading "Utilizado"
column  DISPONIVEL              format 999,999,999 heading "Disponível"
column name FOR A50
break   on report
compute sum of MBYTES on report
compute sum of DISPONIVEL on report

select nvl(b.tablespace_name, nvl(a.tablespace_name,'UNKOWN')) name, mbytes_alloc mbytes,
       --mbytes_alloc-nvl(mbytes_free,0) UTILIZADO,
       nvl(mbytes_free,0) DISPONIVEL
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
