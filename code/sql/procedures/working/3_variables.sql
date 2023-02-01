@config
alter session set nls_date_format = 'DD-Mon-YYYY HH:MI AM';

delete from client where client_id >= 300;

/******* a simple procedure *********/

---------------------------------------------
--  Use a variable to supply the first name--
---------------------------------------------

create or replace procedure add_three
as
begin
  insert into client values(NULL,'Samuel','Sefcik','(303) 536-9869');
  insert into client values(NULL,'Samuel','Bronson','(239) 262-6667');
  insert into client values(NULL,'Samuel','Nokes','(830) 537-6322');
end;
/
show errors;

EXEC add_three;

select * from client where first_name = 'Samuel';

exit

