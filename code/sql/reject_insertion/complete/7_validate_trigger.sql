@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';
SET SERVEROUTPUT ON;

delete from appointment 
where counselor = 'Darrold Cooper' and start_time = '2-JUN-' || extract(year from sysdate) || ' 10:30 AM';
select rownum, appointment.* from appointment where counselor = 'Darrold Cooper' and trunc(start_time) = to_date('2-JUN-' || extract(year from sysdate),'DD-Mon-YYYY');
begin
  dbms_output.put_line ('================================================================================');
  dbms_output.put_line ('Trying to insert for Darrold Cooper.    Insert should succeeed');
  dbms_output.put_line ('insert into appointment values(null,''Darrold Cooper'',104,2, to_date(''2-JUN-'||extract (year from sysdate)||' 10:30 am'',''dd-mon-yyyy hh:mi am''),55)');
  dbms_output.put_line ('================================================================================');
  insert into appointment values(null,'Darrold Cooper',104,2, to_date('2-JUN-'||extract (year from sysdate)||' 10:30 am','dd-mon-yyyy hh:mi am'),55);

  dbms_output.put_line (chr(10));
  dbms_output.put_line ('================================================================================');
  dbms_output.put_line ('Trying to insert a second appointment for Darrold Cooper.    Insert should fail');
  dbms_output.put_line ('insert into appointment values(null,''Darrold Cooper'',104,2, to_date(''2-JUN-'||extract (year from sysdate)||' 10:30 am'',''dd-mon-yyyy hh:mi am''),55)');
  dbms_output.put_line ('================================================================================');
  insert into appointment values(null,'Darrold Cooper',104,2, to_date('2-JUN-'||extract (year from sysdate)||' 10:30 am','dd-mon-yyyy hh:mi am'),55);
  EXCEPTION
  WHEN others THEN
  dbms_output.put_line ('Appication defined exception happened: ' || SQLCODE);
  
end;
/

select rownum, appointment.* 
from appointment 
where counselor = 'Darrold Cooper'
  and trunc(start_time) = '2-JUN-' ||extract (year from sysdate)  
;



exit

