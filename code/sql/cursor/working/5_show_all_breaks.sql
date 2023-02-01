@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';
SET ServerOutPut ON FORMAT WRAPPED

------------------------------------------------------
--  Modify this stored procedure to show ALL the    --
--  breaks between appointments for each counselor  --
------------------------------------------------------

CREATE OR REPLACE PROCEDURE show_breaks
  AS
    v_start_date date;
    v_counselor varchar(30);
    v_break_start date;
    v_break_duration int;

    CURSOR date_cursor
    IS
     select distinct  trunc(start_time) as start_date
     from appointment
     order by start_date;

    CURSOR counselor_cursor
    IS
     select distinct  trunc(start_time) as start_date, counselor
     from appointment
     where trunc(start_time) = v_start_date
     order by counselor;

     CURSOR appt_cursor
     IS
        select *
        from appointment
        where trunc(start_time) = v_start_date
          and counselor=v_counselor
        order by start_time;

  BEGIN
     FOR date_record
     IN date_cursor
     LOOP
       v_start_date :=date_record.start_date;
       DBMS_OUTPUT.put_line (v_start_date);
       FOR counselor_record
       IN counselor_cursor
       LOOP
         v_counselor :=counselor_record.counselor;
         v_break_start := v_start_date + 9 * (1/24);
         DBMS_OUTPUT.put_line ('    ' || v_counselor);
         FOR appt_record
         IN appt_cursor
         LOOP
           v_break_duration := (appt_record.start_time - v_break_start) * 24 * 60;
           DBMS_OUTPUT.put_line ('        ' ||
                                 ' break starts at ' ||  v_break_start ||
                                 ' break duration ' ||  v_break_duration

           );
           v_break_start := appt_record.start_time + appt_record.duration * (1/24/60);

         END LOOP;
       END LOOP;
     END LOOP;
  END;
/

show errors;

exec show_breaks;

exit
