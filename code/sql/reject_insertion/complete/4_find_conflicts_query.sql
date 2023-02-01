@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';

---------------------------------------------------------------------
--   Create a query that finds all appointments that would be in   --
--   conflict with a 55 minute appointment scheduled for 10:30 am  --
--   on June 2 of this year for a particular counselor.            --
--------------------------------------------------------------------- 

select * from appointment
where(  
  -- appointment that start before the proposed appointment ends
  start_time <= add_minutes('02-JUN-'||extract(year from sysdate)||' 10:30 AM',55)
  and 
  -- appointment that end after the proposed appointment starts
  add_minutes(start_time,duration) >= '02-JUN-'||extract(year from sysdate)||' 10:30 AM'
  )
order by counselor  
;

exit