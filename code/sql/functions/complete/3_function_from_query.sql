@config

alter session set nls_date_format='DD-MON-YYYY HH:MI AM';

/***************Function to Return a value from a Query Result*******************/

------------------------------------------------------------
--  Build a function to return the number of appointments --
------------------------------------------------------------

CREATE OR REPLACE FUNCTION appointment_count
   RETURN int
AS
   v_count int;
BEGIN
   select count(*) into v_count from appointment;
   RETURN v_count ;
END;
/

------------------------------------------------------------

select appointment_count from dual;




exit