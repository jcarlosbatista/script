SELECT distinct d.tablespace_name, b.time, b.status
FROM dba_data_files d, v$backup b
WHERE d.file_id = b.FILE#
AND b.STATUS = 'ACTIVE' ;