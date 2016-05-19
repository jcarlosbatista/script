select 'create synonym RLERMA.' || table_name || ' for CARDBOM.' || table_name || ';'
from dba_tables
where owner = 'CARDBOM';

select 'create synonym LUCIANA.' || table_name || ' for CARDBOM.' || table_name || ';'
from dba_tables
where owner = 'CARDBOM';

select 'create synonym LEONARDO.' || table_name || ' for CARDBOM.' || table_name || ';'
from dba_tables
where owner = 'CARDBOM';





























        