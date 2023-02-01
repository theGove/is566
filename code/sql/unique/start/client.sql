@config
 
drop table client;
create table client(
 client_ID int primary key
,first_name varchar(10)
,last_name varchar(12)
,address varchar(25)
,city varchar(10)
,state char(2)
,ZIP varchar(5)
,Phone char(14)
);
 
insert into client values(101,'Brook','Serrano','1303 Elon RD','Richmond','VA','23294','(804) 754-7268');
insert into client values(102,'Shayla','Craig','27 Aiken DR','Richmond','VA','23231','(540) 373-6949');
insert into client values(103,'Brady','Combs','5308 Raleigh RD','Richmond','VA','23060','(434) 636-5839');
insert into client values(104,'Peter','Campos','1420 Hungary RD','Richmond','VA','23236','(804) 262-8752');
insert into client values(105,'Michelle','Marquez','740 Lemoine LN','Richmond','VA','23224',null);
insert into client values(106,'Alexandro','Montgomery','3709 Decatur ST','Richmond','VA','23224','(804) 320-6633');
insert into client values(107,'Alexandrea','Grant','901 Semmes AVE','Richmond','VA','23220','(765) 998-7708');
insert into client values(108,'Ayla','Tillman','2611 Park AVE #6','Richmond','VA','23227','(704) 922-8238');
insert into client values(109,'Montana','Andrews','4100 Hermitage RD','Richmond','VA','23233','(804) 447-6183');
insert into client values(110,'Wayne','Carter','2313 Mountainbrook DR','Chester','VA','23836','(804) 794-1794');
insert into client values(111,'Desmond','Tate','13804 Foggy Hills CT','Richmond','VA','23219','(703) 815-2815');
insert into client values(112,'Junior','Love','47431 Riverbank Forest PL','Richmond','VA','23238','(703) 421-9040');
insert into client values(113,'Colleen','Wong','766 Valley DR','Richmond','VA','23225','(276) 673-5212');
insert into client values(114,'Ray','Luna','5315 Nutting DR','Richmond','VA','23237','(703) 941-2031');
insert into client values(115,'Lee','Wynn','1101 S Joyce ST #2544','Sandston','VA','23150','(352) 536-2059');
insert into client values(116,'Baylee','Schmidt','346 Congress LN #605','Chester','VA','23831',null);
insert into client values(117,'Sade','Mckee','5364 Palmyra CT','Richmond','VA','23238','(757) 479-4335');
insert into client values(118,'Belinda','Mccullough','43 Cockrell ST','Dinwiddie','VA','23841','(703) 212-0378');
insert into client values(119,'Ebony','Myers','22206 Jefferson LN','Richmond','VA','23238','(804) 786-2701');
insert into client values(120,'Erica','Huber','10517 Vale RD','Richmond','VA','23228','(301) 972-1240');
insert into client values(121,'Bradley','Head','707 Stonegate WAY #WA','Richmond','VA','23224','(757) 548-1149');
insert into client values(122,'Rudolph','Cunningham','123 Rebecca DR','Sandston','VA','23150','(540) 662-3593');
insert into client values(123,'Natasha','Singleton','3812 Bricken LN','New Kent','VA','23124','(540) 898-8338');
insert into client values(124,'Antonia','Deleon','8867 Oliver CT #4','Manakin','VA','23103','(703) 392-1082');
insert into client values(125,'Angel','Jennings','8390 Swan Woods RD','Richmond','VA','23234','(540) 854-6128');
insert into client values(126,'Hillary','Cervantes','218 Taylor Ridge WAY','Richmond','VA','23228','(512) 243-6356');
insert into client values(127,'Kristie','Serrano','2605 Cannery RD','Richmond','VA','23238','(540) 380-9676');
insert into client values(128,'Janie','Mosley','1203 Lancaster AVE','Mc Kenney','VA','23872','(845) 225-7481');
insert into client values(129,'Dan','Woods','2181 Jamieson AVE #1007','Richmond','VA','23235','(732) 681-0442');
insert into client values(130,'Carlos','Banks','12530 Haltwhistle CT','Richmond','VA','23221','(703) 365-7754');
insert into client values(131,'Johnnie','Fitzgerald','9421 Ashlock CT','Midlothian','VA','23112',null);
insert into client values(132,'Maximillia','Gill','780 Peach Orchard RD','Richmond','VA','23223','(434) 685-2078');
insert into client values(133,'Shanna','Holden','148 Grove CT #4A','Glen Allen','VA','23059','(508) 495-4019');
insert into client values(134,'Abigail','Melendez','5021 Hickory Downs CT','Glen Allen','VA','23059','(804) 360-3255');
insert into client values(135,'Edgardo','Woodward','2213 Coachman DR','Milford','VA','22514',null);
insert into client values(136,'Melisa','Bullock','53 Beaver Dam RD','Amelia','VA','23002','(781) 599-0663');
insert into client values(137,'Jade','Ramsey','925 Old Buckingham RD','Chester','VA','23831','(804) 492-3629');
insert into client values(138,'Desirae','Nieves','320 Killian AVE','Richmond','VA','23225','(757) 399-0712');
insert into client values(139,'Lynette','Horton','421 Overlook DR','Glen Allen','VA','23060','(540) 636-3482');
insert into client values(140,'Weston','Blankenship','2272 Main ST','Richmond','VA','23220','(410) 621-5492');
 
select * from client;
 
exit