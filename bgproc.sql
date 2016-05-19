rem
rem ARQUIVO
rem    bgproc.sql
rem
rem FINALIDADE
rem    Exibe informacoes sobre os processos background ativos
rem
rem MODIFICACOES
rem    01-07-97     Fabio Santana    criacao do script (pela n-esima vez...)
rem

set echo off feedback off pause off verify off trimspool on

select paddr
, name as process_name
, description
, error as process_error
from v$bgprocess
where paddr != '00'
/
prompt

set feedback 6
