@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';

---------------------------------------------------------
-- Create a function to count the number of conflicts  -- 
-- for a proposed appointment time and counselor       --
---------------------------------------------------------

--This starting point is where we left off on the appointment_count function
CREATE OR REPLACE FUNCTION conflict_count(
  p_counselor varchar,
  p_date varchar
)

  return int
as
  v_count int;
  v_date date;
begin
  v_date := to_date(p_date,'DD-MON-YYYY');
  select count(*) into v_count from appointment
  where counselor = p_counselor
    and trunc(start_time)=v_date
  ;
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
