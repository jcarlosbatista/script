prompt Entre com o valor do bloco em KB:
select TABLESPACE_NAME, 
TOTAL_BLOCKS*&bloco/1024 TAM_MB,
 USED_BLOCKS*&bloco/1024 USED_MB, 
FREE_BLOCKS*&bloco/1024 FREE_MB
from v$sort_segment;
undef bloco