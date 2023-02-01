@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';

--------------------------------------------------------------
--  Create a view that displays the full schedule, showing  --
--  Breaks and apppointmnets in chronological ordrer        --
--------------------------------------------------------------

create or replace view full_schedule as
select * from appointment

union

select null, COUNSELOR, null, null, START_TIME, DURATION 
from table(counselor_availability);

select * 
from full_schedule
where trunc(START_TIME) = '2-Jun-' || extract(year from sysdate)
order by trunc(START_TIME), counselor, start_time ;

exit
