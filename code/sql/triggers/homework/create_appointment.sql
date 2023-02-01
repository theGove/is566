@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH24:MI';
-- an example for logging the time and user who create and modified records
drop table appointment;
create table appointment(
   APPT_ID int primary key,
   COUNSELOR varchar(20),
   CLIENT_ID int,
   ROOM number(1,0),
   START_TIME date,
   DURATION number(3,0) ,
   -- these are the fields we will use for logging
   create_date date,
   created_by varchar(30),
   change_date date,
   changed_by varchar(30)
 );

--Code for trigger to log record changes goes here

show errors;
-- End of code to log record changes

insert into appointment (appt_id, counselor, client_id, room, start_time, duration)
values(1,'Quinn Fowler',100,1,to_date('2016-2-15 1:00 pm','yyyy-mm-dd hh:mi am'),55);

select APPT_ID, COUNSELOR, CLIENT_ID, ROOM, START_TIME, DURATION from appointment;
select APPT_ID, CREATE_DATE, CREATED_BY, CHANGE_DATE, CHANGED_BY from appointment;

update appointment set duration = 115 where appt_id = 1;

select APPT_ID, COUNSELOR, CLIENT_ID, ROOM, START_TIME, DURATION from appointment;
select APPT_ID, CREATE_DATE, CREATED_BY, CHANGE_DATE, CHANGED_BY from appointment;

exit
