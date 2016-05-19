rem
rem ARQUIVO
rem    fklist.sql
rem
rem FINALIDADE
rem    Exibe lista de foreign keys que apontam para uma determinada tabela.
rem
rem MODIFICACOES
rem    01-mar-1999     Fabio Santana     criacao do script
rem

set echo off
set feedback off
set verify off

accept dono   prompt 'Informe o dono da tabela...: '
accept tabela prompt 'Informe o nome da tabela...: '

select table_name,
       constraint_name
from dba_constraints PRI
where owner = upper('&dono')
and constraint_type != 'C'
and exists
    ( select 'x'
      from dba_constraints SEG
      where SEG.owner = upper('&dono')
      and SEG.constraint_name = PRI.r_constraint_name
      and SEG.table_name = upper('&tabela')
    )
order by table_name, constraint_name;
prompt

set verify on
set feedback 6
