@config

alter session set nls_date_format='DD-MON-YYYY HH:MI AM';


/***************Built in functions*******************/

select SYSDATE from dual;

select NEXT_DAY(sysdate,'monday') as next_monday from dual;

select trunc(sysdate) as date_only from dual;

-----------------------------------------------------------------
--  modify this select statement to show just the current time --
-----------------------------------------------------------------

select sysdate as time_only from dual;

exit