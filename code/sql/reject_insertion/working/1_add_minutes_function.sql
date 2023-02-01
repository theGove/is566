@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';


-------------------------------------------------------
--  Create a function to add minutes to a given time --
--  and return the new time                          --     
-------------------------------------------------------


CREATE OR REPLACE FUNCTION add_minutes
as
begin
end;
/

show errors;

-------------------------------------------------------

select add_minutes(trunc(sysdate), 9.5*60) as class_time
from   dual;

exit
