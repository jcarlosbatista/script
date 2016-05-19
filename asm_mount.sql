TTITLE LEFT SKIP 1 "ASM DISK GROUPS" SKIP 2
    SET LINES 120 PAGES 999
    CLEAR COLUMNS
    COLUMN "HOSTNAME"   FORMAT a15
    COLUMN "INSTANCE"   FORMAT a10
    COLUMN "INST_CAPTURA" FORMAT a18
    COLUMN "GROUP"      FORMAT 999  
    COLUMN "GROUP_NAME" FORMAT a15
    COLUMN "STATE"      FORMAT a10
    COLUMN "TYPE"       FORMAT a7
    COLUMN "TOTAL_MB"   FORMAT 9,999,000
    COLUMN "FREE_MB"    FORMAT 9,999,000
    SELECT  host_name "HOSTNAME",
                    instance_name "INSTANCE",
                    SUBSTR(TO_CHAR(sysdate,' dd/mm/yy hh24:mi:ss'),1,20) "INST_CAPTURA",
            group_number  "GROUP",
            name          "GROUP_NAME",
            state         "STATE",
            type          "TYPE",
            total_mb      "TOTAL_MB",
            free_mb       "FREE_MB"  FROM    v$asm_diskgroup, v$instance;
            DECODE(100 - ceil(FREE_MB/TOTAL_MB*100), NULL, 100, 100 - ceil(FREE_MB/TOTAL_MB*100)) "% USADO"
    FROM    v$asm_diskgroup, v$instance;
TTITLE OFF
