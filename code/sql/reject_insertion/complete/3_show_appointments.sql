@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';

-- The following query shows all appointments on June 2 of this 
-- year this can be seen graphically at 
-- https://filedn.com/lOHnphPm3vnROy2M4FmMMtR/linux/oracle/images/june_2.png

select * 
from   appointment
where  trunc(start_time) = '02-JUN-' || extract(year from sysdate)
order 
   by  counselor, start_time;

exit
