use is566;

drop table employee2;

create table employee2(
  employee_id uuid,
  first_name text,
  last_name text,
  address text,
  city text,
  state text,
  zip text,
  phone text,
  title text,
  salary int,
  note text,
  primary key employee_id
);


insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Joshua','Rosa','5000 N Wolcott Ave','Chicago','IL','60640','(773) 293-6409','Sanitarian',82000);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Zach','Barber','7522 N Oleander Ave','Chicago','IL','60631','(219) 473-0757','Sanitarian',79900);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Lisa','Tillman','5529 S Dorchester Ave','Chicago','IL','60637','(773) 424-5470','Sanitarian',84700);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Bob','Benson','7011 S Campbell Ave','Chicago','IL','60629','(773) 891-8653','Sanitarian',81900);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Craig','Kerr','300 N State St Apt 4801','Chicago','IL','60654','(219) 473-9718','Sanitarian',72900);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Standard','Murray','8633 S Yates Blvd','Chicago','IL','60617','(773) 891-5230','Sanitarian',83300);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Rosemary','Kennedy','3239 W Hirsch St Apt 1','Chicago','IL','60651','(630) 859-3286','Sanitarian',64700);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Sarah','Lindsey','4704 W Wrightwood Ave','Chicago','IL','60639','(773) 227-0204','Sanitarian',70600);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Jessica','Anthony','7211 S Hermitage Ave','Chicago','IL','60636','(630) 859-2291','Sanitarian',71500);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Mark','Atkins','1000 N Lake Shore Plz','Chicago','IL','60611','(773) 907-7655','Sanitarian',75900);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Vicky','Coleman','1241 W Barry Ave','Chicago','IL','60657','(773) 434-8235','Sanitarian',64100);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Randall','Curtis','11812 S Justine St','Chicago','IL','60643','(773) 235-7702','Sanitarian',82700);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Ruth','Noble','2249 W Marquette Rd','Chicago','IL','60636','(773) 434-9505','Sanitarian',77400);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Arnold','Holder','2341 E 92nd St','Chicago','IL','60617','(773) 221-6608','Sanitarian',63500);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Robert','Morin','7337 S South Shore Dr Apt 320','Chicago','IL','60649','(219) 473-5482','Sanitarian',76000);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'David','Hodges','3108 W 63rd St','Chicago','IL','60629','(773) 789-2283','Sanitarian',68400);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Daryl','William','4218 S Calumet Ave','Chicago','IL','60653','(773) 855-9558','Sanitarian',80300);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Eric','Henson','7305 S Morgan St','Chicago','IL','60621','(773) 862-4881','Sanitarian',81300);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Robert','Lane','7642 S Rhodes Ave','Chicago','IL','60619','(773) 253-8766','Sanitarian',83200);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Thomas','Langley','9118 S Oglesby Ave','Chicago','IL','60617','(773) 437-4932','Sanitarian',63500);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Philip','Powers','1916 N Albany Ave','Chicago','IL','60647','(773) 862-4911','Sanitarian',70800);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Tawana','Huffman','506 E 88th Pl','Chicago','IL','60619','(773) 638-2715','Sanitarian',83200);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Cecelia','Glenn','1401 E 55th St Apt 808n','Chicago','IL','60615','(773) 665-6795','Sanitarian',63700);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Richard','Tyler','4726 N Campbell Ave Apt 1','Chicago','IL','60625','(773) 373-7888','Sanitarian',70300);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Christopher','Riddle','6558 S Campbell Ave Apt 2','Chicago','IL','60629','(773) 293-1713','Sanitarian',75600);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Marcus','Parker','11806 S Vincennes Ave','Chicago','IL','60643','(773) 227-6246','Sanitarian',68200);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Timothy','Kennedy','6521 N Oketo Ave','Chicago','IL','60631','(312) 787-9982','Sanitarian',79600);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Shauntae','Guerrero','1029 N Hamlin Ave # 3','Chicago','IL','60651','(773) 424-9777','Sanitarian',70800);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Kenndell','Jensen','7723 S Paxton Ave','Chicago','IL','60649','(773) 891-4417','Sanitarian',79000);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Lavetta','Carlson','8131 S Kingston Ave Apt 3','Chicago','IL','60617','(773) 293-8204','Sanitarian',78100);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Gregory','Cardenas','8957 S Justine St','Chicago','IL','60620','(773) 745-6752','Supervisor',93100);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Leah','Nelson','1435 W 105th Pl','Chicago','IL','60643','(773) 881-4251','Sanitarian',84100);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Kathryn','Hopper','858 W Diversey Pkwy','Chicago','IL','60614','(773) 472-6244','Supervisor',85800);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Carolyn','Odom','8141 S Essex Ave','Chicago','IL','60617','(773) 768-6780','Sanitarian',63500);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Melanie','Ingram','PO Box 546','Park Forest','IL','60466','(773) 472-8722','Supervisor',92400);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Ruffin','Branch','6360 S Minerva Ave','Chicago','IL','60637','(773) 363-1274','Sanitarian',66200);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Donald','Mathews','5757 N Sheridan Rd','Chicago','IL','60660','(773) 907-3598','Supervisor',84600);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Jessica','Doyle','4239 N Lincoln Ave Apt 2','Chicago','IL','60618','(773) 253-9446','Sanitarian',79200);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Darlisha','Jacobs','7347 S Damen Ave','Chicago','IL','60636','(773) 221-9206','Supervisor',85100);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Willie','Downs','8200 S East End Ave','Chicago','IL','60617','(708) 338-7346','Sanitarian',71100);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Vincent','Rosario','1216 W Belmont Ave','Chicago','IL','60657','(773) 638-2938','Supervisor',91100);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Valeria','Mcgowan','4033 N Kenneth Ave','Chicago','IL','60641','(773) 745-7003','Sanitarian',84800);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Anthony','David','7621 S Emerald Ave','Chicago','IL','60620','(219) 473-6022','Supervisor',66500);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Jalen','Stokes','1549 E 93rd St','Chicago','IL','60619','(773) 468-1285','Sanitarian',81900);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Bobby','Adkins','1250 W Dexter Ln','Hoffman Estates','IL','60169','(219) 473-1345','Division Manager',135200);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Tyfenny','Ball','2919 W Warren Blvd','Chicago','IL','60612','(773) 846-9283','Sanitarian',62200);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Angeline','Sargent','4133 S Prairie Ave Apt 3n','Chicago','IL','60653','(708) 338-2784','Sanitarian',75800);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Charles','Mason','8314 S Mackinaw Ave Apt 1','Chicago','IL','60617','(312) 385-7215','Sanitarian',70800);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Lori','Fitzgerald','1117 S Karlov Ave','Chicago','IL','60624','(773) 253-7036','Sanitarian',78800);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Jeffery','George','5746 S Marshfield Ave','Chicago','IL','60636','(773) 434-8977','Sanitarian',72800);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Zachary','Blanchard','860 W Blackhawk St Unit 1806','Chicago','IL','60642','(708) 926-4138','Sanitarian',67200);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Loran','Burgess','3336 W Madison St','Chicago','IL','60624','(773) 826-0976','Sanitarian',70200);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Maryalice','Holder','3228 N Oriole Ave','Chicago','IL','60634','(773) 625-2879','Sanitarian',80100);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Margaret','Rodriquez','4255 N Oak Park Ave Apt 202','Chicago','IL','60634','(773) 434-1869','Sanitarian',69500);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'James','Joyce','3933 N Seeley Ave # 2','Chicago','IL','60618','(773) 665-1074','Sanitarian',72400);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Aaron','Ray','7443 S Chappel Ave Apt S2','Chicago','IL','60649','(773) 855-7454','Sanitarian',80600);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Jacquelyn','Coleman','5605 N Glenwood Ave Apt 3','Chicago','IL','60660','(312) 385-9362','Sanitarian',67700);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Rosemary','Pittman','5728 W Grace St','Chicago','IL','60634','(312) 385-2976','Sanitarian',73500);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Darlicia','Kent','2640 W 13th St Apt 301','Chicago','IL','60608','(312) 640-1047','Sanitarian',78800);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Nicole','England','1831 S Avers Ave','Chicago','IL','60623','(773) 801-1849','Sanitarian',66100);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Grayln','Rogers','6918 S Rockwell St','Chicago','IL','60629','(773) 424-0844','Sanitarian',72000);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Melisa','Leblanc','7735 S East End Ave Apt 1','Chicago','IL','60649','(773) 855-9501','Sanitarian',81500);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Bernita','Underwood','1027 W Vermont Ave','Chicago','IL','60827','(708) 926-9294','Sanitarian',71800);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Jeffrey','Head','417 S Jefferson St Apt 404','Chicago','IL','60607','(708) 926-9285','Sanitarian',75500);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Christina','Fischer','2228 S Kildare Ave Apt 1','Chicago','IL','60623','(773) 855-2454','Sanitarian',63100);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Marvin','Tyson','3416 W Beach Ave','Chicago','IL','60651','(773) 235-7016','Sanitarian',78600);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Donald','Davis','2831 E 76th Pl','Chicago','IL','60649','(773) 363-2655','Sanitarian',81500);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Jeremaih','Mullen','6616 N Damen Ave','Chicago','IL','60645','(773) 363-7141','Sanitarian',74300);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Graegar','Bowers','3230 N Sheffield Ave','Chicago','IL','60657','(773) 472-0424','Sanitarian',70900);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Wendy','Sanders','70 W Burton Pl Apt 1902','Chicago','IL','60610','(312) 787-7384','Sanitarian',62400);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Monique','Spencer','137 N Waller Ave Apt 1w','Chicago','IL','60644','(773) 887-4691','Sanitarian',81500);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Walter','Melendez','1241 W 72nd Pl','Chicago','IL','60636','(773) 846-2358','Sanitarian',67800);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Larry','Pollard','11505 S Church St','Chicago','IL','60643','(773) 468-2768','Sanitarian',71400);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Stephanie','Goodwin','756 E 131st St','Chicago','IL','60827','(773) 293-9448','Sanitarian',81000);
insert into employee(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE, TITLE, SALARY) values(uuid(),'Anastasia','Hansen','6023 S Elizabeth St','Chicago','IL','60636','(773) 424-8729','Sanitarian',79300);

