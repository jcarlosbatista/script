prompt ***TODOS OS SERVI�OS DEVEM ESTAR COMO 'RUNNING'***
prompt ***CASO N�O ESTEJA FAVOR INICIAR O WORKFLOW MAILER CONFORME PROCEDIMENTO!****
prompt WORKFLOW PRODU��O ASDB (LINUX)
conn owf_mgr@ASDB_LINUX
col COMPONENT_NAME for a50
col COMPONENT_TYPE for a20
col COMPONENT_STATUS for a20
set pagesize 200
set linesize 200
select SC.COMPONENT_TYPE, SC.COMPONENT_NAME, SC.COMPONENT_STATUS
from FND_SVC_COMPONENTS SC
order by 1, 2;

prompt WORKFLOW JUR�DICO (ELMA04)
conn owf_mgr@ELMA04
col COMPONENT_NAME for a50
col COMPONENT_TYPE for a20
col COMPONENT_STATUS for a20
set pagesize 200
set linesize 200
select SC.COMPONENT_TYPE, SC.COMPONENT_NAME, SC.COMPONENT_STATUS
from FND_SVC_COMPONENTS SC
order by 1, 2;

prompt WORKFLOW R11 (ELMA06)
conn apps@elma06
col COMPONENT_NAME for a50
col COMPONENT_TYPE for a30
col COMPONENT_STATUS for a20
set pagesize 200
set linesize 200
select SC.COMPONENT_TYPE, SC.COMPONENT_NAME, SC.COMPONENT_STATUS
from FND_SVC_COMPONENTS SC
where SC.COMPONENT_NAME like 'W%'
order by 1, 2;

prompt Verifica��o Finalizada!