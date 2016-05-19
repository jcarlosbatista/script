rem
rem ARQUIVO
rem    diskstat.sql
rem
rem FINALIDADE
rem    Exibe estatisticas de acessos por hard disk.
rem
rem MODIFICACOES
rem    01-07-97     Fabio Santana   criacao do script (pela n-esima vez...)
rem

set pause off
set feedback off

col phyrds       format 999,999,999,999 heading 'PHYSICAL|READS'
col phywrts      format 999,999,999,999 heading 'PHYSICAL|WRITES'
col phyblkrd     format 999,999,999,999 heading 'BLOCK|READS'
col phyblkwrt    format 999,999,999,999 heading 'BLOCK|WRITES'
col readtim      format 999,999,999,999 heading 'TEMPO DAS|LEITURAS'
col writetim     format 999,999,999,999 heading 'TEMPO DAS|GRAVAÇÕES'

break on report
compute sum of PHYRDS       on report
compute sum of PHYWRTS      on report
compute sum of PHYBLKRD     on report
compute sum of PHYBLKWRT    on report
compute sum of RDS_WRTS     on report
compute sum of BLK_RDS_WRTS on report
compute sum of READTIM      on report
compute sum of WRITETIM     on report

select substr(d.name, 1, 4) as disk,
       sum(f.phyrds) as phyrds, sum(f.phywrts) as phywrts,
       sum(f.phyblkrd) as phyblkrd, sum(f.phyblkwrt) as phyblkwrt,
--       sum(f.phyrds+f.phywrts) as rds_wrts,
--       sum(f.phyblkrd+f.phyblkwrt) as blk_rds_wrts,
       sum(f.readtim) as readtim,
       sum(f.writetim) as writetim
from v$datafile d,
     v$filestat f
where d.file# = f.file#
group by substr(d.name, 1, 4);
prompt

clear breaks
clear compute

set feedback 6
