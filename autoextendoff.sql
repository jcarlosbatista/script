spo c:\scripts\acerta.sql
select 'alter database datafile '||file_id||' autoextend off;'
from dba_data_files
where autoextensible = 'YES'
union 
select 'alter database tempfile '||file_id||' autoextend off;'
from dba_temp_files
where autoextensible = 'YES';
spo off
@acerta.sql