@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';

----------------------------------------------------
--  Add parameters to the counselor_availibility  --
--  function to specify start and end of day      --
----------------------------------------------------

drop type  t_counselor_available_table;

CREATE OR REPLACE TYPE t_counselor_available_row AS OBJECT (
  counselor VARCHAR(20),
  start_time DATE,
  duration NUMBER(3)
);
/

CREATE OR REPLACE TYPE t_counselor_available_table AS TABLE OF t_counselor_available_row;
/


CREATE OR REPLACE Function counselor_availability
  return t_counselor_available_table
  AS
    v_ret t_counselor_available_table;
    v_start_date date;
    v_counselor varchar(30);
    v_break_start date;
    v_break_duration int;

    CURSOR date_cursor
    IS
     select distinct  trunc(start_time) as start_date
     from appointment
     order by trunc(start_time);

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
     v_ret := t_counselor_available_table();
     FOR date_record
     IN date_cursor
     LOOP
       v_start_date :=date_record.start_date;
       FOR counselor_record
       IN counselor_cursor
       LOOP
         v_counselor :=counselor_record.counselor;
         v_break_start := v_start_date + 9 * (1/24);
         FOR appt_record
         IN appt_cursor
         LOOP
           v_break_duration := (appt_record.start_time - v_break_start) * 24 * 60;
           if v_break_duration >= 30 then
             v_ret.extend;
             v_ret(v_ret.count):=t_counselor_available_row(v_counselor, v_break_start, v_break_duration);
           end if;
           v_break_start := appt_record.start_time + appt_record.duration * (1/24/60);
         END LOOP;
         -- process the break after the last appointment of the day
         v_break_duration := ((v_start_date + 17 * (1/24)) - v_break_start) * 24 * 60;
         if v_break_duration >= 30 then
           v_ret.extend;
           v_ret(v_ret.count):=t_counselor_available_row(v_counselor, v_break_start, v_break_duration);
         end if;
       END LOOP;
     END LOOP;
     return v_ret;
  END;
/

show errors;


select * from table(counselor_availability)
where trunc(start_time) = '2-Jun-'||extract(year from sysdate);

exit
