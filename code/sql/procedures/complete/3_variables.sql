@config
alter session set nls_date_format = 'DD-Mon-YYYY HH:MI AM';

delete from client where client_id >= 300;

/******* a simple procedure *********/

---------------------------------------------
--  Use a variable to supply the first name--
---------------------------------------------

create or replace procedure add_three
as
  v_first_name varchar(20);
begin
  v_first_name := 'Samuel';
  insert into client values(NULL,v_first_name,'Sefcik','(303) 536-9869');
  insert into client values(NULL,v_first_name,'Bronson','(239) 262-6667');
  insert into client values(NULL,v_first_name,'Nokes','(830) 537-6322');
end;
/
show errors;

EXEC add_three;

select * from client where first_name = 'Samuel';

exit

