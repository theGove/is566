@config
alter session set nls_date_format='DD-MON-YYYY HH:MI AM';

--------------------------------------------------
--  Task Create a function to retrun a dynamic  --
--  table with hard-coded records               --
--------------------------------------------------

drop type t_counselor_available_table;


CREATE OR REPLACE TYPE t_counselor_available_row AS OBJECT (
  counselor VARCHAR(20),
  start_time DATE,
  duration NUMBER(3)
);
/

CREATE OR REPLACE TYPE t_counselor_available_table AS TABLE OF t_counselor_available_row;
/

CREATE OR REPLACE FUNCTION counselor_availability
RETURN t_counselor_available_table
AS
  v_ret t_counselor_available_table;
BEGIN
  v_ret := t_counselor_available_table();
  v_ret.extend;
  v_ret(v_ret.count) := t_counselor_available_row('Leslie Wright', (year from sysdate)||' 10:00 am', 60);

  v_ret.extend;
  v_ret(v_ret.count) := t_counselor_available_row('Quinn Fowler', '16-FEB-'||extract(year from sysdate)||' 2:00 pm', 15);

  v_ret.extend;
  v_ret(v_ret.count) := t_counselor_available_row('Quinn Fowler', '16-FEB-'||extract(year from sysdate)||' 11:40 am', 20);

  RETURN v_ret;
END ;
/

show errors;

SELECT * FROM TABLE(counselor_availability);

exit;
