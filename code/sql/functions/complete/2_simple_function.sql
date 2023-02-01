@config

/***************Simple function*******************/

------------------------------------------------------
--  Build a function to return the number seven (7) --
------------------------------------------------------
CREATE OR REPLACE FUNCTION seven
   RETURN int
AS
BEGIN
   RETURN 7;
END;
/
------------------------------------------------------
select seven from dual;


exit