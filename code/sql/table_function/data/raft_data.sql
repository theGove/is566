@config
alter session set nls_date_format='DD-MON-YYYY HH:MI AM';


drop view appointments;
drop table appointment;
drop table available;
drop table client;
drop table junk;

drop sequence availableid;
drop sequence clientid;
drop sequence apptid;

purge recyclebin;

create table junk(id int);

create table available(
  available_ID int primary key,
  COUNSELOR varchar(20),
  START_TIME date,
  DURATION number(3,0) 
);

 create sequence availableID start with 100 increment by 1;

 CREATE OR REPLACE TRIGGER available_PK
  BEFORE INSERT ON available
  FOR EACH ROW
    begin
      select availableID.nextval into :new.available_id from dual;
    end;
/


create table client(
  CLIENT_ID int Primary Key,
  FIRST_NAME varchar(20),
  LAST_NAME varchar(20),
  PHONE varchar(14)
);

 create sequence clientID start with 100 increment by 1;
 
 
 CREATE OR REPLACE TRIGGER client_PK
  BEFORE INSERT ON client
  FOR EACH ROW
    begin
      select clientID.nextval into :new.client_id from dual;
    end;
/



 create table appointment(
   APPT_ID int primary key,
   COUNSELOR varchar(20),
   CLIENT_ID int,
   ROOM number(1,0),
   START_TIME date,
   DURATION number(3,0)
 );

  create sequence apptID start with 100 increment by 1;

 CREATE OR REPLACE TRIGGER appointment_PK
  BEFORE INSERT ON appointment
  FOR EACH ROW
    begin
      select apptID.nextval into :new.appt_id from dual;
    end;
/



CREATE VIEW APPOINTMENTS AS 
  SELECT APPT_ID
        ,Counselor
        ,cast(to_char(START_TIME,'DD-MON-YYYY') as char(11)) as APPT_DATE
        ,to_char(START_TIME,'HH:MI AM') as START_TIME
        ,DURATION
        ,cast(CLIENT.FIRST_NAME || ' ' || CLIENT.LAST_NAME as varchar(20)) as client
        ,ROOM 
  FROM  APPOINTMENT 
   join CLIENT 
     on APPOINTMENT.client_id = client.client_id
  ;
/

insert into junk values(1);

insert into client values(NULL,'Josephine','Lee','(303) 536-9896');
insert into client values(NULL,'Catherine','Chen','(239) 262-6676');
insert into client values(NULL,'Sandra','Welch','(830) 537-6342');
insert into client values(NULL,'Jonathon','Jacobson','(252) 449-6898');
insert into client values(NULL,'Kirsten','Zimmerman','(402) 684-2298');
insert into client values(NULL,'Numbers','Gallagher','(781) 380-0635');
insert into client values(NULL,'Terrance','Stevens','(718) 774-9590');
insert into client values(NULL,'Dexter','Campbell','(337) 828-4602');
insert into client values(NULL,'Monica','Garfield','(252) 435-2945');
insert into client values(NULL,'Roosevelt','Morales','(914) 723-5217');
insert into client values(NULL,'David','Marjolin','(712) 668-4459');
insert into client values(NULL,'Wahyu','Wibowo','(407) 549-5575');
insert into client values(NULL,'Gerard','Beard','(803) 794-1497');
insert into client values(NULL,'Alfredo','Valdez','(308) 848-2922');
insert into client values(NULL,'Abdul','Hafeez-Baig','(330) 735-2094');
insert into client values(NULL,'Clive','Sanford','(973) 299-8416');
insert into client values(NULL,'Carlos','Sloan','(315) 425-7121');
insert into client values(NULL,'Sadie','Dickinson','(301) 689-5429');
insert into client values(NULL,'Benjamin','Darden','(908) 617-5313');
insert into client values(NULL,'Nancy','Gustafson','(415) 488-9736');
insert into client values(NULL,'Troy','Eaton','(204) 942-5901');
insert into client values(NULL,'Tonia','Bruin','(203) 973-0311');
insert into client values(NULL,'Nicole','Wagner','(620) 459-0111');
insert into client values(NULL,'P.Sasikala','Gounder','(423) 613-0879');
insert into client values(NULL,'Michele','Vang','(712) 258-2153');
insert into client values(NULL,'Leslie','Leong','(406) 639-2047');
insert into client values(NULL,'William','Richmond','(417) 962-5045');
insert into client values(NULL,'Rachel','McCalla)','(360) 599-2071');
insert into client values(NULL,'Andy','Mcdonough','(260) 463-3380');
insert into client values(NULL,'Donna','Lund','(580) 476-3414');
insert into client values(NULL,'Quinn','Fowler','(540) 364-3485');
insert into client values(NULL,'Russel','Burris','(928) 359-2434');
insert into client values(NULL,'Nathan','Stout','(631) 666-7251');
insert into client values(NULL,'Tiffany','Braun','(808) 244-1501');
insert into client values(NULL,'Antje','Sester','(717) 993-5275');
insert into client values(NULL,'Emanuel','Jacobs','(304) 475-3759');
insert into client values(NULL,'Ashley','Lloyd','(631) 586-7879');
insert into client values(NULL,'Rickie','Jefferson','(530) 459-3179');
insert into client values(NULL,'Diane','Knox','(843) 651-9687');
insert into client values(NULL,'Elham','Mousavidin','(954) 530-5147');
insert into client values(NULL,'Amit','Agrahari','(256) 437-0537');
insert into client values(NULL,'Cherilyn','Randolph','(956) 765-8039');
insert into client values(NULL,'Chris','Street','(304) 738-0098');
insert into client values(NULL,'Miguel','Golden','(703) 467-9172');
insert into client values(NULL,'Mary','Jones','(415) 398-5033');
insert into client values(NULL,'Mario','Harper','(806) 364-4263');
insert into client values(NULL,'Stanton','Rainey','(847) 244-7117');
insert into client values(NULL,'Devis','Bianchini','(905) 947-9188');
insert into client values(NULL,'Shuhua','Liu','(479) 736-2751');
insert into client values(NULL,'Victoria','Whitney','(610) 399-1675');
insert into client values(NULL,'Jinhu','Li','(859) 744-6858');
insert into client values(NULL,'Clifford','Grace','(413) 464-7875');
insert into client values(NULL,'Jeffrey','Kirk','(304) 393-1400');
insert into client values(NULL,'Fernando','Ilharco','(906) 847-6359');
insert into client values(NULL,'James','O''Brien','(305) 517-6113');
insert into client values(NULL,'Wesley','Davenport','(802) 234-9039');
insert into client values(NULL,'Esther','William','(580) 254-2693');
insert into client values(NULL,'Anita','Ritter','(870) 358-3048');
insert into client values(NULL,'Elton','Bartlett','(302) 628-6958');
insert into client values(NULL,'Khalil','Abuosba','(920) 699-7223');
insert into client values(NULL,'William','Haseman','(336) 359-2259');
insert into client values(NULL,'Sylvia','Alvarado','(610) 385-6254');
insert into client values(NULL,'Ephrem','Eyob','(559) 298-1685');
insert into client values(NULL,'Kristin','Eschenfelder','(435) 755-0816');
insert into client values(NULL,'Luz','Bryant','(860) 887-0530');
insert into client values(NULL,'Maribel','Randall','(317) 674-8748');
insert into client values(NULL,'Marc','Caesar','(520) 803-1433');
insert into client values(NULL,'Michael','Weeks','(707) 843-4260');
insert into client values(NULL,'Gilbert','Gee','(973) 827-6067');
insert into client values(NULL,'Angel','Salazar','(313) 832-1469');
insert into client values(NULL,'Molly','Christian','(518) 827-4164');
insert into client values(NULL,'Gavin','Parker','(620) 367-2613');
insert into client values(NULL,'Linda','Pruitt','(805) 986-3715');
insert into client values(NULL,'Anto','Nugroho','(435) 867-6076');
insert into client values(NULL,'Wendy','Newton','(631) 567-9268');
insert into client values(NULL,'Shankar','Sundaresan','(508) 881-7460');
insert into client values(NULL,'Keith','Daniels','(361) 727-9207');
insert into client values(NULL,'Roger','Debreceny','(828) 743-0214');
insert into client values(NULL,'Michael','Sutton','(504) 899-7572');
insert into client values(NULL,'Marilyn','Johnson','(518) 899-0034');
insert into client values(NULL,'Gerry','Jensen','(801) 356-2864');
insert into client values(NULL,'Slobodan','Danilovic','(508) 545-1163');
insert into client values(NULL,'Dixie','Groves','(501) 679-3391');
insert into client values(NULL,'Jarvis','Carlton','(516) 731-7040');
insert into client values(NULL,'Ali','Kamrani','(317) 422-8978');
insert into client values(NULL,'Mark','Lucas','(518) 212-2182');
insert into client values(NULL,'Robert','Kauffman','(509) 380-5644');
insert into client values(NULL,'Eddie','Roberts','(727) 785-7904');
insert into client values(NULL,'Opal','Delgado','(313) 259-6364');
insert into client values(NULL,'Sri','Vasudevan','(708) 424-2381');
insert into client values(NULL,'Ronny','Michael','(662) 337-4364');
insert into client values(NULL,'Helen','Kelley','(859) 291-3372');
insert into client values(NULL,'Rich','Fitzgerald','(508) 867-7909');
insert into client values(NULL,'Matti','Rossi','(770) 507-1921');
insert into client values(NULL,'Meliha','Handzic','(301) 483-7981');
insert into client values(NULL,'Guy','Stanton','(845) 471-1772');
insert into client values(NULL,'Earl','Griffin','(775) 468-0440');
insert into client values(NULL,'Deana','Madison','(801) 521-6335');
insert into client values(NULL,'Virginia','Ilie','(314) 831-7647');
insert into client values(NULL,'Ran','Wolff','(218) 879-8238');
insert into client values(NULL,'Robson','Giovannini','(615) 443-4952');
insert into client values(NULL,'Yungchang','Ku','(808) 244-5817');
insert into client values(NULL,'Trent','Gentry','(610) 541-0193');
insert into client values(NULL,'Ebony','Kauffman','(319) 438-6459');
insert into client values(NULL,'Paul','Handisides','(802) 425-2308');
insert into client values(NULL,'Xiafeng','Wang','(801) 226-4404');
insert into client values(NULL,'Rod','Mason','(515) 287-4636');
insert into client values(NULL,'Nathaniel','Moon','(410) 796-7419');
insert into client values(NULL,'Scot','Oneal','(631) 598-1937');
insert into client values(NULL,'Fred','Coleman','(985) 386-3744');
insert into client values(NULL,'User','Temp4','(781) 365-1370');
insert into client values(NULL,'Stacy','Lane','(314) 638-1756');
insert into client values(NULL,'Erin','Perkins','(573) 475-9359');
insert into client values(NULL,'Graciela','Santiago','(201) 816-0997');
insert into client values(NULL,'Kurt','Small','(717) 352-3485');
insert into client values(NULL,'Zaheeruddin','Asif','(401) 434-1321');
insert into client values(NULL,'Stephen','Jarrett','(870) 943-2638');
insert into client values(NULL,'Stefan','Blumenberg','(978) 258-7006');
insert into client values(NULL,'Jacqueline','Cooper','(860) 425-0603');
insert into client values(NULL,'Felipe','Crosby','(574) 264-3829');
insert into client values(NULL,'Archie','Kaufman','(905) 791-7095');
insert into client values(NULL,'Van','Knowles','(770) 944-8568');
insert into client values(NULL,'Billie','Sinclair','(516) 561-5114');
insert into client values(NULL,'Shawna','Whitaker','(774) 323-0138');
insert into client values(NULL,'Cathy','Witherspoon','(630) 323-2599');
insert into client values(NULL,'Cesar','Perez-Alvarez','(208) 232-8692');
insert into client values(NULL,'Jeanette','Wade','(260) 358-0916');
insert into client values(NULL,'Richard','Lee','(845) 336-7915');
insert into client values(NULL,'Dezon','Finch','(928) 474-6857');
insert into client values(NULL,'Shu-Chen','Yen','(254) 296-2759');
insert into client values(NULL,'Rong-An','Shang','(254) 359-4061');
insert into client values(NULL,'Wiley','Morrison','(503) 650-0087');
insert into client values(NULL,'Grant','Howard','(443) 312-6853');
insert into client values(NULL,'Ernestine','Henderson','(801) 225-7125');
insert into client values(NULL,'Eric','Lu','(435) 722-0375');
insert into client values(NULL,'Susan','Sherer','(718) 435-4739');
insert into client values(NULL,'Alfreda','Shaw','(508) 557-1130');
insert into client values(NULL,'Sriraman','Ramachandran','(559) 645-0945');
insert into client values(NULL,'Kerry','Willis','(505) 281-8189');
insert into client values(NULL,'George','Sims','(330) 945-7597');
insert into client values(NULL,'Chase','Stafford','(801) 322-2188');
insert into client values(NULL,'Selris','Mahabir','(413) 586-4076');
insert into client values(NULL,'Bennie','Kline','(518) 436-3829');
insert into client values(NULL,'Souha','Kaouk','(260) 499-5440');
insert into client values(NULL,'Gertrude','Abrams','(860) 649-3735');
insert into client values(NULL,'Tom','Hirons','(208) 684-5266');
insert into client values(NULL,'Ernesto','Hogan','(917) 261-4502');
insert into client values(NULL,'Eva-Maria','Sperger','(860) 646-6524');
insert into client values(NULL,'Sandrine','Balbo','(845) 628-1074');
insert into client values(NULL,'Durmus','Yoruk','(435) 723-6128');
insert into client values(NULL,'Clement','Reyes','(718) 373-2896');
insert into client values(NULL,'Sven','Laumer','(231) 865-1569');
insert into client values(NULL,'John','Hebeler','(904) 529-8221');
insert into client values(NULL,'Carlin','Dowling','(352) 793-2480');
insert into client values(NULL,'Faye','Teer','(506) 652-7008');
insert into client values(NULL,'Julian','Newsome','(407) 327-3625');
insert into client values(NULL,'Fergle','D''Aubeterre','(614) 891-9116');
insert into client values(NULL,'Jeannie','Murphy','(717) 426-2868');
insert into client values(NULL,'Abdul','Lackey','(916) 492-2770');
insert into client values(NULL,'Gilbert','Griffith','(604) 886-6582');
insert into client values(NULL,'Constantinos','Stefanou','(978) 667-2855');
insert into client values(NULL,'Uchenna','Sr','(810) 329-3605');
insert into client values(NULL,'Vicki','Webster','(435) 752-2327');
insert into client values(NULL,'Clement','Gill','(740) 446-7214');
insert into client values(NULL,'Edward','Fisher','(410) 833-3345');
insert into client values(NULL,'Malcolm','Roy','(401) 434-3305');
insert into client values(NULL,'Carol','Abatelli','(304) 428-1396');
insert into client values(NULL,'Ulku','Yaylacicegi','(860) 548-9493');
insert into client values(NULL,'Kshiti','Joshi','(352) 793-6431');
insert into client values(NULL,'Milo','Cash','(570) 388-6951');
insert into client values(NULL,'Rhonda','James','(251) 446-9624');
insert into client values(NULL,'Sylvia','Hutchinson','(360) 785-0379');
insert into client values(NULL,'Epaminondas','Kapetanios','(651) 429-3775');
insert into client values(NULL,'Zhiyan','Hu','(760) 352-4913');
insert into client values(NULL,'Elizabeth','Baker','(415) 789-8687');
insert into client values(NULL,'Helen','Mobley','(408) 493-5032');
insert into client values(NULL,'Roland','Eichelberger','(406) 445-9833');
insert into client values(NULL,'Eddie','Gregg','(479) 442-0414');
insert into client values(NULL,'Porfirio','Mcallister','(978) 263-1830');
insert into client values(NULL,'Elmer','Scott','(719) 486-8188');
insert into client values(NULL,'Shuangyuan','Shi','(828) 686-9239');
insert into client values(NULL,'Bram','Pynoo','(706) 592-2593');
insert into client values(NULL,'Tim','Felton','(401) 364-9839');
insert into client values(NULL,'Ching','Lee','(423) 323-4996');
insert into client values(NULL,'Kendrick','Wallace','(212) 399-8581');
insert into client values(NULL,'Miguel','Olivas-Lujan','(315) 686-3560');
insert into client values(NULL,'Gwendolyn','Cooper','(580) 628-3066');
insert into client values(NULL,'Hasan','Cavusoglu','(435) 843-9846');
insert into client values(NULL,'Eileen','Hendricks','(712) 827-4198');
insert into client values(NULL,'Marsha','Carrillo','(603) 643-1870');
insert into client values(NULL,'Robert','Cerveny','(317) 846-5438');
insert into client values(NULL,'Russ','Mooney','(423) 334-4644');
insert into client values(NULL,'Margie','Rhodes','(573) 264-2741');
insert into client values(NULL,'Kristine','Craig','(803) 648-4902');
insert into client values(NULL,'Oren','Quick','(508) 759-1317');
insert into client values(NULL,'Benito','Edwards','(508) 786-0586');
insert into client values(NULL,'Peter','Chen','(203) 454-1768');
insert into client values(NULL,'Delmar','Ramirez','(763) 421-8136');
insert into client values(NULL,'Heriberto','Lamb','(646) 476-7860');
insert into client values(NULL,'Yishu','Ding','(208) 637-8209');


insert into appointment values(null,'Leslie Wright', 269 , 1, to_date('01-JUN-'||extract(year from sysdate)||' 10:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Darrold Cooper', 197 , 1, to_date('01-JUN-'||extract(year from sysdate)||' 12:00 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Elizabeth Baker', 183 , 1, to_date('01-JUN-'||extract(year from sysdate)||' 04:00 PM','dd-mon-yyyy hh:mi am'),25);
insert into appointment values(null,'Quinn Fowler', 281 , 1, to_date('01-JUN-'||extract(year from sysdate)||' 01:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 201 , 2, to_date('01-JUN-'||extract(year from sysdate)||' 12:30 PM','dd-mon-yyyy hh:mi am'),25);
insert into appointment values(null,'Leslie Wright', 177 , 2, to_date('01-JUN-'||extract(year from sysdate)||' 01:30 PM','dd-mon-yyyy hh:mi am'),25);
insert into appointment values(null,'Darrold Cooper', 128 , 2, to_date('01-JUN-'||extract(year from sysdate)||' 03:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 198 , 2, to_date('01-JUN-'||extract(year from sysdate)||' 10:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Darrold Cooper', 153 , 3, to_date('01-JUN-'||extract(year from sysdate)||' 02:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Quinn Fowler', 271 , 3, to_date('01-JUN-'||extract(year from sysdate)||' 12:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Quinn Fowler', 260 , 3, to_date('01-JUN-'||extract(year from sysdate)||' 10:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 209 , 3, to_date('01-JUN-'||extract(year from sysdate)||' 11:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 256 , 3, to_date('01-JUN-'||extract(year from sysdate)||' 04:00 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Darrold Cooper', 262 , 4, to_date('01-JUN-'||extract(year from sysdate)||' 09:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Abigail Smith', 164 , 4, to_date('01-JUN-'||extract(year from sysdate)||' 11:00 AM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Abigail Smith', 229 , 4, to_date('01-JUN-'||extract(year from sysdate)||' 01:00 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Abigail Smith', 277 , 4, to_date('01-JUN-'||extract(year from sysdate)||' 02:30 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Quinn Fowler', 147 , 5, to_date('01-JUN-'||extract(year from sysdate)||' 11:00 AM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'James Sawyer', 149 , 5, to_date('01-JUN-'||extract(year from sysdate)||' 01:00 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Elizabeth Baker', 254 , 5, to_date('01-JUN-'||extract(year from sysdate)||' 02:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'James Sawyer', 265 , 5, to_date('01-JUN-'||extract(year from sysdate)||' 03:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Darrold Cooper', 182 , 1, to_date('02-JUN-'||extract(year from sysdate)||' 09:00 AM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Leslie Wright', 116 , 1, to_date('02-JUN-'||extract(year from sysdate)||' 12:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'James Sawyer', 227 , 1, to_date('02-JUN-'||extract(year from sysdate)||' 02:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 225 , 1, to_date('02-JUN-'||extract(year from sysdate)||' 11:00 AM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Leslie Wright', 253 , 1, to_date('02-JUN-'||extract(year from sysdate)||' 01:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Darrold Cooper', 226 , 1, to_date('02-JUN-'||extract(year from sysdate)||' 03:30 PM','dd-mon-yyyy hh:mi am'),115);
insert into appointment values(null,'Abigail Smith', 212 , 2, to_date('02-JUN-'||extract(year from sysdate)||' 10:00 AM','dd-mon-yyyy hh:mi am'),115);
insert into appointment values(null,'Darrold Cooper', 133 , 2, to_date('02-JUN-'||extract(year from sysdate)||' 01:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Quinn Fowler', 259 , 2, to_date('02-JUN-'||extract(year from sysdate)||' 04:00 PM','dd-mon-yyyy hh:mi am'),115);
insert into appointment values(null,'Abigail Smith', 286 , 2, to_date('02-JUN-'||extract(year from sysdate)||' 09:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'James Sawyer', 132 , 3, to_date('02-JUN-'||extract(year from sysdate)||' 09:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Quinn Fowler', 173 , 3, to_date('02-JUN-'||extract(year from sysdate)||' 01:00 PM','dd-mon-yyyy hh:mi am'),25);
insert into appointment values(null,'James Sawyer', 272 , 3, to_date('02-JUN-'||extract(year from sysdate)||' 10:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Darrold Cooper', 144 , 3, to_date('02-JUN-'||extract(year from sysdate)||' 12:30 PM','dd-mon-yyyy hh:mi am'),25);
insert into appointment values(null,'Quinn Fowler', 285 , 3, to_date('02-JUN-'||extract(year from sysdate)||' 11:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Darrold Cooper', 185 , 3, to_date('02-JUN-'||extract(year from sysdate)||' 02:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 152 , 3, to_date('02-JUN-'||extract(year from sysdate)||' 02:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Quinn Fowler', 205 , 3, to_date('02-JUN-'||extract(year from sysdate)||' 02:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'James Sawyer', 103 , 3, to_date('02-JUN-'||extract(year from sysdate)||' 03:30 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'James Sawyer', 150 , 3, to_date('02-JUN-'||extract(year from sysdate)||' 01:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 112 , 4, to_date('02-JUN-'||extract(year from sysdate)||' 09:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Quinn Fowler', 176 , 4, to_date('02-JUN-'||extract(year from sysdate)||' 10:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 181 , 4, to_date('02-JUN-'||extract(year from sysdate)||' 11:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Abigail Smith', 276 , 4, to_date('02-JUN-'||extract(year from sysdate)||' 01:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 121 , 4, to_date('02-JUN-'||extract(year from sysdate)||' 01:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Abigail Smith', 104 , 4, to_date('02-JUN-'||extract(year from sysdate)||' 02:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 140 , 5, to_date('02-JUN-'||extract(year from sysdate)||' 09:00 AM','dd-mon-yyyy hh:mi am'),115);
insert into appointment values(null,'James Sawyer', 174 , 5, to_date('02-JUN-'||extract(year from sysdate)||' 11:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'James Sawyer', 109 , 5, to_date('02-JUN-'||extract(year from sysdate)||' 12:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Quinn Fowler', 258 , 5, to_date('02-JUN-'||extract(year from sysdate)||' 02:00 PM','dd-mon-yyyy hh:mi am'),25);
insert into appointment values(null,'Leslie Wright', 157 , 5, to_date('02-JUN-'||extract(year from sysdate)||' 02:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 123 , 5, to_date('02-JUN-'||extract(year from sysdate)||' 03:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'James Sawyer', 195 , 1, to_date('03-JUN-'||extract(year from sysdate)||' 09:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Abigail Smith', 235 , 1, to_date('03-JUN-'||extract(year from sysdate)||' 01:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 264 , 1, to_date('03-JUN-'||extract(year from sysdate)||' 03:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 165 , 1, to_date('03-JUN-'||extract(year from sysdate)||' 10:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 297 , 1, to_date('03-JUN-'||extract(year from sysdate)||' 11:00 AM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Darrold Cooper', 234 , 2, to_date('03-JUN-'||extract(year from sysdate)||' 09:30 AM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Darrold Cooper', 163 , 2, to_date('03-JUN-'||extract(year from sysdate)||' 12:00 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Darrold Cooper', 280 , 2, to_date('03-JUN-'||extract(year from sysdate)||' 11:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Abigail Smith', 247 , 2, to_date('03-JUN-'||extract(year from sysdate)||' 03:30 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Darrold Cooper', 242 , 2, to_date('03-JUN-'||extract(year from sysdate)||' 01:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Darrold Cooper', 207 , 3, to_date('03-JUN-'||extract(year from sysdate)||' 03:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Abigail Smith', 192 , 3, to_date('03-JUN-'||extract(year from sysdate)||' 09:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'James Sawyer', 243 , 3, to_date('03-JUN-'||extract(year from sysdate)||' 10:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 138 , 3, to_date('03-JUN-'||extract(year from sysdate)||' 11:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 143 , 3, to_date('03-JUN-'||extract(year from sysdate)||' 01:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'James Sawyer', 284 , 3, to_date('03-JUN-'||extract(year from sysdate)||' 02:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Darrold Cooper', 194 , 3, to_date('03-JUN-'||extract(year from sysdate)||' 04:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 245 , 3, to_date('03-JUN-'||extract(year from sysdate)||' 04:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 219 , 4, to_date('03-JUN-'||extract(year from sysdate)||' 01:00 PM','dd-mon-yyyy hh:mi am'),25);
insert into appointment values(null,'Quinn Fowler', 117 , 4, to_date('03-JUN-'||extract(year from sysdate)||' 09:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Abigail Smith', 172 , 4, to_date('03-JUN-'||extract(year from sysdate)||' 10:00 AM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Quinn Fowler', 107 , 4, to_date('03-JUN-'||extract(year from sysdate)||' 12:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Abigail Smith', 108 , 4, to_date('03-JUN-'||extract(year from sysdate)||' 02:00 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Leslie Wright', 283 , 4, to_date('03-JUN-'||extract(year from sysdate)||' 03:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Quinn Fowler', 184 , 5, to_date('03-JUN-'||extract(year from sysdate)||' 01:30 PM','dd-mon-yyyy hh:mi am'),115);
insert into appointment values(null,'James Sawyer', 211 , 5, to_date('03-JUN-'||extract(year from sysdate)||' 03:30 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Quinn Fowler', 187 , 5, to_date('03-JUN-'||extract(year from sysdate)||' 10:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 196 , 5, to_date('03-JUN-'||extract(year from sysdate)||' 09:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 124 , 5, to_date('03-JUN-'||extract(year from sysdate)||' 09:00 AM','dd-mon-yyyy hh:mi am'),25);
insert into appointment values(null,'James Sawyer', 293 , 5, to_date('03-JUN-'||extract(year from sysdate)||' 11:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'James Sawyer', 288 , 5, to_date('03-JUN-'||extract(year from sysdate)||' 12:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Quinn Fowler', 167 , 1, to_date('04-JUN-'||extract(year from sysdate)||' 09:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 135 , 1, to_date('04-JUN-'||extract(year from sysdate)||' 10:00 AM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Quinn Fowler', 273 , 1, to_date('04-JUN-'||extract(year from sysdate)||' 10:00 AM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Elizabeth Baker', 118 , 1, to_date('04-JUN-'||extract(year from sysdate)||' 02:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 213 , 1, to_date('04-JUN-'||extract(year from sysdate)||' 04:00 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Abigail Smith', 231 , 2, to_date('04-JUN-'||extract(year from sysdate)||' 10:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 162 , 2, to_date('04-JUN-'||extract(year from sysdate)||' 09:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 257 , 2, to_date('04-JUN-'||extract(year from sysdate)||' 12:00 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Quinn Fowler', 160 , 2, to_date('04-JUN-'||extract(year from sysdate)||' 01:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Quinn Fowler', 250 , 2, to_date('04-JUN-'||extract(year from sysdate)||' 03:30 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Darrold Cooper', 131 , 2, to_date('04-JUN-'||extract(year from sysdate)||' 02:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 294 , 3, to_date('04-JUN-'||extract(year from sysdate)||' 10:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Abigail Smith', 222 , 3, to_date('04-JUN-'||extract(year from sysdate)||' 09:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Darrold Cooper', 298 , 3, to_date('04-JUN-'||extract(year from sysdate)||' 09:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 202 , 3, to_date('04-JUN-'||extract(year from sysdate)||' 11:30 AM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'James Sawyer', 203 , 3, to_date('04-JUN-'||extract(year from sysdate)||' 03:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Darrold Cooper', 168 , 3, to_date('04-JUN-'||extract(year from sysdate)||' 04:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 291 , 3, to_date('04-JUN-'||extract(year from sysdate)||' 01:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 275 , 4, to_date('04-JUN-'||extract(year from sysdate)||' 02:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 266 , 4, to_date('04-JUN-'||extract(year from sysdate)||' 09:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Quinn Fowler', 292 , 4, to_date('04-JUN-'||extract(year from sysdate)||' 11:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Abigail Smith', 159 , 4, to_date('04-JUN-'||extract(year from sysdate)||' 12:30 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Leslie Wright', 142 , 4, to_date('04-JUN-'||extract(year from sysdate)||' 03:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Abigail Smith', 134 , 5, to_date('04-JUN-'||extract(year from sysdate)||' 04:00 PM','dd-mon-yyyy hh:mi am'),115);
insert into appointment values(null,'James Sawyer', 188 , 5, to_date('04-JUN-'||extract(year from sysdate)||' 09:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'James Sawyer', 136 , 5, to_date('04-JUN-'||extract(year from sysdate)||' 11:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'James Sawyer', 252 , 5, to_date('04-JUN-'||extract(year from sysdate)||' 01:00 PM','dd-mon-yyyy hh:mi am'),115);
insert into appointment values(null,'Elizabeth Baker', 274 , 1, to_date('05-JUN-'||extract(year from sysdate)||' 11:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Quinn Fowler', 221 , 1, to_date('05-JUN-'||extract(year from sysdate)||' 03:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'James Sawyer', 210 , 1, to_date('05-JUN-'||extract(year from sysdate)||' 02:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'James Sawyer', 169 , 1, to_date('05-JUN-'||extract(year from sysdate)||' 10:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 156 , 2, to_date('05-JUN-'||extract(year from sysdate)||' 11:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 155 , 2, to_date('05-JUN-'||extract(year from sysdate)||' 02:30 PM','dd-mon-yyyy hh:mi am'),25);
insert into appointment values(null,'Darrold Cooper', 230 , 2, to_date('05-JUN-'||extract(year from sysdate)||' 03:00 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Leslie Wright', 279 , 3, to_date('05-JUN-'||extract(year from sysdate)||' 09:30 AM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'James Sawyer', 161 , 3, to_date('05-JUN-'||extract(year from sysdate)||' 11:00 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Abigail Smith', 244 , 3, to_date('05-JUN-'||extract(year from sysdate)||' 12:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Quinn Fowler', 139 , 3, to_date('05-JUN-'||extract(year from sysdate)||' 04:00 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Elizabeth Baker', 120 , 3, to_date('05-JUN-'||extract(year from sysdate)||' 01:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Abigail Smith', 200 , 4, to_date('05-JUN-'||extract(year from sysdate)||' 09:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 189 , 4, to_date('05-JUN-'||extract(year from sysdate)||' 10:30 AM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Darrold Cooper', 216 , 4, to_date('05-JUN-'||extract(year from sysdate)||' 12:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 191 , 4, to_date('05-JUN-'||extract(year from sysdate)||' 03:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Elizabeth Baker', 236 , 4, to_date('05-JUN-'||extract(year from sysdate)||' 04:00 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Darrold Cooper', 122 , 5, to_date('05-JUN-'||extract(year from sysdate)||' 11:00 AM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'Leslie Wright', 151 , 5, to_date('05-JUN-'||extract(year from sysdate)||' 12:30 PM','dd-mon-yyyy hh:mi am'),85);
insert into appointment values(null,'James Sawyer', 208 , 5, to_date('05-JUN-'||extract(year from sysdate)||' 03:30 PM','dd-mon-yyyy hh:mi am'),55);
insert into appointment values(null,'Leslie Wright', 208 , 2, to_date('02-JUN-'||extract(year from sysdate)||' 10:45 AM','dd-mon-yyyy hh:mi am'),55);

select * from cat;

exit