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
as
begin

end;
/

show errors;

select appointment_count('Darrold Cooper', '05-JUN-'||extract(year from sysdate)) as appts
from   dual;




exit
