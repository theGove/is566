@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';

---------------------------------------------------------------------
--   Create a query that finds all appointments that would be in   --
--   conflict with a 55 minute appointment scheduled for 10:30 am  --
--   on June 2 of this year for a particular counselor.            --
--------------------------------------------------------------------- 

select * from appointment

order by counselor
;

exit
