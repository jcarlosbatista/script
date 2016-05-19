@base
SET HEAD OFF
PROMPT FASOWNER
select round(sum(bytes)/1024/1024, 2)
from dba_segments
where owner = 'FASOWNER'
group by owner
/
SET HEAD OFF
PROMPT MSTOWNER
select round(sum(bytes)/1024/1024, 2)
from dba_segments
where owner = 'MSTOWNER'
group by owner
/
SET HEAD OFF
PROMPT CTROWNER
select round(sum(bytes)/1024/1024, 2)
from dba_segments
where owner = 'CTROWNER'
group by owner
/
SET HEAD OFF
PROMPT RMROWNER
select round(sum(bytes)/1024/1024, 2)
from dba_segments
where owner = 'RMROWNER'
group by owner
/

