-- run setup.sql located in this folder to get your schema prepared for this assignment

/*
Create a trigger that will prevent a room from being double scheduled.  
Make sure that no appointments overlap for any room and that there is 
at least 5 minutes between the end of one appointment and the start of 
another.  So if one appointment ends at 3:55, the soonest the next 
appointment could start in that room is 4:00.

Your script should pickup where the setup.sql leaves off and continue 
from there to build the trigger.  DO NOT include the statements in the 
setup.sql as a part of your submission.  The grader will execute that
script and then your solution to evaluate your performance. 
You may create other objects (such as a function) if you like to make 
your trigger more manageable; however, everything needed for your 
trigger to work needs to be spefied in this file.

The following video may be of help:
https://prof-oracle.blogspot.com/2018/01/trigger-that-uses-function-to-evaluate.html

*/

CREATE OR REPLACE TRIGGER room_schedule_conflict
begin
end;
/

show errors;



exit
