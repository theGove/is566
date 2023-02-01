-- run setup.sql located in the homework folder to get your schema prepared for this assignment

/*

 Below, create a script that will build a function to return a table with the times
 that rooms are not scheduled for appointments.  Your function should show all times
 avialable that are at least 30 minutes in length between the hours of 9:00 am and 
 5:00 pm.  There must be a 5 minute break between each appointment booked in a given
 room so if an appointment ended at 3:55, the room wouldn't be available until 4:00
 Your procedure should reference the appointment table, which is created in the 
 script named setup.sql.

 The following vides may be of help:

  https://prof-oracle.blogspot.com/2018/01/cursor-in-stored-procedure.html
  https://prof-oracle.blogspot.com/2018/02/function-to-return-table.html

 */



CREATE OR REPLACE FUNCTION room_availability
AS
BEGIN
  
END;
/
show errors;