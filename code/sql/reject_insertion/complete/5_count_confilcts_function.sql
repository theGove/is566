@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';

---------------------------------------------------------
-- Create a function to count the number of conflicts  -- 
-- for a proposed appointment time and counselor       --
---------------------------------------------------------

--This starting point is where we left off on the appointment_count function
CREATE OR REPLACE FUNCTION conflict_count(
p_counselor varchar,
p_start_time date,
p_duration int
)
  return int
as
  v_count int;
begin
  select count(*) into v_count from appointment
  where(  
    -- appointment that start before the proposed appointment ends
    start_time <= add_minutes(p_start_time,p_duration)
    and 
    -- appointment that end after the proposed appointment starts
    add_minutes(start_time,duration) >= p_start_time
  )
    and counselor = p_counselor;
  return v_count;
end;
/

show errors;

with counselor as(
  select distinct counselor as name from appointments
)
select name, 
       conflict_count(name,'2-JUN-'||extract(year from sysdate)||' 10:30 AM',55) as conflicts 
from   counselor
order
   by  name;
exit
