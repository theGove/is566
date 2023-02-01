@config

drop table counselor;

create table counselor(
 counselor_id int primary key
,first_name varchar(10)
,last_name varchar(12)
,address varchar(25)
,city varchar(10)
,state char(2)
,ZIP varchar(5)
,Phone char(14)
,SSN char(11)
,birthdate date
);

-- add code to create trigger here
 
CREATE OR REPLACE TRIGGER object_id
 BEFORE INSERT ON counselor
 FOR EACH ROW
   begin
     :new.counselor_id := object_id.nextval;
   end;
/
 


-- end of code to create trigger
show errors;
 
insert into counselor values(11,'Kristine','Hester','8317 Robert Bruce DR','Richmond','VA','23226','(804) 276-4149','120-66-2854','18-JUN-1977');
insert into counselor values(12,'Zachariah','Wilkinson','6732 Miami AVE','Richmond','VA','23235','(434) 634-2635','765-04-1210','12-MAR-1971');
insert into counselor values(13,'Michael','Morse','2101 Greenfield DR','Richmond','VA','23234','(804) 330-5791','316-88-0199','08-OCT-1951');
insert into counselor values(14,'Sebastian','Schmidt','5505 Handel CT #APT E','Richmond','VA','23236','(804) 674-4860','290-54-5212','15-JUL-1984');
insert into counselor values(15,'Wendy','Morrow','312 Pullbrooke DR','Richmond','VA','23229','(910) 655-9763','495-54-4471','28-JUL-1991');

select counselor_id, first_name, last_name, phone from counselor;
 
exit
