select distinct owner, count(*), max(last_analyzed), min(last_analyzed)
from dba_tables
where owner not in('WMSYS','SYSTEM','DBSNMP','APPQOSSYS','PERFSTAT','BACKUP', 'EXFSYS', 'SYSMAN', 'DBSMP', 'SYS', 'OUTLN', 'MDSYS', 'XDB', 'TSMSYS', 'ORDSYS')
group by owner;