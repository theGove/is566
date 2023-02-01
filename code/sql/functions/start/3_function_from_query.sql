@config

alter session set nls_date_format='DD-MON-YYYY HH:MI AM';

/***************Function to Return a value from a Query Result*******************/

------------------------------------------------------------
--  Build a function to return the number of appointments --
------------------------------------------------------------

CREATE OR REPLACE FUNCTION appointment_count
   RETURN int
AS
BEGIN
   RETURN 100;
END;
/

------------------------------------------------------------

select appointment_count from dual;




exit