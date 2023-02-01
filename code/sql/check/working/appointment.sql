@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH24:MI';
 
drop table appointment;
create table appointment(
  APPT_ID int primary key
  ,COUNSELOR varchar(20)
  ,CLIENT_ID int
  ,ROOM number(1,0)
  ,START_TIME date
  ,DURATION number(3,0)
  -- add constraint to verify that the appointment is not too long or too short
);

 
insert into appointment values(1,'Quinn Fowler',100,1,to_date(extract(year from sysdate)||'-2-15 1:00 pm','yyyy-mm-dd hh:mi am'),55);
insert into appointment values(2,'Quinn Fowler',101,1,to_date(extract(year from sysdate)||'-2-15 2:00 pm','yyyy-mm-dd hh:mi am'),55);
insert into appointment values(3,'Quinn Fowler',102,1, to_date(extract(year from sysdate)||'-2-15 3:00 pm','yyyy-mm-dd hh:mi am'),55);
insert into appointment values(4,'Elizabeth Baker',105,2, to_date(extract(year from sysdate)||'-2-15 2:00 pm','yyyy-mm-dd hh:mi am'),115);
 
-- An appointment that is too short
insert into appointment values(5,'Elizabeth Baker',104,3, to_date(extract(year from sysdate)||'-2-15 1100 am','yyyy-mm-dd hh:mi am'),25);
 
-- An appointment that is too long
insert into appointment values(6,'Elizabeth Baker',103,3, to_date(extract(year from sysdate)||'-2-15 0900 am','yyyy-mm-dd hh:mi am'),125);

-- invalid room
insert into appointment values(7,'Elizabeth Baker',103,9, to_date(extract(year from sysdate)||'-2-15 0200 pm','yyyy-mm-dd hh:mi am'),55);
 
 
select * from appointment;
exit