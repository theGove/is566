@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';

-------------------------------------------------------------
--  Create a function to count the number of appointments  --
--  on a given day for a given counselor                   --
-------------------------------------------------------------

CREATE OR REPLACE FUNCTION appointment_count(
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

select appointment_count('Darrold Cooper', '05-JUN-'||extract(year from sysdate)) as appts
from   dual;




exit
