@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';

-------------------------------------------------
-- Create a trigger to reject an insert if it  --
-- would create a conflict for a counselor     --
-------------------------------------------------

CREATE OR REPLACE TRIGGER counselor_schedule_conflict

end;
/

show errors;



exit
