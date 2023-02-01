@config
alter session set NLS_DATE_FORMAT='DD-Mon-YYYY HH:MI AM';

-------------------------------------------------
-- Create a trigger to reject an insert if it  --
-- would create a conflict for a counselor     --
-------------------------------------------------

CREATE OR REPLACE TRIGGER counselor_schedule_conflict
  before insert on appointment
  for each row
  declare
    v_conflicts int;
  begin
    v_conflicts := conflict_count(:new.counselor, :new.start_time, :new.duration);
    if v_conflicts > 0 then
      raise_application_error(-20001,'Cannot add appointment.  There is a conflicting appointment for ' || :new.counselor);
    end if;
end;
/

show errors;



exit
