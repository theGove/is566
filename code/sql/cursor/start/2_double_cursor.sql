@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';
SET ServerOutPut ON FORMAT WRAPPED

---------------------------------------------------------
--  Modify this stored procedure to show which         --
--  counselors are scheduled on each day               --
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
