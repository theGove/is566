-- appointmnet data can be seen graphically at the following URL
-- https://filedn.com/lOHnphPm3vnROy2M4FmMMtR/linux/oracle/images/6-2_schedule.png


@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';
-- Add a statement here to allow output to be shown in the console

---------------------------------------------------------
--  Create a procedure that uses a cursor to show the  --
--  list of days in the schedule                       --
---------------------------------------------------------


CREATE OR REPLACE PROCEDURE show_breaks
  AS
  BEGIN

  END;
/

show errors;

exec show_breaks;

exit
