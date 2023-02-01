-- appointmnet data can be seen graphically at the following URL
-- https://filedn.com/lOHnphPm3vnROy2M4FmMMtR/linux/oracle/images/6-2_schedule.png


@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';
-- Add a statement here to allow output to be shown in the console
SET ServerOutPut ON FORMAT WRAPPED

---------------------------------------------------------
--  Create a procedure that uses a cursor to show the  --
--  list of days in the schedule                       --
---------------------------------------------------------


CREATE OR REPLACE PROCEDURE show_breaks
  AS
    v_start_date date;
    CURSOR  date_cursor
    is
      select distinct trunc(start_time) as start_date
      from appointment
      order by start_date;
  BEGIN
    for date_record 
    in date_cursor
    loop 
      v_start_date :=date_record.start_date;
      DBMS_OUTPUT.put_line(v_start_date);
    end loop;
  END;
/

show errors;

exec show_breaks;

exit
