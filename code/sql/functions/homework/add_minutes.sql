@config

alter session set nls_date_format='DD-MON-YYYY HH:MI AM';

/***************Function to manipulate dates and times *******************/

----------------------------------------------
--  Build a function to return the end time --
--  for a given start time and duration     --
----------------------------------------------

CREATE OR REPLACE FUNCTION add_minutes()
/
show errors;
----------------------------------------------

select appointment.*
       , add_minutes(start_time, duration) as end_time
from   appointment
where  counselor = 'Leslie Wright';

exit