?��prompt PL/SQL Developer Export Tables for user SYSTEM@XE
prompt Created by user on Thursday, 18 June 2020
set feedback off
set define off

prompt Creating AREA...
create table AREA
(
  areaid   NUMBER(3) not null,
  areaname VARCHAR2(20) not null
)
;
alter table AREA
  add primary key (AREAID);

prompt Creating CITY...
create table CITY
(
  cityid   NUMBER(3) not null,
  cityname VARCHAR2(50) not null,
  areaid   NUMBER(3) not null
)
;
alter table CITY
  add primary key (CITYID);

prompt Creating CITIZEN...
create table CITIZEN
(
  citizenid   NUMBER(9) not null,
  citizenname VARCHAR2(50) not null,
  phone       VARCHAR2(15) not null,
  address     VARCHAR2(50) not null,
  cityid      NUMBER(3) not null
)
;
alter table CITIZEN
  add primary key (CITIZENID);
alter table CITIZEN
  add foreign key (CITYID)
  references CITY (CITYID);

prompt Creating CLERK...
create table CLERK
(
  clerkid   NUMBER(9) not null,
  rating    NUMBER(2) not null,
  hireyear  NUMBER(4) not null,
  bossid    NUMBER(9) not null,
  salary    FLOAT not null,
  clerkname VARCHAR2(50) not null,
  areaid    NUMBER(3) not null
)
;
alter table CLERK
  add primary key (CLERKID);

prompt Creating FIELD...
create table FIELD
(
  fieldid   NUMBER(3) not null,
  filedname VARCHAR2(50) not null
)
;
alter table FIELD
  add primary key (FIELDID);

prompt Creating HEALTHINSTITUTION...
create table HEALTHINSTITUTION
(
  healtinstid NUMBER(3) not null,
  instname    VARCHAR2(50) not null,
  cityid      NUMBER(3) not null,
  fieldid     NUMBER(3) not null
)
;
alter table HEALTHINSTITUTION
  add primary key (HEALTINSTID);
alter table HEALTHINSTITUTION
  add foreign key (CITYID)
  references CITY (CITYID);
alter table HEALTHINSTITUTION
  add foreign key (FIELDID)
  references FIELD (FIELDID);

prompt Creating DEPARTMENT...
create table DEPARTMENT
(
  depid        INTEGER not null,
  numberofbeds NUMBER(4) not null,
  depname      VARCHAR2(50) not null,
  healtinstid  NUMBER(3) not null
)
;
alter table DEPARTMENT
  add primary key (DEPID, HEALTINSTID);
alter table DEPARTMENT
  add foreign key (HEALTINSTID)
  references HEALTHINSTITUTION (HEALTINSTID);

prompt Creating LICENSING...
create table LICENSING
(
  licensetype VARCHAR2(50) not null,
  licenseid   NUMBER(3) not null,
  releasedate DATE not null,
  fieldid     NUMBER(3) not null
)
;
alter table LICENSING
  add primary key (LICENSEID);
alter table LICENSING
  add foreign key (FIELDID)
  references FIELD (FIELDID);

prompt Creating DOCTOR...
create table DOCTOR
(
  specialization VARCHAR2(50) not null,
  licenseid      NUMBER(3) not null,
  workerid       NUMBER(9) not null
)
;
alter table DOCTOR
  add primary key (WORKERID);
alter table DOCTOR
  add foreign key (LICENSEID)
  references LICENSING (LICENSEID);

prompt Creating HOSPITALIZEDAT...
create table HOSPITALIZEDAT
(
  startdate   DATE not null,
  enddate     DATE not null,
  bednumber   NUMBER(4) not null,
  citizenid   NUMBER(9) not null,
  depid       INTEGER not null,
  healtinstid NUMBER(3) not null
)
;
alter table HOSPITALIZEDAT
  add primary key (CITIZENID, DEPID, HEALTINSTID);
alter table HOSPITALIZEDAT
  add foreign key (CITIZENID)
  references CITIZEN (CITIZENID);

prompt Creating MEDICALEQUIPMANT...
create table MEDICALEQUIPMANT
(
  equiptype   VARCHAR2(50) not null,
  medequipid  VARCHAR2(3) not null,
  quantity    NUMBER(5) not null,
  depid       INTEGER not null,
  healtinstid NUMBER(3) not null
)
;
alter table MEDICALEQUIPMANT
  add primary key (MEDEQUIPID, DEPID, HEALTINSTID);

prompt Creating SCHEDULE...
create table SCHEDULE
(
  meetingtime DATE not null,
  clerkid     NUMBER(9) not null,
  citizenid   NUMBER(9) not null
)
;
alter table SCHEDULE
  add primary key (MEETINGTIME, CLERKID, CITIZENID);
alter table SCHEDULE
  add foreign key (CLERKID)
  references CLERK (CLERKID);
alter table SCHEDULE
  add foreign key (CITIZENID)
  references CITIZEN (CITIZENID);

prompt Creating TREATED_BY...
create table TREATED_BY
(
  treatdate     DATE not null,
  treatmenttype VARCHAR2(50) not null,
  treatmenttime VARCHAR2(50) not null,
  citizenid     NUMBER(9) not null,
  workerid      NUMBER(9) not null
)
;
alter table TREATED_BY
  add primary key (TREATDATE, TREATMENTTIME, CITIZENID, WORKERID);
alter table TREATED_BY
  add foreign key (CITIZENID)
  references CITIZEN (CITIZENID);
alter table TREATED_BY
  add foreign key (WORKERID)
  references DOCTOR (WORKERID);

prompt Creating WORKAT...
create table WORKAT
(
  salary         FLOAT not null,
  rating         NUMBER(2) not null,
  hiredate       DATE not null,
  workpercentage NUMBER(2) not null,
  depid          INTEGER not null,
  healtinstid    NUMBER(3) not null,
  workerid       NUMBER(9) not null
)
;
alter table WORKAT
  add primary key (DEPID, HEALTINSTID, WORKERID);

prompt Creating WORKER...
create table WORKER
(
  workerid         NUMBER(9) not null,
  wokername        VARCHAR2(50) not null,
  birthdate        DATE not null,
  itsboss_workerid NUMBER(9) not null
)
;
alter table WORKER
  add primary key (WORKERID);
alter table WORKER
  add foreign key (ITSBOSS_WORKERID)
  references WORKER (WORKERID);

prompt Loading AREA...
insert into AREA (areaid, areaname)
values (1, 'West Virginia');
insert into AREA (areaid, areaname)
values (2, 'Missouri');
insert into AREA (areaid, areaname)
values (3, 'Texas');
insert into AREA (areaid, areaname)
values (4, 'Delaware');
insert into AREA (areaid, areaname)
values (5, 'Tennessee');
insert into AREA (areaid, areaname)
values (6, 'Arkansas');
insert into AREA (areaid, areaname)
values (7, 'Illinois');
insert into AREA (areaid, areaname)
values (8, 'Minnesota');
insert into AREA (areaid, areaname)
values (9, 'South Carolina');
insert into AREA (areaid, areaname)
values (10, 'Oregon');
insert into AREA (areaid, areaname)
values (11, 'Maryland');
insert into AREA (areaid, areaname)
values (12, 'Georgia');
insert into AREA (areaid, areaname)
values (13, 'Massachusetts');
insert into AREA (areaid, areaname)
values (14, 'Mississippi');
insert into AREA (areaid, areaname)
values (15, 'Ohio');
insert into AREA (areaid, areaname)
values (16, 'Idaho');
insert into AREA (areaid, areaname)
values (17, 'Florida');
insert into AREA (areaid, areaname)
values (18, 'New Jersey');
insert into AREA (areaid, areaname)
values (19, 'Michigan');
insert into AREA (areaid, areaname)
values (20, 'Hawaii');
commit;
prompt 20 records loaded
prompt Loading CITY...
insert into CITY (cityid, cityname, areaid)
values (100, 'Jacksonville', 19);
insert into CITY (cityid, cityname, areaid)
values (101, 'Pasadena', 10);
insert into CITY (cityid, cityname, areaid)
values (102, 'High Wycombe', 6);
insert into CITY (cityid, cityname, areaid)
values (103, 'Bretzfeld-Waldbach', 5);
insert into CITY (cityid, cityname, areaid)
values (104, 'Bernex', 2);
insert into CITY (cityid, cityname, areaid)
values (105, 'Waalwijk', 5);
insert into CITY (cityid, cityname, areaid)
values (106, 'Neuquen', 6);
insert into CITY (cityid, cityname, areaid)
values (107, 'Waite Park', 7);
insert into CITY (cityid, cityname, areaid)
values (108, 'Buffalo Grove', 9);
insert into CITY (cityid, cityname, areaid)
values (109, 'Monroe', 15);
insert into CITY (cityid, cityname, areaid)
values (110, 'Sheffield', 3);
insert into CITY (cityid, cityname, areaid)
values (111, 'Edmonton', 13);
insert into CITY (cityid, cityname, areaid)
values (112, 'Colorado Springs', 5);
insert into CITY (cityid, cityname, areaid)
values (113, 'S. Bernardo do Campo', 15);
insert into CITY (cityid, cityname, areaid)
values (114, 'El Segundo', 6);
insert into CITY (cityid, cityname, areaid)
values (115, 'Kumamoto', 9);
insert into CITY (cityid, cityname, areaid)
values (116, 'Ft. Leavenworth', 8);
insert into CITY (cityid, cityname, areaid)
values (117, 'Kצln', 18);
insert into CITY (cityid, cityname, areaid)
values (118, 'L''union', 9);
insert into CITY (cityid, cityname, areaid)
values (119, 'Pompeia', 13);
insert into CITY (cityid, cityname, areaid)
values (120, 'Paחo de Arcos', 14);
insert into CITY (cityid, cityname, areaid)
values (121, 'Lenexa', 10);
insert into CITY (cityid, cityname, areaid)
values (122, 'Reading', 14);
insert into CITY (cityid, cityname, areaid)
values (123, 'Obfelden', 13);
insert into CITY (cityid, cityname, areaid)
values (124, 'Herzogenrath', 6);
insert into CITY (cityid, cityname, areaid)
values (125, 'Nara', 4);
insert into CITY (cityid, cityname, areaid)
values (126, 'Swannanoa', 9);
insert into CITY (cityid, cityname, areaid)
values (127, 'Echirolles', 4);
insert into CITY (cityid, cityname, areaid)
values (128, 'Toronto', 1);
insert into CITY (cityid, cityname, areaid)
values (129, 'Lucca', 18);
insert into CITY (cityid, cityname, areaid)
values (130, 'Suffern', 19);
insert into CITY (cityid, cityname, areaid)
values (131, 'Long Island City', 18);
insert into CITY (cityid, cityname, areaid)
values (132, 'Gettysburg', 13);
insert into CITY (cityid, cityname, areaid)
values (133, 'Kaunas', 2);
insert into CITY (cityid, cityname, areaid)
values (134, 'Forest Park', 6);
insert into CITY (cityid, cityname, areaid)
values (135, 'Benbrook', 18);
insert into CITY (cityid, cityname, areaid)
values (136, 'Gifu', 15);
insert into CITY (cityid, cityname, areaid)
values (137, 'Tualatin', 16);
insert into CITY (cityid, cityname, areaid)
values (138, 'Paחo de Arcos', 17);
insert into CITY (cityid, cityname, areaid)
values (139, 'Bedfordshire', 16);
insert into CITY (cityid, cityname, areaid)
values (140, 'Koufu', 8);
insert into CITY (cityid, cityname, areaid)
values (141, 'Bekescsaba', 11);
insert into CITY (cityid, cityname, areaid)
values (142, 'Moorestown', 5);
insert into CITY (cityid, cityname, areaid)
values (143, 'Berlin-Adlershof', 9);
insert into CITY (cityid, cityname, areaid)
values (144, 'Ottawa', 19);
insert into CITY (cityid, cityname, areaid)
values (145, 'Birmingham', 14);
insert into CITY (cityid, cityname, areaid)
values (146, 'Balmoral', 1);
insert into CITY (cityid, cityname, areaid)
values (147, 'Maidenhead', 8);
insert into CITY (cityid, cityname, areaid)
values (148, 'Milton', 4);
insert into CITY (cityid, cityname, areaid)
values (149, 'Luedenscheid', 14);
commit;
prompt 50 records loaded
prompt Loading CITIZEN...
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (708262840, 'Diamond Olson', '(681) 485-9113', '61 Beach Avenue', 100);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (189811489, 'Maritza Marks', '(640) 612-8540', '107 Pegasus Street', 101);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (467351472, 'Kennedy Chen', '(887) 507-7157', '82 Judge Avenue', 102);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (152874477, 'Anthony Davila', '(640) 927-4303', '25 Mason Row', 103);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (590564086, 'Payton Sloan', '(363) 800-8519', '14 Hope Row', 104);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (945582077, 'Jeramiah Yu', '(322) 423-4859', '84 Penrose Route', 105);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (79504732, 'Gloria Hoffman', '(953) 773-4315', '113 Barley Row', 106);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (780946586, 'Abel Hansen', '(889) 938-3601', '39 Peace Route', 107);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (375972455, 'Amiya Drake', '(915) 878-9537', '47 Hazelnut Avenue', 108);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (971633137, 'Anna Velez', '(326) 862-3195', '3 Noble Avenue', 109);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (202710130, 'Iyana Meza', '(635) 461-7619', '73 Medieval Lane', 110);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (936814527, 'Johnathon Barnes', '(511) 920-0300', '113 Ivy Avenue', 111);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (618144212, 'Shaniya Dominguez', '(761) 894-1572', '77 Fox Street', 112);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (330927664, 'Bentley Hunter', '(544) 903-0344', '111 Lily Route', 113);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (850965499, 'Madyson Bradley', '(305) 897-2762', '77 Bright Passage', 114);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (121670810, 'Aiyana Hahn', '(874) 698-3483', '57 Storm Lane', 115);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (591829232, 'Zechariah Moran', '(362) 629-4653', '45 Seaview Passage', 116);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (523479830, 'Eliza Smith', '(897) 985-3936', '33 Frost Avenue', 117);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (972999281, 'Janae Nicholson', '(446) 871-4078', '44 Nightingale Avenue', 118);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (869593414, 'Sarahi Wagner', '(588) 363-6336', '67 Locust Street', 119);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (364323076, 'Fatima Livingston', '(797) 334-1333', '88 King Boulevard', 120);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (456295284, 'Ashleigh Winters', '(291) 680-4955', '102 East Avenue', 121);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (486877093, 'Clayton Shah', '(438) 398-3822', '35 Shade Route', 122);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (850636732, 'Emilia Bautista', '(672) 836-5328', '67 Clarity Row', 123);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (670150291, 'Martin Hodges', '(969) 528-3764', '90 Flax Street', 124);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (345108322, 'Carlie Avery', '(837) 213-1474', '66 Nightingale Row', 125);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (49629406, 'Mayra Mcgee', '(465) 501-2208', '29 Archer Lane', 126);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (996662084, 'Kelly Murphy', '(280) 346-4131', '68 Beech Route', 127);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (482818846, 'Messiah Mercer', '(506) 310-6753', '73 Victory Boulevard', 128);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (385892708, 'Libby Brady', '(371) 532-6213', '68 Sunshine Boulevard', 129);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (113899307, 'Reynaldo Lucero', '(376) 470-6332', '64 Apollo Passage', 130);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (19214993, 'Rowan Walters', '(990) 951-3708', '49 Kingwood Avenue', 131);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (640808719, 'Rohan Patel', '(646) 942-2650', '84 Greenfield Boulevard', 132);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (464600526, 'Paxton Rogers', '(860) 723-4516', '75 Starlight Avenue', 133);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (191386480, 'Alexis Bean', '(766) 620-8862', '76 Sunny Street', 134);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (287878005, 'Tiara Wilkinson', '(571) 568-9706', '95 Knight Lane', 135);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (754030724, 'Taniya Best', '(727) 486-2616', '11 Moonlight Way', 136);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (698473099, 'Kristian Perkins', '(241) 712-1121', '65 Storm Way', 137);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (111413768, 'Daniella Ballard', '(908) 533-5728', '83 Aurora Street', 138);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (671660675, 'Bridger Nicholson', '(477) 741-3982', '101 Champion Boulevard', 139);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (892580017, 'Tanner Velazquez', '(243) 828-0882', '49 Hart Row', 140);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (903626083, 'Kadyn Parker', '(490) 332-1815', '108 Beech Avenue', 141);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (620937216, 'Ernesto Crane', '(527) 637-2468', '108 Sunshine Row', 142);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (908000615, 'Alma Benson', '(468) 917-8598', '82 Spring Avenue', 143);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (724134639, 'Marie Barton', '(626) 986-0157', '49 Merchant Street', 144);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (985907107, 'Lilyana Lamb', '(940) 472-6389', '110 Achorage Street', 145);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (726919780, 'Lewis Stewart', '(730) 384-0925', '115 Knight Boulevard', 146);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (412079807, 'Alonso Washington', '(223) 511-1080', '55 Cathedral Street', 147);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (709915279, 'Aiyana Russo', '(437) 246-9151', '11 Palm Street', 148);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (434940113, 'Jaylon Mills', '(202) 987-5836', '80 Archer Route', 149);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (291741163, 'Drew Love', '(202) 878-9980', '77 General Street', 110);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (426148194, 'Denisse Ball', '(579) 989-1843', '2 West Row', 111);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (64526097, 'Lia Michael', '(952) 885-8891', '112 Champion Way', 112);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (603338542, 'Esteban Frederick', '(578) 921-4734', '24 Circus Boulevard', 113);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (784600813, 'Addyson Farley', '(923) 746-5945', '51 Ember Street', 114);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (70822249, 'Peyton Griffith', '(809) 797-1096', '48 Harbor Avenue', 115);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (70831716, 'Ronan Holmes', '(553) 207-6160', '31 Archer Lane', 116);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (751988735, 'Heidy Cruz', '(770) 434-7266', '30 Willow Way', 117);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (365963339, 'Miracle Gould', '(658) 950-6485', '21 Old Lane', 118);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (648911084, 'Gunnar Barr', '(309) 615-5237', '7 Senna Row', 141);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (185000152, 'Chana Meadows', '(833) 811-2588', '62 Tower Row', 142);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (710935253, 'Olivia Duncan', '(841) 486-2290', '111 Barley Avenue', 143);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (293713935, 'Kolten Clarke', '(893) 528-2309', '9 Prince Street', 144);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (63271602, 'Milagros Hill', '(740) 275-8298', '40 Beaver Lane', 145);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (326413904, 'Libby Dickson', '(625) 579-6590', '28 Cliff Avenue', 146);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (360147273, 'Kiley Compton', '(399) 339-4007', '74 Anchor Route', 143);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (792958079, 'Phoenix Mcdowell', '(775) 470-2012', '86 Union Avenue', 144);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (642196831, 'Taryn Bridges', '(713) 375-2755', '115 Moon Lane', 145);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (187988627, 'Elsie Black', '(648) 822-3256', '88 Kings Boulevard', 146);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (211681471, 'Bruce Meyer', '(964) 549-4644', '91 Berry Row', 147);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (503126262, 'Teagan Fritz', '(863) 209-0900', '87 Oval Boulevard', 148);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (437511476, 'Alfredo Cline', '(300) 477-8871', '6 South Lane', 149);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (991978392, 'Alvin Alvarez', '(688) 423-0740', '57 Broom Row', 110);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (897773040, 'Cayden Henry', '(873) 742-8711', '39 Ocean Avenue', 128);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (206683768, 'Iyana Paul', '(649) 590-8167', '94 Colonel Passage', 129);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (779945885, 'Haiden Shepard', '(244) 246-4486', '76 Storm Street', 130);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (726563582, 'Braden Summers', '(959) 747-1142', '8 Garden Boulevard', 131);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (156171593, 'James Nichols', '(543) 926-5707', '15 Haven Avenue', 132);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (171910180, 'Damien Hess', '(293) 978-4218', '92 Penrose Avenue', 133);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (388283660, 'Joselyn Chan', '(276) 550-7416', '77 Fair Avenue', 134);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (18795929, 'Serena Klein', '(679) 870-5170', '63 Globe Way', 135);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (856592056, 'Sammy Bonilla', '(858) 712-2817', '56 Bury Street', 136);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (173006051, 'Kiana Jimenez', '(848) 252-2370', '60 Senna Row', 137);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (840454690, 'Tamia Mercado', '(357) 947-6644', '12 Gold Boulevard', 116);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (677761715, 'Chanel Raymond', '(964) 295-4683', '4 Manor Way', 117);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (55937608, 'Ariel Little', '(286) 596-0144', '5 Paradise Way', 118);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (719978224, 'Nolan Orozco', '(605) 200-4712', '101 Oak Street', 141);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (834214215, 'George Maldonado', '(683) 582-9224', '77 Nova Row', 142);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (434932129, 'Valery Leach', '(599) 541-6077', '9 Green Route', 143);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (988386543, 'Leonel Joseph', '(507) 464-8089', '79 Mount Street', 144);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (129407872, 'Koen Finley', '(723) 553-9931', '83 Bush Lane', 145);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (452323355, 'Marshall Barton', '(978) 512-8548', '7 Copper Passage', 146);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (742852779, 'Noelle Butler', '(207) 369-5153', '61 Temple Lane', 143);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (592650513, 'Saul Leonard', '(283) 581-4214', '112 Windmill Route', 144);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (448291127, 'Haley Howe', '(795) 925-1060', '73 Juniper Lane', 130);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (18645918, 'Emmy Strong', '(255) 850-9946', '75 Jewel Street', 131);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (653961350, 'Josie Mcfarland', '(342) 258-1111', '87 Providence Lane', 132);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (64729682, 'Yazmin Oconnell', '(566) 312-8386', '23 Bay View Lane', 133);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (955095939, 'Zaniyah Reese', '(442) 634-5835', '61 Mason Way', 134);
insert into CITIZEN (citizenid, citizenname, phone, address, cityid)
values (685600354, 'Declan Wilson', '(759) 929-2227', '39 Gold Avenue', 135);
commit;
prompt 100 records loaded
prompt Loading CLERK...
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (985608353, 76, 2019, 728586501, 6259, 'Aaron Robbins', 65);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (216673752, 60, 2010, 611912795, 3588, 'Regina Hicks', 11);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (616839114, 84, 2015, 82463116, 3575, 'Vivian Rhodes', 90);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (56423791, 30, 2008, 13621976, 6554, 'Vicente Robles', 70);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (715357972, 32, 2012, 178536762, 7322, 'Riley Vang', 62);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (769944696, 57, 2011, 835856510, 5472, 'Ashton Maldonado', 41);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (106947896, 33, 2014, 951674376, 6255, 'Erin Raymond', 14);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (701642916, 35, 2007, 192952482, 4323, 'Emma Terrell', 66);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (230298738, 74, 2006, 747768908, 8522, 'Mallory Burnett', 21);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (536047901, 55, 2007, 359153629, 4907, 'Alice Rojas', 52);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (688678649, 60, 2011, 754058532, 8450, 'Daniela Bradshaw', 1);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (45172409, 70, 2013, 116713838, 8161, 'Carlos Crane', 20);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (261999697, 29, 2018, 351427476, 3376, 'Marisa Blackburn', 73);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (533844976, 52, 2008, 871371068, 5303, 'Lacey Wright', 93);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (439153011, 76, 2014, 636986649, 3182, 'Aliana Munoz', 82);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (742868808, 33, 2017, 644517151, 6253, 'Juliet Day', 84);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (89160074, 45, 2015, 129040934, 8855, 'Isabell Brock', 32);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (908621892, 80, 2011, 338392591, 7171, 'Janiya James', 89);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (727320134, 42, 2010, 730255019, 4750, 'Brittany Nielsen', 60);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (889893500, 60, 2019, 169525232, 4145, 'Dustin Terrell', 87);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (97748603, 86, 2017, 503531033, 5199, 'Yasmin Steele', 16);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (621893021, 70, 2020, 536832758, 8996, 'Jacey Stephens', 7);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (50870763, 77, 2014, 881497689, 4197, 'Judith Kramer', 5);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (231962714, 48, 2016, 888871238, 7656, 'Aliana Warren', 23);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (3266076, 36, 2017, 288561006, 4629, 'Jerimiah Richardson', 58);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (242059824, 30, 2006, 653257004, 9931, 'Kimora Bruce', 10);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (986515397, 90, 2016, 561974294, 3060, 'Matilda Mills', 51);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (640574572, 69, 2014, 683069173, 5642, 'Jon Hanna', 56);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (381434132, 84, 2011, 632061896, 8346, 'Jadiel Nichols', 43);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (58713028, 76, 2011, 282805064, 5877, 'Aliza Johnston', 8);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (413518592, 64, 2007, 210526370, 3139, 'Kymani Atkins', 9);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (89541503, 72, 2010, 35100364, 9279, 'Jayda Booker', 85);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (675975458, 72, 2015, 386211345, 6900, 'Jamiya Cox', 38);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (953496147, 39, 2016, 53215943, 8060, 'Jonah Mckay', 76);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (763143179, 43, 2008, 571651713, 7809, 'Campbell Manning', 79);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (640330926, 95, 2014, 887279443, 7253, 'Ivy Sutton', 49);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (219641402, 36, 2009, 348994280, 9481, 'Zaniyah Dominguez', 55);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (797503856, 99, 2007, 596091330, 6734, 'Fernanda Stanton', 57);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (714723836, 77, 2008, 654058322, 7181, 'Maddison Bright', 2);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (962919031, 42, 2007, 467458799, 6323, 'Annie Lozano', 83);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (804709291, 97, 2012, 482185653, 8052, 'Dominique Pollard', 75);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (177769483, 69, 2016, 679505128, 9664, 'Brynlee Whitaker', 54);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (901257019, 86, 2020, 189682273, 6748, 'Aedan Ramos', 69);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (857760109, 81, 2015, 747715581, 3646, 'Kiley Gillespie', 48);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (744958679, 36, 2006, 290166400, 8599, 'Maxwell Huffman', 50);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (563871338, 47, 2018, 815005240, 9063, 'Sidney Mcdowell', 81);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (566015263, 83, 2011, 853047389, 6153, 'Abraham Waller', 68);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (278216922, 96, 2007, 975381784, 5014, 'Jonas Ayala', 71);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (479478250, 40, 2008, 7375540, 3072, 'Yoselin Allen', 96);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (340526675, 64, 2011, 866019935, 8808, 'Darius Dunn', 6);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (578494275, 65, 2019, 253823707, 6361, 'Osvaldo Sparks', 97);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (470721569, 27, 2010, 578436469, 6112, 'Adrianna Norman', 86);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (625260228, 80, 2015, 63966459, 5552, 'Celia Cowan', 25);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (602574296, 77, 2008, 775632110, 8881, 'Kyra Howell', 22);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (141169429, 55, 2012, 849549339, 8108, 'Aden Nash', 78);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (657042160, 96, 2011, 595482475, 8155, 'Haven Dominguez', 26);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (111959269, 41, 2014, 196953292, 3323, 'Micah Singh', 31);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (116034120, 77, 2007, 655805639, 5681, 'Mariah Hampton', 88);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (568167932, 81, 2006, 577025006, 5638, 'Jeremy Lutz', 29);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (775027789, 74, 2007, 675210639, 7284, 'Jaxson Robertson', 45);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (533397741, 64, 2011, 919044101, 6241, 'Marquise Horne', 36);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (462438254, 93, 2013, 462929801, 6205, 'Autumn Joseph', 19);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (412908680, 66, 2018, 150609347, 9603, 'Melina Morales', 12);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (999775205, 59, 2008, 510596727, 8121, 'Jaelyn Baxter', 35);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (377845907, 40, 2014, 71840651, 3885, 'Luz Mcintyre', 4);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (358888404, 42, 2017, 544243390, 8564, 'Rigoberto Stafford', 39);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (508028509, 43, 2015, 962334883, 8019, 'Lila Shields', 17);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (935116002, 90, 2011, 248278494, 6271, 'Brooke Mayo', 74);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (826448233, 45, 2010, 332180403, 5020, 'Karly Cooke', 67);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (62588564, 46, 2019, 861989291, 9752, 'Joanna Nichols', 34);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (37773505, 60, 2017, 340695319, 5345, 'Elizabeth Booth', 80);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (224334980, 84, 2020, 412463694, 4504, 'John Mcmahon', 13);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (725061585, 62, 2014, 520949281, 8672, 'Roman Martin', 42);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (380575697, 49, 2016, 297954194, 5738, 'Dakota Lindsey', 24);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (443090391, 39, 2017, 588792612, 9339, 'Donald Romero', 92);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (102056465, 25, 2006, 759442973, 6564, 'Seth Mercado', 27);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (132751178, 86, 2016, 513758036, 4058, 'Maxwell Calderon', 100);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (459089952, 90, 2014, 811969949, 4276, 'Amelia Mills', 98);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (352326915, 35, 2011, 65786836, 7722, 'Stacy Savage', 28);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (398251227, 31, 2011, 111324755, 5795, 'Lola Vaughan', 47);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (198620173, 61, 2007, 441864276, 5570, 'Autumn Oneal', 33);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (468433995, 85, 2010, 422387569, 9366, 'Jacquelyn Alvarez', 30);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (169418156, 42, 2015, 920606814, 4919, 'Maddison Francis', 99);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (48780608, 55, 2016, 623443858, 5001, 'Lukas Powers', 15);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (245602759, 88, 2008, 153201103, 7808, 'Landon Moody', 63);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (865215977, 29, 2014, 247598093, 3237, 'Judah Solis', 46);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (613154169, 75, 2009, 487998812, 3505, 'Carina Todd', 37);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (710604897, 74, 2007, 969419112, 8100, 'Trinity Cochran', 40);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (903631899, 79, 2008, 764532349, 3065, 'Terrence Owens', 77);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (163989772, 97, 2007, 162100909, 9168, 'Clinton Ochoa', 95);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (424689583, 88, 2012, 963939156, 7690, 'Jaylee Carpenter', 3);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (251645553, 48, 2016, 848997346, 9457, 'Kyan Fuentes', 94);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (520881414, 85, 2020, 596236364, 6804, 'Brodie Murphy', 61);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (740053775, 58, 2015, 376869355, 5188, 'Mike Pham', 59);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (970992503, 56, 2006, 932521110, 5899, 'Iliana Zuniga', 44);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (552470268, 89, 2018, 168148868, 5387, 'Maverick Klein', 53);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (283304585, 42, 2011, 467598885, 4620, 'Brianna Munoz', 72);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (315265026, 92, 2007, 964843484, 8858, 'Aryana Mcintyre', 64);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (83705991, 62, 2008, 812109096, 4153, 'Kira Pope', 18);
insert into CLERK (clerkid, rating, hireyear, bossid, salary, clerkname, areaid)
values (632486887, 37, 2011, 484427206, 6570, 'Mathew Schneider', 91);
commit;
prompt 100 records loaded
prompt Loading FIELD...
insert into FIELD (fieldid, filedname)
values (880, 'General Medicine Division');
insert into FIELD (fieldid, filedname)
values (191, 'Community Medicine Division');
insert into FIELD (fieldid, filedname)
values (176, 'Field of Mental Health');
insert into FIELD (fieldid, filedname)
values (333, 'Field of Geriatrics');
insert into FIELD (fieldid, filedname)
values (297, 'Dental Health Division');
insert into FIELD (fieldid, filedname)
values (895, 'Field of Rehabilitation');
insert into FIELD (fieldid, filedname)
values (685, 'Occupational Therapy');
insert into FIELD (fieldid, filedname)
values (842, 'Physiotherapy');
insert into FIELD (fieldid, filedname)
values (393, 'Speech therapist');
insert into FIELD (fieldid, filedname)
values (699, 'National Psychology');
insert into FIELD (fieldid, filedname)
values (983, 'Social work');
insert into FIELD (fieldid, filedname)
values (506, 'Child development and rehabilitation');
commit;
prompt 12 records loaded
prompt Loading HEALTHINSTITUTION...
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (435, 'Big River Hospital', 106, 685);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (861, 'Blessings Clinic', 149, 191);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (726, 'Harmony Grove Clinic', 113, 333);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (758, 'Lowland Clinic', 145, 506);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (224, 'Spring Harbor Medical Clinic', 105, 842);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (42, 'Grand River Hospital', 127, 895);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (116, 'Grand Willow Medical Center', 132, 393);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (431, 'Spring Grove Hospital Center', 114, 176);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (380, 'Grand View Clinic', 120, 393);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (426, 'Tranquility Community Hospital', 114, 297);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (546, 'Spring Forest Clinic', 137, 333);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (186, 'Rose Valley Medical Clinic', 106, 393);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (632, 'Spring Grove General Hospital', 118, 393);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (789, 'Bellevue Community Hospital', 110, 880);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (860, 'Crossroads Hospital', 124, 176);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (74, 'White Blossom Hospital Center', 149, 333);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (472, 'Highland General Hospital', 110, 983);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (514, 'Hope Haven General Hospital', 141, 842);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (680, 'Summerstone Hospital Center', 125, 191);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (213, 'Summerstone Hospital Center', 102, 176);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (51, 'Hill Crest Medical Center', 103, 333);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (581, 'Stillwater Hospital Center', 100, 176);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (78, 'Charity Medical Clinic', 108, 393);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (895, 'Valley Health Medical Clinic', 148, 176);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (301, 'Spring Fountain Medical Clinic', 130, 685);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (151, 'Kindred Medical Center', 122, 983);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (170, 'Rose Clinic', 124, 880);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (912, 'Citrus Hospital', 132, 983);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (501, 'Green Hill Hospital Center', 112, 880);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (893, 'Heartland Hospital', 130, 393);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (857, 'White River Community Hospital', 119, 699);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (443, 'Southshore Hospital', 116, 685);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (297, 'Pine Valley Medical Clinic', 127, 333);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (566, 'Beacon Medical Center', 120, 983);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (164, 'Garden City General Hospital', 142, 685);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (996, 'Kindred Soul Clinic', 137, 191);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (652, 'Clearwater Valley Community Hospital', 138, 176);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (582, 'Fairview Community Hospital', 102, 297);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (564, 'Angelwing Medical Center', 123, 506);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (815, 'Archangel General Hospital', 136, 880);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (820, 'Honor Grave Hospital', 140, 297);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (157, 'Silverwood Clinic', 141, 895);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (281, 'Lowland Medical Clinic', 142, 393);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (420, 'Hyacinth Medical Center', 131, 699);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (408, 'Big River Hospital Center', 113, 191);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (279, 'Hillsdale Clinic', 140, 685);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (423, 'Swan River Clinic', 147, 191);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (573, 'Good Samaritan Medical Clinic', 108, 983);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (292, 'Greengrass Hospital Center', 109, 699);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (146, 'Petunia Hospital', 145, 699);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (338, 'Silver Gardens Community Hospital', 109, 506);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (364, 'Silver Pine Clinic', 119, 842);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (340, 'Silverstone Clinic', 144, 393);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (180, 'Hopevale General Hospital', 139, 895);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (713, 'Clearwater Lake General Hospital', 115, 895);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (809, 'Progress Clinic', 111, 191);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (839, 'Hot Springs General Hospital', 129, 842);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (656, 'Hopevale Hospital Center', 100, 880);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (834, 'Sapphire Lake Clinic', 136, 176);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (34, 'Citrus Medical Center', 143, 842);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (616, 'Forest View Community Hospital', 143, 699);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (931, 'Silver Birch General Hospital', 123, 191);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (503, 'Silver Birch Medical Center', 104, 297);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (748, 'Overlook Medical Clinic', 148, 880);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (381, 'Healthstone Community Hospital', 115, 333);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (352, 'Rose Petal Medical Center', 133, 699);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (25, 'Angelvale Medical Center', 146, 983);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (31, 'Genesis Clinic', 118, 685);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (200, 'Morningside Medical Clinic', 117, 842);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (107, 'Summit Hospital', 125, 333);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (601, 'East Valley Clinic', 112, 176);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (310, 'Wildflower Hospital', 138, 297);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (526, 'Paradise Valley Hospital Center', 121, 699);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (831, 'Spring Grove Medical Clinic', 134, 880);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (121, 'White Mountain Medical Center', 126, 297);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (313, 'Twin Mountains Community Hospital', 117, 895);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (339, 'Harmony Medical Center', 116, 297);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (942, 'Silverwood Clinic', 104, 685);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (363, 'Woodland Hospital Center', 107, 699);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (572, 'Cherry Blossom Medical Center', 134, 983);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (111, 'Marine Medical Clinic', 122, 880);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (555, 'Springfield Hospital Center', 126, 176);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (714, 'Heartstone Medical Center', 147, 506);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (584, 'Bayview Medical Clinic', 107, 842);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (854, 'Fortuna Medical Center', 105, 895);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (892, 'Valley Health Hospital Center', 129, 895);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (781, 'Maple Grove Medical Clinic', 146, 880);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (309, 'Great River Clinic', 111, 506);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (883, 'Oasis Hospital', 135, 506);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (319, 'Cherry Blossom Medical Center', 144, 983);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (174, 'Marine Medical Clinic', 128, 685);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (427, 'Springfield Hospital Center', 139, 333);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (455, 'Heartstone Medical Center', 135, 191);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (331, 'Bayview Medical Clinic', 133, 506);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (589, 'Fortuna Medical Center', 101, 191);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (759, 'Valley Health Hospital Center', 121, 506);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (865, 'Maple Grove Medical Clinic', 128, 297);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (648, 'Great River Clinic', 131, 842);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (547, 'Oasis Hospital', 101, 333);
insert into HEALTHINSTITUTION (healtinstid, instname, cityid, fieldid)
values (360, 'Spring Forest Hospital', 103, 895);
commit;
prompt 100 records loaded
prompt Loading DEPARTMENT...
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (224, 47, 'Admissions', 435);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (753, 36, 'Anesthetics', 861);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (621, 30, 'Breast Screening', 726);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (265, 39, 'Burn Center', 758);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (540, 38, 'Cardiology', 224);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (924, 11, 'CSSD', 42);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (598, 26, 'Chaplaincy', 116);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (789, 45, 'Coronary Care Unit', 431);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (993, 13, 'Critical Care', 380);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (97, 11, 'Diagnostic Imaging', 426);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (976, 16, 'Discharge Lounge', 546);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (399, 44, 'Elderly services', 186);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (405, 26, 'Finance Department', 632);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (633, 18, 'Gastroenterology', 789);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (450, 13, 'General Services', 860);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (959, 41, 'General Surgery', 74);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (336, 48, 'Gynecology', 472);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (890, 38, 'Haematology', 514);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (777, 41, 'Health & Safety', 680);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (179, 30, 'Intensive Care Unit', 213);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (365, 38, 'Human Resources', 51);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (600, 21, 'Infection Control', 581);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (528, 10, 'Information Management', 78);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (492, 31, 'Maternity', 895);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (220, 12, 'Medical Records', 301);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (33, 43, 'Microbiology', 151);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (121, 30, 'Neonatal', 170);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (22, 13, 'Neurology', 912);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (830, 16, 'Nutrition and Dietetics', 501);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (413, 13, 'Obstetrics/Gynecology', 893);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (425, 37, 'Occupational Therapy', 857);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (329, 28, 'Oncology', 443);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (556, 43, 'Ophthalmology', 297);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (20, 48, 'Orthopaedics', 566);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (717, 41, 'Otolaryngology', 164);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (853, 16, 'Pain Management', 996);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (233, 33, 'Patient Accounts', 652);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (734, 20, 'Patient Services', 582);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (124, 37, 'Pharmacy', 564);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (245, 33, 'Physiotherapy', 815);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (803, 36, 'Purchasing & Supplies', 820);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (110, 42, 'Radiology', 157);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (631, 14, 'Radiotherapy', 281);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (149, 25, 'Renal', 420);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (172, 11, 'Rheumatology', 408);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (710, 17, 'Sexual Health', 279);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (185, 44, 'Social Work', 423);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (513, 10, 'Urology', 573);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (226, 25, 'Occupational Therapy', 292);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (478, 40, 'Oncology', 146);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (958, 11, 'Ophthalmology', 338);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (792, 37, 'Orthopaedics', 364);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (419, 25, 'Otolaryngology', 340);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (977, 38, 'Pain Management', 180);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (688, 25, 'Patient Accounts', 713);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (480, 24, 'Patient Services', 809);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (741, 10, 'Pharmacy', 839);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (964, 25, 'Physiotherapy', 656);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (296, 16, 'Purchasing & Supplies', 834);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (951, 20, 'Radiology', 34);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (758, 47, 'Radiotherapy', 616);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (820, 14, 'Renal', 931);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (799, 38, 'Rheumatology', 503);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (670, 26, 'Sexual Health', 748);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (321, 35, 'Social Work', 381);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (246, 28, 'Burn Center', 352);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (790, 47, 'Cardiology', 25);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (684, 11, 'CSSD', 31);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (928, 31, 'Chaplaincy', 200);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (846, 22, 'Coronary Care Unit', 107);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (640, 27, 'Critical Care', 601);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (251, 49, 'Diagnostic Imaging', 310);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (572, 47, 'Discharge Lounge', 526);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (926, 48, 'Elderly services', 831);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (501, 33, 'Finance Department', 121);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (953, 11, 'Gastroenterology', 313);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (737, 22, 'General Services', 339);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (608, 39, 'General Surgery', 942);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (886, 46, 'Gynecology', 363);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (749, 37, 'Haematology', 572);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (130, 49, 'Health & Safety', 111);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (155, 49, 'Intensive Care Unit', 555);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (189, 39, 'Human Resources', 714);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (16, 11, 'Admissions', 584);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (780, 11, 'Anesthetics', 854);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (731, 39, 'Breast Screening', 892);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (880, 10, 'Burn Center', 781);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (427, 35, 'Cardiology', 309);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (763, 48, 'CSSD', 883);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (549, 24, 'Chaplaincy', 319);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (29, 42, 'Coronary Care Unit', 174);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (75, 41, 'Critical Care', 427);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (503, 47, 'Diagnostic Imaging', 455);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (491, 17, 'Discharge Lounge', 331);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (712, 31, 'Elderly services', 589);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (93, 12, 'Finance Department', 759);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (682, 17, 'Gastroenterology', 865);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (279, 49, 'General Services', 648);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (203, 16, 'General Surgery', 547);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (735, 42, 'Gynecology', 360);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (716, 42, 'Haematology', 435);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (838, 36, 'Health & Safety', 861);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (473, 38, 'Ophthalmology', 726);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (306, 41, 'Orthopaedics', 758);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (847, 50, 'Otolaryngology', 224);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (356, 32, 'Pain Management', 42);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (496, 42, 'Patient Accounts', 116);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (767, 42, 'Patient Services', 431);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (530, 35, 'Pharmacy', 380);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (642, 16, 'Physiotherapy', 426);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (471, 39, 'Purchasing & Supplies', 546);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (218, 38, 'Radiology', 186);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (591, 25, 'Radiotherapy', 632);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (526, 32, 'Renal', 789);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (406, 48, 'Rheumatology', 860);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (81, 35, 'Sexual Health', 74);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (67, 41, 'Social Work', 472);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (981, 40, 'Urology', 514);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (686, 39, 'Occupational Therapy', 680);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (87, 47, 'Oncology', 213);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (531, 25, 'Ophthalmology', 51);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (184, 40, 'Orthopaedics', 581);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (619, 27, 'Otolaryngology', 78);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (332, 33, 'Pain Management', 895);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (26, 24, 'Patient Accounts', 301);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (114, 24, 'Patient Services', 151);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (512, 47, 'Pharmacy', 170);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (433, 14, 'Physiotherapy', 912);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (660, 43, 'Purchasing & Supplies', 501);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (667, 38, 'Radiology', 893);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (460, 39, 'Radiotherapy', 857);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (895, 39, 'Renal', 443);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (368, 29, 'Rheumatology', 297);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (74, 40, 'Sexual Health', 566);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (738, 44, 'Social Work', 164);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (88, 46, 'Burn Center', 996);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (866, 41, 'Cardiology', 652);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (205, 16, 'CSSD', 582);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (157, 37, 'Chaplaincy', 564);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (932, 38, 'Coronary Care Unit', 815);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (779, 21, 'Critical Care', 820);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (766, 23, 'Diagnostic Imaging', 157);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (366, 13, 'Discharge Lounge', 281);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (592, 16, 'Elderly services', 420);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (438, 12, 'Finance Department', 408);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (393, 24, 'Gastroenterology', 279);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (760, 43, 'General Services', 423);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (791, 44, 'General Surgery', 573);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (875, 39, 'Gynecology', 292);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (223, 13, 'Purchasing & Supplies', 146);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (338, 30, 'Radiology', 338);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (219, 46, 'Radiotherapy', 364);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (994, 23, 'Renal', 340);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (289, 41, 'Rheumatology', 180);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (873, 26, 'Sexual Health', 713);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (107, 17, 'Social Work', 809);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (651, 37, 'Urology', 839);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (197, 46, 'Occupational Therapy', 656);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (388, 25, 'Oncology', 834);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (781, 24, 'Ophthalmology', 34);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (161, 37, 'Orthopaedics', 616);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (458, 47, 'Otolaryngology', 931);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (476, 30, 'Pain Management', 503);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (652, 40, 'Patient Accounts', 748);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (337, 48, 'Patient Services', 381);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (547, 34, 'Pharmacy', 352);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (546, 47, 'Physiotherapy', 25);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (747, 46, 'Purchasing & Supplies', 31);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (967, 46, 'Radiology', 200);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (415, 12, 'Radiotherapy', 107);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (561, 14, 'Renal', 601);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (479, 41, 'Rheumatology', 310);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (736, 21, 'Sexual Health', 526);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (343, 27, 'Social Work', 831);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (882, 31, 'Burn Center', 121);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (198, 45, 'Cardiology', 313);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (641, 40, 'CSSD', 339);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (713, 49, 'Chaplaincy', 942);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (353, 36, 'Coronary Care Unit', 363);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (797, 35, 'Critical Care', 572);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (645, 43, 'Diagnostic Imaging', 111);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (811, 17, 'Discharge Lounge', 555);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (548, 28, 'Elderly services', 714);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (0, 41, 'Finance Department', 584);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (472, 25, 'Gastroenterology', 854);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (325, 44, 'General Services', 892);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (457, 29, 'General Surgery', 781);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (522, 13, 'Gynecology', 309);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (828, 39, 'Haematology', 883);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (922, 44, 'Health & Safety', 319);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (756, 36, 'Intensive Care Unit', 174);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (2, 29, 'Human Resources', 427);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (860, 27, 'Admissions', 455);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (806, 34, 'Anesthetics', 331);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (952, 17, 'Breast Screening', 589);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (517, 35, 'Burn Center', 759);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (918, 50, 'Cardiology', 865);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (103, 49, 'CSSD', 648);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (191, 17, 'Chaplaincy', 547);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (32, 29, 'Coronary Care Unit', 360);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (68, 37, 'Critical Care', 435);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (371, 20, 'Diagnostic Imaging', 861);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (173, 27, 'Discharge Lounge', 726);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (102, 47, 'Elderly services', 758);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (392, 23, 'Finance Department', 224);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (344, 19, 'Gastroenterology', 42);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (28, 22, 'General Services', 116);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (395, 33, 'General Surgery', 431);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (674, 18, 'Gynecology', 380);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (383, 29, 'Haematology', 426);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (677, 43, 'Health & Safety', 546);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (840, 46, 'Ophthalmology', 186);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (123, 18, 'Orthopaedics', 632);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (280, 31, 'Otolaryngology', 789);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (584, 32, 'Pain Management', 860);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (495, 42, 'Patient Accounts', 74);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (76, 38, 'Patient Services', 472);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (122, 16, 'Pharmacy', 514);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (283, 44, 'Physiotherapy', 680);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (949, 46, 'Purchasing & Supplies', 213);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (764, 36, 'Radiology', 51);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (225, 25, 'Radiotherapy', 581);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (580, 17, 'Renal', 78);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (300, 45, 'Rheumatology', 895);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (511, 41, 'Sexual Health', 301);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (762, 16, 'Social Work', 151);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (443, 42, 'Urology', 170);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (940, 22, 'Occupational Therapy', 912);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (378, 49, 'Oncology', 501);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (664, 25, 'Ophthalmology', 893);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (12, 24, 'Orthopaedics', 857);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (562, 38, 'Otolaryngology', 443);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (459, 20, 'Pain Management', 297);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (15, 21, 'Patient Accounts', 566);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (524, 42, 'Patient Services', 164);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (852, 31, 'Pharmacy', 996);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (941, 43, 'Physiotherapy', 652);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (382, 29, 'Purchasing & Supplies', 582);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (627, 28, 'Radiology', 564);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (390, 27, 'Radiotherapy', 815);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (193, 47, 'Renal', 820);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (826, 14, 'Rheumatology', 157);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (855, 33, 'Sexual Health', 281);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (778, 50, 'Social Work', 420);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (815, 28, 'Burn Center', 408);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (60, 12, 'Cardiology', 279);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (84, 25, 'CSSD', 423);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (341, 27, 'Chaplaincy', 573);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (725, 16, 'Coronary Care Unit', 292);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (730, 30, 'Critical Care', 146);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (287, 17, 'Diagnostic Imaging', 338);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (837, 46, 'Discharge Lounge', 364);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (345, 42, 'Elderly services', 340);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (625, 44, 'Finance Department', 180);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (646, 19, 'Sexual Health', 713);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (933, 33, 'Social Work', 809);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (164, 21, 'Urology', 839);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (217, 27, 'Occupational Therapy', 656);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (678, 42, 'Oncology', 834);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (41, 16, 'Ophthalmology', 34);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (152, 17, 'Orthopaedics', 616);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (444, 42, 'Otolaryngology', 931);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (65, 47, 'Pain Management', 503);
insert into DEPARTMENT (depid, numberofbeds, depname, healtinstid)
values (516, 17, 'Patient Accounts', 748);
commit;
prompt 264 records loaded
prompt Loading LICENSING...
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 638, to_date('27-01-2000', 'dd-mm-yyyy'), 176);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 697, to_date('19-03-2000', 'dd-mm-yyyy'), 393);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 357, to_date('14-06-2001', 'dd-mm-yyyy'), 685);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 706, to_date('17-03-2002', 'dd-mm-yyyy'), 506);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 839, to_date('21-10-2002', 'dd-mm-yyyy'), 176);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 463, to_date('11-04-2003', 'dd-mm-yyyy'), 895);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 474, to_date('28-06-2003', 'dd-mm-yyyy'), 842);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 727, to_date('18-02-2005', 'dd-mm-yyyy'), 176);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 732, to_date('19-08-2007', 'dd-mm-yyyy'), 842);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 140, to_date('13-01-2008', 'dd-mm-yyyy'), 880);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 895, to_date('25-08-2008', 'dd-mm-yyyy'), 842);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 765, to_date('11-03-2009', 'dd-mm-yyyy'), 895);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 163, to_date('01-12-2009', 'dd-mm-yyyy'), 393);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 362, to_date('10-11-2010', 'dd-mm-yyyy'), 880);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 346, to_date('02-11-2011', 'dd-mm-yyyy'), 393);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 703, to_date('19-11-2011', 'dd-mm-yyyy'), 699);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 108, to_date('22-06-2012', 'dd-mm-yyyy'), 191);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 717, to_date('10-11-2012', 'dd-mm-yyyy'), 983);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 741, to_date('09-05-2013', 'dd-mm-yyyy'), 685);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 716, to_date('14-12-2013', 'dd-mm-yyyy'), 191);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 173, to_date('02-03-2014', 'dd-mm-yyyy'), 176);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 311, to_date('23-03-2015', 'dd-mm-yyyy'), 880);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 626, to_date('02-04-2016', 'dd-mm-yyyy'), 842);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 860, to_date('05-02-2018', 'dd-mm-yyyy'), 895);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 157, to_date('13-10-2018', 'dd-mm-yyyy'), 333);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 701, to_date('17-06-2000', 'dd-mm-yyyy'), 191);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 75, to_date('18-06-2000', 'dd-mm-yyyy'), 880);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 351, to_date('17-02-2004', 'dd-mm-yyyy'), 191);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 97, to_date('12-12-2004', 'dd-mm-yyyy'), 685);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 604, to_date('16-02-2006', 'dd-mm-yyyy'), 699);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 374, to_date('18-12-2007', 'dd-mm-yyyy'), 699);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 130, to_date('30-06-2008', 'dd-mm-yyyy'), 699);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 738, to_date('05-01-2009', 'dd-mm-yyyy'), 297);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 12, to_date('15-12-2009', 'dd-mm-yyyy'), 880);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 603, to_date('25-08-2010', 'dd-mm-yyyy'), 297);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 399, to_date('02-09-2010', 'dd-mm-yyyy'), 393);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 915, to_date('23-02-2011', 'dd-mm-yyyy'), 983);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 654, to_date('02-12-2011', 'dd-mm-yyyy'), 176);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 316, to_date('17-01-2013', 'dd-mm-yyyy'), 506);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 365, to_date('02-12-2013', 'dd-mm-yyyy'), 506);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 818, to_date('22-01-2014', 'dd-mm-yyyy'), 176);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 124, to_date('12-02-2014', 'dd-mm-yyyy'), 393);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 29, to_date('10-03-2015', 'dd-mm-yyyy'), 842);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 656, to_date('25-04-2015', 'dd-mm-yyyy'), 983);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 764, to_date('28-06-2015', 'dd-mm-yyyy'), 297);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 172, to_date('03-06-2016', 'dd-mm-yyyy'), 506);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 945, to_date('15-08-2016', 'dd-mm-yyyy'), 842);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 479, to_date('08-06-2017', 'dd-mm-yyyy'), 983);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 38, to_date('12-04-2018', 'dd-mm-yyyy'), 880);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 863, to_date('25-08-2019', 'dd-mm-yyyy'), 880);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 71, to_date('10-01-2000', 'dd-mm-yyyy'), 393);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 921, to_date('13-05-2000', 'dd-mm-yyyy'), 333);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 221, to_date('25-11-2002', 'dd-mm-yyyy'), 983);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 457, to_date('20-06-2004', 'dd-mm-yyyy'), 393);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 358, to_date('13-12-2005', 'dd-mm-yyyy'), 685);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 181, to_date('05-04-2006', 'dd-mm-yyyy'), 191);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 192, to_date('16-10-2006', 'dd-mm-yyyy'), 191);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 943, to_date('05-11-2006', 'dd-mm-yyyy'), 333);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 962, to_date('07-10-2008', 'dd-mm-yyyy'), 506);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 245, to_date('16-10-2008', 'dd-mm-yyyy'), 176);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 36, to_date('03-02-2009', 'dd-mm-yyyy'), 880);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 143, to_date('11-01-2013', 'dd-mm-yyyy'), 895);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 822, to_date('05-04-2013', 'dd-mm-yyyy'), 191);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 228, to_date('24-05-2013', 'dd-mm-yyyy'), 297);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 671, to_date('16-06-2013', 'dd-mm-yyyy'), 699);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 556, to_date('16-08-2015', 'dd-mm-yyyy'), 685);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 652, to_date('30-01-2016', 'dd-mm-yyyy'), 842);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 927, to_date('21-04-2016', 'dd-mm-yyyy'), 699);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 56, to_date('08-07-2018', 'dd-mm-yyyy'), 685);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 735, to_date('07-11-2018', 'dd-mm-yyyy'), 506);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 637, to_date('12-12-2018', 'dd-mm-yyyy'), 699);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 317, to_date('06-04-2019', 'dd-mm-yyyy'), 983);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 759, to_date('07-04-2019', 'dd-mm-yyyy'), 895);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 572, to_date('26-05-2019', 'dd-mm-yyyy'), 333);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 775, to_date('06-09-2019', 'dd-mm-yyyy'), 699);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 33, to_date('17-07-2003', 'dd-mm-yyyy'), 191);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 763, to_date('17-07-2004', 'dd-mm-yyyy'), 176);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 196, to_date('11-04-2006', 'dd-mm-yyyy'), 685);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 635, to_date('14-10-2006', 'dd-mm-yyyy'), 983);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 744, to_date('24-10-2006', 'dd-mm-yyyy'), 880);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 299, to_date('22-07-2007', 'dd-mm-yyyy'), 393);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 158, to_date('06-03-2008', 'dd-mm-yyyy'), 895);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 984, to_date('01-08-2008', 'dd-mm-yyyy'), 895);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 370, to_date('24-11-2008', 'dd-mm-yyyy'), 191);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 864, to_date('14-12-2008', 'dd-mm-yyyy'), 506);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 793, to_date('05-09-2009', 'dd-mm-yyyy'), 297);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 713, to_date('15-09-2011', 'dd-mm-yyyy'), 333);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 695, to_date('17-01-2013', 'dd-mm-yyyy'), 297);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 53, to_date('28-02-2013', 'dd-mm-yyyy'), 983);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 519, to_date('21-05-2013', 'dd-mm-yyyy'), 685);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 838, to_date('24-06-2013', 'dd-mm-yyyy'), 895);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 562, to_date('28-09-2013', 'dd-mm-yyyy'), 333);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 260, to_date('17-04-2014', 'dd-mm-yyyy'), 333);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 281, to_date('14-11-2014', 'dd-mm-yyyy'), 297);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Gynecologist', 546, to_date('06-01-2016', 'dd-mm-yyyy'), 842);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Ophthalmologist', 524, to_date('24-05-2017', 'dd-mm-yyyy'), 176);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Orthodontic', 262, to_date('14-07-2017', 'dd-mm-yyyy'), 333);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('Occupational therapist', 691, to_date('26-04-2018', 'dd-mm-yyyy'), 297);
insert into LICENSING (licensetype, licenseid, releasedate, fieldid)
values ('family doctor', 210, to_date('14-06-2018', 'dd-mm-yyyy'), 506);
commit;
prompt 99 records loaded
prompt Loading DOCTOR...
insert into DOCTOR (specialization, licenseid, workerid)
values ('Critical care medicine', 638, 531238815);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Hospice and palliative care', 697, 648956315);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Pain medicine', 357, 71932811);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Pediatric anesthesiology', 706, 311466467);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Sleep medicine', 839, 214019947);
insert into DOCTOR (specialization, licenseid, workerid)
values (' Dermatopathology', 463, 655611592);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Pediatric dermatology', 474, 267895569);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Procedural dermatology', 727, 475822438);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Abdominal radiology', 732, 608832283);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Breast imaging', 140, 871947790);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Cardiothoracic radiology', 895, 156552498);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Cardiovascular radiology', 765, 154508569);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Chest radiology', 163, 918926951);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Emergency radiology', 362, 867688554);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Endovascular surgical neuroradiology', 346, 684228936);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Gastrointestinal radiology', 703, 518625103);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Genitourinary radiology', 108, 950758028);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Head and neck radiology', 717, 520553314);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Interventional radiology', 741, 505111071);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Musculoskeletal radiology', 716, 65914345);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Neuroradiology', 173, 102975751);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Nuclear radiology', 311, 97370635);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Pediatric radiology', 626, 157985841);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Radiation oncology', 860, 702948713);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Vascular and interventional radiology', 157, 167848962);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Critical care medicine', 701, 477713169);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Hospice and palliative care', 75, 475432614);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Pain medicine', 351, 978976997);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Pediatric anesthesiology', 97, 960371044);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Sleep medicine', 604, 125805491);
insert into DOCTOR (specialization, licenseid, workerid)
values (' Dermatopathology', 374, 882503173);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Pediatric dermatology', 130, 90523324);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Procedural dermatology', 738, 62842027);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Abdominal radiology', 12, 85099344);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Breast imaging', 603, 585949230);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Cardiothoracic radiology', 399, 663022089);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Cardiovascular radiology', 915, 138808687);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Chest radiology', 654, 115866959);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Emergency radiology', 316, 67162927);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Endovascular surgical neuroradiology', 365, 726182643);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Gastrointestinal radiology', 818, 867117574);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Genitourinary radiology', 124, 468320988);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Head and neck radiology', 29, 845532748);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Interventional radiology', 656, 979100171);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Musculoskeletal radiology', 764, 202306184);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Neuroradiology', 172, 660108450);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Nuclear radiology', 945, 481022444);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Pediatric radiology', 479, 41216358);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Radiation oncology', 38, 325294143);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Vascular and interventional radiology', 863, 803833678);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Critical care medicine', 71, 608473425);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Hospice and palliative care', 921, 109416098);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Pain medicine', 221, 881549786);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Pediatric anesthesiology', 457, 869554266);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Sleep medicine', 358, 325939163);
insert into DOCTOR (specialization, licenseid, workerid)
values (' Dermatopathology', 181, 599701445);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Pediatric dermatology', 192, 720256910);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Procedural dermatology', 943, 42734252);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Abdominal radiology', 962, 371691541);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Breast imaging', 245, 42464775);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Cardiothoracic radiology', 36, 212036071);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Cardiovascular radiology', 143, 558483801);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Chest radiology', 822, 833381050);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Emergency radiology', 228, 944474945);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Endovascular surgical neuroradiology', 671, 948300705);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Gastrointestinal radiology', 556, 572710466);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Genitourinary radiology', 652, 151713573);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Head and neck radiology', 927, 36653768);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Interventional radiology', 56, 609838404);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Musculoskeletal radiology', 735, 74246556);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Neuroradiology', 637, 69683187);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Nuclear radiology', 317, 772049123);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Pediatric radiology', 759, 9637682);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Radiation oncology', 572, 894659176);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Vascular and interventional radiology', 775, 694973824);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Critical care medicine', 33, 420691439);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Hospice and palliative care', 763, 93706212);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Pain medicine', 196, 227081707);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Pediatric anesthesiology', 635, 460241027);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Sleep medicine', 744, 670519313);
insert into DOCTOR (specialization, licenseid, workerid)
values (' Dermatopathology', 299, 135594200);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Pediatric dermatology', 158, 390209868);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Procedural dermatology', 984, 829823516);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Abdominal radiology', 370, 163199704);
insert into DOCTOR (specialization, licenseid, workerid)
values ('Breast imaging', 864, 47750333);
commit;
prompt 85 records loaded
prompt Loading HOSPITALIZEDAT...
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('31-01-2018', 'dd-mm-yyyy'), to_date('16-03-2018', 'dd-mm-yyyy'), 2294, 708262840, 224, 435);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('20-02-2018', 'dd-mm-yyyy'), to_date('19-04-2018', 'dd-mm-yyyy'), 2934, 189811489, 753, 861);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('08-03-2018', 'dd-mm-yyyy'), to_date('25-05-2018', 'dd-mm-yyyy'), 8390, 467351472, 621, 726);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('15-03-2018', 'dd-mm-yyyy'), to_date('29-05-2018', 'dd-mm-yyyy'), 1270, 152874477, 265, 758);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('20-03-2018', 'dd-mm-yyyy'), to_date('02-08-2018', 'dd-mm-yyyy'), 7727, 590564086, 540, 224);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('02-05-2018', 'dd-mm-yyyy'), to_date('09-10-2018', 'dd-mm-yyyy'), 2782, 945582077, 924, 42);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('31-05-2018', 'dd-mm-yyyy'), to_date('19-11-2018', 'dd-mm-yyyy'), 9621, 79504732, 598, 116);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('06-06-2018', 'dd-mm-yyyy'), to_date('29-12-2018', 'dd-mm-yyyy'), 6593, 780946586, 789, 431);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('18-10-2018', 'dd-mm-yyyy'), to_date('09-01-2019', 'dd-mm-yyyy'), 7588, 375972455, 993, 380);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('04-01-2019', 'dd-mm-yyyy'), to_date('04-02-2019', 'dd-mm-yyyy'), 427, 971633137, 97, 426);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('08-01-2019', 'dd-mm-yyyy'), to_date('06-03-2019', 'dd-mm-yyyy'), 6973, 202710130, 976, 546);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('09-01-2019', 'dd-mm-yyyy'), to_date('26-03-2019', 'dd-mm-yyyy'), 1484, 936814527, 399, 186);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('24-01-2019', 'dd-mm-yyyy'), to_date('01-05-2019', 'dd-mm-yyyy'), 5413, 618144212, 405, 632);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('28-04-2019', 'dd-mm-yyyy'), to_date('30-05-2019', 'dd-mm-yyyy'), 337, 330927664, 633, 789);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('25-06-2019', 'dd-mm-yyyy'), to_date('27-06-2019', 'dd-mm-yyyy'), 1125, 850965499, 450, 860);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('28-06-2019', 'dd-mm-yyyy'), to_date('05-07-2019', 'dd-mm-yyyy'), 8585, 121670810, 959, 74);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('05-07-2019', 'dd-mm-yyyy'), to_date('29-07-2019', 'dd-mm-yyyy'), 4001, 591829232, 336, 472);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('26-07-2019', 'dd-mm-yyyy'), to_date('05-08-2019', 'dd-mm-yyyy'), 5863, 523479830, 890, 514);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('01-09-2019', 'dd-mm-yyyy'), to_date('09-09-2019', 'dd-mm-yyyy'), 8289, 972999281, 777, 680);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('08-09-2019', 'dd-mm-yyyy'), to_date('18-09-2019', 'dd-mm-yyyy'), 9664, 869593414, 179, 213);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('15-09-2019', 'dd-mm-yyyy'), to_date('24-09-2019', 'dd-mm-yyyy'), 811, 364323076, 365, 51);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('24-09-2019', 'dd-mm-yyyy'), to_date('11-10-2019', 'dd-mm-yyyy'), 2335, 456295284, 600, 581);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('16-11-2019', 'dd-mm-yyyy'), to_date('17-11-2019', 'dd-mm-yyyy'), 5672, 486877093, 528, 78);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('10-12-2019', 'dd-mm-yyyy'), to_date('12-12-2019', 'dd-mm-yyyy'), 624, 850636732, 492, 895);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('13-12-2019', 'dd-mm-yyyy'), to_date('24-12-2019', 'dd-mm-yyyy'), 8047, 670150291, 220, 301);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('16-02-2018', 'dd-mm-yyyy'), to_date('11-03-2018', 'dd-mm-yyyy'), 56, 345108322, 33, 151);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('18-02-2018', 'dd-mm-yyyy'), to_date('22-03-2018', 'dd-mm-yyyy'), 5780, 49629406, 121, 170);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('11-05-2018', 'dd-mm-yyyy'), to_date('26-06-2018', 'dd-mm-yyyy'), 6729, 996662084, 22, 912);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('14-05-2018', 'dd-mm-yyyy'), to_date('03-07-2018', 'dd-mm-yyyy'), 8667, 482818846, 830, 501);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('28-05-2018', 'dd-mm-yyyy'), to_date('01-10-2018', 'dd-mm-yyyy'), 8555, 385892708, 413, 893);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('13-06-2018', 'dd-mm-yyyy'), to_date('14-10-2018', 'dd-mm-yyyy'), 652, 113899307, 425, 857);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('11-07-2018', 'dd-mm-yyyy'), to_date('06-11-2018', 'dd-mm-yyyy'), 7011, 19214993, 329, 443);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('02-09-2018', 'dd-mm-yyyy'), to_date('11-11-2018', 'dd-mm-yyyy'), 8172, 640808719, 556, 297);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('06-09-2018', 'dd-mm-yyyy'), to_date('21-11-2018', 'dd-mm-yyyy'), 9387, 464600526, 20, 566);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('14-09-2018', 'dd-mm-yyyy'), to_date('06-12-2018', 'dd-mm-yyyy'), 535, 191386480, 717, 164);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('27-11-2018', 'dd-mm-yyyy'), to_date('22-12-2018', 'dd-mm-yyyy'), 9959, 287878005, 853, 996);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('09-01-2019', 'dd-mm-yyyy'), to_date('15-01-2019', 'dd-mm-yyyy'), 4614, 754030724, 233, 652);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('27-01-2019', 'dd-mm-yyyy'), to_date('30-01-2019', 'dd-mm-yyyy'), 7154, 698473099, 734, 582);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('24-02-2019', 'dd-mm-yyyy'), to_date('26-02-2019', 'dd-mm-yyyy'), 4076, 111413768, 124, 564);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('17-03-2019', 'dd-mm-yyyy'), to_date('21-03-2019', 'dd-mm-yyyy'), 4499, 671660675, 245, 815);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('08-04-2019', 'dd-mm-yyyy'), to_date('10-04-2019', 'dd-mm-yyyy'), 268, 892580017, 803, 820);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('22-04-2019', 'dd-mm-yyyy'), to_date('26-06-2019', 'dd-mm-yyyy'), 4967, 903626083, 110, 157);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('01-05-2019', 'dd-mm-yyyy'), to_date('03-07-2019', 'dd-mm-yyyy'), 1621, 620937216, 631, 281);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('26-06-2019', 'dd-mm-yyyy'), to_date('23-07-2019', 'dd-mm-yyyy'), 6932, 908000615, 149, 420);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('09-07-2019', 'dd-mm-yyyy'), to_date('28-07-2019', 'dd-mm-yyyy'), 856, 724134639, 172, 408);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('07-08-2019', 'dd-mm-yyyy'), to_date('08-08-2019', 'dd-mm-yyyy'), 130, 985907107, 710, 279);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('05-09-2019', 'dd-mm-yyyy'), to_date('06-09-2019', 'dd-mm-yyyy'), 4828, 726919780, 185, 423);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('21-10-2019', 'dd-mm-yyyy'), to_date('18-11-2019', 'dd-mm-yyyy'), 3922, 412079807, 513, 573);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('19-11-2019', 'dd-mm-yyyy'), to_date('18-12-2019', 'dd-mm-yyyy'), 518, 709915279, 226, 292);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('20-12-2019', 'dd-mm-yyyy'), to_date('28-12-2019', 'dd-mm-yyyy'), 2833, 434940113, 478, 146);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('27-01-2018', 'dd-mm-yyyy'), to_date('03-03-2018', 'dd-mm-yyyy'), 49, 291741163, 958, 338);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('08-02-2018', 'dd-mm-yyyy'), to_date('29-03-2018', 'dd-mm-yyyy'), 9042, 426148194, 792, 364);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('20-02-2018', 'dd-mm-yyyy'), to_date('19-05-2018', 'dd-mm-yyyy'), 4428, 64526097, 419, 340);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('05-03-2018', 'dd-mm-yyyy'), to_date('04-07-2018', 'dd-mm-yyyy'), 2339, 603338542, 977, 180);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('11-05-2018', 'dd-mm-yyyy'), to_date('25-07-2018', 'dd-mm-yyyy'), 4141, 784600813, 688, 713);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('08-06-2018', 'dd-mm-yyyy'), to_date('27-07-2018', 'dd-mm-yyyy'), 7343, 70822249, 480, 809);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('04-08-2018', 'dd-mm-yyyy'), to_date('17-09-2018', 'dd-mm-yyyy'), 4420, 70831716, 741, 839);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('25-08-2018', 'dd-mm-yyyy'), to_date('26-09-2018', 'dd-mm-yyyy'), 5560, 751988735, 964, 656);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('04-09-2018', 'dd-mm-yyyy'), to_date('22-10-2018', 'dd-mm-yyyy'), 245, 365963339, 296, 834);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('18-09-2018', 'dd-mm-yyyy'), to_date('18-11-2018', 'dd-mm-yyyy'), 2896, 648911084, 951, 34);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('22-10-2018', 'dd-mm-yyyy'), to_date('24-11-2018', 'dd-mm-yyyy'), 7558, 185000152, 758, 616);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('20-12-2018', 'dd-mm-yyyy'), to_date('14-01-2019', 'dd-mm-yyyy'), 2777, 710935253, 820, 931);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('17-01-2019', 'dd-mm-yyyy'), to_date('28-01-2019', 'dd-mm-yyyy'), 8339, 293713935, 799, 503);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('12-02-2019', 'dd-mm-yyyy'), to_date('18-03-2019', 'dd-mm-yyyy'), 816, 63271602, 670, 748);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('04-03-2019', 'dd-mm-yyyy'), to_date('28-03-2019', 'dd-mm-yyyy'), 3100, 326413904, 321, 381);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('11-03-2019', 'dd-mm-yyyy'), to_date('16-04-2019', 'dd-mm-yyyy'), 5452, 360147273, 246, 352);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('06-05-2019', 'dd-mm-yyyy'), to_date('26-05-2019', 'dd-mm-yyyy'), 950, 792958079, 790, 25);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('06-07-2019', 'dd-mm-yyyy'), to_date('29-04-2019', 'dd-mm-yyyy'), 3510, 642196831, 684, 31);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('04-05-2019', 'dd-mm-yyyy'), to_date('28-08-2019', 'dd-mm-yyyy'), 9550, 187988627, 928, 200);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('24-06-2019', 'dd-mm-yyyy'), to_date('28-11-2019', 'dd-mm-yyyy'), 7662, 211681471, 846, 107);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('05-07-2019', 'dd-mm-yyyy'), to_date('02-12-2019', 'dd-mm-yyyy'), 4447, 503126262, 640, 601);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('17-10-2019', 'dd-mm-yyyy'), to_date('07-12-2019', 'dd-mm-yyyy'), 3351, 437511476, 251, 310);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('01-11-2019', 'dd-mm-yyyy'), to_date('15-12-2019', 'dd-mm-yyyy'), 5906, 991978392, 572, 526);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('22-11-2019', 'dd-mm-yyyy'), to_date('30-12-2019', 'dd-mm-yyyy'), 6445, 897773040, 926, 831);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('25-12-2019', 'dd-mm-yyyy'), to_date('06-01-2020', 'dd-mm-yyyy'), 5037, 206683768, 501, 121);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('08-02-2018', 'dd-mm-yyyy'), to_date('18-03-2018', 'dd-mm-yyyy'), 4083, 779945885, 953, 313);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('13-03-2018', 'dd-mm-yyyy'), to_date('21-03-2018', 'dd-mm-yyyy'), 9098, 726563582, 737, 339);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('05-04-2018', 'dd-mm-yyyy'), to_date('16-05-2018', 'dd-mm-yyyy'), 6404, 156171593, 608, 942);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('13-04-2018', 'dd-mm-yyyy'), to_date('02-06-2018', 'dd-mm-yyyy'), 8097, 171910180, 886, 363);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('22-04-2018', 'dd-mm-yyyy'), to_date('06-06-2018', 'dd-mm-yyyy'), 2702, 388283660, 749, 572);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('03-06-2018', 'dd-mm-yyyy'), to_date('18-06-2018', 'dd-mm-yyyy'), 6860, 18795929, 130, 111);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('24-06-2018', 'dd-mm-yyyy'), to_date('30-07-2018', 'dd-mm-yyyy'), 8846, 856592056, 155, 555);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('06-09-2018', 'dd-mm-yyyy'), to_date('07-09-2018', 'dd-mm-yyyy'), 5485, 173006051, 189, 714);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('22-10-2018', 'dd-mm-yyyy'), to_date('06-11-2018', 'dd-mm-yyyy'), 4129, 840454690, 16, 584);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('28-10-2018', 'dd-mm-yyyy'), to_date('28-10-2018', 'dd-mm-yyyy'), 1041, 677761715, 780, 854);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('23-11-2018', 'dd-mm-yyyy'), to_date('30-01-2019', 'dd-mm-yyyy'), 9236, 55937608, 731, 892);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('31-12-2018', 'dd-mm-yyyy'), to_date('04-02-2019', 'dd-mm-yyyy'), 753, 719978224, 880, 781);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('02-01-2019', 'dd-mm-yyyy'), to_date('17-08-2019', 'dd-mm-yyyy'), 6930, 834214215, 427, 309);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('14-01-2019', 'dd-mm-yyyy'), to_date('20-08-2019', 'dd-mm-yyyy'), 5905, 434932129, 763, 883);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('06-02-2019', 'dd-mm-yyyy'), to_date('23-08-2019', 'dd-mm-yyyy'), 1999, 988386543, 549, 319);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('06-03-2019', 'dd-mm-yyyy'), to_date('24-08-2019', 'dd-mm-yyyy'), 4618, 129407872, 29, 174);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('11-03-2019', 'dd-mm-yyyy'), to_date('18-09-2019', 'dd-mm-yyyy'), 7091, 452323355, 75, 427);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('12-05-2019', 'dd-mm-yyyy'), to_date('19-09-2019', 'dd-mm-yyyy'), 447, 742852779, 503, 455);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('27-07-2019', 'dd-mm-yyyy'), to_date('26-09-2019', 'dd-mm-yyyy'), 9505, 592650513, 491, 331);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('06-08-2019', 'dd-mm-yyyy'), to_date('19-10-2019', 'dd-mm-yyyy'), 320, 448291127, 712, 589);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('29-08-2019', 'dd-mm-yyyy'), to_date('28-10-2019', 'dd-mm-yyyy'), 3238, 18645918, 93, 759);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('30-08-2019', 'dd-mm-yyyy'), to_date('21-01-2020', 'dd-mm-yyyy'), 985, 653961350, 682, 865);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('16-09-2019', 'dd-mm-yyyy'), to_date('04-02-2020', 'dd-mm-yyyy'), 5902, 64729682, 279, 648);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('12-10-2019', 'dd-mm-yyyy'), to_date('16-02-2020', 'dd-mm-yyyy'), 4039, 955095939, 203, 547);
insert into HOSPITALIZEDAT (startdate, enddate, bednumber, citizenid, depid, healtinstid)
values (to_date('31-12-2019', 'dd-mm-yyyy'), to_date('23-02-2020', 'dd-mm-yyyy'), 2041, 685600354, 735, 360);
commit;
prompt 100 records loaded
prompt Loading MEDICALEQUIPMANT...
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Gauze', '471', 7232, 716, 435);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('oxygen tanks', '113', 7473, 838, 861);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Kidney machines', '686', 7208, 473, 726);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Breast pumps', '710', 6435, 306, 758);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('drapes', '129', 1679, 847, 224);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('LASIK Surgical Machines', '623', 9511, 356, 42);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Electrolyte analyzers', '856', 8656, 496, 116);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('LASIK Surgical Machines', '126', 6964, 767, 431);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Wheelchairs', '408', 3455, 530, 380);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Medical Ventilators', '497', 2696, 642, 426);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Hematology analyzers', '541', 483, 471, 546);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Breast pumps', '546', 5539, 218, 186);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Surgical caps', '362', 7070, 591, 632);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Gauze', '253', 1957, 526, 789);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('blankets', '352', 8794, 406, 860);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Electrolyte analyzers', '738', 3604, 81, 74);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Microbiological systems', '019', 8083, 67, 472);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Differential counters', '271', 8215, 981, 514);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Drug testing analyzers', '033', 6310, 686, 680);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Differential counters', '830', 5331, 87, 213);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Patient Lifts', '709', 4128, 531, 51);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Diagnostic scopes', '365', 4307, 184, 581);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Insulin pumps', '847', 2030, 619, 78);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('oxygen tanks', '605', 6776, 332, 895);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('LASIK Surgical Machines', '613', 6336, 26, 301);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('gloves', '620', 372, 114, 151);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Heart-lung Machines', '539', 4598, 512, 170);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Nebulizers', '106', 4108, 433, 912);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Blood collection supplies', '027', 2890, 660, 501);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Blood collection supplies', '702', 1786, 667, 893);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('crutches', '239', 793, 460, 857);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Dialysis Machine', '125', 38, 895, 443);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Medical Ventilators', '112', 8284, 368, 297);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Blood gas analyzers', '054', 4107, 74, 566);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Insulin pumps', '164', 8918, 738, 164);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Kidney machines', '534', 8119, 88, 996);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Wheelchairs', '316', 4127, 866, 652);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Kidney machines', '708', 6140, 205, 582);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Pressure mattresses', '043', 8469, 157, 564);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('drapes', '357', 761, 932, 815);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Surgical caps', '755', 1395, 779, 820);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Traction equipment', '159', 5909, 766, 157);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Dialysis Machine', '636', 7281, 366, 281);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Infusion Pumps ', '093', 1271, 592, 420);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Nebulizers', '866', 9679, 438, 408);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Insulin pumps', '603', 3895, 393, 279);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Breast pumps', '723', 9606, 760, 423);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Surgical caps', '416', 9240, 791, 573);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Walkers', '014', 7206, 875, 292);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Diagnostic scopes', '221', 8322, 223, 146);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('gloves', '157', 8675, 338, 338);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Bili lights', '170', 6366, 219, 364);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Medical Lasers', '489', 8477, 994, 340);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Oxygen Concentrators Ventilators', '515', 1967, 289, 180);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Hematology analyzers', '201', 9511, 873, 713);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Diagnostic scopes', '444', 1640, 107, 809);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('LASIK Surgical Machines', '464', 8579, 651, 839);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('glasses', '007', 9804, 197, 656);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('blankets', '921', 5155, 388, 834);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Medical Lasers', '430', 9900, 781, 34);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('crutches', '775', 6247, 161, 616);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('canes', '418', 4917, 458, 931);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Oxygen Concentrators Ventilators', '404', 3586, 476, 503);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('gowns', '325', 5179, 652, 748);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Gauze', '806', 7390, 337, 381);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Breast pumps', '896', 5143, 547, 352);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Nebulizers', '783', 1163, 546, 25);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Diagnostic scopes', '629', 2140, 747, 31);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Surgical caps', '143', 7738, 967, 200);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Patient Lifts', '626', 114, 415, 107);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Coagulation analyzers', '305', 7735, 561, 601);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Oxygen Concentrators Ventilators', '979', 3274, 479, 310);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Oxygen Concentrators Ventilators', '342', 7130, 736, 526);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Hematology analyzers', '284', 1038, 343, 831);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('gloves', '768', 101, 882, 121);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Infusion Pumps ', '506', 8872, 198, 313);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Differential counters', '396', 4911, 641, 339);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Microbiological systems', '367', 4077, 713, 942);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Urinalysis analyzers', '722', 4047, 353, 363);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Medical Ventilators', '669', 6023, 797, 572);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Nebulizers', '084', 9385, 645, 111);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Electrolyte analyzers', '415', 9809, 811, 555);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Incubators ', '417', 4973, 548, 714);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('glasses', '812', 8928, 0, 584);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Urinalysis analyzers', '614', 8508, 472, 854);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('drapes', '479', 2305, 325, 892);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Dialysis Machine', '973', 6939, 457, 781);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('gowns', '293', 263, 522, 309);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Drug testing analyzers', '618', 2313, 828, 883);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('oxygen tanks', '714', 7268, 922, 319);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Bili lights', '916', 6569, 756, 174);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Infusion Pumps ', '580', 719, 2, 427);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Blood gas analyzers', '968', 1104, 224, 435);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Wheelchairs', '500', 2517, 753, 861);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('oxygen tanks', '275', 1891, 621, 726);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Medical Lasers', '595', 1154, 265, 758);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Breast pumps', '773', 2019, 540, 224);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('blankets', '220', 6624, 924, 42);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Electrolyte analyzers', '989', 8683, 598, 116);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('blankets', '707', 1938, 789, 431);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Nebulizers', '503', 4659, 993, 380);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Diagnostic scopes', '195', 3501, 97, 426);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Traction equipment', '022', 9420, 976, 546);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Traction equipment', '394', 3932, 399, 186);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Hematology analyzers', '315', 8200, 405, 632);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('canes', '237', 9919, 633, 789);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Bili lights', '778', 2492, 450, 860);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Traction equipment', '763', 6574, 959, 74);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('oxygen tanks', '469', 4102, 336, 472);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Oxygen Concentrators Ventilators', '360', 7318, 890, 514);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Insulin pumps', '548', 4866, 777, 680);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Wheelchairs', '258', 7536, 179, 213);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Wheelchairs', '065', 8567, 365, 51);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('canes', '197', 3298, 600, 581);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Blood gas analyzers', '557', 3499, 528, 78);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Coagulation analyzers', '490', 1559, 492, 895);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Kidney machines', '426', 9583, 220, 301);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Hospital beds', '544', 183, 33, 151);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('glasses', '298', 8032, 121, 170);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Coagulation analyzers', '012', 5015, 22, 912);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Traction equipment', '726', 7150, 830, 501);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('canes', '104', 9030, 413, 893);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('oxygen tanks', '292', 626, 425, 857);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Chemistry analyzers', '584', 1638, 329, 443);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Diagnostic scopes', '895', 7118, 556, 297);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Coagulation analyzers', '745', 8893, 20, 566);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Chemistry analyzers', '368', 6808, 717, 164);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Heart-lung Machines', '943', 6673, 853, 996);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Urinalysis analyzers', '375', 5897, 233, 652);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Blood collection supplies', '655', 9754, 734, 582);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Differential counters', '341', 4392, 124, 564);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Differential counters', '137', 2397, 245, 815);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Heart-lung Machines', '972', 4864, 803, 820);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Infusion Pumps ', '493', 2308, 110, 157);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Microbiological systems', '499', 661, 631, 281);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Patient Lifts', '668', 717, 149, 420);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Dialysis Machine', '199', 3569, 172, 408);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Wheelchairs', '240', 8916, 710, 279);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Dialysis Machine', '779', 7635, 185, 423);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Hospital beds', '860', 2851, 513, 573);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Medical Ventilators', '721', 5694, 226, 292);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Microbiological systems', '428', 5946, 478, 146);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('gloves', '990', 1577, 958, 338);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Infusion Pumps ', '591', 3123, 792, 364);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Nebulizers', '967', 4297, 419, 340);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('LASIK Surgical Machines', '592', 136, 977, 180);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Medical Lasers', '389', 5055, 688, 713);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Kidney machines', '486', 5279, 480, 809);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Coagulation analyzers', '762', 935, 741, 839);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Infusion Pumps ', '701', 9709, 964, 656);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Breast pumps', '677', 9071, 296, 834);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Hospital beds', '023', 5387, 951, 34);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('LASIK Surgical Machines', '945', 3824, 758, 616);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Medical Ventilators', '926', 7572, 820, 931);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('crutches', '138', 9216, 799, 503);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('gowns', '252', 2544, 670, 748);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Hospital beds', '256', 2908, 321, 381);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Diagnostic scopes', '561', 5107, 246, 352);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Walkers', '183', 518, 790, 25);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('canes', '633', 7579, 684, 31);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Wheelchairs', '139', 3525, 928, 200);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('glasses', '420', 1950, 846, 107);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Patient Lifts', '236', 5722, 640, 601);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Gauze', '123', 8721, 251, 310);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('drapes', '961', 6203, 572, 526);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Walkers', '062', 1957, 926, 831);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Bili lights', '724', 4813, 501, 121);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Oxygen Concentrators Ventilators', '678', 5360, 953, 313);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Hospital beds', '587', 3693, 737, 339);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Drug testing analyzers', '323', 7007, 608, 942);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('blankets', '638', 1943, 886, 363);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Breast pumps', '794', 7724, 749, 572);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Bili lights', '925', 6856, 130, 111);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Patient Lifts', '716', 2781, 155, 555);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Wheelchairs', '833', 7817, 189, 714);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Walkers', '845', 7029, 16, 584);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Differential counters', '402', 7445, 780, 854);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Insulin pumps', '309', 3571, 731, 892);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('LASIK Surgical Machines', '268', 1717, 880, 781);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Walkers', '434', 4235, 427, 309);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Chemistry analyzers', '410', 3584, 763, 883);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Nebulizers', '537', 1230, 549, 319);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Bili lights', '446', 719, 29, 174);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Hospital beds', '216', 7843, 75, 427);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('canes', '467', 5947, 503, 455);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('oxygen tanks', '956', 1395, 491, 331);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('crutches', '651', 8666, 712, 589);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Hematology analyzers', '889', 8552, 93, 759);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Pressure mattresses', '303', 4846, 682, 865);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Blood collection supplies', '150', 5202, 279, 648);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Gauze', '977', 5862, 203, 547);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Blood gas analyzers', '264', 7033, 735, 360);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Hematology analyzers', '370', 3724, 371, 861);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Drug testing analyzers', '901', 1592, 173, 726);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Blood collection supplies', '454', 970, 102, 758);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Pressure mattresses', '297', 7755, 392, 224);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('gowns', '483', 5654, 344, 42);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Walkers', '136', 9846, 28, 116);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Medical Lasers', '260', 3550, 395, 431);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Medical Lasers', '468', 5058, 674, 380);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Chemistry analyzers', '163', 5574, 383, 426);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('blankets', '296', 5594, 677, 546);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Hospital beds', '203', 6305, 840, 186);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('crutches', '405', 1504, 123, 632);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Insulin pumps', '090', 1357, 280, 789);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Heart-lung Machines', '559', 1621, 584, 860);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Heart-lung Machines', '037', 623, 495, 74);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Patient Lifts', '168', 5918, 76, 472);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Diagnostic scopes', '134', 3932, 122, 514);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('LASIK Surgical Machines', '100', 406, 283, 680);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Infusion Pumps ', '994', 9617, 949, 213);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Urinalysis analyzers', '869', 8836, 764, 51);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('drapes', '121', 1573, 225, 581);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Dialysis Machine', '625', 4838, 580, 78);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('glasses', '288', 4281, 300, 895);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Patient Lifts', '593', 4136, 511, 301);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Drug testing analyzers', '346', 7747, 762, 151);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Pressure mattresses', '647', 1312, 443, 170);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('crutches', '573', 2099, 940, 912);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Drug testing analyzers', '034', 8561, 378, 501);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Breast pumps', '158', 4280, 664, 893);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Blood gas analyzers', '774', 6150, 12, 857);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Incubators ', '995', 5128, 562, 443);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Traction equipment', '453', 5002, 459, 297);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Heart-lung Machines', '637', 781, 15, 566);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Incubators ', '495', 1619, 524, 164);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Walkers', '648', 1963, 852, 996);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Patient Lifts', '504', 7540, 941, 652);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Breast pumps', '526', 2100, 382, 582);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Nebulizers', '171', 7285, 627, 564);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Wheelchairs', '205', 3239, 390, 815);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Kidney machines', '175', 7943, 193, 820);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Microbiological systems', '524', 6335, 826, 157);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Incubators ', '645', 5229, 855, 281);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Microbiological systems', '462', 3884, 778, 420);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Insulin pumps', '069', 3058, 815, 408);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Pressure mattresses', '451', 9954, 60, 279);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('oxygen tanks', '776', 2309, 84, 423);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Oxygen Concentrators Ventilators', '914', 6469, 341, 573);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Urinalysis analyzers', '887', 633, 725, 292);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Diagnostic scopes', '532', 1150, 730, 146);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('gloves', '011', 7888, 287, 338);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Blood gas analyzers', '861', 8008, 837, 364);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Surgical caps', '211', 7556, 345, 340);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Walkers', '397', 3056, 625, 180);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Infusion Pumps ', '938', 3761, 646, 713);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Bili lights', '652', 1627, 933, 809);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Pressure mattresses', '717', 20, 164, 839);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('crutches', '619', 3660, 217, 656);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Pressure mattresses', '913', 7573, 678, 834);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Bili lights', '611', 9051, 41, 34);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Incubators ', '578', 4142, 152, 616);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Insulin pumps', '498', 1521, 444, 931);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Coagulation analyzers', '760', 7168, 65, 503);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Kidney machines', '048', 7098, 516, 748);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Hospital beds', '289', 4158, 860, 455);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('canes', '110', 1306, 806, 331);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Traction equipment', '474', 527, 952, 589);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Patient Lifts', '147', 3602, 517, 759);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('drapes', '338', 1839, 918, 865);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('blankets', '492', 5541, 103, 648);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Pressure mattresses', '317', 6171, 191, 547);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Gauze', '178', 2426, 32, 360);
insert into MEDICALEQUIPMANT (equiptype, medequipid, quantity, depid, healtinstid)
values ('Infusion Pumps ', '141', 2885, 68, 435);
commit;
prompt 264 records loaded
prompt Loading SCHEDULE...
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('02-01-2020 04:39:47', 'dd-mm-yyyy hh24:mi:ss'), 742868808, 618144212);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('08-01-2020 15:56:26', 'dd-mm-yyyy hh24:mi:ss'), 413518592, 55937608);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('12-01-2020 18:58:45', 'dd-mm-yyyy hh24:mi:ss'), 797503856, 121670810);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('14-01-2020 09:14:49', 'dd-mm-yyyy hh24:mi:ss'), 744958679, 709915279);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('16-01-2020 03:28:04', 'dd-mm-yyyy hh24:mi:ss'), 230298738, 49629406);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('18-01-2020 15:22:53', 'dd-mm-yyyy hh24:mi:ss'), 89160074, 434940113);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('20-01-2020 09:18:00', 'dd-mm-yyyy hh24:mi:ss'), 462438254, 79504732);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('28-01-2020 10:30:51', 'dd-mm-yyyy hh24:mi:ss'), 675975458, 784600813);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('01-02-2020 04:09:50', 'dd-mm-yyyy hh24:mi:ss'), 358888404, 365963339);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('02-02-2020 00:30:31', 'dd-mm-yyyy hh24:mi:ss'), 377845907, 189811489);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('02-02-2020 13:22:48', 'dd-mm-yyyy hh24:mi:ss'), 97748603, 156171593);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('05-02-2020 08:41:16', 'dd-mm-yyyy hh24:mi:ss'), 50870763, 129407872);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('07-02-2020 03:22:53', 'dd-mm-yyyy hh24:mi:ss'), 775027789, 64526097);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('12-02-2020 12:26:47', 'dd-mm-yyyy hh24:mi:ss'), 640330926, 426148194);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('22-02-2020 05:33:38', 'dd-mm-yyyy hh24:mi:ss'), 48780608, 426148194);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('25-02-2020 06:15:41', 'dd-mm-yyyy hh24:mi:ss'), 231962714, 79504732);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('03-03-2020 08:06:25', 'dd-mm-yyyy hh24:mi:ss'), 340526675, 591829232);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('05-03-2020 13:40:48', 'dd-mm-yyyy hh24:mi:ss'), 216673752, 603338542);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('09-03-2020 22:42:14', 'dd-mm-yyyy hh24:mi:ss'), 640574572, 779945885);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('21-03-2020 06:58:36', 'dd-mm-yyyy hh24:mi:ss'), 412908680, 897773040);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('23-03-2020 15:02:18', 'dd-mm-yyyy hh24:mi:ss'), 999775205, 710935253);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('24-03-2020 08:27:10', 'dd-mm-yyyy hh24:mi:ss'), 889893500, 173006051);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('24-03-2020 20:17:57', 'dd-mm-yyyy hh24:mi:ss'), 48780608, 996662084);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('02-04-2020 08:24:34', 'dd-mm-yyyy hh24:mi:ss'), 50870763, 330927664);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('02-04-2020 09:54:51', 'dd-mm-yyyy hh24:mi:ss'), 315265026, 670150291);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('07-04-2020 20:28:27', 'dd-mm-yyyy hh24:mi:ss'), 132751178, 955095939);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('08-04-2020 08:14:47', 'dd-mm-yyyy hh24:mi:ss'), 552470268, 840454690);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('08-04-2020 22:18:28', 'dd-mm-yyyy hh24:mi:ss'), 352326915, 892580017);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('12-04-2020 10:16:45', 'dd-mm-yyyy hh24:mi:ss'), 89541503, 55937608);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('17-04-2020 02:51:21', 'dd-mm-yyyy hh24:mi:ss'), 62588564, 792958079);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('23-04-2020 18:22:45', 'dd-mm-yyyy hh24:mi:ss'), 953496147, 724134639);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('25-04-2020 12:59:45', 'dd-mm-yyyy hh24:mi:ss'), 742868808, 79504732);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('27-04-2020 06:15:59', 'dd-mm-yyyy hh24:mi:ss'), 640330926, 742852779);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('28-04-2020 19:11:25', 'dd-mm-yyyy hh24:mi:ss'), 710604897, 640808719);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('07-05-2020 10:09:41', 'dd-mm-yyyy hh24:mi:ss'), 970992503, 434940113);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('07-05-2020 19:59:22', 'dd-mm-yyyy hh24:mi:ss'), 470721569, 850636732);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('11-05-2020 23:30:20', 'dd-mm-yyyy hh24:mi:ss'), 89541503, 670150291);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('18-05-2020 00:48:23', 'dd-mm-yyyy hh24:mi:ss'), 479478250, 724134639);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('18-05-2020 05:00:05', 'dd-mm-yyyy hh24:mi:ss'), 50870763, 936814527);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('18-05-2020 08:28:27', 'dd-mm-yyyy hh24:mi:ss'), 83705991, 620937216);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('18-05-2020 14:13:12', 'dd-mm-yyyy hh24:mi:ss'), 632486887, 996662084);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('29-05-2020 04:54:02', 'dd-mm-yyyy hh24:mi:ss'), 744958679, 360147273);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('11-06-2020 12:34:24', 'dd-mm-yyyy hh24:mi:ss'), 657042160, 79504732);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('16-06-2020 11:32:12', 'dd-mm-yyyy hh24:mi:ss'), 413518592, 452323355);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('20-06-2020 00:30:23', 'dd-mm-yyyy hh24:mi:ss'), 775027789, 388283660);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('22-06-2020 03:54:00', 'dd-mm-yyyy hh24:mi:ss'), 744958679, 751988735);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('28-06-2020 13:30:34', 'dd-mm-yyyy hh24:mi:ss'), 50870763, 719978224);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('01-07-2020 00:40:45', 'dd-mm-yyyy hh24:mi:ss'), 177769483, 152874477);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('05-07-2020 16:32:44', 'dd-mm-yyyy hh24:mi:ss'), 278216922, 792958079);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('15-07-2020 23:19:40', 'dd-mm-yyyy hh24:mi:ss'), 602574296, 834214215);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('19-07-2020 22:04:30', 'dd-mm-yyyy hh24:mi:ss'), 224334980, 642196831);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('20-07-2020 01:01:20', 'dd-mm-yyyy hh24:mi:ss'), 953496147, 784600813);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('26-07-2020 09:11:57', 'dd-mm-yyyy hh24:mi:ss'), 566015263, 708262840);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('05-08-2020 02:45:36', 'dd-mm-yyyy hh24:mi:ss'), 688678649, 364323076);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('11-08-2020 04:03:47', 'dd-mm-yyyy hh24:mi:ss'), 352326915, 434940113);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('13-08-2020 16:09:59', 'dd-mm-yyyy hh24:mi:ss'), 380575697, 592650513);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('15-08-2020 02:49:20', 'dd-mm-yyyy hh24:mi:ss'), 536047901, 936814527);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('16-08-2020 03:11:57', 'dd-mm-yyyy hh24:mi:ss'), 216673752, 869593414);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('17-08-2020 11:19:40', 'dd-mm-yyyy hh24:mi:ss'), 640330926, 156171593);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('19-08-2020 03:10:22', 'dd-mm-yyyy hh24:mi:ss'), 632486887, 640808719);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('24-08-2020 22:06:31', 'dd-mm-yyyy hh24:mi:ss'), 657042160, 211681471);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('26-08-2020 18:28:39', 'dd-mm-yyyy hh24:mi:ss'), 219641402, 191386480);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('28-08-2020 08:16:56', 'dd-mm-yyyy hh24:mi:ss'), 58713028, 726919780);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('03-09-2020 09:24:46', 'dd-mm-yyyy hh24:mi:ss'), 62588564, 784600813);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('08-09-2020 09:51:33', 'dd-mm-yyyy hh24:mi:ss'), 424689583, 482818846);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('11-09-2020 05:56:06', 'dd-mm-yyyy hh24:mi:ss'), 230298738, 360147273);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('13-09-2020 03:29:31', 'dd-mm-yyyy hh24:mi:ss'), 675975458, 467351472);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('23-09-2020 02:18:05', 'dd-mm-yyyy hh24:mi:ss'), 352326915, 360147273);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('28-09-2020 08:10:53', 'dd-mm-yyyy hh24:mi:ss'), 889893500, 640808719);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('29-09-2020 10:36:20', 'dd-mm-yyyy hh24:mi:ss'), 340526675, 202710130);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('05-10-2020 00:47:05', 'dd-mm-yyyy hh24:mi:ss'), 230298738, 908000615);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('06-10-2020 13:05:48', 'dd-mm-yyyy hh24:mi:ss'), 710604897, 945582077);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('14-10-2020 20:20:32', 'dd-mm-yyyy hh24:mi:ss'), 424689583, 202710130);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('17-10-2020 15:53:51', 'dd-mm-yyyy hh24:mi:ss'), 986515397, 742852779);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('17-10-2020 23:13:12', 'dd-mm-yyyy hh24:mi:ss'), 769944696, 426148194);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('19-10-2020 18:21:27', 'dd-mm-yyyy hh24:mi:ss'), 865215977, 670150291);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('26-10-2020 23:41:34', 'dd-mm-yyyy hh24:mi:ss'), 901257019, 486877093);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('31-10-2020 16:13:35', 'dd-mm-yyyy hh24:mi:ss'), 985608353, 640808719);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('03-11-2020 15:55:52', 'dd-mm-yyyy hh24:mi:ss'), 242059824, 437511476);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('04-11-2020 08:59:34', 'dd-mm-yyyy hh24:mi:ss'), 769944696, 364323076);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('10-11-2020 22:25:49', 'dd-mm-yyyy hh24:mi:ss'), 198620173, 618144212);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('14-11-2020 02:07:43', 'dd-mm-yyyy hh24:mi:ss'), 701642916, 191386480);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('15-11-2020 16:27:33', 'dd-mm-yyyy hh24:mi:ss'), 744958679, 503126262);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('23-11-2020 08:28:10', 'dd-mm-yyyy hh24:mi:ss'), 37773505, 620937216);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('25-11-2020 19:24:31', 'dd-mm-yyyy hh24:mi:ss'), 219641402, 792958079);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('29-11-2020 20:37:58', 'dd-mm-yyyy hh24:mi:ss'), 283304585, 365963339);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('02-12-2020 11:19:32', 'dd-mm-yyyy hh24:mi:ss'), 657042160, 293713935);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('08-12-2020 08:59:25', 'dd-mm-yyyy hh24:mi:ss'), 377845907, 330927664);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('09-12-2020 16:58:13', 'dd-mm-yyyy hh24:mi:ss'), 219641402, 869593414);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('13-12-2020 01:04:39', 'dd-mm-yyyy hh24:mi:ss'), 398251227, 754030724);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('16-12-2020 15:08:03', 'dd-mm-yyyy hh24:mi:ss'), 675975458, 202710130);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('19-12-2020 22:45:33', 'dd-mm-yyyy hh24:mi:ss'), 701642916, 293713935);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('21-12-2020 20:25:26', 'dd-mm-yyyy hh24:mi:ss'), 56423791, 671660675);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('22-12-2020 16:29:34', 'dd-mm-yyyy hh24:mi:ss'), 889893500, 191386480);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('23-12-2020 00:55:00', 'dd-mm-yyyy hh24:mi:ss'), 714723836, 972999281);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('23-12-2020 09:47:05', 'dd-mm-yyyy hh24:mi:ss'), 468433995, 187988627);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('23-12-2020 21:58:19', 'dd-mm-yyyy hh24:mi:ss'), 826448233, 908000615);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('26-12-2020 19:36:37', 'dd-mm-yyyy hh24:mi:ss'), 132751178, 156171593);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('29-12-2020 04:59:57', 'dd-mm-yyyy hh24:mi:ss'), 520881414, 173006051);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('31-12-2020 12:42:54', 'dd-mm-yyyy hh24:mi:ss'), 163989772, 152874477);
commit;
prompt 100 records loaded
prompt Loading TREATED_BY...
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('02-01-2019', 'dd-mm-yyyy'), 'surgery', '12:05', 708262840, 531238815);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('03-01-2019', 'dd-mm-yyyy'), 'checkup', '12:10', 189811489, 648956315);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('04-01-2019', 'dd-mm-yyyy'), 'Diaphragm pacing', '12:15', 467351472, 71932811);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('05-01-2019', 'dd-mm-yyyy'), 'Clinical uses of mesenchymal stem cells', '12:20', 152874477, 311466467);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('06-01-2019', 'dd-mm-yyyy'), 'Hydrogogue', '12:25', 590564086, 214019947);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('07-01-2019', 'dd-mm-yyyy'), 'Protein replacement therapy', '12:30', 945582077, 655611592);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('08-01-2019', 'dd-mm-yyyy'), 'Apheresis', '12:35', 79504732, 267895569);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('09-01-2019', 'dd-mm-yyyy'), 'NDR Method', '12:40', 780946586, 475822438);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('10-01-2019', 'dd-mm-yyyy'), 'Management of scoliosis', '12:45', 375972455, 608832283);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('11-01-2019', 'dd-mm-yyyy'), 'Dopamine therapy', '12:50', 971633137, 871947790);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('12-01-2019', 'dd-mm-yyyy'), 'Self-administration', '12:55', 202710130, 156552498);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('13-01-2019', 'dd-mm-yyyy'), 'Mydicar', '13:00', 936814527, 154508569);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('14-01-2019', 'dd-mm-yyyy'), 'Treatment of human lice', '13:05', 618144212, 918926951);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('15-01-2019', 'dd-mm-yyyy'), 'Hyperbaric treatment schedules', '13:10', 330927664, 867688554);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('16-01-2019', 'dd-mm-yyyy'), 'Hyperbaric medicine', '13:15', 850965499, 684228936);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('17-01-2019', 'dd-mm-yyyy'), 'Graded exercise therapy', '13:20', 121670810, 518625103);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('18-01-2019', 'dd-mm-yyyy'), 'Tracheal intubation', '13:25', 591829232, 950758028);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('19-01-2019', 'dd-mm-yyyy'), 'Megavitamin therapy', '13:30', 523479830, 520553314);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('20-01-2019', 'dd-mm-yyyy'), 'Smile surgery', '13:35', 972999281, 505111071);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('21-01-2019', 'dd-mm-yyyy'), 'Procaine blockade', '13:40', 869593414, 65914345);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('22-01-2019', 'dd-mm-yyyy'), 'Cyanoacrylate', '13:45', 364323076, 102975751);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('23-01-2019', 'dd-mm-yyyy'), 'Pneumotherapy', '13:50', 456295284, 97370635);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('24-01-2019', 'dd-mm-yyyy'), 'Oral pressure therapy', '13:55', 486877093, 157985841);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('25-01-2019', 'dd-mm-yyyy'), 'Targeted temperature management', '14:00', 850636732, 702948713);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('26-01-2019', 'dd-mm-yyyy'), 'Magnesium and depression', '14:05', 670150291, 167848962);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('27-01-2019', 'dd-mm-yyyy'), 'Electrical muscle stimulation', '14:10', 345108322, 477713169);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('28-01-2019', 'dd-mm-yyyy'), 'Antiseptic lavage', '14:15', 49629406, 475432614);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('29-01-2019', 'dd-mm-yyyy'), 'Culdoscopy', '14:20', 996662084, 978976997);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('30-01-2019', 'dd-mm-yyyy'), 'Strimvelis', '14:25', 482818846, 960371044);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('31-01-2019', 'dd-mm-yyyy'), 'Pumpable ice technology', '14:30', 385892708, 125805491);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('01-02-2019', 'dd-mm-yyyy'), 'Chemoprophylaxis', '14:35', 113899307, 882503173);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('02-02-2019', 'dd-mm-yyyy'), 'Fluid replacement', '14:40', 19214993, 90523324);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('03-02-2019', 'dd-mm-yyyy'), 'Bloodletting', '14:45', 640808719, 62842027);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('04-02-2019', 'dd-mm-yyyy'), 'Outpatient parenteral antibiotic therapy', '14:50', 464600526, 85099344);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('05-02-2019', 'dd-mm-yyyy'), 'User:Suchexams/sandbox', '14:55', 191386480, 585949230);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('06-02-2019', 'dd-mm-yyyy'), 'Bone cement', '15:00', 287878005, 663022089);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('07-02-2019', 'dd-mm-yyyy'), 'EBOO', '15:05', 754030724, 138808687);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('08-02-2019', 'dd-mm-yyyy'), 'Bathroom privileges', '15:10', 698473099, 115866959);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('02-01-2019', 'dd-mm-yyyy'), 'Ice pack', '15:15', 111413768, 67162927);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('03-01-2019', 'dd-mm-yyyy'), 'Urinary catheterization', '15:20', 671660675, 726182643);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('04-01-2019', 'dd-mm-yyyy'), 'High-dose estrogen', '15:25', 892580017, 867117574);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('05-01-2019', 'dd-mm-yyyy'), 'Age management medicine', '15:30', 903626083, 468320988);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('06-01-2019', 'dd-mm-yyyy'), 'Drug of last resort', '15:35', 620937216, 845532748);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('07-01-2019', 'dd-mm-yyyy'), 'Prostate steam treatment', '15:40', 908000615, 979100171);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('08-01-2019', 'dd-mm-yyyy'), 'Enzyme replacement therapy', '15:45', 724134639, 202306184);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('09-01-2019', 'dd-mm-yyyy'), 'Laparoscopy', '15:50', 985907107, 660108450);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('10-01-2019', 'dd-mm-yyyy'), 'Tobacco smoke enema', '15:55', 726919780, 481022444);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('11-01-2019', 'dd-mm-yyyy'), 'Immunosuppression', '16:00', 412079807, 41216358);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('12-01-2019', 'dd-mm-yyyy'), 'Pre-exposure prophylaxis', '16:05', 709915279, 325294143);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('13-01-2019', 'dd-mm-yyyy'), 'Transoral robotic surgery', '16:10', 434940113, 803833678);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('14-01-2019', 'dd-mm-yyyy'), 'Immunoglobulin therapy', '16:15', 291741163, 608473425);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('15-01-2019', 'dd-mm-yyyy'), 'Intravitreal administration', '16:20', 426148194, 109416098);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('16-01-2019', 'dd-mm-yyyy'), 'Chronotherapy (sleep phase)', '16:25', 64526097, 881549786);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('17-01-2019', 'dd-mm-yyyy'), 'Chest wall oscillation', '16:30', 603338542, 869554266);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('02-01-2019', 'dd-mm-yyyy'), 'RICE (medicine)', '16:35', 784600813, 325939163);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('03-01-2019', 'dd-mm-yyyy'), 'Hyperimmune globulin', '16:40', 70822249, 599701445);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('04-01-2019', 'dd-mm-yyyy'), 'Electrotherapeutics', '16:45', 70831716, 720256910);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('05-01-2019', 'dd-mm-yyyy'), 'Frenkel exercises', '16:50', 751988735, 42734252);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('06-01-2019', 'dd-mm-yyyy'), 'Management of multiple sclerosis', '16:55', 365963339, 371691541);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('07-01-2019', 'dd-mm-yyyy'), 'LDL apheresis', '17:00', 648911084, 42464775);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('08-01-2019', 'dd-mm-yyyy'), 'Electrotherapy', '17:05', 185000152, 212036071);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('09-01-2019', 'dd-mm-yyyy'), 'Respimat', '17:10', 710935253, 558483801);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('10-01-2019', 'dd-mm-yyyy'), 'Non-contact normothermic wound therapy', '17:15', 293713935, 833381050);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('11-01-2019', 'dd-mm-yyyy'), 'Somnoplasty', '17:20', 63271602, 944474945);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('12-01-2019', 'dd-mm-yyyy'), 'Facet joint injection', '17:25', 326413904, 948300705);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('13-01-2019', 'dd-mm-yyyy'), 'Hypnosis', '17:30', 360147273, 572710466);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('14-01-2019', 'dd-mm-yyyy'), 'Harris flush', '17:35', 792958079, 151713573);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('15-01-2019', 'dd-mm-yyyy'), 'Photopheresis', '17:40', 642196831, 36653768);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('16-01-2019', 'dd-mm-yyyy'), 'Salvage therapy', '17:45', 187988627, 609838404);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('17-01-2019', 'dd-mm-yyyy'), 'Time delay toxin activation', '17:50', 211681471, 74246556);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('18-01-2019', 'dd-mm-yyyy'), 'Transdermal continuous oxygen therapy', '17:55', 503126262, 69683187);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('19-01-2019', 'dd-mm-yyyy'), 'Arthrocentesis', '18:00', 437511476, 772049123);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('20-01-2019', 'dd-mm-yyyy'), 'Kraamzorg', '18:05', 991978392, 9637682);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('21-01-2019', 'dd-mm-yyyy'), 'Expiratory apnea', '18:10', 897773040, 894659176);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('22-01-2019', 'dd-mm-yyyy'), 'Endoscopic nasopharyngectomy', '18:15', 206683768, 694973824);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('23-01-2019', 'dd-mm-yyyy'), 'Optoelectronic plethysmography', '18:20', 779945885, 420691439);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('24-01-2019', 'dd-mm-yyyy'), 'Celacade', '18:25', 726563582, 93706212);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('25-01-2019', 'dd-mm-yyyy'), 'Neuroreflexotherapy', '18:30', 156171593, 227081707);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('26-01-2019', 'dd-mm-yyyy'), 'Pastille', '18:35', 171910180, 460241027);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('27-01-2019', 'dd-mm-yyyy'), 'Dry-powder inhaler', '18:40', 388283660, 670519313);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('28-01-2019', 'dd-mm-yyyy'), 'Alternative uses for placenta', '18:45', 18795929, 135594200);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('29-01-2019', 'dd-mm-yyyy'), 'Therapeutic effect', '18:50', 856592056, 390209868);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('30-01-2019', 'dd-mm-yyyy'), 'Bed rest', '18:55', 173006051, 829823516);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('31-01-2019', 'dd-mm-yyyy'), 'Directly observed treatment, short-course', '12:05', 840454690, 163199704);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('01-02-2019', 'dd-mm-yyyy'), 'Symptomatic treatment', '12:10', 677761715, 47750333);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('02-02-2019', 'dd-mm-yyyy'), 'Gene therapy for osteoarthritis', '12:15', 55937608, 531238815);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('03-02-2019', 'dd-mm-yyyy'), 'Maintenance therapy', '12:20', 719978224, 648956315);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('04-02-2019', 'dd-mm-yyyy'), 'Intramuscular injection', '12:25', 834214215, 71932811);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('05-02-2019', 'dd-mm-yyyy'), 'Pulmonary rehabilitation', '12:30', 434932129, 311466467);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('06-02-2019', 'dd-mm-yyyy'), 'Lateral electrical surface stimulation', '12:35', 988386543, 214019947);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('07-02-2019', 'dd-mm-yyyy'), 'Heliox', '12:40', 129407872, 655611592);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('08-02-2019', 'dd-mm-yyyy'), 'Quaternary prevention', '12:45', 452323355, 267895569);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('02-01-2019', 'dd-mm-yyyy'), 'Transillumination', '12:50', 742852779, 475822438);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('03-01-2019', 'dd-mm-yyyy'), 'Athletic taping', '12:55', 592650513, 608832283);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('04-01-2019', 'dd-mm-yyyy'), 'Hydrogel dressing', '13:00', 448291127, 871947790);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('05-01-2019', 'dd-mm-yyyy'), 'Growth attenuation', '13:05', 18645918, 156552498);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('06-01-2019', 'dd-mm-yyyy'), 'Isocentric technique', '13:10', 653961350, 154508569);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('07-01-2019', 'dd-mm-yyyy'), 'Anthrax immune globulin', '13:15', 64729682, 918926951);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('08-01-2019', 'dd-mm-yyyy'), 'Semper rehydration solution', '13:20', 955095939, 867688554);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('09-01-2019', 'dd-mm-yyyy'), 'Medical gas therapy', '13:25', 685600354, 684228936);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('10-01-2019', 'dd-mm-yyyy'), 'CLaCS', '13:30', 708262840, 518625103);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('11-01-2019', 'dd-mm-yyyy'), 'Intraosseous infusion', '13:35', 189811489, 950758028);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('12-01-2019', 'dd-mm-yyyy'), 'Celacade', '13:40', 467351472, 520553314);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('13-01-2019', 'dd-mm-yyyy'), 'Neuroreflexotherapy', '13:45', 152874477, 505111071);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('14-01-2019', 'dd-mm-yyyy'), 'Pastille', '13:50', 590564086, 65914345);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('15-01-2019', 'dd-mm-yyyy'), 'Dry-powder inhaler', '13:55', 945582077, 102975751);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('16-01-2019', 'dd-mm-yyyy'), 'Alternative uses for placenta', '14:00', 79504732, 97370635);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('17-01-2019', 'dd-mm-yyyy'), 'Therapeutic effect', '14:05', 780946586, 157985841);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('18-01-2019', 'dd-mm-yyyy'), 'Bed rest', '14:10', 375972455, 702948713);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('19-01-2019', 'dd-mm-yyyy'), 'Directly observed treatment, short-course', '14:15', 971633137, 167848962);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('20-01-2019', 'dd-mm-yyyy'), 'Symptomatic treatment', '14:20', 202710130, 477713169);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('21-01-2019', 'dd-mm-yyyy'), 'Gene therapy for osteoarthritis', '14:25', 936814527, 475432614);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('22-01-2019', 'dd-mm-yyyy'), 'Maintenance therapy', '14:30', 618144212, 978976997);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('23-01-2019', 'dd-mm-yyyy'), 'Intramuscular injection', '14:35', 330927664, 960371044);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('24-01-2019', 'dd-mm-yyyy'), 'Pulmonary rehabilitation', '14:40', 850965499, 125805491);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('25-01-2019', 'dd-mm-yyyy'), 'Lateral electrical surface stimulation', '14:45', 121670810, 882503173);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('26-01-2019', 'dd-mm-yyyy'), 'Heliox', '14:50', 591829232, 90523324);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('27-01-2019', 'dd-mm-yyyy'), 'Quaternary prevention', '14:55', 523479830, 62842027);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('28-01-2019', 'dd-mm-yyyy'), 'Transillumination', '15:00', 972999281, 85099344);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('29-01-2019', 'dd-mm-yyyy'), 'Athletic taping', '15:05', 869593414, 585949230);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('30-01-2019', 'dd-mm-yyyy'), 'Hydrogel dressing', '15:10', 364323076, 663022089);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('31-01-2019', 'dd-mm-yyyy'), 'Growth attenuation', '15:15', 456295284, 138808687);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('01-02-2019', 'dd-mm-yyyy'), 'Isocentric technique', '15:20', 486877093, 115866959);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('02-02-2019', 'dd-mm-yyyy'), 'Anthrax immune globulin', '15:25', 850636732, 67162927);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('03-02-2019', 'dd-mm-yyyy'), 'Semper rehydration solution', '15:30', 670150291, 726182643);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('04-02-2019', 'dd-mm-yyyy'), 'Medical gas therapy', '15:35', 345108322, 867117574);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('05-02-2019', 'dd-mm-yyyy'), 'CLaCS', '15:40', 49629406, 468320988);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('06-02-2019', 'dd-mm-yyyy'), 'Intraosseous infusion', '15:45', 996662084, 845532748);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('07-02-2019', 'dd-mm-yyyy'), 'Celacade', '15:50', 482818846, 979100171);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('08-02-2019', 'dd-mm-yyyy'), 'Neuroreflexotherapy', '15:55', 385892708, 202306184);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('02-01-2019', 'dd-mm-yyyy'), 'Pastille', '16:00', 113899307, 660108450);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('03-01-2019', 'dd-mm-yyyy'), 'Dry-powder inhaler', '16:05', 19214993, 481022444);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('04-01-2019', 'dd-mm-yyyy'), 'Alternative uses for placenta', '16:10', 640808719, 41216358);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('05-01-2019', 'dd-mm-yyyy'), 'Therapeutic effect', '16:15', 464600526, 325294143);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('06-01-2019', 'dd-mm-yyyy'), 'Bed rest', '16:20', 191386480, 803833678);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('07-01-2019', 'dd-mm-yyyy'), 'Directly observed treatment, short-course', '16:25', 287878005, 608473425);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('08-01-2019', 'dd-mm-yyyy'), 'Symptomatic treatment', '16:30', 754030724, 109416098);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('09-01-2019', 'dd-mm-yyyy'), 'Gene therapy for osteoarthritis', '16:35', 698473099, 881549786);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('10-01-2019', 'dd-mm-yyyy'), 'Maintenance therapy', '16:40', 111413768, 869554266);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('11-01-2019', 'dd-mm-yyyy'), 'Intramuscular injection', '16:45', 671660675, 325939163);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('12-01-2019', 'dd-mm-yyyy'), 'Pulmonary rehabilitation', '16:50', 892580017, 599701445);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('13-01-2019', 'dd-mm-yyyy'), 'Lateral electrical surface stimulation', '16:55', 903626083, 720256910);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('14-01-2019', 'dd-mm-yyyy'), 'Heliox', '17:00', 620937216, 42734252);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('15-01-2019', 'dd-mm-yyyy'), 'Quaternary prevention', '17:05', 908000615, 371691541);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('16-01-2019', 'dd-mm-yyyy'), 'Transillumination', '17:10', 724134639, 42464775);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('17-01-2019', 'dd-mm-yyyy'), 'Athletic taping', '17:15', 985907107, 212036071);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('18-01-2019', 'dd-mm-yyyy'), 'Hydrogel dressing', '17:20', 726919780, 558483801);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('19-01-2019', 'dd-mm-yyyy'), 'Growth attenuation', '17:25', 412079807, 833381050);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('20-01-2019', 'dd-mm-yyyy'), 'Isocentric technique', '17:30', 709915279, 944474945);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('21-01-2019', 'dd-mm-yyyy'), 'Anthrax immune globulin', '17:35', 434940113, 948300705);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('22-01-2019', 'dd-mm-yyyy'), 'Semper rehydration solution', '17:40', 291741163, 572710466);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('23-01-2019', 'dd-mm-yyyy'), 'Medical gas therapy', '17:45', 426148194, 151713573);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('24-01-2019', 'dd-mm-yyyy'), 'CLaCS', '17:50', 64526097, 36653768);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('25-01-2019', 'dd-mm-yyyy'), 'Intraosseous infusion', '17:55', 603338542, 609838404);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('26-01-2019', 'dd-mm-yyyy'), 'Celacade', '18:00', 784600813, 74246556);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('27-01-2019', 'dd-mm-yyyy'), 'Neuroreflexotherapy', '18:05', 70822249, 69683187);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('28-01-2019', 'dd-mm-yyyy'), 'Pastille', '18:10', 70831716, 772049123);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('29-01-2019', 'dd-mm-yyyy'), 'Dry-powder inhaler', '18:15', 751988735, 9637682);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('30-01-2019', 'dd-mm-yyyy'), 'Alternative uses for placenta', '18:20', 365963339, 894659176);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('31-01-2019', 'dd-mm-yyyy'), 'Therapeutic effect', '18:25', 648911084, 694973824);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('01-02-2019', 'dd-mm-yyyy'), 'Bed rest', '18:30', 185000152, 420691439);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('02-02-2019', 'dd-mm-yyyy'), 'Directly observed treatment, short-course', '18:35', 710935253, 93706212);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('03-02-2019', 'dd-mm-yyyy'), 'Symptomatic treatment', '18:40', 293713935, 227081707);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('04-02-2019', 'dd-mm-yyyy'), 'Gene therapy for osteoarthritis', '18:45', 63271602, 460241027);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('05-02-2019', 'dd-mm-yyyy'), 'Maintenance therapy', '18:50', 326413904, 670519313);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('06-02-2019', 'dd-mm-yyyy'), 'Intramuscular injection', '18:55', 360147273, 135594200);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('07-02-2019', 'dd-mm-yyyy'), 'Pulmonary rehabilitation', '12:05', 792958079, 390209868);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('08-02-2019', 'dd-mm-yyyy'), 'Lateral electrical surface stimulation', '12:10', 642196831, 829823516);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('02-01-2019', 'dd-mm-yyyy'), 'Heliox', '12:15', 187988627, 163199704);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('03-01-2019', 'dd-mm-yyyy'), 'Quaternary prevention', '12:20', 211681471, 47750333);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('04-01-2019', 'dd-mm-yyyy'), 'Transillumination', '12:25', 503126262, 460241027);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('05-01-2019', 'dd-mm-yyyy'), 'Athletic taping', '12:30', 437511476, 670519313);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('06-01-2019', 'dd-mm-yyyy'), 'Hydrogel dressing', '12:35', 991978392, 135594200);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('07-01-2019', 'dd-mm-yyyy'), 'Growth attenuation', '12:40', 897773040, 390209868);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('08-01-2019', 'dd-mm-yyyy'), 'Isocentric technique', '12:45', 206683768, 829823516);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('09-01-2019', 'dd-mm-yyyy'), 'Anthrax immune globulin', '12:50', 779945885, 163199704);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('10-01-2019', 'dd-mm-yyyy'), 'Semper rehydration solution', '12:55', 726563582, 47750333);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('11-01-2019', 'dd-mm-yyyy'), 'Medical gas therapy', '13:00', 156171593, 460241027);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('12-01-2019', 'dd-mm-yyyy'), 'CLaCS', '13:05', 171910180, 670519313);
insert into TREATED_BY (treatdate, treatmenttype, treatmenttime, citizenid, workerid)
values (to_date('13-01-2019', 'dd-mm-yyyy'), 'Intraosseous infusion', '13:10', 388283660, 135594200);
commit;
prompt 180 records loaded
prompt Loading WORKAT...
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (5110.151, 46, to_date('28-09-2006', 'dd-mm-yyyy'), 89, 224, 435, 531238815);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (9203.725, 20, to_date('04-07-2007', 'dd-mm-yyyy'), 10, 753, 861, 648956315);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (7608.353, 92, to_date('29-05-2008', 'dd-mm-yyyy'), 7, 621, 726, 71932811);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (10196.82, 68, to_date('25-10-2008', 'dd-mm-yyyy'), 8, 265, 758, 311466467);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (9650.464, 61, to_date('04-09-2010', 'dd-mm-yyyy'), 74, 540, 224, 214019947);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (9522.606, 16, to_date('19-08-2011', 'dd-mm-yyyy'), 57, 924, 42, 655611592);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (9673.756, 6, to_date('23-09-2011', 'dd-mm-yyyy'), 45, 598, 116, 267895569);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (5300.325, 88, to_date('02-01-2012', 'dd-mm-yyyy'), 44, 789, 431, 475822438);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (11422.211, 33, to_date('03-03-2012', 'dd-mm-yyyy'), 54, 993, 380, 608832283);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (6179.105, 71, to_date('04-08-2012', 'dd-mm-yyyy'), 49, 97, 426, 871947790);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (7267.421, 59, to_date('16-04-2013', 'dd-mm-yyyy'), 51, 976, 546, 156552498);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (12308.546, 1, to_date('07-02-2014', 'dd-mm-yyyy'), 50, 399, 186, 154508569);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (11810.055, 52, to_date('16-09-2014', 'dd-mm-yyyy'), 4, 405, 632, 918926951);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (8950.58, 25, to_date('21-12-2014', 'dd-mm-yyyy'), 78, 633, 789, 867688554);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (4946.684, 97, to_date('24-12-2014', 'dd-mm-yyyy'), 26, 450, 860, 684228936);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (6384.548, 73, to_date('24-10-2015', 'dd-mm-yyyy'), 72, 959, 74, 518625103);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (7564.46, 61, to_date('21-03-2016', 'dd-mm-yyyy'), 51, 336, 472, 950758028);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (10519.116, 76, to_date('07-09-2016', 'dd-mm-yyyy'), 13, 890, 514, 520553314);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (12553, 30, to_date('03-01-2017', 'dd-mm-yyyy'), 45, 777, 680, 505111071);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (6872.499, 74, to_date('09-08-2018', 'dd-mm-yyyy'), 43, 179, 213, 65914345);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (11081.4, 44, to_date('24-10-2018', 'dd-mm-yyyy'), 81, 365, 51, 102975751);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (5824.44, 5, to_date('01-11-2018', 'dd-mm-yyyy'), 53, 600, 581, 97370635);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (9864.779, 11, to_date('13-11-2018', 'dd-mm-yyyy'), 89, 528, 78, 157985841);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (4190.66, 61, to_date('08-03-2019', 'dd-mm-yyyy'), 43, 492, 895, 702948713);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (8705.079, 49, to_date('08-09-2019', 'dd-mm-yyyy'), 78, 220, 301, 167848962);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (7992.068, 33, to_date('21-02-2006', 'dd-mm-yyyy'), 74, 33, 151, 477713169);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (7212.265, 60, to_date('24-11-2006', 'dd-mm-yyyy'), 35, 121, 170, 475432614);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (11481.664, 78, to_date('07-03-2008', 'dd-mm-yyyy'), 24, 22, 912, 978976997);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (4462.775, 45, to_date('30-04-2009', 'dd-mm-yyyy'), 40, 830, 501, 960371044);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (11065.09, 38, to_date('06-08-2010', 'dd-mm-yyyy'), 71, 413, 893, 125805491);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (14055.197, 63, to_date('10-12-2010', 'dd-mm-yyyy'), 80, 425, 857, 882503173);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (9720.78, 26, to_date('03-08-2011', 'dd-mm-yyyy'), 7, 329, 443, 90523324);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (13895.357, 76, to_date('04-10-2011', 'dd-mm-yyyy'), 58, 556, 297, 62842027);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (5897.105, 26, to_date('17-07-2012', 'dd-mm-yyyy'), 43, 20, 566, 85099344);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (5622.985, 56, to_date('20-11-2012', 'dd-mm-yyyy'), 47, 717, 164, 585949230);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (14695.431, 17, to_date('12-07-2013', 'dd-mm-yyyy'), 42, 853, 996, 663022089);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (14915.336, 45, to_date('18-11-2013', 'dd-mm-yyyy'), 51, 233, 652, 138808687);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (11079.406, 16, to_date('03-09-2014', 'dd-mm-yyyy'), 97, 734, 582, 115866959);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (10922.697, 58, to_date('06-09-2014', 'dd-mm-yyyy'), 67, 124, 564, 67162927);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (14517.21, 21, to_date('31-03-2015', 'dd-mm-yyyy'), 23, 245, 815, 726182643);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (13377.569, 98, to_date('18-02-2016', 'dd-mm-yyyy'), 14, 803, 820, 867117574);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (10879.384, 99, to_date('25-03-2017', 'dd-mm-yyyy'), 92, 110, 157, 468320988);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (14902.424, 49, to_date('12-07-2017', 'dd-mm-yyyy'), 33, 631, 281, 845532748);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (8117.515, 4, to_date('31-12-2017', 'dd-mm-yyyy'), 41, 149, 420, 979100171);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (10500.078, 17, to_date('25-05-2018', 'dd-mm-yyyy'), 29, 172, 408, 202306184);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (5090.347, 68, to_date('24-07-2018', 'dd-mm-yyyy'), 9, 710, 279, 660108450);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (9624.829, 78, to_date('08-09-2018', 'dd-mm-yyyy'), 26, 185, 423, 481022444);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (6679.581, 74, to_date('21-01-2019', 'dd-mm-yyyy'), 32, 513, 573, 41216358);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (4591.696, 79, to_date('03-06-2019', 'dd-mm-yyyy'), 0, 226, 292, 325294143);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (4080.767, 29, to_date('10-10-2019', 'dd-mm-yyyy'), 7, 478, 146, 803833678);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (10707.087, 18, to_date('01-05-2006', 'dd-mm-yyyy'), 7, 958, 338, 608473425);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (9728.29, 69, to_date('12-11-2006', 'dd-mm-yyyy'), 6, 792, 364, 109416098);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (11570.061, 84, to_date('13-03-2007', 'dd-mm-yyyy'), 56, 419, 340, 881549786);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (7209.655, 11, to_date('30-07-2007', 'dd-mm-yyyy'), 12, 977, 180, 869554266);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (4431.441, 46, to_date('21-08-2007', 'dd-mm-yyyy'), 11, 688, 713, 325939163);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (10354.305, 19, to_date('16-07-2008', 'dd-mm-yyyy'), 2, 480, 809, 599701445);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (12915.058, 63, to_date('19-01-2011', 'dd-mm-yyyy'), 64, 741, 839, 720256910);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (7397.617, 75, to_date('03-06-2011', 'dd-mm-yyyy'), 37, 964, 656, 42734252);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (14139.114, 29, to_date('27-09-2011', 'dd-mm-yyyy'), 54, 296, 834, 371691541);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (11291.931, 24, to_date('01-10-2011', 'dd-mm-yyyy'), 48, 951, 34, 42464775);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (4934.993, 56, to_date('30-05-2012', 'dd-mm-yyyy'), 64, 758, 616, 212036071);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (6870.514, 63, to_date('17-09-2012', 'dd-mm-yyyy'), 95, 820, 931, 558483801);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (6939.751, 34, to_date('20-11-2012', 'dd-mm-yyyy'), 34, 799, 503, 833381050);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (14731.906, 50, to_date('17-01-2013', 'dd-mm-yyyy'), 83, 670, 748, 944474945);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (7984.074, 9, to_date('26-03-2014', 'dd-mm-yyyy'), 40, 321, 381, 948300705);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (8574.157, 6, to_date('11-06-2014', 'dd-mm-yyyy'), 44, 246, 352, 572710466);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (6918.597, 96, to_date('25-09-2014', 'dd-mm-yyyy'), 92, 790, 25, 151713573);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (8857.617, 20, to_date('18-05-2016', 'dd-mm-yyyy'), 52, 684, 31, 36653768);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (14246.71, 8, to_date('29-08-2016', 'dd-mm-yyyy'), 90, 928, 200, 609838404);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (12916.459, 32, to_date('11-10-2016', 'dd-mm-yyyy'), 53, 846, 107, 74246556);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (9883.038, 68, to_date('26-02-2018', 'dd-mm-yyyy'), 97, 640, 601, 69683187);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (13015.308, 42, to_date('12-06-2018', 'dd-mm-yyyy'), 79, 251, 310, 772049123);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (7498.06, 94, to_date('13-08-2018', 'dd-mm-yyyy'), 10, 572, 526, 9637682);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (11512.131, 61, to_date('23-12-2018', 'dd-mm-yyyy'), 68, 926, 831, 894659176);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (4540.722, 78, to_date('06-03-2020', 'dd-mm-yyyy'), 36, 501, 121, 694973824);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (9821.319, 78, to_date('01-10-2006', 'dd-mm-yyyy'), 68, 953, 313, 420691439);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (10083.958, 20, to_date('23-01-2007', 'dd-mm-yyyy'), 92, 737, 339, 93706212);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (6601.24, 96, to_date('18-05-2007', 'dd-mm-yyyy'), 4, 608, 942, 227081707);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (8327.604, 87, to_date('09-04-2008', 'dd-mm-yyyy'), 41, 886, 363, 460241027);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (8139.568, 31, to_date('14-04-2008', 'dd-mm-yyyy'), 4, 749, 572, 670519313);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (5427.153, 52, to_date('05-11-2008', 'dd-mm-yyyy'), 58, 130, 111, 135594200);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (4900.18, 34, to_date('12-01-2009', 'dd-mm-yyyy'), 76, 155, 555, 390209868);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (6996.537, 23, to_date('01-09-2009', 'dd-mm-yyyy'), 11, 189, 714, 829823516);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (7609.719, 6, to_date('27-11-2009', 'dd-mm-yyyy'), 26, 16, 584, 163199704);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (7131.812, 57, to_date('19-04-2010', 'dd-mm-yyyy'), 95, 780, 854, 47750333);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (14053.99, 81, to_date('02-12-2011', 'dd-mm-yyyy'), 72, 731, 892, 651653039);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (10955.927, 36, to_date('30-12-2011', 'dd-mm-yyyy'), 1, 880, 781, 334482803);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (13238.328, 33, to_date('07-05-2012', 'dd-mm-yyyy'), 26, 427, 309, 590390539);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (6050.041, 71, to_date('09-11-2012', 'dd-mm-yyyy'), 88, 763, 883, 777271072);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (7183.294, 49, to_date('28-11-2012', 'dd-mm-yyyy'), 6, 549, 319, 930997789);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (6304.752, 69, to_date('10-03-2013', 'dd-mm-yyyy'), 20, 29, 174, 264181465);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (5134.672, 39, to_date('11-04-2013', 'dd-mm-yyyy'), 65, 75, 427, 904309366);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (10490.535, 77, to_date('02-05-2014', 'dd-mm-yyyy'), 35, 503, 455, 675443623);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (10763.133, 8, to_date('22-05-2014', 'dd-mm-yyyy'), 98, 491, 331, 98795350);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (7091.617, 32, to_date('28-11-2014', 'dd-mm-yyyy'), 55, 712, 589, 291975656);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (4631.982, 90, to_date('19-10-2015', 'dd-mm-yyyy'), 16, 93, 759, 659346126);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (4567.552, 28, to_date('21-03-2016', 'dd-mm-yyyy'), 62, 682, 865, 832411481);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (8144.647, 56, to_date('10-12-2016', 'dd-mm-yyyy'), 34, 279, 648, 821772864);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (7751.575, 93, to_date('02-01-2019', 'dd-mm-yyyy'), 8, 203, 547, 813408967);
insert into WORKAT (salary, rating, hiredate, workpercentage, depid, healtinstid, workerid)
values (9894.174, 18, to_date('22-09-2019', 'dd-mm-yyyy'), 93, 735, 360, 927420065);
commit;
prompt 100 records loaded
prompt Loading WORKER...
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (531238815, 'Diamond Olson', to_date('20-01-2000', 'dd-mm-yyyy'), 531238815);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (648956315, 'Maritza Marks', to_date('25-08-1957', 'dd-mm-yyyy'), 648956315);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (71932811, 'Kennedy Chen', to_date('09-09-1992', 'dd-mm-yyyy'), 71932811);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (311466467, 'Anthony Davila', to_date('16-05-1976', 'dd-mm-yyyy'), 311466467);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (214019947, 'Payton Sloan', to_date('02-01-1989', 'dd-mm-yyyy'), 214019947);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (655611592, 'Jeramiah Yu', to_date('22-08-1971', 'dd-mm-yyyy'), 655611592);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (267895569, 'Gloria Hoffman', to_date('22-08-1979', 'dd-mm-yyyy'), 267895569);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (475822438, 'Abel Hansen', to_date('03-06-1960', 'dd-mm-yyyy'), 475822438);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (608832283, 'Amiya Drake', to_date('02-09-1964', 'dd-mm-yyyy'), 608832283);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (871947790, 'Anna Velez', to_date('31-01-1971', 'dd-mm-yyyy'), 871947790);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (156552498, 'Iyana Meza', to_date('16-10-1977', 'dd-mm-yyyy'), 871947790);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (154508569, 'Johnathon Barnes', to_date('07-06-1964', 'dd-mm-yyyy'), 531238815);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (918926951, 'Shaniya Dominguez', to_date('04-06-1987', 'dd-mm-yyyy'), 531238815);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (867688554, 'Bentley Hunter', to_date('28-12-1956', 'dd-mm-yyyy'), 648956315);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (684228936, 'Madyson Bradley', to_date('30-01-1969', 'dd-mm-yyyy'), 648956315);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (518625103, 'Aiyana Hahn', to_date('10-06-1961', 'dd-mm-yyyy'), 71932811);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (950758028, 'Zechariah Moran', to_date('30-11-1983', 'dd-mm-yyyy'), 71932811);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (520553314, 'Eliza Smith', to_date('18-06-1963', 'dd-mm-yyyy'), 311466467);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (505111071, 'Janae Nicholson', to_date('27-03-1996', 'dd-mm-yyyy'), 311466467);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (65914345, 'Sarahi Wagner', to_date('22-05-1961', 'dd-mm-yyyy'), 214019947);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (102975751, 'Fatima Livingston', to_date('30-04-1985', 'dd-mm-yyyy'), 214019947);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (97370635, 'Ashleigh Winters', to_date('08-12-1989', 'dd-mm-yyyy'), 655611592);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (157985841, 'Clayton Shah', to_date('25-07-1997', 'dd-mm-yyyy'), 655611592);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (702948713, 'Emilia Bautista', to_date('20-02-1963', 'dd-mm-yyyy'), 267895569);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (167848962, 'Martin Hodges', to_date('31-08-1973', 'dd-mm-yyyy'), 267895569);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (477713169, 'Carlie Avery', to_date('12-12-1989', 'dd-mm-yyyy'), 475822438);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (475432614, 'Mayra Mcgee', to_date('11-04-1985', 'dd-mm-yyyy'), 475822438);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (978976997, 'Kelly Murphy', to_date('03-06-1983', 'dd-mm-yyyy'), 608832283);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (960371044, 'Messiah Mercer', to_date('12-09-1956', 'dd-mm-yyyy'), 608832283);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (125805491, 'Libby Brady', to_date('18-01-2000', 'dd-mm-yyyy'), 871947790);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (882503173, 'Reynaldo Lucero', to_date('27-06-1961', 'dd-mm-yyyy'), 871947790);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (90523324, 'Rowan Walters', to_date('15-04-1952', 'dd-mm-yyyy'), 531238815);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (62842027, 'Rohan Patel', to_date('19-03-1993', 'dd-mm-yyyy'), 531238815);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (85099344, 'Paxton Rogers', to_date('14-04-1982', 'dd-mm-yyyy'), 648956315);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (585949230, 'Alexis Bean', to_date('03-02-1958', 'dd-mm-yyyy'), 648956315);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (663022089, 'Tiara Wilkinson', to_date('04-03-1987', 'dd-mm-yyyy'), 71932811);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (138808687, 'Taniya Best', to_date('24-08-1965', 'dd-mm-yyyy'), 71932811);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (115866959, 'Kristian Perkins', to_date('18-05-1989', 'dd-mm-yyyy'), 311466467);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (67162927, 'Daniella Ballard', to_date('24-12-1984', 'dd-mm-yyyy'), 311466467);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (726182643, 'Bridger Nicholson', to_date('19-11-1985', 'dd-mm-yyyy'), 214019947);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (867117574, 'Tanner Velazquez', to_date('16-07-1966', 'dd-mm-yyyy'), 214019947);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (468320988, 'Kadyn Parker', to_date('18-02-1984', 'dd-mm-yyyy'), 655611592);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (845532748, 'Ernesto Crane', to_date('21-10-1962', 'dd-mm-yyyy'), 655611592);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (979100171, 'Alma Benson', to_date('16-07-1986', 'dd-mm-yyyy'), 267895569);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (202306184, 'Marie Barton', to_date('20-09-1961', 'dd-mm-yyyy'), 267895569);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (660108450, 'Lilyana Lamb', to_date('06-07-1999', 'dd-mm-yyyy'), 475822438);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (481022444, 'Lewis Stewart', to_date('06-06-1983', 'dd-mm-yyyy'), 475822438);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (41216358, 'Alonso Washington', to_date('28-11-1994', 'dd-mm-yyyy'), 608832283);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (325294143, 'Aiyana Russo', to_date('18-09-1991', 'dd-mm-yyyy'), 608832283);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (803833678, 'Jaylon Mills', to_date('02-05-1971', 'dd-mm-yyyy'), 871947790);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (608473425, 'Drew Love', to_date('12-01-1966', 'dd-mm-yyyy'), 871947790);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (109416098, 'Denisse Ball', to_date('10-07-1982', 'dd-mm-yyyy'), 531238815);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (881549786, 'Lia Michael', to_date('14-04-1973', 'dd-mm-yyyy'), 531238815);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (869554266, 'Esteban Frederick', to_date('11-09-1990', 'dd-mm-yyyy'), 648956315);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (325939163, 'Addyson Farley', to_date('16-11-1961', 'dd-mm-yyyy'), 648956315);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (599701445, 'Peyton Griffith', to_date('22-10-1951', 'dd-mm-yyyy'), 71932811);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (720256910, 'Ronan Holmes', to_date('23-02-1956', 'dd-mm-yyyy'), 71932811);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (42734252, 'Heidy Cruz', to_date('15-03-1986', 'dd-mm-yyyy'), 311466467);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (371691541, 'Miracle Gould', to_date('30-11-1984', 'dd-mm-yyyy'), 311466467);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (42464775, 'Gunnar Barr', to_date('09-06-1997', 'dd-mm-yyyy'), 214019947);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (212036071, 'Chana Meadows', to_date('18-01-1959', 'dd-mm-yyyy'), 214019947);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (558483801, 'Olivia Duncan', to_date('09-08-1973', 'dd-mm-yyyy'), 655611592);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (833381050, 'Kolten Clarke', to_date('27-02-1964', 'dd-mm-yyyy'), 655611592);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (944474945, 'Milagros Hill', to_date('05-01-1994', 'dd-mm-yyyy'), 267895569);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (948300705, 'Libby Dickson', to_date('03-02-1961', 'dd-mm-yyyy'), 267895569);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (572710466, 'Kiley Compton', to_date('25-02-1989', 'dd-mm-yyyy'), 475822438);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (151713573, 'Phoenix Mcdowell', to_date('20-11-1994', 'dd-mm-yyyy'), 475822438);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (36653768, 'Taryn Bridges', to_date('19-08-1968', 'dd-mm-yyyy'), 608832283);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (609838404, 'Elsie Black', to_date('19-11-1971', 'dd-mm-yyyy'), 608832283);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (74246556, 'Bruce Meyer', to_date('18-03-1996', 'dd-mm-yyyy'), 871947790);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (69683187, 'Teagan Fritz', to_date('22-09-1951', 'dd-mm-yyyy'), 871947790);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (772049123, 'Alfredo Cline', to_date('16-06-1994', 'dd-mm-yyyy'), 531238815);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (9637682, 'Alvin Alvarez', to_date('06-02-1994', 'dd-mm-yyyy'), 531238815);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (894659176, 'Cayden Henry', to_date('16-04-1968', 'dd-mm-yyyy'), 648956315);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (694973824, 'Iyana Paul', to_date('15-08-1953', 'dd-mm-yyyy'), 648956315);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (420691439, 'Haiden Shepard', to_date('17-06-1964', 'dd-mm-yyyy'), 71932811);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (93706212, 'Braden Summers', to_date('06-07-1993', 'dd-mm-yyyy'), 71932811);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (227081707, 'James Nichols', to_date('03-02-1960', 'dd-mm-yyyy'), 311466467);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (460241027, 'Damien Hess', to_date('22-12-1968', 'dd-mm-yyyy'), 311466467);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (670519313, 'Joselyn Chan', to_date('22-04-1964', 'dd-mm-yyyy'), 214019947);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (135594200, 'Serena Klein', to_date('14-12-1970', 'dd-mm-yyyy'), 214019947);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (390209868, 'Sammy Bonilla', to_date('04-11-1956', 'dd-mm-yyyy'), 655611592);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (829823516, 'Kiana Jimenez', to_date('24-09-1993', 'dd-mm-yyyy'), 655611592);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (163199704, 'Tamia Mercado', to_date('03-11-1951', 'dd-mm-yyyy'), 267895569);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (47750333, 'Chanel Raymond', to_date('27-04-1973', 'dd-mm-yyyy'), 267895569);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (651653039, 'Ariel Little', to_date('26-04-1955', 'dd-mm-yyyy'), 475822438);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (334482803, 'Nolan Orozco', to_date('18-05-1988', 'dd-mm-yyyy'), 475822438);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (590390539, 'George Maldonado', to_date('05-11-1984', 'dd-mm-yyyy'), 608832283);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (777271072, 'Valery Leach', to_date('17-06-1959', 'dd-mm-yyyy'), 608832283);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (930997789, 'Leonel Joseph', to_date('07-03-1963', 'dd-mm-yyyy'), 871947790);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (264181465, 'Koen Finley', to_date('09-02-1999', 'dd-mm-yyyy'), 871947790);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (904309366, 'Marshall Barton', to_date('24-11-1993', 'dd-mm-yyyy'), 531238815);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (675443623, 'Noelle Butler', to_date('22-10-1999', 'dd-mm-yyyy'), 531238815);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (98795350, 'Saul Leonard', to_date('22-09-1962', 'dd-mm-yyyy'), 648956315);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (291975656, 'Haley Howe', to_date('25-08-1989', 'dd-mm-yyyy'), 648956315);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (659346126, 'Emmy Strong', to_date('09-09-1973', 'dd-mm-yyyy'), 71932811);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (832411481, 'Josie Mcfarland', to_date('19-04-1978', 'dd-mm-yyyy'), 71932811);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (821772864, 'Yazmin Oconnell', to_date('31-10-1963', 'dd-mm-yyyy'), 311466467);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (813408967, 'Zaniyah Reese', to_date('19-01-1997', 'dd-mm-yyyy'), 311466467);
insert into WORKER (workerid, wokername, birthdate, itsboss_workerid)
values (927420065, 'Declan Wilson', to_date('09-09-1990', 'dd-mm-yyyy'), 214019947);
commit;
prompt 100 records loaded

set feedback on
set define on
prompt Done
