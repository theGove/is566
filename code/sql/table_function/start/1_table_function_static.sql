@config
alter session set nls_date_format='DD-MON-YYYY HH:MI AM';

--------------------------------------------------
--  Create a function to retrun a static table  --
--------------------------------------------------

--drop type t_counselor_available_table;

-- Step 1: Create a user-defined type defining the rows we will return
CREATE OR REPLACE TYPE t_counselor_available_row AS
/

-- Step 2: Create a user-defined type defining the table we will return
CREATE OR REPLACE TYPE t_counselor_available_table AS
/

--Step 3: Create a function to return a static table with records
CREATE OR REPLACE FUNCTION counselor_availability
RETURN
AS
BEGIN


END ;
/

show errors;

exit;
