@config
alter session set nls_date_format = 'DD-Mon-YYYY HH:MI AM';

delete from client where client_id >= 300;

/******* a simple procedure *********/

--------------------------------------------------------------
--  Convert the following procedure into a stored procedure --
--------------------------------------------------------------

begin
  insert into client values(NULL,'Parker','Sefcik','(303) 536-9869');
  insert into client values(NULL,'Parker','Bronson','(239) 262-6667');
  insert into client values(NULL,'Parker','Nokes','(830) 537-6322');
end;
/


select * from client where first_name = 'Parker';

exit

