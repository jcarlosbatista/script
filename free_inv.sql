select count(*)"Qtd tbs"
from dba_tablespaces;

select a.data+b.temp "Total (Mb)"
from (select sum(bytes/1024/1024) data from dba_data_files) a,
(select sum(bytes/1024/1024) temp from dba_temp_files) b
/

select round (100 - (((mbytes_alloc-nvl(mbytes_free,0))/mbytes_alloc)*100), 1) free
from ( select sum(bytes)/1024/1024 mbytes_free
       from  sys.dba_free_space
        ) a,
     ( select sum(bytes)/1024/1024 mbytes_alloc
       from sys.dba_data_files
       )b;

select sum(bytes/1024/1024) "Temp (Mb)"
from dba_temp_files;

select sum(bytes/1024/1024) "Undo (Mb)" 
from dba_data_files
where tablespace_name LIKE '%UNDO%';


