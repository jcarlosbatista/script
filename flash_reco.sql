set lines 500 pages 9999
col espaco_limite(MB) for a30
col espaco_disponivel(MB) for a30
col porcentagem_usada(MB) for 999999999999999999
col name for a60
select name,
to_char(space_limit /1024/1024 , '999,999,999,999') "espaco_limite(MB)",
to_char((space_limit - space_used + space_reclaimable) /1024/1024 , '999,999,999,999') "espaco_disponivel(MB)",
round((space_used - space_reclaimable)/space_limit * 100,1) "porcentagem_usada(MB)" from v$recovery_file_dest;


--select * from v$flash_recovery_area_usage;