@config
alter session set nls_date_format='DD-MON-YYYY HH:MI AM';

--------------------------------------------------
--  Create a function to retrun a static table  --
--------------------------------------------------

drop type t_counselor_available_table;

-- Step 1: Create a user-defined type defining the rows we will return
CREATE OR REPLACE TYPE t_counselor_available_row AS object(
  counselor varchar(20),
  start_time date,
  duration number(3)
);
/

-- Step 2: Create a user-defined type defining the table we will return
CREATE OR REPLACE TYPE t_counselor_available_table AS 
table of t_counselor_available_row;
/

--Step 3: Create a function to return a static table with records
CREATE OR REPLACE FUNCTION counselor_availability
RETURN t_counselor_available_table
AS
BEGIN
  return t_counselor_available_table(
      t_counselor_available_row('Leslie Wright','16-FEB-'||extract(year from sysdate)||' 10:00 am', 60),
      t_counselor_available_row('Quinn Fowler','16-FEB-'||extract(year from sysdate)||' 2:00 pm', 15),
      t_counselor_available_row('Quinn Fowler','16-FEB-'||extract(year from sysdate)||' 11:40 am', 20)
  );

END ;
/

show errors;

select * from table(counselor_availability);

exit


