rem
rem ARQUIVO
rem    ativo.sql
rem
rem FINALIDADE
rem    Exibe informacoes sobre usuarios executando um comando AGORA.
rem
rem MODIFICACOES
rem    01-07-97     Fabio Santana    criacao do script (pela n-esima vez...)
rem


set lines 500 pages 9999
col username for a20
col program for a45
col machine_osuser for a40
col status for a10
col sessao for a20
col logon_time for a20
set echo off feedback off pause off verify off trimspool on

select s.username,
       to_number(p.spid) as os_pid,
       '''' || to_char(s.sid) || ',' || to_char(s.serial#) || '''' as sessao,
       s.server,
       s.machine || ': ' || s.osuser as machine_osuser,
       s.program,
       decode( trunc(sysdate-s.logon_time),            -- dias conectado
               0, to_char(s.logon_time,'hh24:mi:ss'),  -- se menos de um dia
                  to_char(trunc(sysdate-s.logon_time, 1), 'fm99.0') || ' dias'
             ) as logon_time,
       decode( trunc(last_call_et/86400),  -- 86400 seg = 1 dia
               0, '     ',                 -- se 0 dias, coloca brancos
                  to_char(trunc(last_call_et/60/60/24), '0') || 'd, ')
       || to_char( to_date(mod(last_call_et, 86400), 'SSSSS'),
                              'hh24"h"MI"m"SS"s"'
                 ) as last_call_et,
       decode(status, 'ACTIVE', 'ATIVO',
                      'INACTIVE', 'INATIVO',
                      status) as status
from sys.gv_$session s, sys.gv_$process p
where s.username is not null
and s.paddr = p.addr
and s.status = 'ACTIVE'
order by status, s.username
/
prompt

set feedback 6
