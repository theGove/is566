@config

alter session set nls_date_format = 'DD-Mon-YYYY HH:MI AM';

delete from client where client_id >= 300;

/******* a simple procedure *********/

-------------------------------------------------------------
--  Print to the console the number of records before and  --
--  after inserting the records                            --
-------------------------------------------------------------

create or replace procedure add_three(
  p_first_name varchar
)
as 
  v_record_count int;
begin
  insert into client values(NULL,p_first_name,'Sefcik','(303) 536-9869');
  insert into client values(NULL,p_first_name,'Bronson','(239) 262-6667');
  insert into client values(NULL,p_first_name,'Nokes','(830) 537-6322');
end;
/
show errors;

EXEC add_three('Alec');

select * from client where first_name = 'Alec';

exit

