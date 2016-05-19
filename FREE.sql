----------------------------------------------------------------------------------------
-- VERIFICAR ESPACO LIVRE NAS TABLESPACES
----------------------------------------------------------------------------------------
set pagesize 5555
column dummy noprint
column  pct_used          format 999.9       heading "%Used"
column  name              format a30         heading "Tablespace Name"
column  mbytes            format 999,999,999 heading "Tam_total(MB)"
column  used              format 999,999,999 heading "Used(MB)"
column  free              format 999,999,999 heading "Free(MB)"
column  mbytes_largest    format 999,999,999 heading "Largest(MB)"
col file_name for a50
break   on report
compute sum of mbytes on report
compute sum of free on report
compute sum of used on report

select nvl(b.tablespace_name, nvl(a.tablespace_name,'UNKOWN')) name,
       mbytes_alloc mbytes, mbytes_alloc-nvl(mbytes_free,0) used,
       nvl(mbytes_free,0) free, ((mbytes_alloc-nvl(mbytes_free,0))/mbytes_alloc)*100 pct_used,
       nvl(mbytes_largest,0) largest
from ( select sum(bytes)/1024/1024 mbytes_free,
              round(max(bytes)/1024/1024,2) mbytes_largest,
              tablespace_name
       from  sys.dba_free_space
       group by tablespace_name ) a,
     ( select sum(bytes)/1024/1024 mbytes_alloc,
              tablespace_name
       from sys.dba_data_files
       group by tablespace_name )b
where a.tablespace_name (+) = b.tablespace_name
--and a.tablespace_name = 'STICK_DATA'
order by 5 desc;

set pagesize 5555
set linesize 500
column file_name format a60
undef tablespace

select file_id, file_name, bytes/1024/1024 "TAMANHO MB", maxbytes/1024/1024 "CRESCIMENTO MAXIMO"
from dba_data_files
where tablespace_name = '&&tablespace'
/


######################################################################################################
###################################      DOWNSIZE POR DATAFILE      ##################################
######################################################################################################



column cmd format a90 word_wrapped
select c.tablespace_name, a.file_id, 'alter database datafile '''||file_name||''' resize ' ||
       ceil( (nvl(hwm,1)*c.block_size )/1024/1024 )  || 'm;' cmd, c.status,
       ceil( blocks*c.block_size/1024/1024) - ceil( (nvl(hwm,1)*c.block_size)/1024/1024 ) savings, 
       a.bytes/1024/1024 bytes
from dba_data_files a, dba_tablespaces c,
     ( select file_id, max(block_id+blocks-1) hwm
         from dba_extents
        group by file_id ) b 
where a.file_id = b.file_id(+)
--AND A.TABLESPACE_NAME='TS_COD01_I'
and a.tablespace_name=c.tablespace_name
--and c.contents <> 'UNDO'
and ceil( blocks*c.block_size/1024/1024) - ceil( (nvl(hwm,1)*c.block_size)/1024/1024 ) > 0
order by savings
/
