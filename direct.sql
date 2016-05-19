set lines 500 pages 9999
col owner for a25
col DIRECTORY_NAME for a30
col DIRECTORY_PATH for a80

select * from dba_directories
/