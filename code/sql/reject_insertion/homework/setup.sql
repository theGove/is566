@config
alter session set nls_date_format='DD-MON-YYYY HH:MI AM';

drop table appointment;
drop table client;

create table client(
  CLIENT_ID int primary key,
  FIRST_NAME varchar(20),
  LAST_NAME varchar(20),
  PHONE varchar(14)
);

insert into client values(100,'Ashley','Lloyd','(508) 759-1317');
insert into client values(101,'Sandra','Welch','(508) 786-0586');
insert into client values(102,'Clive','Sanford','(508) 297-2070');
insert into client values(103,'Abby','Harris',null);
insert into client values(104,'Gene','Mann','(508) 478-4373');
insert into client values(105,'Jennifer','Marin','(508) 867-5309');
insert into client values(106,'Theodore','Laurents','(508) 867-5903');

create table appointment(
  APPT_ID int primary key,
  COUNSELOR varchar(20),
  CLIENT_ID int references client,
  ROOM number(1,0),
  START_TIME date,
  DURATION number(3,0) 
);

insert into appointment values(1,'Quinn Fowler',100,1,to_date(extract(year from sysdate)||'-2-15 1:00 pm','yyyy-mm-dd hh:mi am'),55);
insert into appointment values(2,'Quinn Fowler',101,1,to_date(extract(year from sysdate)||'-2-15 2:00 pm','yyyy-mm-dd hh:mi am'),85);
insert into appointment values(3,'Quinn Fowler',102,1, to_date(extract(year from sysdate)||'-2-15 3:30 pm','yyyy-mm-dd hh:mi am'),55);
insert into appointment values(4,'Elizabeth Baker',105,2, to_date(extract(year from sysdate)||'-2-15 2:00 pm','yyyy-mm-dd hh:mi am'),115);
insert into appointment values(5,'Elizabeth Baker',103,2, to_date(extract(year from sysdate)||'-2-15 11:00 am','yyyy-mm-dd hh:mi am'),45);
insert into appointment values(6,'Leslie Wright',106,2, to_date(extract(year from sysdate)||'-2-15 1:00 pm','yyyy-mm-dd hh:mi am'),115);

select * from client;
select * from appointment;

exit
