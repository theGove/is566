@config

alter session set nls_date_format='DD-MON-YYYY HH:MI AM';

/***************Function that accepts parameters *******************/

------------------------------------------------------------
--  Build a function to return the number of appointments --
--  for the specified counselor and day                   --
------------------------------------------------------------


CREATE OR REPLACE FUNCTION appointment_count(
   p_counselor varchar,
   p_day varchar
  )
   RETURN int
AS
   v_count int;
   v_date date;
BEGIN
   v_date := to_date(p_day,'DD-MON-YYYY');
   select count(*) into v_count
   from appointment
   where trunc(start_time) = v_date
     and counselor = p_counselor;
   RETURN v_count ;
END;
/

------------------------------------------------------------

select APPOINTMENT_COUNT('Darrold Cooper','01-JUN-' || extract(year from sysdate)) as appt_count from dual;





exit