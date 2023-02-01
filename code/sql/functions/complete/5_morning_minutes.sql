@config

alter session set nls_date_format='DD-MON-YYYY HH:MI AM';
-- set serveroutput on
-- dbms_output.put_line ('printing to screen');


/***************Function to manipulate dates and times *******************/

----------------------------------------------------------------
--  Build a function to show how many minutes are between the --
--  start of the workday (8:00 am) and the datetime given     --
----------------------------------------------------------------

CREATE OR REPLACE FUNCTION morning_minutes(
   p_date date
  )
   RETURN int
AS
   v_free_minutes int;
   v_first_appt date;
   v_day_starts date;
BEGIN

   v_day_starts := trunc(p_date) + (8 * 60 * (1/24/60));  
   v_free_minutes := (p_date - v_day_starts)*24*60;  
   RETURN v_free_minutes ;

END;
/
show errors;
----------------------------------------------
with appt_days as(
    select counselor
          ,min(start_time) as first_appt
    from   appointment            
    group 
       by  counselor 
          ,trunc(start_time)
)
select counselor
      ,first_appt
      ,morning_minutes(first_appt) as minutes_free
from   appt_days
order 
    by counselor
      ,first_appt
;

select morning_minutes('01-JUN-2020 9:00 am') as minutes from dual;
exit