@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';


-------------------------------------------------------
--  Create a function to add minutes to a given time --
--  and return the new time                          --     
-------------------------------------------------------


CREATE OR REPLACE FUNCTION add_minutes(
  p_start date,
  p_minutes int
  )
  return date
as
begin
  return p_start + p_minutes * (1/24/60);
end;
/

show errors;

-------------------------------------------------------

select add_minutes(trunc(sysdate), 9.5*60) as class_time
from dual;

exit
