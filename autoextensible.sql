undef arquivo
spo C:\Scripts\spool\&&arquivo
set pagesize 5555
set linesize 5000
col file_name for a50
@base_lev
prompt DATAFILES DA BASE:
select file_id, file_name, autoextensible
from dba_data_files;
prompt TEMPFILES DA BASE:
select file_id, file_name, autoextensible
from dba_temp_files;
spo off

select 'alter database datafile '||file_id||' autoextend off;'
from dba_data_files
where autoextensible = 'YES';

select 'alter database tempfile '||file_id||' autoextend off;'
from dba_temp_files
where autoextensible = 'YES';