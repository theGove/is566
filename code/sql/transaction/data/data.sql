@config
drop table junk;
create table junk(
   id int primary key
  ,name varchar(50)
  ,cost decimal(10,2) default 9.99
);

grant select on junk to public;

 drop sequence junkID ;
 create sequence junkID start with 100 increment by 1;

 CREATE OR REPLACE TRIGGER junk_PK
  BEFORE INSERT ON junk
  FOR EACH ROW
    begin
      select junkID.nextval into :new.id from dual;
    end;
/

begin
  insert into junk values(null, 'Sony Betamax player', 22.95);
  insert into junk (name) values('Microsoft Zune');
  insert into junk (name, cost) values('HD DVD Player',23.99);
  insert into junk (name, cost) values('Apple Newton',149.99);
  insert into junk (name, cost) values('Kodak Land Camera',19.99);
  insert into junk (name, cost) values('CueCat scanner',9.99);
end;
/

select * from junk;

exit