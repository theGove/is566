use is566;

drop table emp;

create table emp(
  employee_id int primary key,
  first_name varchar,
  last_name varchar,
  salary int
);

insert into emp(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY) values(104633,'Joshua','Rosa',82000);
insert into emp(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY) values(106581,'Zach','Barber',79900);
insert into emp(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY) values(111559,'Lisa','Tillman',84700);
insert into emp(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY) values(112202,'Bob','Benson',81900);
insert into emp(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY) values(115790,'Craig','Kerr',72900);

select * from emp;

update emp set 
  salary = 85000,
  first_name = 'Robert',
  last_name = 'Johnson'
where employee_id = 112202;

select * from emp;