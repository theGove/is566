@config

drop sequence object_id;
-- add code to create the sequence here

create sequence object_id 
start with      100 
increment by    1;

-- end of code to create sequence

select object_id.nextval from dual;
select object_id.nextval from dual;
select object_id.nextval from dual;

exit