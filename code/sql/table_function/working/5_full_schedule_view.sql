@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';

--------------------------------------------------------------
--  Create a view that displays the full schedule, showing  --
--  Breaks and apppointmnets in chronological ordrer        --
--------------------------------------------------------------

--  a query to show appointments
select * from appointment;

--  a query to show availability
select * from table(counselor_availability);

exit
