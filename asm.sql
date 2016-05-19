select NAME DG, TOTAL_MB, FREE_MB, round((TOTAL_MB-FREE_MB)/TOTAL_MB*100) "PCT_UTILIZADO %" from v$asm_diskgroup;




-- alter tablespace PSAPSR3 add datafile '+ECP_DATA' size 1m;