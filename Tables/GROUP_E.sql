?��prompt PL/SQL Developer Export Tables for user SYSTEM
prompt Created by Evyatar on יום שני 10 אוגוסט 2020
set feedback off
set define off

prompt Creating ACTIVITY...
create table ACTIVITY
(
  activitytype VARCHAR2(32) not null,
  activityid   INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACTIVITY
  add primary key (ACTIVITYID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating AREA...
create table AREA
(
  areaid   INTEGER not null,
  areaname VARCHAR2(32)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AREA
  add primary key (AREAID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BELONGS_TO...
create table BELONGS_TO
(
  jobpercentage FLOAT not null,
  enddate       DATE,
  startdate     DATE not null,
  workerid      INTEGER not null,
  depid         INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BELONGS_TO
  add primary key (WORKERID, DEPID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CITY...
create table CITY
(
  cityid   INTEGER not null,
  cityname VARCHAR2(32) not null,
  areaid   INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CITY
  add primary key (CITYID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating CITIZEN...
create table CITIZEN
(
  citizenid   INTEGER not null,
  citizenname VARCHAR2(32) not null,
  phonenumber VARCHAR2(32) not null,
  address     VARCHAR2(32) not null,
  cityid      INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CITIZEN
  add primary key (CITIZENID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CITIZEN
  add foreign key (CITYID)
  references CITY (CITYID);

prompt Creating CLERK...
create table CLERK
(
  clerkid   NUMBER(9) not null,
  clerkname VARCHAR2(50),
  bossid    NUMBER(9),
  areaid    NUMBER(3) not null,
  salary    FLOAT,
  hireyear  NUMBER(4),
  rating    NUMBER(2)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLERK
  add primary key (CLERKID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLERK
  add foreign key (AREAID)
  references AREA (AREAID);

prompt Creating FIELD...
create table FIELD
(
  fieldid   NUMBER(3) not null,
  filedname VARCHAR2(50) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table FIELD
  add primary key (FIELDID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating HEALTHINSTITUTION...
create table HEALTHINSTITUTION
(
  healthinstid NUMBER(3) not null,
  instname     VARCHAR2(50) not null,
  cityid       NUMBER(3) not null,
  fieldid      NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HEALTHINSTITUTION
  add primary key (HEALTHINSTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
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
  healthinstid NUMBER(3) not null,
  depname      VARCHAR2(50) not null,
  cityid       INTEGER not null,
  numberofbeds NUMBER(4) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DEPARTMENT
  add primary key (DEPID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DEPARTMENT
  add foreign key (HEALTHINSTID)
  references HEALTHINSTITUTION (HEALTHINSTID);
alter table DEPARTMENT
  add foreign key (CITYID)
  references CITY (CITYID);

prompt Creating LICENSING...
create table LICENSING
(
  licensetype VARCHAR2(50) not null,
  licenseid   NUMBER(3) not null,
  releasedate DATE not null,
  fieldid     NUMBER(3) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LICENSING
  add primary key (LICENSEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
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
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DOCTOR
  add primary key (WORKERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DOCTOR
  add foreign key (LICENSEID)
  references LICENSING (LICENSEID);

prompt Creating HEALTH_PROFESSION...
create table HEALTH_PROFESSION
(
  hpid   INTEGER not null,
  hpname VARCHAR2(32) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HEALTH_PROFESSION
  add primary key (HPID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

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
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HOSPITALIZEDAT
  add primary key (CITIZENID, DEPID, HEALTINSTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HOSPITALIZEDAT
  add foreign key (CITIZENID)
  references CITIZEN (CITIZENID);

prompt Creating INSTRUCTOR...
create table INSTRUCTOR
(
  instructorid INTEGER not null,
  citizenid    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INSTRUCTOR
  add primary key (INSTRUCTORID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table INSTRUCTOR
  add foreign key (CITIZENID)
  references CITIZEN (CITIZENID);

prompt Creating LICENSE...
create table LICENSE
(
  licenseid    INTEGER not null,
  hpid         INTEGER not null,
  instructorid INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table LICENSE
  add primary key (HPID, INSTRUCTORID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PARTICIPATES_IN...
create table PARTICIPATES_IN
(
  participationdate DATE not null,
  workerid          INTEGER not null,
  activityid        INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PARTICIPATES_IN
  add primary key (WORKERID, ACTIVITYID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SCHEDULE...
create table SCHEDULE
(
  meetingtime DATE not null,
  clerkid     NUMBER(9) not null,
  citizenid   INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SCHEDULE
  add primary key (MEETINGTIME, CLERKID, CITIZENID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
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
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TREATED_BY
  add primary key (TREATDATE, TREATMENTTIME, CITIZENID, WORKERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TREATED_BY
  add foreign key (WORKERID)
  references DOCTOR (WORKERID);
alter table TREATED_BY
  add foreign key (CITIZENID)
  references CITIZEN (CITIZENID);

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
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKAT
  add primary key (DEPID, HEALTINSTID, WORKERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating WORKER...
create table WORKER
(
  workerid         NUMBER(9) not null,
  workername       VARCHAR2(50) not null,
  birthdate        DATE not null,
  itsboss_workerid NUMBER(9) not null,
  startdate        DATE,
  enddate          DATE,
  type             INTEGER,
  citizenid        INTEGER,
  salary           FLOAT
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKER
  add primary key (WORKERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table WORKER
  add foreign key (ITSBOSS_WORKERID)
  references WORKER (WORKERID);

prompt Disabling triggers for ACTIVITY...
alter table ACTIVITY disable all triggers;
prompt Disabling triggers for AREA...
alter table AREA disable all triggers;
prompt Disabling triggers for BELONGS_TO...
alter table BELONGS_TO disable all triggers;
prompt Disabling triggers for CITY...
alter table CITY disable all triggers;
prompt Disabling triggers for CITIZEN...
alter table CITIZEN disable all triggers;
prompt Disabling triggers for CLERK...
alter table CLERK disable all triggers;
prompt Disabling triggers for FIELD...
alter table FIELD disable all triggers;
prompt Disabling triggers for HEALTHINSTITUTION...
alter table HEALTHINSTITUTION disable all triggers;
prompt Disabling triggers for DEPARTMENT...
alter table DEPARTMENT disable all triggers;
prompt Disabling triggers for LICENSING...
alter table LICENSING disable all triggers;
prompt Disabling triggers for DOCTOR...
alter table DOCTOR disable all triggers;
prompt Disabling triggers for HEALTH_PROFESSION...
alter table HEALTH_PROFESSION disable all triggers;
prompt Disabling triggers for HOSPITALIZEDAT...
alter table HOSPITALIZEDAT disable all triggers;
prompt Disabling triggers for INSTRUCTOR...
alter table INSTRUCTOR disable all triggers;
prompt Disabling triggers for LICENSE...
alter table LICENSE disable all triggers;
prompt Disabling triggers for PARTICIPATES_IN...
alter table PARTICIPATES_IN disable all triggers;
prompt Disabling triggers for SCHEDULE...
alter table SCHEDULE disable all triggers;
prompt Disabling triggers for TREATED_BY...
alter table TREATED_BY disable all triggers;
prompt Disabling triggers for WORKAT...
alter table WORKAT disable all triggers;
prompt Disabling triggers for WORKER...
alter table WORKER disable all triggers;
prompt Disabling foreign key constraints for CITIZEN...
alter table CITIZEN disable constraint SYS_C007479;
prompt Disabling foreign key constraints for CLERK...
alter table CLERK disable constraint SYS_C007535;
prompt Disabling foreign key constraints for HEALTHINSTITUTION...
alter table HEALTHINSTITUTION disable constraint SYS_C007571;
alter table HEALTHINSTITUTION disable constraint SYS_C007572;
prompt Disabling foreign key constraints for DEPARTMENT...
alter table DEPARTMENT disable constraint SYS_C007606;
alter table DEPARTMENT disable constraint SYS_C007607;
prompt Disabling foreign key constraints for LICENSING...
alter table LICENSING disable constraint SYS_C007477;
prompt Disabling foreign key constraints for DOCTOR...
alter table DOCTOR disable constraint SYS_C007482;
prompt Disabling foreign key constraints for HOSPITALIZEDAT...
alter table HOSPITALIZEDAT disable constraint SYS_C007483;
prompt Disabling foreign key constraints for INSTRUCTOR...
alter table INSTRUCTOR disable constraint SYS_C007565;
prompt Disabling foreign key constraints for SCHEDULE...
alter table SCHEDULE disable constraint SYS_C007553;
alter table SCHEDULE disable constraint SYS_C007554;
prompt Disabling foreign key constraints for TREATED_BY...
alter table TREATED_BY disable constraint SYS_C007424;
alter table TREATED_BY disable constraint SYS_C007484;
prompt Disabling foreign key constraints for WORKER...
alter table WORKER disable constraint SYS_C007441;
prompt Deleting WORKER...
delete from WORKER;
commit;
prompt Deleting WORKAT...
delete from WORKAT;
commit;
prompt Deleting TREATED_BY...
delete from TREATED_BY;
commit;
prompt Deleting SCHEDULE...
delete from SCHEDULE;
commit;
prompt Deleting PARTICIPATES_IN...
delete from PARTICIPATES_IN;
commit;
prompt Deleting LICENSE...
delete from LICENSE;
commit;
prompt Deleting INSTRUCTOR...
delete from INSTRUCTOR;
commit;
prompt Deleting HOSPITALIZEDAT...
delete from HOSPITALIZEDAT;
commit;
prompt Deleting HEALTH_PROFESSION...
delete from HEALTH_PROFESSION;
commit;
prompt Deleting DOCTOR...
delete from DOCTOR;
commit;
prompt Deleting LICENSING...
delete from LICENSING;
commit;
prompt Deleting DEPARTMENT...
delete from DEPARTMENT;
commit;
prompt Deleting HEALTHINSTITUTION...
delete from HEALTHINSTITUTION;
commit;
prompt Deleting FIELD...
delete from FIELD;
commit;
prompt Deleting CLERK...
delete from CLERK;
commit;
prompt Deleting CITIZEN...
delete from CITIZEN;
commit;
prompt Deleting CITY...
delete from CITY;
commit;
prompt Deleting BELONGS_TO...
delete from BELONGS_TO;
commit;
prompt Deleting AREA...
delete from AREA;
commit;
prompt Deleting ACTIVITY...
delete from ACTIVITY;
commit;
prompt Loading ACTIVITY...
insert into ACTIVITY (activitytype, activityid)
values ('Swimming', 1);
insert into ACTIVITY (activitytype, activityid)
values ('Riding', 2);
insert into ACTIVITY (activitytype, activityid)
values ('Karaoke', 3);
insert into ACTIVITY (activitytype, activityid)
values ('Rafting', 4);
insert into ACTIVITY (activitytype, activityid)
values ('Yoga', 5);
insert into ACTIVITY (activitytype, activityid)
values ('Running', 6);
insert into ACTIVITY (activitytype, activityid)
values ('Paiting', 7);
commit;
prompt 7 records loaded
prompt Loading AREA...
insert into AREA (areaid, areaname)
values (21, 'MI');
insert into AREA (areaid, areaname)
values (22, 'MO');
insert into AREA (areaid, areaname)
values (23, 'WV');
insert into AREA (areaid, areaname)
values (24, 'ID');
insert into AREA (areaid, areaname)
values (25, 'CO');
insert into AREA (areaid, areaname)
values (26, 'ND');
insert into AREA (areaid, areaname)
values (27, 'NV');
insert into AREA (areaid, areaname)
values (28, 'MN');
insert into AREA (areaid, areaname)
values (29, 'FL');
insert into AREA (areaid, areaname)
values (30, 'IA');
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
prompt 30 records loaded
prompt Loading BELONGS_TO...
insert into BELONGS_TO (jobpercentage, enddate, startdate, workerid, depid)
values (100, to_date('24-11-2024', 'dd-mm-yyyy'), to_date('05-07-2015', 'dd-mm-yyyy'), 5000, 1);
insert into BELONGS_TO (jobpercentage, enddate, startdate, workerid, depid)
values (75, to_date('20-09-2024', 'dd-mm-yyyy'), to_date('21-07-2019', 'dd-mm-yyyy'), 5001, 2);
insert into BELONGS_TO (jobpercentage, enddate, startdate, workerid, depid)
values (75, to_date('21-10-2024', 'dd-mm-yyyy'), to_date('17-08-2011', 'dd-mm-yyyy'), 5002, 3);
insert into BELONGS_TO (jobpercentage, enddate, startdate, workerid, depid)
values (75, to_date('02-01-2020', 'dd-mm-yyyy'), to_date('27-06-2018', 'dd-mm-yyyy'), 5003, 4);
insert into BELONGS_TO (jobpercentage, enddate, startdate, workerid, depid)
values (75, to_date('16-02-2020', 'dd-mm-yyyy'), to_date('29-06-2012', 'dd-mm-yyyy'), 5004, 5);
insert into BELONGS_TO (jobpercentage, enddate, startdate, workerid, depid)
values (100, to_date('22-03-2021', 'dd-mm-yyyy'), to_date('18-11-2016', 'dd-mm-yyyy'), 5006, 7);
insert into BELONGS_TO (jobpercentage, enddate, startdate, workerid, depid)
values (50, to_date('17-02-2021', 'dd-mm-yyyy'), to_date('13-04-2008', 'dd-mm-yyyy'), 5008, 9);
insert into BELONGS_TO (jobpercentage, enddate, startdate, workerid, depid)
values (75, to_date('15-09-2023', 'dd-mm-yyyy'), to_date('09-06-2015', 'dd-mm-yyyy'), 5009, 10);
insert into BELONGS_TO (jobpercentage, enddate, startdate, workerid, depid)
values (100, to_date('01-09-2024', 'dd-mm-yyyy'), to_date('14-08-2017', 'dd-mm-yyyy'), 6000, 11);
commit;
prompt 9 records loaded
prompt Loading CITY...
insert into CITY (cityid, cityname, areaid)
values (23, 'Sursee', 10);
insert into CITY (cityid, cityname, areaid)
values (24, 'Thalwil', 4);
insert into CITY (cityid, cityname, areaid)
values (25, 'Sapulpa', 5);
insert into CITY (cityid, cityname, areaid)
values (26, 'Belgrad', 1);
insert into CITY (cityid, cityname, areaid)
values (27, 'Linz', 4);
insert into CITY (cityid, cityname, areaid)
values (28, 'Boise', 8);
insert into CITY (cityid, cityname, areaid)
values (29, 'Berlin', 8);
insert into CITY (cityid, cityname, areaid)
values (30, 'Odense', 3);
insert into CITY (cityid, cityname, areaid)
values (1, 'Coppell', 8);
insert into CITY (cityid, cityname, areaid)
values (2, 'Neuquen', 3);
insert into CITY (cityid, cityname, areaid)
values (3, 'Monroe', 6);
insert into CITY (cityid, cityname, areaid)
values (4, 'Koblenz', 2);
insert into CITY (cityid, cityname, areaid)
values (5, 'Pasadena', 1);
insert into CITY (cityid, cityname, areaid)
values (6, 'Sainte-foy', 2);
insert into CITY (cityid, cityname, areaid)
values (7, 'Bellerose', 4);
insert into CITY (cityid, cityname, areaid)
values (8, 'Bend', 9);
insert into CITY (cityid, cityname, areaid)
values (9, 'Claymont', 4);
insert into CITY (cityid, cityname, areaid)
values (10, 'Kungki', 5);
insert into CITY (cityid, cityname, areaid)
values (11, 'Nagasaki', 10);
insert into CITY (cityid, cityname, areaid)
values (12, 'Northbrook', 7);
insert into CITY (cityid, cityname, areaid)
values (13, 'Lancaster', 2);
insert into CITY (cityid, cityname, areaid)
values (14, 'Zurich', 7);
insert into CITY (cityid, cityname, areaid)
values (15, 'Douala', 9);
insert into CITY (cityid, cityname, areaid)
values (16, 'Rua eteno', 4);
insert into CITY (cityid, cityname, areaid)
values (17, 'Chicago', 2);
insert into CITY (cityid, cityname, areaid)
values (18, 'Mönchengladbach', 9);
insert into CITY (cityid, cityname, areaid)
values (19, 'Bautzen', 5);
insert into CITY (cityid, cityname, areaid)
values (20, 'Birmensdorf', 7);
insert into CITY (cityid, cityname, areaid)
values (21, 'Seattle', 3);
insert into CITY (cityid, cityname, areaid)
values (22, 'Suwon-city', 9);
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
values (117, 'K׳¦ln', 18);
insert into CITY (cityid, cityname, areaid)
values (118, 'L''union', 9);
insert into CITY (cityid, cityname, areaid)
values (119, 'Pompeia', 13);
insert into CITY (cityid, cityname, areaid)
values (120, 'Pa׳—o de Arcos', 14);
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
values (138, 'Pa׳—o de Arcos', 17);
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
prompt 80 records loaded
prompt Loading CITIZEN...
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (1, 'Clint David', '00523206895', '75 Badalucco Road', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (2, 'Brad Bruce', '00534389353', '63 Julia', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (3, 'Edgar Bello', '00547364264', '895 Rubinek Road', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (4, 'Donal Dickinson', '0''055''0508629421', '786 Withers Road', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (5, 'Geoff MacNeil', '0021564127', '976 Franks Drive', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (6, 'Nastassja Rollins', '00524253197', '63 O''Keefe Street', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (7, 'Rosario Ceasar', '0088223394', '69 Nantes Road', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (8, 'Lydia Douglas', '00537043546', '89 Irving Road', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (9, 'Machine Presley', '00533933042', '868 Haggard Street', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (10, 'Elisabeth Wayans', '0088226157', '14 Flack Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (11, 'Joaquim Flemyng', '0092380230', '51 Sedgwick Road', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (12, 'Christian Winstone', '00535869867', '81st Street', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (13, 'Grace Penders', '0084432549', '73 Kevn Road', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (14, 'Rick Sizemore', '0042712645', '80 Cliff Street', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (15, 'Nora Wheel', '0036341768', '86 Burrows Street', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (16, 'Geraldine Crouse', '00525990664', '94 Charlottesville Drive', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (17, 'Burton Fiorentino', '00525381915', '50 Montréal Street', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (18, 'Courtney Hiatt', '00534298231', '155 Seongnam-si Drive', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (19, 'Chaka Roberts', '00543115384', '40 Stephanie', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (20, 'Rich Rourke', '00526188579', '36 Fehr Street', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (21, 'Matthew O''Neill', '0''055''0509502863', '97 Flemyng Road', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (22, 'Ceili Sandler', '00536313901', '28 Tilly Drive', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (23, 'Neneh Wright', '0021390571', '3 Amarillo Street', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (24, 'Mira Kretschmann', '00547691900', '91st Street', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (25, 'Diamond Keaton', '0088295714', '70 Hohenfels', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (26, 'Julia De Almeida', '0096572655', '86 Guy Street', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (27, 'Ronny DiCaprio', '0094415943', '21 Bo Road', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (28, 'Collective Thurman', '0096618545', '8 Depp Road', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (29, 'Emerson Neuwirth', '0''055''0502723090', '605 Costa Ave', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (30, 'Jim Streep', '00542233386', '47 Bautzen', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (31, 'Derrick Pierce', '00538224287', '18 Aidan Street', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (32, 'Selma Pleasence', '0045383903', '39 Phillips Street', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (33, 'Rowan Kahn', '0087592539', '67 Heubach', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (34, 'Roberta Puckett', '00528479257', '515 Chloe Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (35, 'Stockard Choice', '0045985411', '50 Browne Drive', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (36, 'Shirley Kennedy', '0041306397', '24 Magnuson', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (37, 'Trey Weaver', '00523669673', '82 Shreveport Road', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (38, 'Clint Boone', '00536573691', '2 Rickie Road', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (39, 'Scott Curtis-Hall', '00526214969', '808 Bergara Street', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (40, 'Belinda Reeves', '00546449823', '221 Chirignago Street', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (41, 'Meredith Beckinsale', '0033676489', '82 Holderbank Drive', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (42, 'Rachid Douglas', '0083896524', '14 Syracuse Blvd', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (43, 'Davy Harrison', '00549539811', '13rd Street', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (44, 'Jared Carlyle', '0038431755', '48 Lindo Road', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (45, 'Fiona Rosas', '0029646865', '8 Patti Blvd', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (46, 'Lesley Quatro', '00547439206', '833 Owen Street', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (47, 'Alec Haynes', '0096916861', '52nd Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (48, 'Harrison Cocker', '0031088877', '81 Soul Drive', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (49, 'Suzi Colon', '0043895397', '37 Joy Blvd', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (50, 'Kurtwood Singh', '0097584824', '60 Koyana Road', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (51, 'Alicia Potter', '0086031132', '44 Paul Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (52, 'Carl Arthur', '00538897341', '18 Cruise Drive', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (53, 'Steven von Sydow', '0044210582', '429 Sugar Hill Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (54, 'Boz Brooke', '00527334973', '975 Deschanel Blvd', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (55, 'Jared Gaines', '00524078066', '509 White Blvd', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (56, 'Ray Burmester', '0036706497', '27 Sainte-Marie Blvd', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (57, 'Carol LaBelle', '0021462878', '24 Ronny Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (58, 'Judi Cocker', '0097126614', '31 O''fallon Road', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (59, 'Emmylou Rockwell', '0084192770', '21 Lowell Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (60, 'Chely DeVito', '0041901971', '82 Lara Drive', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (61, 'Aimee Tierney', '0094052531', '53 Kochi Street', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (62, 'Dom Bruce', '0035219013', '60 McGovern Road', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (63, 'Rascal Keaton', '0032303362', '77 Sara Street', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (64, 'Tilda Leto', '0021103918', '25 Winterthur Ave', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (65, 'Anthony Aykroyd', '0095783255', '69 Micky Road', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (66, 'Steven Minogue', '0021114851', '79 Geoffrey Drive', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (67, 'Ned Robards', '0086613772', '61st Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (68, 'Arturo Grier', '0041873446', '86 Seann Drive', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (69, 'Philip Matthau', '00526025538', '49 Sorvino Road', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (70, 'Josh Savage', '0033755082', '95 Roy Parnell Ave', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (71, 'Ramsey Cherry', '0038691646', '20 Nicky Road', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (72, 'Jody Arthur', '0''055''0502157379', '484 Harper Street', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (73, 'Cevin Plummer', '00521748329', '68 Zooey Street', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (74, 'Dean Bradford', '00534191246', '12nd Street', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (75, 'Cathy Coolidge', '0''055''0504758287', '63 Chan Road', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (76, 'Nicolas Matthau', '0099103866', '87 Almaty Street', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (77, 'Adina Cartlidge', '0039318552', '259 Patty Blvd', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (78, 'Sylvester Braugher', '00528716780', '40 Roy Parnell Road', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (79, 'Lisa Rourke', '0''055''0507563134', '96 Woodland Hills Ave', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (80, 'Colin Lemmon', '0027206394', '79 Newman Road', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (81, 'Wesley Osbourne', '0''055''0502519012', '51 Reid Drive', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (82, 'Dan Botti', '0091181473', '55 Ned Blvd', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (83, 'Merle Noseworthy', '0044960506', '92 Klugh Street', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (84, 'Ruth McGovern', '0''055''0504694745', '829 Koteas Ave', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (85, 'Shirley Gunton', '00541811256', '74 Chaka Blvd', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (86, 'Maura Swayze', '0035663164', '17 Christie Street', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (87, 'Adina Hatosy', '0''055''0504903455', '13 Tarantino Road', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (88, 'Alan Harnes', '0''055''0507583419', '55 Alexander Ave', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (89, 'Eliza Mifune', '0''055''0503404035', '847 Paula Road', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (90, 'Emilio Parish', '0027731285', '564 Kiefer Street', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (91, 'Vondie Myers', '00541491664', '525 Rory Street', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (92, 'Max Laurie', '00542624031', '215 Oyten Blvd', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (93, 'Rueben Broza', '00544342378', '102 Lengdorf Street', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (94, 'Gaby Coughlan', '0043039491', '61 Wang Street', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (95, 'Juice Jordan', '0036125315', '5 Keeslar Road', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (96, 'Natacha Roundtree', '0086287495', '27 Arkin Drive', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (97, 'Charles Stanton', '0049752985', '56 Meyer Road', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (98, 'Judy Copeland', '0097117736', '72 Pigott-Smith Road', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (99, 'April Spiner', '0048787396', '417 Spears Street', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (100, 'Debby Cagle', '0086414772', '7 Paço de Arcos Street', 30);
commit;
prompt 100 records committed...
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (101, 'Clive Vannelli', '0046631418', '92nd Street', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (102, 'Hikaru McElhone', '0029194422', '928 Zurich Road', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (103, 'Jet Bacharach', '0027949429', '97 Vance Ave', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (104, 'Nik David', '00544659454', '82 Zipf Street', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (105, 'Laurie Balin', '0082106849', '89 Woodland Hills Blvd', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (106, 'Janice Tucker', '00547225851', '75 Robby Road', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (107, 'Dwight Moriarty', '0''055''0504795925', '408 Daniels Drive', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (108, 'Famke Craig', '0084508958', '8 Moreno Blvd', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (109, 'Simon Wainwright', '00522829466', '993 Lena Road', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (110, 'Cole McKennitt', '00533722789', '24 Indianapolis Road', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (111, 'Miranda Tinsley', '0046894991', '33rd Street', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (112, 'Beth Cheadle', '0''055''0505077614', '796 MacLachlan Street', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (113, 'Lari Bates', '0083242095', '85 Wang Road', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (114, 'Curtis Salt', '00543787159', '80 Ewan Road', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (115, 'Salma Solido', '0091880680', '72 Carol Road', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (116, 'Adrien Loggia', '0089291909', '85 Branch Street', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (117, 'Woody Cooper', '00523591547', '53rd Street', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (118, 'Merillee Hughes', '0085681993', '7 Saxon Blvd', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (119, 'Emilio Moss', '0036998988', '975 St Jean de Soudain Street', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (120, 'Rosco Harrelson', '0081751185', '63 Tanon Road', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (121, 'Jackson Kravitz', '0037094481', '62 Narrows', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (122, 'Val Trejo', '0094271759', '83 Chur Drive', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (123, 'Lynn Costello', '0092897368', '73rd Street', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (124, 'Leelee Head', '0094990443', '81 Patricia', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (125, 'Emily Hawkins', '0''055''0504962652', '99 Kyra Street', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (126, 'Robby Jeffreys', '00544991139', '11 Reiner Road', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (127, 'Jesse Huston', '0047225555', '9 Sara Road', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (128, 'Sissy Richards', '0''055''0504225847', '5 Kwun Tong Street', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (129, 'Judge Mattea', '00523985057', '913 Lofgren Street', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (130, 'Carl Idol', '00531250819', '91 Lynette Street', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (131, 'Karon Leachman', '0097640526', '8 Nikki Street', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (132, 'Julia Jones', '00544920083', '7 Malmö Street', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (133, 'Connie Astin', '0022101863', '47 Howard Road', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (134, 'Courtney Stiles', '0093805604', '70 Harrison Road', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (135, 'Clint Eldard', '00522757855', '74 Andrew Blvd', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (136, 'Campbell Aglukark', '00534275661', '98 Palmer Ave', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (137, 'Maury Landau', '00534310018', '9 Mitra Road', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (138, 'Rupert Harrelson', '00538000168', '73 Belushi Street', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (139, 'Dan Kudrow', '0083221518', '85 Witherspoon Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (140, 'Kelli Gryner', '00533718897', '47 Butner Street', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (141, 'Jeff Reynolds', '0095489662', '53 Whitaker Street', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (142, 'Ernie Moody', '0024786178', '55 Terrasa Road', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (143, 'Matthew Secada', '0039628110', '66 Eiksmarka Blvd', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (144, 'Penelope Dafoe', '0039359338', '60 Koteas', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (145, 'Madeleine Dickinson', '0''055''0507311052', '81 Plummer Road', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (146, 'Cornell Stevenson', '00541448290', '50 Boyle Road', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (147, 'Kevn Eckhart', '00533897373', '22 Cledus Drive', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (148, 'Seann Stanton', '00535477247', '66 Adelaide Ave', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (149, 'Tcheky Kier', '0089532994', '912 Martha', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (150, 'Jean-Luc McBride', '0''055''0509202512', '98 Mayfield Village Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (151, 'Marisa Craddock', '0039398164', '83 Barbara Drive', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (152, 'Mandy Knight', '00534396945', '78 Palin Street', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (153, 'Carol Spader', '00526028416', '403 Macht Road', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (154, 'Marlon Rowlands', '0''055''0505300324', '91 Santa Clarita Street', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (155, 'Jessica Dolenz', '00542515111', '6 Hoffman Street', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (156, 'Murray Douglas', '00528222613', '95 Mint Street', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (157, 'Ming-Na Hall', '00542299556', '524 Conshohocken Road', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (158, 'Rolando Field', '0092630855', '44 Auckland Street', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (159, 'Neil Patton', '0089140791', '9 Hercules Street', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (160, 'Beverley Nivola', '0031817774', '4 Holbrook Drive', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (161, 'Bobby Adler', '00526995769', '12 Mint Ave', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (162, 'Bradley Pitney', '00527537898', '42 Rourke Drive', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (163, 'Ronny Beckham', '0039940325', '88 Moraz Ave', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (164, 'Hector Woodard', '00548696707', '812 Birmingham Road', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (165, 'Gates Cassel', '0''055''0505210313', '550 Martinez Street', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (166, 'Isaiah Moreno', '0''055''0505070253', '40 Kinney', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (167, 'Mae Hutch', '00535857953', '10 Natalie Street', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (168, 'Tzi Lowe', '0''055''0507330459', '43rd Street', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (169, 'Philip Gyllenhaal', '00526971758', '12nd Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (170, 'Vince Madsen', '0082850515', '24 Oldham Drive', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (171, 'Hal Gough', '0023141355', '11st Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (172, 'Maury Davis', '0081234015', '483 Logue Drive', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (173, 'Harold Roundtree', '0041456781', '17 Rob Drive', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (174, 'Merle Rain', '0096543487', '582 Lindo Street', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (175, 'Nikka Soul', '00538362146', '38 Leawood Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (176, 'Heather Cobbs', '0083795722', '73 Biehn Street', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (177, 'Alana Shalhoub', '00545376613', '81st Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (178, 'Lydia Ryder', '0027402997', '55 Conlee Street', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (179, 'Temuera Liotta', '0023618135', '100 Osbourne Road', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (180, 'Lea Saxon', '00545541787', '40 Lynch', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (181, 'Rhona Blaine', '00524131883', '62nd Street', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (182, 'Rod Ferry', '00537552183', '16 Gaithersburg Road', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (183, 'Miguel Blossoms', '0036984727', '15 Orbit Road', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (184, 'Jake Marsden', '0034700374', '23 Reeve Blvd', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (185, 'Mia Garber', '00546031484', '15 McIntosh Drive', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (186, 'Nicole Sevigny', '00531996217', '74 Renfro Drive', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (187, 'Ruth Flatts', '00544869044', '54 Nelson Road', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (188, 'Benjamin Lennox', '00534476572', '19 Marlboro Road', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (189, 'Karon Zeta-Jones', '0034232142', '81 Jonze Road', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (190, 'Daryl Cube', '00547855094', '32 Clinton Drive', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (191, 'Ellen MacNeil', '0027547217', '634 Dorval Drive', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (192, 'Lucinda Thomson', '00546497466', '29 Miki Road', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (193, 'Larry Drive', '00523541011', '3 McGregor Road', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (194, 'Jackson Willard', '0031691016', '38 Lakeville Street', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (195, 'Gloria Nunn', '00538978413', '51 Ford Street', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (196, 'Maura Tripplehorn', '0034354666', '34 Exeter Road', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (197, 'Richard Easton', '0089039788', '79 Kazem Blvd', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (198, 'Vanessa Macht', '00522444808', '73rd Street', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (199, 'Al Applegate', '0047052033', '25 Arkin Ave', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (200, 'Cole Ramirez', '0098918151', '63 Benoit Drive', 19);
commit;
prompt 200 records committed...
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (201, 'Seth Milsap', '0027729645', '46 Avital Road', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (202, 'Marlon Azaria', '0028878796', '268 Osborne Street', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (203, 'Johnny Brothers', '00532498366', '142 Rachid Street', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (204, 'Stellan Wagner', '0''055''0504416161', '78 Burlington Drive', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (205, 'Melba Balaban', '00524038452', '23rd Street', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (206, 'Chi Robards', '0045906154', '96 Culkin Street', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (207, 'Frederic Rippy', '0037183471', '81st Street', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (208, 'Vincent Brooke', '00541860587', '94 El Segundo Street', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (209, 'Diane Kattan', '0036906177', '59 Ritchie Road', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (210, 'Cheech McCoy', '0022527510', '81 Thessaloniki Drive', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (211, 'Elle Connelly', '0034992880', '85 Monterrey Street', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (212, 'Ali Plowright', '0023061070', '62 Nora Drive', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (213, 'Fred Zevon', '0084991028', '428 Rizzo Drive', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (214, 'Debi Russell', '0099080928', '98 Horton Road', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (215, 'Brian Goldberg', '00536845404', '44 Kramer Road', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (216, 'Rachid Giannini', '0093544372', '5 McNarland Road', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (217, 'Chloe Saucedo', '0094493241', '51 Costner Road', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (218, 'Melba Williams', '0042774529', '41st Street', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (219, 'Dionne Holbrook', '0087731479', '62 Rains', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (220, 'Vin Connelly', '00546463130', '12nd Street', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (221, 'Ernie Seagal', '00537717994', '71 Cockburn Drive', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (222, 'Trini Giamatti', '0''055''0502415311', '4 Ty Road', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (223, 'Marty Scorsese', '0028281171', '92 King of Prussia Road', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (224, 'Cole Marshall', '00523459644', '62nd Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (225, 'Rhona Cocker', '0044915284', '469 Oates Street', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (226, 'Merillee Fogerty', '0025021484', '337 Heron Blvd', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (227, 'Kathy Lowe', '0094438947', '4 Garland Drive', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (228, 'Night Stormare', '0043663863', '100 Loring Street', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (229, 'Marley Baldwin', '00538889299', '13 Vienna Road', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (230, 'Vertical Goodall', '00544975192', '82nd Street', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (231, 'Coley Griffin', '0049593403', '84 Trace Street', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (232, 'Meryl Cobbs', '0093186130', '30 Joseph Drive', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (233, 'Rachel Short', '00544619064', '83 Rawls Street', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (234, 'Arturo Salt', '00539197054', '21 Roddy Road', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (235, 'Casey Lee', '0089389910', '82 Condition Road', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (236, 'Leelee Chan', '0097582550', '39 Berry Road', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (237, 'Stephen McGovern', '0095408335', '47 Holland', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (238, 'Larnelle Jenkins', '0041321343', '45 Fredericia Ave', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (239, 'Hal Milsap', '00542739061', '16 Charlie Blvd', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (240, 'Chi Barry', '0029424255', '57 Horb Road', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (241, 'Kitty Liotta', '0038277836', '12 Rotterdam Road', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (242, 'Catherine Cross', '0097845563', '22nd Street', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (243, 'Guy Tobolowsky', '00523938762', '83 Carol Street', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (244, 'Rosanne Schiff', '0''055''0506446911', '565 Swank Drive', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (245, 'Donna Statham', '0044295552', '31 Pompton Plains Blvd', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (246, 'Anita Sweeney', '0034631703', '14 Theron Blvd', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (247, 'Anna Walken', '00524837789', '2 Huntington Street', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (248, 'Sean Dillon', '0032657922', '29 Williams Road', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (249, 'Annette Jackson', '0084391246', '93 Rome', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (250, 'Kim Jolie', '0049554195', '80 Miranda', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (251, 'Udo Chapman', '0037969008', '58 Kidman Road', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (252, 'Gilberto Hewett', '0''055''0502557901', '237 Ojeda Drive', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (253, 'Ashton Marley', '00524852042', '14 Knutsford Ave', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (254, 'Juan Nicholas', '0032144947', '12 Bullock Blvd', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (255, 'Rhona Taha', '00533171805', '20 Remy Blvd', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (256, 'Frank Oakenfold', '0048029113', '70 Evett Drive', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (257, 'Morris Savage', '0095075236', '872 Elisabeth Road', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (258, 'Phil Conlee', '0022419834', '611 Isaac Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (259, 'Keith Nugent', '0029195974', '34 Allan Road', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (260, 'Forest Elizondo', '0023029340', '985 Burrows Road', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (261, 'Caroline Huston', '00539524805', '72 Sutherland Road', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (262, 'Isaac Botti', '0089389518', '903 Renfro Street', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (263, 'Frederic Penders', '0092316807', '20 Cobbs Ave', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (264, 'Lance Platt', '0034834032', '58 Denis Street', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (265, 'Brian Cash', '0046703923', '49 Glover Drive', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (266, 'Lucy Holy', '0''055''0508858578', '6 Jean-Luc Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (267, 'Crystal Stevens', '00532369044', '77 Byrne Ave', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (268, 'Richie Romijn-Stamos', '0042841899', '63 Nynäshamn', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (269, 'Joseph Brosnan', '0''055''0501254163', '228 Pollak Street', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (270, 'Tom McGill', '0036705823', '51 Carlyle Blvd', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (271, 'Woody Taylor', '0087752646', '94 Jean-Luc Drive', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (272, 'Desmond Eldard', '0088220566', '99 Kay Blvd', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (273, 'Willie Goldblum', '0093373907', '84 Harris Street', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (274, 'Joan Hyde', '0094153404', '42 Day-Lewis Ave', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (275, 'Minnie DiBiasio', '00535354251', '81 Stigers Ave', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (276, 'Dennis Begley', '00541284480', '22 Niven Street', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (277, 'Red Alexander', '0087777707', '19 Nicholson', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (278, 'Oliver Plowright', '0097827783', '41 Roth Blvd', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (279, 'Brian Lovitz', '0084086503', '48 Makowicz Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (280, 'Vanessa Kattan', '0096737666', '100 Buffalo Grove Blvd', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (281, 'Charles Levine', '0084001011', '665 Milano Ave', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (282, 'Andre Harris', '00524065620', '93 Kinney Drive', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (283, 'Pam Northam', '0042364033', '30 Garza Blvd', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (284, 'Frances Pryce', '0''055''0507991021', '45 Robinson Road', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (285, 'Michael Rush', '0036747766', '69 Hillerød', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (286, 'Cheech Lynch', '00523160751', '57 Griggs Drive', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (287, 'Chaka Fishburne', '0083191526', '47 Stockard Street', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (288, 'Lionel Silverman', '0''055''0501396660', '14 Ebersdorf Road', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (289, 'Pierce Hampton', '00527305401', '8 Shaye', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (290, 'Simon Linney', '0095133763', '38 Dar Street', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (291, 'Shawn Seagal', '0081165380', '82 Child Ave', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (292, 'Lili Carrack', '00541716255', '76 Graham Blvd', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (293, 'Sinead Paltrow', '00529348514', '73 Heron Blvd', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (294, 'Pelvic Cherry', '00526046559', '34 Joe Street', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (295, 'Philip Dunn', '0034345117', '34 DeLuise Street', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (296, 'Coley Krumholtz', '00546816031', '651 Albright Street', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (297, 'Kristin Lynne', '0024388564', '755 Isaiah Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (298, 'Jarvis Rubinek', '0034021540', '64 Rosco Street', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (299, 'Armin Stevenson', '00547344621', '104 Haslam Drive', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (300, 'Minnie McCracken', '0''055''0505239423', '1 Vanessa Ave', 30);
commit;
prompt 300 records committed...
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (301, 'Gladys Hackman', '00548296789', '1 Colleen', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (302, 'Geraldine Dunn', '0087698469', '93 Norm Drive', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (303, 'Donald MacDowell', '00539308932', '68 Dortmund Drive', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (304, 'David Lewis', '0095111920', '8 Rodgers Street', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (305, 'Delbert Watley', '00549151276', '39 Hanley Drive', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (306, 'Rachael Cagle', '0029952850', '37 Belle Road', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (307, 'Charlize Fiorentino', '0081515190', '141 Stuart Drive', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (308, 'Mika Schock', '0044366860', '53 Beals Road', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (309, 'Mira Dukakis', '0091227264', '323 Thora Road', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (310, 'Maxine Bullock', '00549225564', '52nd Street', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (311, 'France Hopper', '0091691534', '53 Eastwood Drive', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (312, 'Rosco Rhodes', '0''055''0504512117', '82 Fort Lewis Road', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (313, 'Julia Cromwell', '0027324185', '87 Redwood Shores Blvd', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (314, 'Fionnula Moreno', '0036115128', '827 Stockholm Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (315, 'Bonnie Bradford', '0045437859', '52nd Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (316, 'Wendy Downey', '0082439125', '312 Sam Street', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (317, 'Tcheky Morton', '00544268248', '51 Wiedlin Street', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (318, 'Lance Reeves', '0036445359', '684 Carmen Road', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (319, 'Isaiah Pullman', '0096027126', '38 Katrin Road', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (320, 'Charlton Stamp', '0081068319', '59 Eschborn Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (321, 'Roy Borgnine', '0''055''0505716647', '24 Satriani Road', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (322, 'Christian Finn', '00547853786', '59 Wes Drive', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (323, 'Lara Flatts', '0086040015', '372 Tallahassee Drive', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (324, 'Tyrone Sweeney', '0091903574', '25 Coolidge Blvd', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (325, 'Mykelti Berenger', '00527731529', '59 Rodriguez Drive', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (326, 'Julio Salonga', '00542831478', '92nd Street', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (327, 'Colm Mitra', '00537285754', '8 Edmonton Road', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (328, 'Natasha Dern', '0096489704', '59 Prinze Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (329, 'Ozzy Lee', '0024655726', '62nd Street', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (330, 'Glenn Gray', '0022726023', '59 Richmond Hill Road', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (331, 'Joy Reeve', '0086906501', '918 Rueil-Malmaison Drive', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (332, 'Wayman Peterson', '0047383681', '38 Reese Road', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (333, 'Franz Cassel', '00525116554', '52 Kelly Street', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (334, 'Denis Richter', '00521632005', '6 Belushi Drive', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (335, 'Judy Ticotin', '0022082733', '65 Bean Drive', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (336, 'Hope Goldwyn', '0025595824', '13rd Street', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (337, 'Merillee Rosas', '0045197652', '54 Pressly Blvd', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (338, 'Donal Spacey', '0037384279', '40 Tolkan', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (339, 'Don Lineback', '0081637058', '64 Drew Road', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (340, 'Hugo Durning', '0086981488', '90 Miller Road', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (341, 'Anna Rains', '00545506123', '61 Choice Drive', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (342, 'CeCe Bonham', '0089481616', '23 Ford Road', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (343, 'Melanie Heald', '0''055''0506604830', '6 Bristol Street', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (344, 'Micky Parsons', '00536016872', '47 Tara Blvd', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (345, 'Benicio Gibson', '00541790348', '14 Secada Street', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (346, 'Trey Allison', '0''055''0503377365', '80 Eckhart Ave', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (347, 'Selma Norton', '0094907457', '15 Lopez Road', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (348, 'Denis Bosco', '0086906044', '64 Ed Drive', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (349, 'Chaka Polito', '0037959679', '39 Boise Drive', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (350, 'Nicholas Diggs', '00528731955', '8 Belinda Street', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (351, 'Mos Cox', '0028936304', '942 Downey', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (352, 'Tanya Farrell', '0''055''0506929015', '40 Jonny Drive', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (353, 'Cheryl Liotta', '0022127389', '52 Madrid Drive', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (354, 'Carole Creek', '0026935445', '645 Vannelli Blvd', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (355, 'Jonny Kier', '00522234400', '51 Witt', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (356, 'Mary Beth Crouse', '0098040069', '74 Art Blvd', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (357, 'Merrilee Posey', '00538633723', '102 Wolf Street', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (358, 'Marty Leguizamo', '0''055''0505854043', '831 Pelvic Drive', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (359, 'Antonio Reiner', '0''055''0507630634', '42 Pesci Street', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (360, 'Austin Bruce', '0034329225', '89 Debbie Street', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (361, 'Bill Faithfull', '0033645032', '94 Blackwell Drive', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (362, 'Andie Minogue', '00524771545', '80 Phoenix Road', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (363, 'Catherine Womack', '0037313586', '95 Soul Blvd', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (364, 'Treat Lavigne', '0029083031', '63rd Street', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (365, 'Kay Coburn', '0096108808', '85 Archbold Blvd', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (366, 'Gabriel Cross', '0098710605', '55 Gleeson', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (367, 'Nick McIntosh', '0096479466', '59 O''fallon Drive', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (368, 'James Nelligan', '0026860464', '20 Delbert Street', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (369, 'Corey Blige', '00521684110', '79 Tippe Road', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (370, 'Suzanne Easton', '0093642322', '44 Tamala Blvd', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (371, 'Rene Krieger', '0046130742', '21 Polley Street', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (372, 'Blair Caviezel', '00522760304', '83rd Street', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (373, 'Greg Khan', '0035313072', '35 Hjallerup Drive', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (374, 'Lesley Jackson', '00521898703', '487 Gilbert Road', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (375, 'Gates Miles', '0048473256', '68 Americana Drive', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (376, 'Lou Pierce', '0088075548', '93rd Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (377, 'Corey Brown', '0082665687', '82 Roberts Road', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (378, 'Colm Torn', '00523650282', '73 Warrenton Street', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (379, 'Andre Quinn', '0028391525', '38 Emilio Street', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (380, 'Edwin Brandt', '00531824156', '6 Paul Road', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (381, 'Holly Skaggs', '00535531738', '15 Thora Road', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (382, 'Jared Lee', '0049158536', '4 Lesley Road', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (383, 'Don Shaye', '00528271296', '1 Sellers Drive', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (384, 'Gino Boorem', '00538650677', '60 Augst', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (385, 'Petula Flack', '0''055''0504238261', '33rd Street', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (386, 'King Hershey', '0085616725', '155 Caroline Drive', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (387, 'Rachel Cummings', '00546655102', '91st Street', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (388, 'Mel England', '0048228974', '18 Terrence Street', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (389, 'Jesse Pony', '00523584965', '41 Mel Road', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (390, 'Goldie Twilley', '0094579427', '19 Newman Blvd', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (391, 'Ruth Unger', '0096344303', '36 Grier Drive', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (392, 'Clint McNarland', '0034198499', '53 Rush Drive', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (393, 'Chet Matarazzo', '0049917163', '21 McNeice Drive', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (394, 'Raymond Leto', '00529289013', '82 Thewlis Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (395, 'Chalee Benson', '0037887367', '495 Jake Ave', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (396, 'Noah O''Sullivan', '0097801581', '28 Martin Drive', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (397, 'Pete Steenburgen', '0081758459', '924 Gagnon Drive', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (398, 'Lennie James', '0094013413', '24 Madsen Drive', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (399, 'Amanda Liotta', '0''055''0505136325', '20 Sigourney', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (400, 'Selma Imperioli', '0083449390', '36 Ripley Road', 24);
commit;
prompt 400 records committed...
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (401, 'Carlene Hawthorne', '0''055''0502890981', '45 Antwerpen Street', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (402, 'Burt Hampton', '0089253116', '81st Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (403, 'Claire Cozier', '0034524849', '62nd Street', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (404, 'Roddy Cross', '00523336262', '42 Enfield Road', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (405, 'Gary Kweller', '00539332310', '58 Suberg Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (406, 'Alannah Giamatti', '00541839486', '479 Ciudad del Este Drive', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (407, 'Devon Paltrow', '00548244220', '88 Landau Blvd', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (408, 'Sheena Fraser', '00539773615', '882 West Drayton', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (409, 'Lily Berkley', '0''055''0504170858', '39 Boulder Road', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (410, 'Vanessa Vance', '0021876012', '88 Tankard Street', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (411, 'Grace Gosdin', '0089565720', '719 Carl Drive', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (412, 'Jude Horizon', '00537160824', '83rd Street', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (413, 'Bobby Joli', '0026288558', '32 Jones Road', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (414, 'Cesar Emmerich', '00542629072', '34 Wien Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (415, 'Maury Van Damme', '00545392268', '963 Ratzenberger Street', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (416, 'Stewart Forrest', '0095856626', '85 Bette Ave', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (417, 'Lena White', '0087634499', '59 Caan Drive', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (418, 'Andie Butler', '00525542985', '65 McCormack Drive', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (419, 'Alfred Beals', '0029469809', '49 Donovan Road', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (420, 'Donald Carr', '0''055''0509513723', '95 Toronto Drive', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (421, 'Laurence Scaggs', '0092253388', '88 Roth Street', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (422, 'Avril Masur', '0028323499', '81 Soda Blvd', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (423, 'Cuba Pullman', '0095127142', '14 Child Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (424, 'Jackson Alston', '00534486618', '42nd Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (425, 'Ellen Hayek', '0024315080', '381 Studi Road', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (426, 'Pat Frampton', '00547176658', '8 Gainesville Ave', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (427, 'Sylvester Payne', '00539951453', '56 Fichtner', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (428, 'Eliza Shawn', '00546177368', '620 Christian', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (429, 'Jaime Marie', '00528656052', '37 Alfred', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (430, 'Carla Stoltz', '00538639797', '73rd Street', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (431, 'Tommy Winger', '0099815518', '701 Spector Street', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (432, 'Collin Englund', '0''055''0509969069', '7 Boone Drive', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (433, 'Malcolm Hudson', '0''055''0505273126', '9 Brooks Road', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (434, 'Dave Klein', '00541158864', '88 Thornton', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (435, 'Jean Schneider', '0''055''0508376914', '618 Thames Ditton Street', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (436, 'Maceo Speaks', '00541542588', '41 Redwood City Street', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (437, 'Denise Dempsey', '0''055''0505082477', '37 Finney Street', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (438, 'Ruth Lopez', '0043592787', '21 Colon Street', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (439, 'Keith Withers', '00539311360', '73rd Street', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (440, 'Pam Leachman', '00531546296', '87 Austin Ave', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (441, 'Hugh Davies', '00525263791', '93rd Street', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (442, 'Nina Plummer', '0082071598', '69 Jackie Street', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (443, 'Jonny Faithfull', '00534343241', '80 Charles Road', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (444, 'Elias Ripley', '0046732219', '63 Diesel Street', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (445, 'Candice Voight', '0036068344', '36 Carnes Blvd', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (446, 'Timothy McKennitt', '00543466732', '17 Geneva Drive', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (447, 'Rutger Cagle', '0093046632', '85 Haverhill', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (448, 'Betty Polley', '00522901899', '79 Darren Street', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (449, 'Maceo McDowell', '0028579800', '60 Rea', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (450, 'Kyle Holden', '0''055''0508430137', '61st Street', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (451, 'Vern Kravitz', '00528390875', '42 Shirley Road', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (452, 'Nicolas Mazar', '0046696979', '71 Vannelli', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (453, 'Graham Mitra', '00547494721', '59 Luis Street', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (454, 'Christmas Whitman', '0''055''0503231201', '26 Griggs Street', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (455, 'Lynette Butler', '0''055''0509665718', '182 Barry Road', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (456, 'Merillee Whitaker', '0088778662', '518 Coimbra Street', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (457, 'Taryn Goodall', '00549477231', '56 Rickie Ave', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (458, 'Cherry McGriff', '00534572008', '75 Maceio Road', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (459, 'Hugo Sutherland', '00533201288', '57 West Monroe Road', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (460, 'Rebeka Preston', '0037975725', '27 Tarantino Road', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (461, 'Lucy Fichtner', '0089559393', '653 Patrick Drive', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (462, 'Jodie Neeson', '00529281278', '72 Richardson Ave', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (463, 'Thelma Penn', '0''055''0508228380', '71 Hutch Blvd', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (464, 'Kris Niven', '0043570778', '53 Laurie Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (465, 'Rufus Harry', '0081130636', '12 Sirtis Drive', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (466, 'Freddy Warren', '00521460066', '91 Burstyn Road', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (467, 'Victoria Rucker', '0095660329', '30 Steenburgen Ave', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (468, 'Burt Crudup', '00521120705', '32 Donal Drive', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (469, 'Alan Ripley', '00541177036', '42nd Street', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (470, 'Hector Portman', '0092428246', '17 Cockburn Road', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (471, 'LeVar Thomas', '0035734027', '76 Caan Drive', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (472, 'Mel Michaels', '00523917319', '91 Moody Drive', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (473, 'Annie Emmett', '0098971158', '12nd Street', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (474, 'Morgan Huston', '0089674705', '86 Salonga Drive', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (475, 'Xander Postlethwaite', '0036125764', '948 Idol Blvd', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (476, 'Mary-Louise Gaynor', '0044031133', '53 Snow Road', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (477, 'Larenz Lightfoot', '0''055''0506045144', '56 Pamela Road', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (478, 'Mary-Louise Hauer', '00542209625', '9 Greene Drive', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (479, 'Nina Bassett', '0081779646', '51 Donelly Blvd', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (480, 'Rosie Finn', '0027761861', '76 Todd Road', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (481, 'King Thurman', '0047117126', '89 Franco Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (482, 'Gabrielle Kristofferson', '00527734795', '81st Street', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (483, 'Joaquin Cantrell', '0''055''0501473148', '10 Checker Road', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (484, 'Donna Parish', '00541508420', '40 Brolin Road', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (485, 'Martha Ferrell', '0047673222', '597 Utada Road', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (486, 'Freda Van Der Beek', '00549584722', '9 Val Road', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (487, 'Heath Emmerich', '0037346230', '11st Street', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (488, 'Johnny Clayton', '0038771374', '693 Derek Street', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (489, 'Robert Pearce', '0082542200', '633 Gina Road', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (490, 'Juliana MacDowell', '0036846770', '531 Highlands Ranch Blvd', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (491, 'Sylvester Wilder', '0023549901', '4 Trevino Road', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (492, 'Oliver Redford', '00522099596', '58 DeVito Road', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (493, 'Mena Flanery', '0''055''0509654557', '997 Jet Road', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (494, 'Gena Hornsby', '0087378292', '43 Davidson Street', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (495, 'Scarlett Crystal', '0086426985', '983 Rachael Blvd', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (496, 'Jake Aaron', '00542775373', '67 Lucas Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (497, 'Woody MacDonald', '0''055''0503848724', '32 Perlman Road', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (498, 'Brenda Bush', '00546487726', '18 Wright Drive', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (499, 'Rhett Carmen', '00541899763', '2 Rea Street', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (500, 'Simon Murphy', '0046480301', '60 Lily Drive', 30);
commit;
prompt 500 records committed...
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (501, 'Vanessa Blackwell', '0024810965', '31 Eddie Street', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (502, 'Ann Goldwyn', '00528393771', '53 Boyd Street', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (503, 'Russell Carradine', '0026889360', '378 Torino Street', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (504, 'Debby Basinger', '0097558201', '56 Redford', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (505, 'Keanu Lucas', '0094079733', '40 Bette Street', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (506, 'Vanessa Tripplehorn', '00521303739', '14 Wellington', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (507, 'Denise Red', '0031765073', '57 Meppel Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (508, 'Naomi Lovitz', '00543271963', '52nd Street', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (509, 'Daniel Kutcher', '0032948751', '39 Burton Drive', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (510, 'Randy Keith', '0''055''0507914176', '26 Soroe Drive', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (511, 'Cyndi Ferrer', '0034449226', '772 Sandoval Ave', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (512, 'Lesley Mathis', '0036230411', '32 Shorter Road', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (513, 'Mary Sewell', '00529791356', '88 Donelly Road', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (514, 'Garland Folds', '00544607098', '56 Lachey Street', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (515, 'Matt Cotton', '00523957001', '63 Herzogenrath Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (516, 'Christmas Lennix', '0''055''0502405021', '23 Itu Street', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (517, 'Rickie Frampton', '0099619379', '18 Cheadle Ave', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (518, 'Coley Bridges', '00523213626', '79 Trey Drive', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (519, 'Tony Sanchez', '0026101416', '47 Turku Drive', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (520, 'Allison Worrell', '0038159635', '95 Lineback Road', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (521, 'Debi Chandler', '0049013184', '24 Torino Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (522, 'Joey Warwick', '0046795385', '85 Brosnan Drive', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (523, 'Edwin Hobson', '00545673031', '12nd Street', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (524, 'Taryn Reeve', '00548685486', '74 Rock Road', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (525, 'Emma Haslam', '0081675757', '16 Vin Ave', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (526, 'Aaron Shandling', '00541688666', '37 Marsden Blvd', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (527, 'Liam Aaron', '0084170401', '53rd Street', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (528, 'Grant Atlas', '00538912188', '83 Corona Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (529, 'Jonny Lee Arkin', '0098162444', '201 Porter Drive', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (530, 'Scarlett Myles', '0026068596', '64 Zevon Drive', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (531, 'Daniel Heslov', '0048518964', '8 Thin Drive', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (532, 'Queen Lowe', '0''055''0501581935', '437 Dublin Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (533, 'Azucar Tate', '0''055''0507623159', '463 Burstyn Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (534, 'Geoffrey Streep', '00546032601', '85 Hirsch Drive', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (535, 'Nils Cornell', '00531482738', '89 Flemyng Road', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (536, 'Amy Shatner', '0023700330', '100 Ian Street', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (537, 'Alan Hewitt', '00523992026', '151 Madrid Street', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (538, 'Geggy Uggams', '0''055''0501513750', '19 Leinfelden-Echterdin Ave', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (539, 'Kenny Jane', '0031411507', '45 Robards Street', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (540, 'Marc Cumming', '00538716567', '78 Frost Drive', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (541, 'Dianne Arkin', '00539945163', '37 Tripplehorn Blvd', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (542, 'Dar Fariq', '0035104529', '57 Feuerstein Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (543, 'Freddy Garfunkel', '0048727013', '32 Denzel', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (544, 'Emerson Keaton', '00549653572', '47 LuPone Street', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (545, 'Ani Neill', '0083540949', '355 Belle Street', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (546, 'First Deejay', '00543719409', '53 Jeter Road', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (547, 'Halle Imperioli', '0039400501', '8 Coslada Drive', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (548, 'Natascha Sampson', '00543170506', '19 Pensacola Blvd', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (549, 'Eugene Durning', '0084157854', '59 Duke Drive', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (550, 'Colleen Rubinek', '0043295211', '338 Duncan Drive', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (551, 'Etta Stills', '00535626113', '948 Sample Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (552, 'Michelle El-Saher', '0''055''0501968518', '28 Ojeda Blvd', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (553, 'Patty Judd', '0041934777', '65 Craven Blvd', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (554, 'Jack Suchet', '0''055''0507660738', '24 Swarthmore Ave', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (555, 'Carla Irons', '0041247730', '42 Trieste Road', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (556, 'Terry Hyde', '0048925316', '100 Twilley Drive', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (557, 'Miki Landau', '00527405485', '31st Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (558, 'Kristin Delta', '00534251450', '9 Lonnie Street', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (559, 'Chazz Joli', '0047353615', '65 Miriam Drive', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (560, 'Gino Platt', '0083402077', '584 Gallagher Road', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (561, 'Robby Dean', '0''055''0504635173', '84 Stocksbridge Road', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (562, 'Bridgette Curtis', '00531004111', '591 Gavin Road', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (563, 'Tyrone Page', '0037763489', '62nd Street', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (564, 'Adrien Carrack', '0033618711', '97 Sonny Drive', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (565, 'Donal Hayek', '00532315399', '13rd Street', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (566, 'Spike Firth', '00527603873', '73 Taylor Street', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (567, 'Beverley LaBelle', '00528574725', '70 Berenger Drive', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (568, 'Naomi Todd', '0092427930', '26 Yamaguchi Road', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (569, 'Nicholas Feliciano', '0029994313', '48 El-Saher Drive', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (570, 'Sammy Van Shelton', '0097019002', '73 Sydney Ave', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (571, 'Daryle Esposito', '00532779804', '29 Rea Street', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (572, 'Juice Hubbard', '00543388254', '455 Bancroft Street', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (573, 'Mos Lewis', '0025708136', '51 Clarkson Street', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (574, 'Mary Wheel', '00522361346', '75 Alan Road', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (575, 'Natalie Pleasence', '0047156299', '48 Valentin', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (576, 'Hilton Plummer', '0''055''0503881969', '43 Wendy Street', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (577, 'Emerson King', '0091921963', '67 Eckhart', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (578, 'Sarah Turturro', '0084171972', '42nd Street', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (579, 'Tamala Checker', '0''055''0509903721', '88 Chalee Drive', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (580, 'Jonny D''Onofrio', '0046777583', '60 Gallant Drive', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (581, 'Vincent Peniston', '0024412736', '63 Cash Ave', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (582, 'Courtney Brando', '0087299299', '89 Springfield Street', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (583, 'Salma Wincott', '0046894424', '703 Katrin Blvd', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (584, 'Trini Shaw', '0028653713', '54 Gauteng', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (585, 'Angelina Lunch', '0047878715', '509 Julianna Ave', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (586, 'Scott Rhymes', '0''055''0509274777', '75 Caroline Ave', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (587, 'Nikka Crowe', '0048870081', '76 Piacenza Blvd', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (588, 'Lou Margolyes', '0091319864', '81st Street', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (589, 'Carrie-Anne Dayne', '00531988910', '79 Morse Drive', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (590, 'Lonnie Kennedy', '0''055''0501302636', '84 Holeman Street', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (591, 'Rhea Condition', '0032348653', '74 Odense Street', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (592, 'Don Sepulveda', '0033576383', '17 Carter Blvd', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (593, 'David Springfield', '00545660355', '13 Kreuzau Road', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (594, 'Trey Lane', '0025192476', '36 Schiff Street', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (595, 'Merillee Mazar', '00546510698', '67 David Road', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (596, 'Kate Dourif', '0084824005', '41st Street', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (597, 'Trace McGregor', '0''055''0504024118', '86 Freda Road', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (598, 'Michael McGriff', '0''055''0504132552', '33rd Street', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (599, 'Daryle Gough', '00528867775', '70 Cassel Blvd', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (600, 'Dick Broza', '0036099399', '840 Bradenton Blvd', 26);
commit;
prompt 600 records committed...
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (601, 'Chad Torn', '0047741442', '32 Lennie Drive', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (602, 'Tramaine Vance', '0091826249', '96 Salisbury Street', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (603, 'Timothy Rivers', '00541341719', '91 David Street', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (604, 'Trey Willis', '0''055''0508276158', '91 Giraldo Street', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (605, 'Katrin Ford', '0045734014', '36 Rupert Drive', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (606, 'Ronny Cross', '0025527679', '34 Green bay Blvd', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (607, 'Thomas Craig', '0028407263', '74 Frankfurt Street', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (608, 'Jeff Peterson', '00547982678', '94 Takapuna Street', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (609, 'Bret Jenkins', '0023708705', '82 S. Bernardo do Campo Road', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (610, 'Hector Mraz', '00539152174', '30 Mathis Road', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (611, 'Rik Sedgwick', '0088020879', '533 Leo Street', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (612, 'Ricardo Kurtz', '00542359627', '81 Novara', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (613, 'Shelby Murphy', '0022898908', '92 Aaron Drive', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (614, 'Bridget Dayne', '00541744186', '72 Solido Street', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (615, 'Will Torn', '00537131250', '25 Danes Ave', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (616, 'Candice Gayle', '00547503348', '32 Juliana Road', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (617, 'Bob Cozier', '00544063861', '16 Klugh Ave', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (618, 'Janice Rockwell', '0086190955', '82 Gordie Drive', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (619, 'Reese Dempsey', '00546474543', '96 Jon Drive', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (620, 'Jonathan Hannah', '00541109210', '998 Rtp Road', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (621, 'Stewart Remar', '0''055''0502923497', '41st Street', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (622, 'Blair Cochran', '0046842213', '7 Cook Blvd', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (623, 'Milla Shelton', '0085450400', '6 Zappacosta', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (624, 'Jake Cocker', '0034616593', '3 El Paso Ave', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (625, 'Kate Chao', '0087245214', '91st Street', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (626, 'Brendan Paymer', '0032849423', '18 Sihung-si Ave', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (627, 'Todd Anderson', '0023898836', '448 Research Triangle Road', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (628, 'Wang Lofgren', '0021613920', '8 Kate Road', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (629, 'Lance Cagle', '0044479928', '310 Mt. Laurel Street', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (630, 'Drew Avalon', '00531489091', '8 Elizabeth Drive', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (631, 'Woody Keeslar', '0''055''0502776225', '86 Juliana Road', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (632, 'Rachael Osborne', '0021613564', '69 Gilley Road', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (633, 'Mia DeLuise', '0098678256', '74 Swinton Ave', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (634, 'Julianne Gilliam', '0031002494', '88 Antonio Road', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (635, 'Marley Roundtree', '0085084923', '48 Tankard Drive', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (636, 'Heather Herndon', '00539334842', '66 Hatfield Street', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (637, 'Mykelti Thurman', '0098527181', '93 Mould Road', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (638, 'Joey Arquette', '00521943982', '68 Liquid Road', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (639, 'Rhona Connick', '00533578743', '3 Stephanie Street', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (640, 'Lindsay Sarsgaard', '0084746086', '7 Love Road', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (641, 'Cherry Costner', '0048045129', '77 Tramaine', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (642, 'Rosanna Napolitano', '0038417640', '73 Albuquerque Road', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (643, 'Cyndi Harry', '0084957478', '57 Jude', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (644, 'Melba Jeffreys', '0045917032', '288 Gordon Street', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (645, 'Lari Badalucco', '0034132019', '76 Nicks Road', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (646, 'Miles Iglesias', '00537156789', '56 Seth Drive', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (647, 'Rod Hersh', '00535054724', '51st Street', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (648, 'Chalee Martinez', '0081343159', '72nd Street', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (649, 'Ben Paltrow', '0036839131', '39 Bette', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (650, 'Elisabeth Weisberg', '0035800570', '70 Ernest Road', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (651, 'Leslie Diesel', '00521074014', '80 Black', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (652, 'Rawlins Holy', '0088651002', '44 Kattan Road', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (653, 'Louise Ryan', '0081612088', '314 Johnny Drive', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (654, 'Saffron Gosdin', '0037553503', '154 Paltrow Road', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (655, 'Jonathan Callow', '00527876477', '23rd Street', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (656, 'Carl Boorem', '0036751939', '81 Annette Road', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (657, 'Donna Cube', '0034351740', '93 Karachi Drive', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (658, 'Bridgette Sandoval', '0034486808', '70 Bergen Ave', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (659, 'Vivica Darren', '0''055''0507972389', '800 Dylan Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (660, 'Walter Rosas', '0036724719', '22 Snider', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (661, 'Michelle Whitmore', '0028985198', '76 Wallace Blvd', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (662, 'Powers Forrest', '00538024148', '21 Petula Blvd', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (663, 'Micky Coverdale', '0''055''0504450736', '14 Pullman Road', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (664, 'Casey Lawrence', '00532974300', '429 Kudrow Drive', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (665, 'Liv Mann', '00544256504', '31st Street', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (666, 'Sigourney O''Sullivan', '0081243885', '15 Miguel Road', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (667, 'Pat Beckham', '0082767765', '15 Bebe Street', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (668, 'Ethan Sinatra', '00534051793', '94 Curfman Road', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (669, 'Renee Aaron', '0034245880', '59 Heubach Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (670, 'Miko Jamal', '0037748981', '41 Cusack Drive', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (671, 'Rick Harary', '0086196145', '986 Chapman Road', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (672, 'Marina Morrison', '00542692573', '710 Edinburgh Street', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (673, 'Courtney Weller', '0032917906', '24 Barrymore', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (674, 'Minnie Baldwin', '0024759912', '32 Royston Road', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (675, 'Lynn Jenkins', '0023469176', '65 Madrid Drive', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (676, 'Rick Jeter', '0024679162', '43rd Street', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (677, 'Jake Mattea', '0044130178', '770 Steiger Ave', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (678, 'Lance Bryson', '0094488465', '24 Schock Street', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (679, 'Hikaru Pullman', '00528621546', '58 Lange Blvd', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (680, 'Rade Craddock', '0048947902', '85 Alexander Drive', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (681, 'Dwight Frampton', '0''055''0504816710', '136 Lesley Drive', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (682, 'Lea Klugh', '0''055''0504981725', '99 Snow Road', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (683, 'Russell Landau', '0083174381', '75 Hutton', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (684, 'Isaiah Dayne', '00548858292', '54 Slough Blvd', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (685, 'Guy Hart', '0046011068', '53 Paul Drive', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (686, 'Mia Arkenstone', '0039220203', '82 Carmen', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (687, 'Grace Carradine', '0096688704', '72 Merrilee Drive', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (688, 'Sally Gaines', '0046394046', '36 Moraz Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (689, 'Joshua Bailey', '0''055''0505450217', '80 Pride Street', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (690, 'Jeanne Peniston', '00543248498', '36 Affleck Blvd', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (691, 'Peter Rifkin', '00529317595', '25 Carlene Street', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (692, 'Crystal Bergen', '0034721566', '44 Judy Street', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (693, 'Andie Domino', '00531386128', '792 Myles Street', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (694, 'Earl Barnett', '00522664184', '25 Nielsen Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (695, 'Millie Heche', '00548203476', '11 Annandale', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (696, 'Kurtwood Mandrell', '0046673939', '88 Bridgette Road', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (697, 'Denzel Kinnear', '0096651410', '38 Potter Drive', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (698, 'Dermot Shaye', '00533116094', '65 Dean Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (699, 'Petula Conway', '0035370560', '14 Deborah Road', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (700, 'Cliff Heche', '0''055''0501038811', '3 Patrick', 22);
commit;
prompt 700 records committed...
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (701, 'Amy Streep', '0024015677', '98 Duncan Drive', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (702, 'Carlene Tate', '00531027821', '31 Giamatti Street', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (703, 'Larry Randal', '00549029383', '10 Joinville Road', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (704, 'Julio McGoohan', '00547282754', '26 Kitty Drive', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (705, 'Jack Purefoy', '0046320573', '92 Taryn Drive', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (706, 'Harriet Depp', '0099234581', '69 Barkin Road', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (707, 'Parker Mazzello', '00544618797', '24 Hal Road', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (708, 'Sheryl Hartnett', '0035439121', '388 Rudd Street', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (709, 'Ming-Na Polley', '0021727582', '97 Benbrook Road', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (710, 'Geraldine Moorer', '00526010801', '25 Gailard Road', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (711, 'Carrie-Anne Lloyd', '0025650059', '75 Warren Drive', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (712, 'Rodney Fender', '00537566827', '44 Springfield Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (713, 'Stellan Addy', '00546592921', '74 Alston Road', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (714, 'Stockard Union', '00524169923', '59 Steyr Road', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (715, 'Kyra Boone', '00542025552', '17 Wainwright Street', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (716, 'Laurence Karyo', '00531928952', '21 Scottsdale Ave', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (717, 'Mia Graham', '0081907734', '824 Shelton Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (718, 'Alana Rizzo', '0032018852', '57 Singh Street', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (719, 'Jaime Vega', '00525428326', '92nd Street', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (720, 'Norm Channing', '0043652155', '42nd Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (721, 'Harris Reed', '0085202848', '41st Street', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (722, 'Jim Wincott', '0''055''0504476298', '99 Kyra Road', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (723, 'Jonny Lee Margolyes', '0026102232', '12 Maebashi Drive', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (724, 'Edward Lewis', '0022083827', '3 Tadley Road', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (725, 'Tanya Holly', '0096888874', '43 Hatosy Road', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (726, 'Todd Page', '0084736323', '97 Arnold Blvd', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (727, 'Nikki Close', '00533444081', '196 Kristiansand Street', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (728, 'Trick Popper', '0082942667', '93rd Street', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (729, 'Gordon Womack', '0089692552', '53rd Street', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (730, 'Kristin Levert', '0087757314', '726 Paige Drive', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (731, 'Mae Cherry', '0''055''0506377643', '86 Rickles Road', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (732, 'Donald Giraldo', '0082651175', '72 Loveless Blvd', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (733, 'Diamond Badalucco', '0044946130', '81 Nolte Ave', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (734, 'Garth DeVita', '0''055''0508273812', '96 Detmer Drive', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (735, 'Tracy Cusack', '0036835639', '31 Danger Drive', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (736, 'Harriet Jonze', '00524495235', '16 Hatfield Road', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (737, 'Geoff Downey', '00545194553', '44 Pordenone', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (738, 'Shannon Spader', '0081497361', '58 Stanley Road', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (739, 'Manu Duke', '00539639080', '51 Breckin Road', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (740, 'Ike LaBelle', '00527912562', '33rd Street', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (741, 'Darius Guilfoyle', '0049453994', '83 Emm Road', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (742, 'Rascal English', '0021602862', '18 Clinton Drive', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (743, 'Jim Reid', '0094048600', '191 Palin Road', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (744, 'Austin Balk', '0089981845', '72nd Street', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (745, 'Guy Redford', '0''055''0509791486', '42 Nanaimo Ave', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (746, 'Cheech Ryan', '0024311706', '3 Vicious Road', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (747, 'Hector Pleasence', '00525266202', '838 Yaphet Street', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (748, 'Ike Cook', '00531415958', '87 Sayer Street', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (749, 'Jason Hobson', '00545821805', '23rd Street', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (750, 'Marley Moorer', '0092187196', '30 McGovern Street', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (751, 'Ricardo Rhymes', '00537944647', '11st Street', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (752, 'Donal Close', '0084704724', '600 Albertina Street', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (753, 'Oliver Milsap', '00533065752', '55 Levy Road', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (754, 'Regina Palmieri', '0049562488', '24 Mollard Street', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (755, 'Owen Viterelli', '0046191873', '82 Fender Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (756, 'Martin Cetera', '0046281992', '91 Isaak', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (757, 'Samantha Lunch', '0''055''0509507861', '93 Omar Street', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (758, 'Dom Simpson', '0025139905', '868 Stallone Street', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (759, 'Isaac Ferrer', '0095780082', '63 Margolyes Street', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (760, 'Yaphet Reeves', '0044908063', '44 Polito Street', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (761, 'Bernie Linney', '00544044734', '43rd Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (762, 'Samantha Mollard', '0037251450', '759 Neil Ave', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (763, 'Eliza Shalhoub', '0081350670', '93rd Street', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (764, 'Diamond Peebles', '0029636237', '70 Secada Street', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (765, 'Forest Rosas', '00545326805', '8 Noseworthy Road', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (766, 'Liam Ferrer', '0034019015', '359 Botti Drive', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (767, 'Temuera Berkoff', '0087622219', '43rd Street', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (768, 'Breckin Bachman', '0037254569', '63rd Street', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (769, 'Rawlins Redford', '00524997224', '1 Birch Drive', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (770, 'Gailard Duke', '0099033502', '73rd Street', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (771, 'Renee Theron', '0025387072', '92 Flack Street', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (772, 'Bob Robbins', '0022461186', '84 First Road', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (773, 'Jimmie Stigers', '0086270323', '34 Winterthur Street', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (774, 'Red Gore', '0091806605', '85 Klugh Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (775, 'Davy Wong', '0034452455', '4 Gin Street', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (776, 'Emm MacNeil', '00528721748', '79 Caguas', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (777, 'Teri Turner', '00536374806', '32 Maidenhead Road', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (778, 'Marisa Hewitt', '00547643253', '56 Richardson Drive', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (779, 'Swoosie Whitman', '0085584881', '75 Blackmore Ave', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (780, 'Judd Davies', '0033130729', '24 Stephanie Drive', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (781, 'Randy DeGraw', '0''055''0503235009', '10 Nanaimo Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (782, 'Viggo Pleasence', '0048948345', '37 Matsuyama Blvd', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (783, 'Coley O''Hara', '0025388640', '75 Cheadle Ave', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (784, 'Gino DiCaprio', '0027475436', '52 Jena Street', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (785, 'Hugh Chesnutt', '0031268047', '52nd Street', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (786, 'Annette Holeman', '0037234478', '19 Berkoff', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (787, 'Lee Church', '00539511945', '28 Kinney Drive', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (788, 'Vince Griffin', '0''055''0502641298', '90 Sedgwick Road', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (789, 'Molly Rippy', '00522156850', '55 Maury', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (790, 'Madeleine Ramis', '00545969270', '71st Street', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (791, 'Zooey Prowse', '00541052096', '317 Gibson Ave', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (792, 'Hector Lonsdale', '0094051666', '100 Holland Ave', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (793, 'Rod Rawls', '0095531953', '12 Dunn Road', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (794, 'Nick Gleeson', '0086359918', '85 North Point Road', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (795, 'Shawn Gray', '0091632141', '24 Prinze Road', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (796, 'Edgar Blackwell', '0093751728', '68 Santa Clarat Street', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (797, 'Tara Palin', '0041471598', '19 Fredericia Road', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (798, 'Sal Harrelson', '0''055''0503750020', '238 Hugo Drive', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (799, 'Bret Sarsgaard', '0024153227', '29 Linz Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (800, 'Delroy Connick', '0086793413', '33 Vannelli Road', 30);
commit;
prompt 800 records committed...
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (801, 'Treat Wine', '0031850055', '72 Tia', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (802, 'Gabrielle Applegate', '0085939949', '83 Irvine Street', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (803, 'Rene McDiarmid', '0027424273', '44 Ahmad', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (804, 'Mel Frampton', '00539161368', '74 Baldwin Road', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (805, 'Derrick Ali', '00533653737', '80 Mulroney Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (806, 'Jonathan Lattimore', '0099786214', '66 Scarlett Drive', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (807, 'Henry Valentin', '0028830689', '6 Reading Drive', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (808, 'Miriam Shaye', '0081514143', '62nd Street', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (809, 'Rhea Lorenz', '0''055''0502009546', '58 Köln Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (810, 'Maceo Bailey', '00531578309', '22 Kitty Road', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (811, 'Trick Cohn', '00529968995', '37 Penelope Road', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (812, 'Gordie McKean', '0029998937', '87 Hoffman Blvd', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (813, 'Cameron Travolta', '0037790580', '5 Kim Road', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (814, 'Debby Aykroyd', '0041695331', '36 Carrack Road', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (815, 'Natascha Sewell', '0086158497', '10 Taryn Road', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (816, 'Clea Beckinsale', '0098962878', '19 Juliet Drive', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (817, 'Clint Kinski', '0033565714', '45 Schiavelli Road', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (818, 'Collin Blackmore', '00525066221', '27 Tempest Street', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (819, 'Debbie Shandling', '0031401484', '687 Shalhoub Road', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (820, 'Vern Rio', '0041949567', '94 Utada Road', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (821, 'Mac Plimpton', '00549212926', '30 Anne', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (822, 'Giancarlo Peniston', '00539754772', '67 Roddy Road', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (823, 'Emmylou Cooper', '00537710048', '62 Renee Street', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (824, 'Janeane Belushi', '0''055''0503781210', '77 Courtney Ave', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (825, 'Rowan Clark', '00535123005', '31st Street', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (826, 'Ving Finn', '0''055''0505268432', '899 Maebashi Street', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (827, 'Tzi Graham', '0''055''0507088998', '81st Street', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (828, 'Darren Burke', '0023778727', '89 Dutton Road', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (829, 'Vin Giannini', '00524568028', '75 Rapaport Drive', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (830, 'Stanley Crowell', '0035812221', '77 Olga', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (831, 'Art Weston', '00531907343', '756 Lyngby Street', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (832, 'Vonda Hyde', '00534501751', '93rd Street', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (833, 'Hugo Spall', '00528283580', '12 Goodall Road', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (834, 'Avenged Tripplehorn', '0096592716', '22 Long Island City', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (835, 'Anthony Ribisi', '00543976901', '26 Kiefer Drive', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (836, 'Lynn Lynch', '0082848848', '34 Charlton Road', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (837, 'Terence Gano', '00533214549', '6 Cle Elum Ave', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (838, 'Hope Van Damme', '0035513593', '28 Burton Blvd', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (839, 'Clive Schiff', '0047500940', '52nd Street', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (840, 'Pamela Beals', '0035167714', '41 Den Haag Blvd', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (841, 'Alec Farrow', '0''055''0504982759', '74 Zevon Road', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (842, 'Denny Holden', '0049887908', '88 Bello Drive', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (843, 'Gilberto Rea', '00526759580', '63 Gwyneth Drive', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (844, 'Matthew Smurfit', '0042905363', '976 Reinhold Drive', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (845, 'Fats Walker', '0''055''0509973002', '73 Rivers Ave', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (846, 'Ned Allen', '0031162077', '44 Culkin Road', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (847, 'Bette Sobieski', '00523158331', '1 Navarro Street', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (848, 'Kim Glover', '0028595026', '55 Mena Street', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (849, 'Milla Chesnutt', '00528590758', '59 Elisabeth Drive', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (850, 'Tyrone Sledge', '0099198726', '27 Rufus Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (851, 'Crystal Leoni', '0081524402', '23 Kadison Blvd', 3);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (852, 'Oliver Hornsby', '0025805013', '999 Buffy Blvd', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (853, 'Mia Strathairn', '0021421619', '18 Grant Road', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (854, 'Bebe Walken', '0''055''0508402188', '52 Tripplehorn Ave', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (855, 'Rene Franklin', '0039406735', '22 St-laurent Ave', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (856, 'Yaphet Morrison', '0028646248', '704 Kris Drive', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (857, 'Rip Pitney', '0''055''0507576723', '83rd Street', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (858, 'Rhett Broderick', '0049682265', '155 Ipswich Road', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (859, 'Arnold Beckinsale', '0096308825', '91 Highton Blvd', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (860, 'Anjelica Heald', '0''055''0509335349', '30 Streamwood Ave', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (861, 'Greg Bandy', '0032935195', '198 Lake Bluff Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (862, 'Corey Day', '00531013256', '746 Edgar Ave', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (863, 'Trace Weber', '00525519872', '49 Wetzlar Street', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (864, 'Janeane Hirsch', '00541999949', '534 Rizzo Street', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (865, 'Ali Brody', '00531612731', '51 Hex Blvd', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (866, 'Wes Travers', '0''055''0508606929', '53rd Street', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (867, 'Gaby Eder', '0''055''0509877552', '55 Sao jose rio preto Street', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (868, 'Jody Sevenfold', '0024007300', '93rd Street', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (869, 'Dwight Secada', '0096047970', '22nd Street', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (870, 'Martha Baker', '0041955085', '85 Fort McMurray Street', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (871, 'Gran Wen', '0027852135', '29 Marietta Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (872, 'Tobey Gatlin', '0092278182', '324 Jill Blvd', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (873, 'Janeane Bedelia', '0098823577', '40 Warrington Street', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (874, 'Donal McDiarmid', '0099389605', '31 Edie Road', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (875, 'Mitchell Himmelman', '0043756896', '822 Greg Drive', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (876, 'Kieran Secada', '00529119699', '13rd Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (877, 'Albertina Mellencamp', '0093177312', '5 Bentley Ave', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (878, 'David Gyllenhaal', '0088285477', '165 Turner Blvd', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (879, 'Debra Ceasar', '0026320717', '71 Penelope', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (880, 'Chloe Rubinek', '0''055''0501704236', '25 Landau Road', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (881, 'Terrence Vaughn', '00537492725', '9 Glenn Ave', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (882, 'Shelby Hanley', '0087698112', '58 Thompson Ave', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (883, 'Kay Crow', '0''055''0504438163', '92 Manning Street', 5);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (884, 'Wendy Levine', '0039658690', '99 Holliday', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (885, 'Nik Dern', '0085539645', '34 Ronstadt Road', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (886, 'Omar Puckett', '00539396949', '11st Street', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (887, 'Catherine urban', '0031298751', '703 Jones Street', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (888, 'Wesley Buscemi', '0032573115', '71 Taryn Blvd', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (889, 'Carl Danes', '0022391224', '75 Uggams Street', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (890, 'Luke Hornsby', '0047074051', '24 Cole Street', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (891, 'Charlton Gallagher', '00537193401', '58 Apple Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (892, 'Lionel Reilly', '0''055''0503048115', '83 Haslam Drive', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (893, 'Juice Stuart', '0089393617', '14 Hingle Street', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (894, 'Joey Peebles', '0086840416', '52nd Street', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (895, 'Nick Peebles', '0029710842', '53 Manaus Road', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (896, 'Rebeka Schwarzenegger', '0031944702', '49 Rickie Street', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (897, 'Kim Spacey', '00529786690', '81st Street', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (898, 'William Murdock', '0087308055', '79 Dysart Road', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (899, 'Marianne McCann', '0085285960', '30 Cumming Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (900, 'Arnold Forrest', '0081106826', '58 Balthazar Drive', 17);
commit;
prompt 900 records committed...
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (901, 'Nathan Hurley', '0094235521', '89 Tsettos Drive', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (902, 'Nils Cromwell', '0048793099', '15 Jeroen Blvd', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (903, 'Taryn Aiken', '0088005808', '348 Kenneth Road', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (904, 'Neneh Rain', '0029915544', '91st Street', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (905, 'Kevin Gugino', '00547719549', '71 Hawkins Ave', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (906, 'Joshua Klugh', '0097603363', '92 Head Road', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (907, 'Stewart Hutch', '0093244359', '22 Rosemead Drive', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (908, 'Joaquin DeVito', '0026134954', '75 Yamaguchi', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (909, 'Nicholas Clark', '0036975490', '18 Thörishaus Road', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (910, 'King McKean', '0021113370', '1 Prague Road', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (911, 'Larenz Buffalo', '0''055''0503655555', '91st Street', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (912, 'Bobby Boorem', '0044665844', '26 MacLachlan Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (913, 'Steve Kingsley', '0047188570', '82 Zafferana Etnea Road', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (914, 'Ellen Kutcher', '0028572552', '43rd Street', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (915, 'Miriam Creek', '0098340250', '69 Maria Road', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (916, 'Demi Tisdale', '00523782253', '385 Matarazzo Road', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (917, 'Harvey Renfro', '0093699884', '15 Frances', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (918, 'Sinead Robbins', '00524144687', '91 Weisberg Drive', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (919, 'Thin Watley', '0044594862', '2 Lithgow Drive', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (920, 'Domingo Hong', '0084946091', '31 Derrick Road', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (921, 'Ahmad Gill', '0034102872', '13 Burstyn Ave', 26);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (922, 'Mint Prowse', '0085538470', '41st Street', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (923, 'Blair Stiers', '00531273288', '73 Forrest Road', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (924, 'Chrissie Zahn', '0029935689', '82 McAnally Road', 12);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (925, 'Adrien Neil', '00529125711', '41 Lahr Road', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (926, 'Clay Cartlidge', '0097184497', '58 Sulzbach Drive', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (927, 'Rosie Craig', '00544435828', '537 Adamstown', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (928, 'John Waite', '00529436286', '59 Heiligenhaus Drive', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (929, 'Gran Fariq', '0033061447', '55 Reinhold Street', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (930, 'Ivan Matheson', '0''055''0509224365', '171 Liu Drive', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (931, 'Jodie Himmelman', '0084791093', '66 New Haven Street', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (932, 'Gabrielle Hampton', '0''055''0505270058', '42 Boorem Road', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (933, 'Val Coolidge', '0036104080', '8 Beaverton Road', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (934, 'Cloris Koteas', '0098634317', '42 Parker Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (935, 'Frank Assante', '00533062367', '35 Buffalo Street', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (936, 'Mekhi Sobieski', '0045187662', '56 DiBiasio Street', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (937, 'Jonatha Oldman', '00527066688', '92 Bailey Street', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (938, 'Samuel Carlisle', '00549795852', '47 Jennifer Street', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (939, 'Embeth Weir', '00543440451', '79 Towson Street', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (940, 'Percy Place', '00535755315', '80 Jacksonville Drive', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (941, 'Chuck Blossoms', '00521011250', '64 Miles Road', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (942, 'James Bandy', '0''055''0501379438', '41st Street', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (943, 'Rose Garofalo', '0043096068', '91 Ty Drive', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (944, 'Ann Gertner', '0037436072', '86 Quaid Drive', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (945, 'Karen Green', '00546389790', '23 Berenger', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (946, 'Chloe Coleman', '00525772788', '36 Torino Road', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (947, 'Chi Leary', '00544095329', '71 Mira', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (948, 'Horace Wilder', '0088866799', '11st Street', 27);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (949, 'Benjamin Aaron', '0099618283', '8 Aimee Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (950, 'Hookah Janney', '00544221350', '47 Martin Street', 9);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (951, 'Lenny Craig', '0093087360', '56 Myles Road', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (952, 'Tommy Moffat', '0048407361', '48 Robbins Blvd', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (953, 'Harris Valentin', '0046210315', '6 Burton Drive', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (954, 'Miko Makowicz', '0048376110', '981 Rucker', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (955, 'Lena Sandler', '00546718429', '30 Wheel Drive', 29);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (956, 'Brooke Cotton', '00528328297', '98 Cromwell Ave', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (957, 'Breckin Drive', '0027497449', '69 Fairfax Drive', 8);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (958, 'Patty Herrmann', '0025194653', '42 Carrie', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (959, 'Marianne Winans', '00533859654', '65 Cottbus Ave', 14);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (960, 'Juliet Grant', '00522569815', '41 Tsu Street', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (961, 'Carl Kier', '00544491634', '58 Wilkinson', 13);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (962, 'Casey Beckinsale', '00532361187', '70 Carlton Ave', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (963, 'Stephanie Horizon', '0031334345', '16 Esposito Drive', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (964, 'Liam Thorton', '0036444399', '83 Kevn Blvd', 30);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (965, 'Elvis Atkinson', '0087074841', '296 Gabriel Blvd', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (966, 'Brendan Weaver', '00532385646', '88 Linz Ave', 11);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (967, 'Russell Humphrey', '0045104773', '42 Hewett Street', 28);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (968, 'Marina Adler', '00522238206', '25 Wilder Road', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (969, 'Vonda Kinnear', '0099186039', '56 Tal Drive', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (970, 'Clint Singh', '0032798237', '62 Kevin Ave', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (971, 'Ani Reno', '0036948179', '84 Cincinnati Drive', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (972, 'Dionne Griggs', '0098099560', '314 Faithfull', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (973, 'Merle Van Damme', '0046283309', '7 Taryn Street', 15);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (974, 'Keith Head', '00545665794', '83rd Street', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (975, 'Rickie Hoskins', '0095133741', '32 Sapporo Road', 4);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (976, 'Adam Heslov', '0023004425', '28 Hatosy Road', 16);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (977, 'Bernie Maguire', '0046871261', '23 Nash Drive', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (978, 'Lupe Sarsgaard', '0084107417', '25 Haverhill Street', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (979, 'Temuera Osborne', '0096862876', '19 Tony Road', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (980, 'Brent Begley', '0042937905', '86 Buffalo Drive', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (981, 'Dylan Isaak', '0087314461', '73 Conley Street', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (982, 'Anna McCain', '00541330163', '16 Barry Street', 24);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (983, 'Freddie Giannini', '0''055''0509420066', '35 Salonga Road', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (984, 'Susan Colton', '0033818231', '47 Natalie Street', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (985, 'Ralph Hopkins', '0''055''0505547639', '94 Woodard Blvd', 10);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (986, 'Carol Fiennes', '00532944790', '77 Tempest Street', 19);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (987, 'Lila Stills', '0026472051', '64 Miko Road', 20);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (988, 'Gino Unger', '0''055''0503379382', '75 Fiorentino Drive', 23);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (989, 'Richard Leachman', '0094991724', '6 Lang Road', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (990, 'Nina Haslam', '0094969936', '77 Fariq Blvd', 17);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (991, 'Debby Torn', '0085460434', '88 Jeroen Street', 25);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (992, 'Dar Marley', '00533610297', '551 McGovern Blvd', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (993, 'Lari Mitra', '0041263837', '92 Devine Road', 18);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (994, 'Gabrielle Caviezel', '0033396591', '28 Cara Street', 7);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (995, 'Ani Miller', '0032632360', '27 Rains Drive', 22);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (996, 'Nik Kweller', '0097125957', '805 Clint', 21);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (997, 'Shannyn Sorvino', '00527794768', '60 Crewson Road', 2);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (998, 'Gloria Sellers', '00548694562', '100 Sona', 6);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (999, 'Bebe Whitman', '00529976361', '66 Bryson Road', 1);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (1000, 'Lin Wakeling', '00523796431', '68 Walken Road', 24);
commit;
prompt 1000 records committed...
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (708262840, 'Diamond Olson', '(681) 485-9113', '61 Beach Avenue', 100);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (189811489, 'Maritza Marks', '(640) 612-8540', '107 Pegasus Street', 101);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (467351472, 'Kennedy Chen', '(887) 507-7157', '82 Judge Avenue', 102);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (152874477, 'Anthony Davila', '(640) 927-4303', '25 Mason Row', 103);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (590564086, 'Payton Sloan', '(363) 800-8519', '14 Hope Row', 104);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (945582077, 'Jeramiah Yu', '(322) 423-4859', '84 Penrose Route', 105);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (79504732, 'Gloria Hoffman', '(953) 773-4315', '113 Barley Row', 106);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (780946586, 'Abel Hansen', '(889) 938-3601', '39 Peace Route', 107);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (375972455, 'Amiya Drake', '(915) 878-9537', '47 Hazelnut Avenue', 108);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (971633137, 'Anna Velez', '(326) 862-3195', '3 Noble Avenue', 109);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (202710130, 'Iyana Meza', '(635) 461-7619', '73 Medieval Lane', 110);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (936814527, 'Johnathon Barnes', '(511) 920-0300', '113 Ivy Avenue', 111);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (618144212, 'Shaniya Dominguez', '(761) 894-1572', '77 Fox Street', 112);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (330927664, 'Bentley Hunter', '(544) 903-0344', '111 Lily Route', 113);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (850965499, 'Madyson Bradley', '(305) 897-2762', '77 Bright Passage', 114);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (121670810, 'Aiyana Hahn', '(874) 698-3483', '57 Storm Lane', 115);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (591829232, 'Zechariah Moran', '(362) 629-4653', '45 Seaview Passage', 116);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (523479830, 'Eliza Smith', '(897) 985-3936', '33 Frost Avenue', 117);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (972999281, 'Janae Nicholson', '(446) 871-4078', '44 Nightingale Avenue', 118);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (869593414, 'Sarahi Wagner', '(588) 363-6336', '67 Locust Street', 119);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (364323076, 'Fatima Livingston', '(797) 334-1333', '88 King Boulevard', 120);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (456295284, 'Ashleigh Winters', '(291) 680-4955', '102 East Avenue', 121);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (486877093, 'Clayton Shah', '(438) 398-3822', '35 Shade Route', 122);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (850636732, 'Emilia Bautista', '(672) 836-5328', '67 Clarity Row', 123);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (670150291, 'Martin Hodges', '(969) 528-3764', '90 Flax Street', 124);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (345108322, 'Carlie Avery', '(837) 213-1474', '66 Nightingale Row', 125);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (49629406, 'Mayra Mcgee', '(465) 501-2208', '29 Archer Lane', 115);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (996662084, 'Kelly Murphy', '(280) 346-4131', '68 Beech Route', 127);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (482818846, 'Messiah Mercer', '(506) 310-6753', '73 Victory Boulevard', 128);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (385892708, 'Libby Brady', '(371) 532-6213', '68 Sunshine Boulevard', 129);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (113899307, 'Reynaldo Lucero', '(376) 470-6332', '64 Apollo Passage', 130);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (19214993, 'Rowan Walters', '(990) 951-3708', '49 Kingwood Avenue', 131);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (640808719, 'Rohan Patel', '(646) 942-2650', '84 Greenfield Boulevard', 132);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (464600526, 'Paxton Rogers', '(860) 723-4516', '75 Starlight Avenue', 133);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (191386480, 'Alexis Bean', '(766) 620-8862', '76 Sunny Street', 134);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (287878005, 'Tiara Wilkinson', '(571) 568-9706', '95 Knight Lane', 135);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (754030724, 'Taniya Best', '(727) 486-2616', '11 Moonlight Way', 136);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (698473099, 'Kristian Perkins', '(241) 712-1121', '65 Storm Way', 137);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (111413768, 'Daniella Ballard', '(908) 533-5728', '83 Aurora Street', 138);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (671660675, 'Bridger Nicholson', '(477) 741-3982', '101 Champion Boulevard', 139);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (892580017, 'Tanner Velazquez', '(243) 828-0882', '49 Hart Row', 140);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (903626083, 'Kadyn Parker', '(490) 332-1815', '108 Beech Avenue', 141);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (620937216, 'Ernesto Crane', '(527) 637-2468', '108 Sunshine Row', 142);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (908000615, 'Alma Benson', '(468) 917-8598', '82 Spring Avenue', 143);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (724134639, 'Marie Barton', '(626) 986-0157', '49 Merchant Street', 144);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (985907107, 'Lilyana Lamb', '(940) 472-6389', '110 Achorage Street', 145);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (726919780, 'Lewis Stewart', '(730) 384-0925', '115 Knight Boulevard', 146);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (412079807, 'Alonso Washington', '(223) 511-1080', '55 Cathedral Street', 147);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (709915279, 'Aiyana Russo', '(437) 246-9151', '11 Palm Street', 148);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (434940113, 'Jaylon Mills', '(202) 987-5836', '80 Archer Route', 149);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (291741163, 'Drew Love', '(202) 878-9980', '77 General Street', 110);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (426148194, 'Denisse Ball', '(579) 989-1843', '2 West Row', 111);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (64526097, 'Lia Michael', '(952) 885-8891', '112 Champion Way', 112);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (603338542, 'Esteban Frederick', '(578) 921-4734', '24 Circus Boulevard', 113);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (784600813, 'Addyson Farley', '(923) 746-5945', '51 Ember Street', 114);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (70822249, 'Peyton Griffith', '(809) 797-1096', '48 Harbor Avenue', 115);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (70831716, 'Ronan Holmes', '(553) 207-6160', '31 Archer Lane', 116);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (751988735, 'Heidy Cruz', '(770) 434-7266', '30 Willow Way', 117);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (365963339, 'Miracle Gould', '(658) 950-6485', '21 Old Lane', 118);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (648911084, 'Gunnar Barr', '(309) 615-5237', '7 Senna Row', 141);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (185000152, 'Chana Meadows', '(833) 811-2588', '62 Tower Row', 142);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (710935253, 'Olivia Duncan', '(841) 486-2290', '111 Barley Avenue', 143);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (293713935, 'Kolten Clarke', '(893) 528-2309', '9 Prince Street', 144);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (63271602, 'Milagros Hill', '(740) 275-8298', '40 Beaver Lane', 145);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (326413904, 'Libby Dickson', '(625) 579-6590', '28 Cliff Avenue', 146);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (360147273, 'Kiley Compton', '(399) 339-4007', '74 Anchor Route', 143);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (792958079, 'Phoenix Mcdowell', '(775) 470-2012', '86 Union Avenue', 144);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (642196831, 'Taryn Bridges', '(713) 375-2755', '115 Moon Lane', 145);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (187988627, 'Elsie Black', '(648) 822-3256', '88 Kings Boulevard', 146);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (211681471, 'Bruce Meyer', '(964) 549-4644', '91 Berry Row', 147);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (503126262, 'Teagan Fritz', '(863) 209-0900', '87 Oval Boulevard', 148);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (437511476, 'Alfredo Cline', '(300) 477-8871', '6 South Lane', 149);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (991978392, 'Alvin Alvarez', '(688) 423-0740', '57 Broom Row', 110);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (897773040, 'Cayden Henry', '(873) 742-8711', '39 Ocean Avenue', 128);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (206683768, 'Iyana Paul', '(649) 590-8167', '94 Colonel Passage', 129);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (779945885, 'Haiden Shepard', '(244) 246-4486', '76 Storm Street', 130);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (726563582, 'Braden Summers', '(959) 747-1142', '8 Garden Boulevard', 131);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (156171593, 'James Nichols', '(543) 926-5707', '15 Haven Avenue', 132);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (171910180, 'Damien Hess', '(293) 978-4218', '92 Penrose Avenue', 133);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (388283660, 'Joselyn Chan', '(276) 550-7416', '77 Fair Avenue', 134);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (18795929, 'Serena Klein', '(679) 870-5170', '63 Globe Way', 135);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (856592056, 'Sammy Bonilla', '(858) 712-2817', '56 Bury Street', 136);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (173006051, 'Kiana Jimenez', '(848) 252-2370', '60 Senna Row', 137);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (840454690, 'Tamia Mercado', '(357) 947-6644', '12 Gold Boulevard', 116);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (677761715, 'Chanel Raymond', '(964) 295-4683', '4 Manor Way', 117);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (55937608, 'Ariel Little', '(286) 596-0144', '5 Paradise Way', 118);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (719978224, 'Nolan Orozco', '(605) 200-4712', '101 Oak Street', 141);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (834214215, 'George Maldonado', '(683) 582-9224', '77 Nova Row', 142);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (434932129, 'Valery Leach', '(599) 541-6077', '9 Green Route', 143);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (988386543, 'Leonel Joseph', '(507) 464-8089', '79 Mount Street', 144);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (129407872, 'Koen Finley', '(723) 553-9931', '83 Bush Lane', 145);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (452323355, 'Marshall Barton', '(978) 512-8548', '7 Copper Passage', 146);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (742852779, 'Noelle Butler', '(207) 369-5153', '61 Temple Lane', 143);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (592650513, 'Saul Leonard', '(283) 581-4214', '112 Windmill Route', 144);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (448291127, 'Haley Howe', '(795) 925-1060', '73 Juniper Lane', 130);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (18645918, 'Emmy Strong', '(255) 850-9946', '75 Jewel Street', 131);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (653961350, 'Josie Mcfarland', '(342) 258-1111', '87 Providence Lane', 132);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (64729682, 'Yazmin Oconnell', '(566) 312-8386', '23 Bay View Lane', 133);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (955095939, 'Zaniyah Reese', '(442) 634-5835', '61 Mason Way', 134);
insert into CITIZEN (citizenid, citizenname, phonenumber, address, cityid)
values (685600354, 'Declan Wilson', '(759) 929-2227', '39 Gold Avenue', 135);
commit;
prompt 1100 records loaded
prompt Loading CLERK...
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (985608353, 'Aaron Robbins', 728586501, 6, 6259, 2019, 76);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (216673752, 'Regina Hicks', 611912795, 9, 3588, 2010, 60);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (616839114, 'Vivian Rhodes', 82463116, 8, 3575, 2015, 84);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (56423791, 'Vicente Robles', 13621976, 17, 6554, 2008, 30);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (715357972, 'Riley Vang', 178536762, 8, 7322, 2012, 32);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (769944696, 'Ashton Maldonado', 835856510, 4, 5472, 2011, 57);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (106947896, 'Erin Raymond', 951674376, 12, 6255, 2014, 33);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (701642916, 'Emma Terrell', 192952482, 17, 4323, 2007, 35);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (230298738, 'Mallory Burnett', 747768908, 10, 8522, 2006, 74);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (536047901, 'Alice Rojas', 359153629, 2, 4907, 2007, 55);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (688678649, 'Daniela Bradshaw', 754058532, 14, 8450, 2011, 60);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (45172409, 'Carlos Crane', 116713838, 15, 8161, 2013, 70);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (261999697, 'Marisa Blackburn', 351427476, 15, 3376, 2018, 29);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (533844976, 'Lacey Wright', 871371068, 18, 5303, 2008, 52);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (439153011, 'Aliana Munoz', 636986649, 10, 3182, 2014, 76);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (742868808, 'Juliet Day', 644517151, 15, 6253, 2017, 33);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (89160074, 'Isabell Brock', 129040934, 5, 8855, 2015, 45);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (908621892, 'Janiya James', 338392591, 16, 7171, 2011, 80);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (727320134, 'Brittany Nielsen', 730255019, 2, 4750, 2010, 42);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (889893500, 'Dustin Terrell', 169525232, 9, 4145, 2019, 60);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (97748603, 'Yasmin Steele', 503531033, 15, 5199, 2017, 86);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (621893021, 'Jacey Stephens', 536832758, 11, 8996, 2020, 70);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (50870763, 'Judith Kramer', 881497689, 6, 4197, 2014, 77);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (231962714, 'Aliana Warren', 888871238, 11, 7656, 2016, 48);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (3266076, 'Jerimiah Richardson', 288561006, 2, 4629, 2017, 36);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (242059824, 'Kimora Bruce', 653257004, 17, 9931, 2006, 30);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (986515397, 'Matilda Mills', 561974294, 4, 3060, 2016, 90);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (640574572, 'Jon Hanna', 683069173, 3, 5642, 2014, 69);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (381434132, 'Jadiel Nichols', 632061896, 15, 8346, 2011, 84);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (58713028, 'Aliza Johnston', 282805064, 8, 5877, 2011, 76);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (413518592, 'Kymani Atkins', 210526370, 16, 3139, 2007, 64);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (89541503, 'Jayda Booker', 35100364, 15, 9279, 2010, 72);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (675975458, 'Jamiya Cox', 386211345, 7, 6900, 2015, 72);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (953496147, 'Jonah Mckay', 53215943, 13, 8060, 2016, 39);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (763143179, 'Campbell Manning', 571651713, 15, 7809, 2008, 43);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (640330926, 'Ivy Sutton', 887279443, 9, 7253, 2014, 95);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (219641402, 'Zaniyah Dominguez', 348994280, 20, 9481, 2009, 36);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (797503856, 'Fernanda Stanton', 596091330, 8, 6734, 2007, 99);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (714723836, 'Maddison Bright', 654058322, 8, 7181, 2008, 77);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (962919031, 'Annie Lozano', 467458799, 5, 6323, 2007, 42);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (804709291, 'Dominique Pollard', 482185653, 13, 8052, 2012, 97);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (177769483, 'Brynlee Whitaker', 679505128, 14, 9664, 2016, 69);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (901257019, 'Aedan Ramos', 189682273, 8, 6748, 2020, 86);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (857760109, 'Kiley Gillespie', 747715581, 4, 3646, 2015, 81);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (744958679, 'Maxwell Huffman', 290166400, 3, 8599, 2006, 36);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (563871338, 'Sidney Mcdowell', 815005240, 12, 9063, 2018, 47);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (566015263, 'Abraham Waller', 853047389, 7, 6153, 2011, 83);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (278216922, 'Jonas Ayala', 975381784, 6, 5014, 2007, 96);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (479478250, 'Yoselin Allen', 7375540, 1, 3072, 2008, 40);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (340526675, 'Darius Dunn', 866019935, 19, 8808, 2011, 64);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (578494275, 'Osvaldo Sparks', 253823707, 16, 6361, 2019, 65);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (470721569, 'Adrianna Norman', 578436469, 14, 6112, 2010, 27);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (625260228, 'Celia Cowan', 63966459, 4, 5552, 2015, 80);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (602574296, 'Kyra Howell', 775632110, 15, 8881, 2008, 77);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (141169429, 'Aden Nash', 849549339, 12, 8108, 2012, 55);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (657042160, 'Haven Dominguez', 595482475, 7, 8155, 2011, 96);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (111959269, 'Micah Singh', 196953292, 6, 3323, 2014, 41);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (116034120, 'Mariah Hampton', 655805639, 11, 5681, 2007, 77);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (568167932, 'Jeremy Lutz', 577025006, 19, 5638, 2006, 81);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (775027789, 'Jaxson Robertson', 675210639, 2, 7284, 2007, 74);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (533397741, 'Marquise Horne', 919044101, 11, 6241, 2011, 64);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (462438254, 'Autumn Joseph', 462929801, 8, 6205, 2013, 93);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (412908680, 'Melina Morales', 150609347, 12, 9603, 2018, 66);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (999775205, 'Jaelyn Baxter', 510596727, 16, 8121, 2008, 59);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (377845907, 'Luz Mcintyre', 71840651, 14, 3885, 2014, 40);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (358888404, 'Rigoberto Stafford', 544243390, 9, 8564, 2017, 42);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (508028509, 'Lila Shields', 962334883, 4, 8019, 2015, 43);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (935116002, 'Brooke Mayo', 248278494, 15, 6271, 2011, 90);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (826448233, 'Karly Cooke', 332180403, 6, 5020, 2010, 45);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (62588564, 'Joanna Nichols', 861989291, 17, 9752, 2019, 46);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (37773505, 'Elizabeth Booth', 340695319, 18, 5345, 2017, 60);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (224334980, 'John Mcmahon', 412463694, 17, 4504, 2020, 84);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (725061585, 'Roman Martin', 520949281, 10, 8672, 2014, 62);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (380575697, 'Dakota Lindsey', 297954194, 8, 5738, 2016, 49);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (443090391, 'Donald Romero', 588792612, 13, 9339, 2017, 39);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (102056465, 'Seth Mercado', 759442973, 17, 6564, 2006, 25);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (132751178, 'Maxwell Calderon', 513758036, 3, 4058, 2016, 86);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (459089952, 'Amelia Mills', 811969949, 12, 4276, 2014, 90);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (352326915, 'Stacy Savage', 65786836, 16, 7722, 2011, 35);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (398251227, 'Lola Vaughan', 111324755, 2, 5795, 2011, 31);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (198620173, 'Autumn Oneal', 441864276, 16, 5570, 2007, 61);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (468433995, 'Jacquelyn Alvarez', 422387569, 20, 9366, 2010, 85);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (169418156, 'Maddison Francis', 920606814, 16, 4919, 2015, 42);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (48780608, 'Lukas Powers', 623443858, 17, 5001, 2016, 55);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (245602759, 'Landon Moody', 153201103, 3, 7808, 2008, 88);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (865215977, 'Judah Solis', 247598093, 8, 3237, 2014, 29);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (613154169, 'Carina Todd', 487998812, 2, 3505, 2009, 75);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (710604897, 'Trinity Cochran', 969419112, 12, 8100, 2007, 74);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (903631899, 'Terrence Owens', 764532349, 4, 3065, 2008, 79);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (163989772, 'Clinton Ochoa', 162100909, 14, 9168, 2007, 97);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (424689583, 'Jaylee Carpenter', 963939156, 10, 7690, 2012, 88);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (251645553, 'Kyan Fuentes', 848997346, 11, 9457, 2016, 48);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (520881414, 'Brodie Murphy', 596236364, 14, 6804, 2020, 85);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (740053775, 'Mike Pham', 376869355, 18, 5188, 2015, 58);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (970992503, 'Iliana Zuniga', 932521110, 20, 5899, 2006, 56);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (552470268, 'Maverick Klein', 168148868, 8, 5387, 2018, 89);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (283304585, 'Brianna Munoz', 467598885, 3, 4620, 2011, 42);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (315265026, 'Aryana Mcintyre', 964843484, 11, 8858, 2007, 92);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (83705991, 'Kira Pope', 812109096, 18, 4153, 2008, 62);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (632486887, 'Mathew Schneider', 484427206, 7, 6570, 2011, 37);
commit;
prompt 100 records committed...
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (1, 'Emily Farrow', 20006, 21, 7293, 2008, 6);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (2, 'Arnold Singletary', 20009, 22, 7866, 2018, 6);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (3, 'Rose Mraz', 20001, 23, 11702, 2008, 6);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (4, 'Melanie Michael', 20001, 24, 9295, 2018, 10);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (5, 'Bobbi Loveless', 20001, 25, 10445, 2011, 6);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (6, 'Ernie Parm', 20004, 26, 7531, 2012, 4);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (7, 'Spike Stiles', 20008, 27, 8295, 2018, 7);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (8, 'Danni Santana', 20003, 28, 5737, 2012, 4);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (9, 'Billy Schwimmer', 20005, 29, 9848, 2011, 5);
insert into CLERK (clerkid, clerkname, bossid, areaid, salary, hireyear, rating)
values (10, 'Daryle Downie', 20010, 30, 5766, 2015, 4);
commit;
prompt 110 records loaded
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
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (435, 'Big River Hospital', 106, 685);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (861, 'Blessings Clinic', 149, 191);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (726, 'Harmony Grove Clinic', 113, 333);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (758, 'Lowland Clinic', 145, 506);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (224, 'Spring Harbor Medical Clinic', 105, 842);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (42, 'Grand River Hospital', 127, 895);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (116, 'Grand Willow Medical Center', 132, 393);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (431, 'Spring Grove Hospital Center', 114, 176);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (380, 'Grand View Clinic', 120, 393);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (426, 'Tranquility Community Hospital', 114, 297);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (546, 'Spring Forest Clinic', 137, 333);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (186, 'Rose Valley Medical Clinic', 106, 393);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (632, 'Spring Grove General Hospital', 118, 393);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (789, 'Bellevue Community Hospital', 110, 880);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (860, 'Crossroads Hospital', 124, 176);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (74, 'White Blossom Hospital Center', 149, 333);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (472, 'Highland General Hospital', 110, 983);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (514, 'Hope Haven General Hospital', 141, 842);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (680, 'Summerstone Hospital Center', 125, 191);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (213, 'Summerstone Hospital Center', 102, 176);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (51, 'Hill Crest Medical Center', 103, 333);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (581, 'Stillwater Hospital Center', 100, 176);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (78, 'Charity Medical Clinic', 108, 393);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (895, 'Valley Health Medical Clinic', 148, 176);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (301, 'Spring Fountain Medical Clinic', 130, 685);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (151, 'Kindred Medical Center', 122, 983);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (170, 'Rose Clinic', 124, 880);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (912, 'Citrus Hospital', 132, 983);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (501, 'Green Hill Hospital Center', 112, 880);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (893, 'Heartland Hospital', 130, 393);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (857, 'White River Community Hospital', 119, 699);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (443, 'Southshore Hospital', 116, 685);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (297, 'Pine Valley Medical Clinic', 127, 333);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (566, 'Beacon Medical Center', 120, 983);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (164, 'Garden City General Hospital', 142, 685);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (996, 'Kindred Soul Clinic', 137, 191);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (652, 'Clearwater Valley Community Hospital', 138, 176);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (582, 'Fairview Community Hospital', 102, 297);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (564, 'Angelwing Medical Center', 123, 506);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (815, 'Archangel General Hospital', 136, 880);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (820, 'Honor Grave Hospital', 140, 297);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (157, 'Silverwood Clinic', 141, 895);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (281, 'Lowland Medical Clinic', 142, 393);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (420, 'Hyacinth Medical Center', 131, 699);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (408, 'Big River Hospital Center', 113, 191);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (279, 'Hillsdale Clinic', 140, 685);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (423, 'Swan River Clinic', 147, 191);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (573, 'Good Samaritan Medical Clinic', 108, 983);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (292, 'Greengrass Hospital Center', 109, 699);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (146, 'Petunia Hospital', 145, 699);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (338, 'Silver Gardens Community Hospital', 109, 506);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (364, 'Silver Pine Clinic', 119, 842);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (340, 'Silverstone Clinic', 144, 393);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (180, 'Hopevale General Hospital', 139, 895);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (713, 'Clearwater Lake General Hospital', 115, 895);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (809, 'Progress Clinic', 111, 191);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (839, 'Hot Springs General Hospital', 129, 842);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (656, 'Hopevale Hospital Center', 100, 880);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (834, 'Sapphire Lake Clinic', 136, 176);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (34, 'Citrus Medical Center', 143, 842);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (616, 'Forest View Community Hospital', 143, 699);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (931, 'Silver Birch General Hospital', 123, 191);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (503, 'Silver Birch Medical Center', 104, 297);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (748, 'Overlook Medical Clinic', 148, 880);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (381, 'Healthstone Community Hospital', 115, 333);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (352, 'Rose Petal Medical Center', 133, 699);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (25, 'Angelvale Medical Center', 146, 983);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (31, 'Genesis Clinic', 118, 685);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (200, 'Morningside Medical Clinic', 117, 842);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (107, 'Summit Hospital', 125, 333);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (601, 'East Valley Clinic', 112, 176);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (310, 'Wildflower Hospital', 138, 297);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (526, 'Paradise Valley Hospital Center', 121, 699);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (831, 'Spring Grove Medical Clinic', 134, 880);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (121, 'White Mountain Medical Center', 126, 297);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (313, 'Twin Mountains Community Hospital', 117, 895);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (339, 'Harmony Medical Center', 116, 297);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (942, 'Silverwood Clinic', 104, 685);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (363, 'Woodland Hospital Center', 107, 699);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (572, 'Cherry Blossom Medical Center', 134, 983);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (111, 'Marine Medical Clinic', 122, 880);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (555, 'Springfield Hospital Center', 126, 176);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (714, 'Heartstone Medical Center', 147, 506);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (584, 'Bayview Medical Clinic', 107, 842);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (854, 'Fortuna Medical Center', 105, 895);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (892, 'Valley Health Hospital Center', 129, 895);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (781, 'Maple Grove Medical Clinic', 146, 880);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (309, 'Great River Clinic', 111, 506);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (883, 'Oasis Hospital', 135, 506);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (319, 'Cherry Blossom Medical Center', 144, 983);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (174, 'Marine Medical Clinic', 128, 685);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (427, 'Springfield Hospital Center', 139, 333);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (455, 'Heartstone Medical Center', 135, 191);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (331, 'Bayview Medical Clinic', 133, 506);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (589, 'Fortuna Medical Center', 101, 191);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (759, 'Valley Health Hospital Center', 121, 506);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (865, 'Maple Grove Medical Clinic', 128, 297);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (648, 'Great River Clinic', 131, 842);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (547, 'Oasis Hospital', 101, 333);
insert into HEALTHINSTITUTION (healthinstid, instname, cityid, fieldid)
values (360, 'Spring Forest Hospital', 103, 895);
commit;
prompt 100 records loaded
prompt Loading DEPARTMENT...
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (1, 435, 'Admissions', 18, 32);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (2, 427, 'Human Resources', 8, 29);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (3, 861, 'Pharmacy', 20, 11);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (4, 726, 'Nephrology', 15, 21);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (5, 758, 'Admissions', 15, 34);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (6, 224, 'Critical Care', 19, 23);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (7, 42, 'Human Resources', 15, 7);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (8, 116, 'Pharmacy', 4, 14);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (10, 380, 'Pharmacy', 6, 9);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (11, 426, 'Oncology', 2, 25);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (224, 435, 'Admissions', 28, 47);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (753, 861, 'Anesthetics', 4, 36);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (621, 726, 'Breast Screening', 27, 30);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (265, 758, 'Burn Center', 19, 39);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (540, 224, 'Cardiology', 4, 38);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (924, 42, 'CSSD', 16, 11);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (598, 116, 'Chaplaincy', 10, 26);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (789, 431, 'Coronary Care Unit', 10, 45);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (993, 380, 'Critical Care', 3, 13);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (97, 426, 'Diagnostic Imaging', 7, 11);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (976, 546, 'Discharge Lounge', 13, 16);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (399, 186, 'Elderly services', 26, 44);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (405, 632, 'Finance Department', 25, 26);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (633, 789, 'Gastroenterology', 21, 18);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (450, 860, 'General Services', 4, 13);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (959, 74, 'General Surgery', 2, 41);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (336, 472, 'Gynecology', 4, 48);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (890, 514, 'Haematology', 17, 38);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (777, 680, 'Health & Safety', 10, 41);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (179, 213, 'Intensive Care Unit', 9, 30);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (365, 51, 'Human Resources', 8, 38);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (600, 581, 'Infection Control', 29, 21);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (528, 78, 'Information Management', 15, 10);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (492, 895, 'Maternity', 24, 31);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (220, 301, 'Medical Records', 19, 12);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (33, 151, 'Microbiology', 17, 43);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (121, 170, 'Neonatal', 6, 30);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (22, 912, 'Neurology', 18, 13);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (830, 501, 'Nutrition and Dietetics', 10, 16);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (413, 893, 'Obstetrics/Gynecology', 18, 13);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (425, 857, 'Occupational Therapy', 16, 37);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (329, 443, 'Oncology', 24, 28);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (556, 297, 'Ophthalmology', 8, 43);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (20, 566, 'Orthopaedics', 10, 48);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (717, 164, 'Otolaryngology', 8, 41);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (853, 996, 'Pain Management', 2, 16);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (233, 652, 'Patient Accounts', 27, 33);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (734, 582, 'Patient Services', 3, 20);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (124, 564, 'Pharmacy', 19, 37);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (245, 815, 'Physiotherapy', 15, 33);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (803, 820, 'Purchasing & Supplies', 5, 36);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (110, 157, 'Radiology', 7, 42);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (631, 281, 'Radiotherapy', 25, 14);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (149, 420, 'Renal', 23, 25);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (172, 408, 'Rheumatology', 19, 11);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (710, 279, 'Sexual Health', 22, 17);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (185, 423, 'Social Work', 17, 44);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (513, 573, 'Urology', 12, 10);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (226, 292, 'Occupational Therapy', 8, 25);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (478, 146, 'Oncology', 22, 40);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (958, 338, 'Ophthalmology', 27, 11);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (792, 364, 'Orthopaedics', 4, 37);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (419, 340, 'Otolaryngology', 8, 25);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (977, 180, 'Pain Management', 8, 38);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (688, 713, 'Patient Accounts', 5, 25);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (480, 809, 'Patient Services', 17, 24);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (741, 839, 'Pharmacy', 20, 10);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (964, 656, 'Physiotherapy', 3, 25);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (296, 834, 'Purchasing & Supplies', 8, 16);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (951, 34, 'Radiology', 13, 20);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (758, 616, 'Radiotherapy', 3, 47);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (820, 931, 'Renal', 25, 14);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (799, 503, 'Rheumatology', 4, 38);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (670, 748, 'Sexual Health', 10, 26);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (321, 381, 'Social Work', 17, 35);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (246, 352, 'Burn Center', 20, 28);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (790, 25, 'Cardiology', 27, 47);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (684, 31, 'CSSD', 22, 11);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (928, 200, 'Chaplaincy', 23, 31);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (846, 107, 'Coronary Care Unit', 22, 22);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (640, 601, 'Critical Care', 16, 27);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (251, 310, 'Diagnostic Imaging', 8, 49);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (572, 526, 'Discharge Lounge', 23, 47);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (926, 831, 'Elderly services', 5, 48);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (501, 121, 'Finance Department', 2, 33);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (953, 313, 'Gastroenterology', 26, 11);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (737, 339, 'General Services', 21, 22);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (608, 942, 'General Surgery', 3, 39);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (886, 363, 'Gynecology', 6, 46);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (749, 572, 'Haematology', 27, 37);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (130, 111, 'Health & Safety', 9, 49);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (155, 555, 'Intensive Care Unit', 3, 49);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (189, 714, 'Human Resources', 21, 39);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (16, 584, 'Admissions', 17, 11);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (780, 854, 'Anesthetics', 24, 11);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (731, 892, 'Breast Screening', 20, 39);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (880, 781, 'Burn Center', 12, 10);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (427, 309, 'Cardiology', 27, 35);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (763, 883, 'CSSD', 12, 48);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (549, 319, 'Chaplaincy', 15, 24);
commit;
prompt 100 records committed...
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (29, 174, 'Coronary Care Unit', 14, 42);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (75, 427, 'Critical Care', 29, 41);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (503, 455, 'Diagnostic Imaging', 27, 47);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (491, 331, 'Discharge Lounge', 21, 17);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (712, 589, 'Elderly services', 24, 31);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (93, 759, 'Finance Department', 20, 12);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (682, 865, 'Gastroenterology', 26, 17);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (279, 648, 'General Services', 22, 49);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (203, 547, 'General Surgery', 15, 16);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (735, 360, 'Gynecology', 12, 42);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (716, 435, 'Haematology', 14, 42);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (838, 861, 'Health & Safety', 3, 36);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (473, 726, 'Ophthalmology', 18, 38);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (306, 758, 'Orthopaedics', 1, 41);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (847, 224, 'Otolaryngology', 26, 50);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (356, 42, 'Pain Management', 28, 32);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (496, 116, 'Patient Accounts', 30, 42);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (767, 431, 'Patient Services', 28, 42);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (530, 380, 'Pharmacy', 9, 35);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (642, 426, 'Physiotherapy', 10, 16);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (471, 546, 'Purchasing & Supplies', 14, 39);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (218, 186, 'Radiology', 29, 38);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (591, 632, 'Radiotherapy', 5, 25);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (526, 789, 'Renal', 28, 32);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (406, 860, 'Rheumatology', 29, 48);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (81, 74, 'Sexual Health', 26, 35);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (67, 472, 'Social Work', 14, 41);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (981, 514, 'Urology', 14, 40);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (686, 680, 'Occupational Therapy', 7, 39);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (87, 213, 'Oncology', 28, 47);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (531, 51, 'Ophthalmology', 5, 25);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (184, 581, 'Orthopaedics', 11, 40);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (619, 78, 'Otolaryngology', 21, 27);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (332, 895, 'Pain Management', 20, 33);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (26, 301, 'Patient Accounts', 14, 24);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (114, 151, 'Patient Services', 10, 24);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (512, 170, 'Pharmacy', 27, 47);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (433, 912, 'Physiotherapy', 20, 14);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (660, 501, 'Purchasing & Supplies', 26, 43);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (667, 893, 'Radiology', 15, 38);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (460, 857, 'Radiotherapy', 9, 39);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (895, 443, 'Renal', 5, 39);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (368, 297, 'Rheumatology', 5, 29);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (74, 566, 'Sexual Health', 23, 40);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (738, 164, 'Social Work', 27, 44);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (88, 996, 'Burn Center', 5, 46);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (866, 652, 'Cardiology', 1, 41);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (205, 582, 'CSSD', 21, 16);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (157, 564, 'Chaplaincy', 16, 37);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (932, 815, 'Coronary Care Unit', 3, 38);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (779, 820, 'Critical Care', 28, 21);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (766, 157, 'Diagnostic Imaging', 25, 23);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (366, 281, 'Discharge Lounge', 26, 13);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (592, 420, 'Elderly services', 16, 16);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (438, 408, 'Finance Department', 13, 12);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (393, 279, 'Gastroenterology', 12, 24);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (760, 423, 'General Services', 26, 43);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (791, 573, 'General Surgery', 11, 44);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (875, 292, 'Gynecology', 6, 39);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (223, 146, 'Purchasing & Supplies', 30, 13);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (338, 338, 'Radiology', 18, 30);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (219, 364, 'Radiotherapy', 1, 46);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (994, 340, 'Renal', 2, 23);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (289, 180, 'Rheumatology', 6, 41);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (873, 713, 'Sexual Health', 2, 26);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (107, 809, 'Social Work', 27, 17);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (651, 839, 'Urology', 12, 37);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (197, 656, 'Occupational Therapy', 15, 46);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (388, 834, 'Oncology', 20, 25);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (781, 34, 'Ophthalmology', 22, 24);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (161, 616, 'Orthopaedics', 13, 37);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (458, 931, 'Otolaryngology', 8, 47);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (476, 503, 'Pain Management', 4, 30);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (652, 748, 'Patient Accounts', 13, 40);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (337, 381, 'Patient Services', 3, 48);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (547, 352, 'Pharmacy', 11, 34);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (546, 25, 'Physiotherapy', 4, 47);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (747, 31, 'Purchasing & Supplies', 5, 46);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (967, 200, 'Radiology', 19, 46);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (415, 107, 'Radiotherapy', 14, 12);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (561, 601, 'Renal', 29, 14);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (479, 310, 'Rheumatology', 12, 41);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (736, 526, 'Sexual Health', 9, 21);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (343, 831, 'Social Work', 3, 27);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (882, 121, 'Burn Center', 14, 31);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (198, 313, 'Cardiology', 17, 45);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (641, 339, 'CSSD', 22, 40);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (713, 942, 'Chaplaincy', 17, 49);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (353, 363, 'Coronary Care Unit', 30, 36);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (797, 572, 'Critical Care', 18, 35);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (645, 111, 'Diagnostic Imaging', 9, 43);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (811, 555, 'Discharge Lounge', 15, 17);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (548, 714, 'Elderly services', 20, 28);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (0, 584, 'Finance Department', 27, 41);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (472, 854, 'Gastroenterology', 20, 25);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (325, 892, 'General Services', 10, 44);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (457, 781, 'General Surgery', 2, 29);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (522, 309, 'Gynecology', 16, 13);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (828, 883, 'Haematology', 8, 39);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (922, 319, 'Health & Safety', 17, 44);
commit;
prompt 200 records committed...
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (756, 174, 'Intensive Care Unit', 26, 36);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (860, 455, 'Admissions', 14, 27);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (806, 331, 'Anesthetics', 28, 34);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (952, 589, 'Breast Screening', 18, 17);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (517, 759, 'Burn Center', 15, 35);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (918, 865, 'Cardiology', 1, 50);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (103, 648, 'CSSD', 6, 49);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (191, 547, 'Chaplaincy', 29, 17);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (32, 360, 'Coronary Care Unit', 20, 29);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (68, 435, 'Critical Care', 2, 37);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (371, 861, 'Diagnostic Imaging', 26, 20);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (173, 726, 'Discharge Lounge', 24, 27);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (102, 758, 'Elderly services', 22, 47);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (392, 224, 'Finance Department', 14, 23);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (344, 42, 'Gastroenterology', 3, 19);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (28, 116, 'General Services', 3, 22);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (395, 431, 'General Surgery', 17, 33);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (674, 380, 'Gynecology', 23, 18);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (383, 426, 'Haematology', 22, 29);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (677, 546, 'Health & Safety', 2, 43);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (840, 186, 'Ophthalmology', 15, 46);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (123, 632, 'Orthopaedics', 20, 18);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (280, 789, 'Otolaryngology', 30, 31);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (584, 860, 'Pain Management', 10, 32);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (495, 74, 'Patient Accounts', 19, 42);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (76, 472, 'Patient Services', 3, 38);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (122, 514, 'Pharmacy', 17, 16);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (283, 680, 'Physiotherapy', 5, 44);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (949, 213, 'Purchasing & Supplies', 27, 46);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (764, 51, 'Radiology', 10, 36);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (225, 581, 'Radiotherapy', 27, 25);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (580, 78, 'Renal', 29, 17);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (300, 895, 'Rheumatology', 18, 45);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (511, 301, 'Sexual Health', 17, 41);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (762, 151, 'Social Work', 3, 16);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (443, 170, 'Urology', 14, 42);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (940, 912, 'Occupational Therapy', 13, 22);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (378, 501, 'Oncology', 14, 49);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (664, 893, 'Ophthalmology', 2, 25);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (12, 857, 'Orthopaedics', 5, 24);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (562, 443, 'Otolaryngology', 17, 38);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (459, 297, 'Pain Management', 18, 20);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (15, 566, 'Patient Accounts', 11, 21);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (524, 164, 'Patient Services', 22, 42);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (852, 996, 'Pharmacy', 2, 31);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (941, 652, 'Physiotherapy', 11, 43);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (382, 582, 'Purchasing & Supplies', 17, 29);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (627, 564, 'Radiology', 7, 28);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (390, 815, 'Radiotherapy', 21, 27);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (193, 820, 'Renal', 12, 47);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (826, 157, 'Rheumatology', 10, 14);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (855, 281, 'Sexual Health', 16, 33);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (778, 420, 'Social Work', 6, 50);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (815, 408, 'Burn Center', 8, 28);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (60, 279, 'Cardiology', 26, 12);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (84, 423, 'CSSD', 15, 25);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (341, 573, 'Chaplaincy', 16, 27);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (725, 292, 'Coronary Care Unit', 15, 16);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (730, 146, 'Critical Care', 22, 30);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (287, 338, 'Diagnostic Imaging', 13, 17);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (837, 364, 'Discharge Lounge', 10, 46);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (345, 340, 'Elderly services', 3, 42);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (625, 180, 'Finance Department', 28, 44);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (646, 713, 'Sexual Health', 8, 19);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (933, 809, 'Social Work', 18, 33);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (164, 839, 'Urology', 27, 21);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (217, 656, 'Occupational Therapy', 8, 27);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (678, 834, 'Oncology', 5, 42);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (41, 34, 'Ophthalmology', 26, 16);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (152, 616, 'Orthopaedics', 3, 17);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (444, 931, 'Otolaryngology', 6, 42);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (65, 503, 'Pain Management', 4, 47);
insert into DEPARTMENT (depid, healthinstid, depname, cityid, numberofbeds)
values (516, 748, 'Patient Accounts', 11, 17);
commit;
prompt 273 records loaded
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
values ('ֲ Dermatopathology', 463, 655611592);
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
values ('ֲ Dermatopathology', 374, 882503173);
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
values ('ֲ Dermatopathology', 181, 599701445);
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
values ('ֲ Dermatopathology', 299, 135594200);
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
prompt Loading HEALTH_PROFESSION...
insert into HEALTH_PROFESSION (hpid, hpname)
values (1, 'Doctor');
insert into HEALTH_PROFESSION (hpid, hpname)
values (2, 'Nurse');
insert into HEALTH_PROFESSION (hpid, hpname)
values (3, 'Nurse');
insert into HEALTH_PROFESSION (hpid, hpname)
values (4, 'Assistant''');
insert into HEALTH_PROFESSION (hpid, hpname)
values (5, '''Psychologist');
insert into HEALTH_PROFESSION (hpid, hpname)
values (6, 'Paramedic');
commit;
prompt 6 records loaded
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
prompt Loading INSTRUCTOR...
insert into INSTRUCTOR (instructorid, citizenid)
values (1, 735);
insert into INSTRUCTOR (instructorid, citizenid)
values (2, 505);
insert into INSTRUCTOR (instructorid, citizenid)
values (3, 301);
insert into INSTRUCTOR (instructorid, citizenid)
values (4, 344);
insert into INSTRUCTOR (instructorid, citizenid)
values (5, 813);
insert into INSTRUCTOR (instructorid, citizenid)
values (6, 389);
insert into INSTRUCTOR (instructorid, citizenid)
values (7, 441);
insert into INSTRUCTOR (instructorid, citizenid)
values (8, 883);
insert into INSTRUCTOR (instructorid, citizenid)
values (9, 929);
insert into INSTRUCTOR (instructorid, citizenid)
values (10, 186);
commit;
prompt 10 records loaded
prompt Loading LICENSE...
insert into LICENSE (licenseid, hpid, instructorid)
values (1, 1, 1);
insert into LICENSE (licenseid, hpid, instructorid)
values (2, 2, 2);
insert into LICENSE (licenseid, hpid, instructorid)
values (3, 3, 3);
insert into LICENSE (licenseid, hpid, instructorid)
values (4, 4, 4);
insert into LICENSE (licenseid, hpid, instructorid)
values (5, 5, 5);
insert into LICENSE (licenseid, hpid, instructorid)
values (6, 6, 6);
insert into LICENSE (licenseid, hpid, instructorid)
values (7, 7, 7);
insert into LICENSE (licenseid, hpid, instructorid)
values (8, 8, 8);
insert into LICENSE (licenseid, hpid, instructorid)
values (9, 9, 9);
insert into LICENSE (licenseid, hpid, instructorid)
values (10, 10, 10);
commit;
prompt 10 records loaded
prompt Loading PARTICIPATES_IN...
insert into PARTICIPATES_IN (participationdate, workerid, activityid)
values (to_date('28-03-2008', 'dd-mm-yyyy'), 5000, 1);
insert into PARTICIPATES_IN (participationdate, workerid, activityid)
values (to_date('04-05-2010', 'dd-mm-yyyy'), 5001, 2);
insert into PARTICIPATES_IN (participationdate, workerid, activityid)
values (to_date('14-08-2016', 'dd-mm-yyyy'), 5002, 3);
insert into PARTICIPATES_IN (participationdate, workerid, activityid)
values (to_date('22-07-2011', 'dd-mm-yyyy'), 5003, 4);
insert into PARTICIPATES_IN (participationdate, workerid, activityid)
values (to_date('23-10-2017', 'dd-mm-yyyy'), 5004, 5);
insert into PARTICIPATES_IN (participationdate, workerid, activityid)
values (to_date('05-11-2019', 'dd-mm-yyyy'), 5005, 6);
insert into PARTICIPATES_IN (participationdate, workerid, activityid)
values (to_date('19-10-2018', 'dd-mm-yyyy'), 5006, 7);
commit;
prompt 7 records loaded
prompt Loading SCHEDULE...
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('28-04-2016 18:57:18', 'dd-mm-yyyy hh24:mi:ss'), 1, 438);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('16-04-2015 06:05:45', 'dd-mm-yyyy hh24:mi:ss'), 3, 613);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('25-11-2016 10:12:17', 'dd-mm-yyyy hh24:mi:ss'), 3, 43);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('06-06-2012 07:04:13', 'dd-mm-yyyy hh24:mi:ss'), 5, 840);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('05-04-2010 22:16:53', 'dd-mm-yyyy hh24:mi:ss'), 6, 779);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('02-02-2014 21:33:33', 'dd-mm-yyyy hh24:mi:ss'), 6, 902);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('24-06-2009 07:03:21', 'dd-mm-yyyy hh24:mi:ss'), 7, 355);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('18-04-2016 10:16:01', 'dd-mm-yyyy hh24:mi:ss'), 7, 67);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('27-10-2009 13:42:05', 'dd-mm-yyyy hh24:mi:ss'), 8, 376);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('16-10-2012 18:56:18', 'dd-mm-yyyy hh24:mi:ss'), 8, 708);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('04-11-2010 19:16:10', 'dd-mm-yyyy hh24:mi:ss'), 9, 453);
insert into SCHEDULE (meetingtime, clerkid, citizenid)
values (to_date('17-09-2012 13:14:44', 'dd-mm-yyyy hh24:mi:ss'), 9, 298);
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
commit;
prompt 100 records committed...
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
prompt 112 records loaded
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
commit;
prompt 100 records committed...
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
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (531238815, 'Diamond Olson', to_date('20-01-2000', 'dd-mm-yyyy'), 531238815, to_date('02-11-2014', 'dd-mm-yyyy'), to_date('21-10-2034', 'dd-mm-yyyy'), 2, 708262840, 7193.7596372454696051453084116320744309);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (648956315, 'Maritza Marks', to_date('25-08-1957', 'dd-mm-yyyy'), 648956315, to_date('01-03-1990', 'dd-mm-yyyy'), to_date('20-09-2031', 'dd-mm-yyyy'), 2, 189811489, 4547.2499370067526057095599731283344926);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (71932811, 'Kennedy Chen', to_date('09-09-1992', 'dd-mm-yyyy'), 71932811, to_date('16-01-1986', 'dd-mm-yyyy'), to_date('16-06-2027', 'dd-mm-yyyy'), 2, 467351472, 12245.820781237282969721313479352891147);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (311466467, 'Anthony Davila', to_date('16-05-1976', 'dd-mm-yyyy'), 311466467, to_date('06-07-1991', 'dd-mm-yyyy'), to_date('11-03-2032', 'dd-mm-yyyy'), 1, 152874477, 10123.104432592657786518412647065175376);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (214019947, 'Payton Sloan', to_date('02-01-1989', 'dd-mm-yyyy'), 214019947, to_date('14-03-2005', 'dd-mm-yyyy'), to_date('28-08-2039', 'dd-mm-yyyy'), 2, 590564086, 18989.055674760710289403734265547087453);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (655611592, 'Jeramiah Yu', to_date('22-08-1971', 'dd-mm-yyyy'), 655611592, to_date('22-09-2000', 'dd-mm-yyyy'), to_date('17-11-2029', 'dd-mm-yyyy'), 2, 945582077, 39596.085480982379762273500702525719362);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (267895569, 'Gloria Hoffman', to_date('22-08-1979', 'dd-mm-yyyy'), 267895569, to_date('25-08-2015', 'dd-mm-yyyy'), to_date('29-12-2038', 'dd-mm-yyyy'), 2, 79504732, 6487.4317804515096351504438521999174571);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (475822438, 'Abel Hansen', to_date('03-06-1960', 'dd-mm-yyyy'), 475822438, to_date('29-10-2014', 'dd-mm-yyyy'), to_date('03-03-2039', 'dd-mm-yyyy'), 2, 780946586, 18051.505999537516462217637124448039488);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (608832283, 'Amiya Drake', to_date('02-09-1964', 'dd-mm-yyyy'), 608832283, to_date('10-08-1991', 'dd-mm-yyyy'), to_date('30-08-2035', 'dd-mm-yyyy'), 2, 375972455, 10593.470807684383769414882934596318601);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (871947790, 'Anna Velez', to_date('31-01-1971', 'dd-mm-yyyy'), 871947790, to_date('21-09-2013', 'dd-mm-yyyy'), to_date('29-11-2022', 'dd-mm-yyyy'), 1, 971633137, 21502.634339758894989629511816286735318);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (156552498, 'Iyana Meza', to_date('16-10-1977', 'dd-mm-yyyy'), 871947790, to_date('26-02-1994', 'dd-mm-yyyy'), to_date('19-11-2034', 'dd-mm-yyyy'), 1, 202710130, 22521.800095756694693993672391109579987);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (154508569, 'Johnathon Barnes', to_date('07-06-1964', 'dd-mm-yyyy'), 531238815, to_date('02-09-2004', 'dd-mm-yyyy'), to_date('21-10-2040', 'dd-mm-yyyy'), 1, 936814527, 18683.09838010407941803621799340611937);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (918926951, 'Shaniya Dominguez', to_date('04-06-1987', 'dd-mm-yyyy'), 531238815, to_date('19-08-1990', 'dd-mm-yyyy'), to_date('12-08-2026', 'dd-mm-yyyy'), 1, 618144212, 5527.2472532013900638231638276644546918);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (867688554, 'Bentley Hunter', to_date('28-12-1956', 'dd-mm-yyyy'), 648956315, to_date('30-11-2001', 'dd-mm-yyyy'), to_date('30-07-2040', 'dd-mm-yyyy'), 1, 330927664, 12411.57154890866186247814953667192144);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (684228936, 'Madyson Bradley', to_date('30-01-1969', 'dd-mm-yyyy'), 648956315, to_date('08-03-1995', 'dd-mm-yyyy'), to_date('20-12-2035', 'dd-mm-yyyy'), 1, 850965499, 31812.115212824405256295674188405513522);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (518625103, 'Aiyana Hahn', to_date('10-06-1961', 'dd-mm-yyyy'), 71932811, to_date('03-09-2008', 'dd-mm-yyyy'), to_date('02-08-2021', 'dd-mm-yyyy'), 2, 121670810, 34166.357218549151365650857644184895062);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (950758028, 'Zechariah Moran', to_date('30-11-1983', 'dd-mm-yyyy'), 71932811, to_date('23-07-1980', 'dd-mm-yyyy'), to_date('07-06-2038', 'dd-mm-yyyy'), 1, 591829232, 19755.506494434295094752658067931273738);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (520553314, 'Eliza Smith', to_date('18-06-1963', 'dd-mm-yyyy'), 311466467, to_date('23-07-2013', 'dd-mm-yyyy'), to_date('18-06-2027', 'dd-mm-yyyy'), 2, 523479830, 4631.4718721260296535829916726909260256);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (505111071, 'Janae Nicholson', to_date('27-03-1996', 'dd-mm-yyyy'), 311466467, to_date('07-08-2019', 'dd-mm-yyyy'), to_date('05-03-2027', 'dd-mm-yyyy'), 2, 972999281, 6023.0450664950185299579002100587358276);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (65914345, 'Sarahi Wagner', to_date('22-05-1961', 'dd-mm-yyyy'), 214019947, to_date('30-05-2009', 'dd-mm-yyyy'), to_date('18-12-2020', 'dd-mm-yyyy'), 2, 869593414, 3847.8553990739666741264802027573271985);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (102975751, 'Fatima Livingston', to_date('30-04-1985', 'dd-mm-yyyy'), 214019947, to_date('01-06-2006', 'dd-mm-yyyy'), to_date('27-01-2024', 'dd-mm-yyyy'), 1, 364323076, 24579.483214587329792050768892866422153);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (97370635, 'Ashleigh Winters', to_date('08-12-1989', 'dd-mm-yyyy'), 655611592, to_date('14-03-1994', 'dd-mm-yyyy'), to_date('28-11-2032', 'dd-mm-yyyy'), 1, 456295284, 12236.758972410173226705988615457270453);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (157985841, 'Clayton Shah', to_date('25-07-1997', 'dd-mm-yyyy'), 655611592, to_date('23-02-2002', 'dd-mm-yyyy'), to_date('18-05-2034', 'dd-mm-yyyy'), 1, 486877093, 21747.900785242351748545850008377907998);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (702948713, 'Emilia Bautista', to_date('20-02-1963', 'dd-mm-yyyy'), 267895569, to_date('04-03-2014', 'dd-mm-yyyy'), to_date('03-02-2022', 'dd-mm-yyyy'), 2, 850636732, 39621.889320670332161947782704975355249);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (167848962, 'Martin Hodges', to_date('31-08-1973', 'dd-mm-yyyy'), 267895569, to_date('22-01-1988', 'dd-mm-yyyy'), to_date('28-10-2026', 'dd-mm-yyyy'), 1, 670150291, 14348.126072820369877648575241527349857);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (477713169, 'Carlie Avery', to_date('12-12-1989', 'dd-mm-yyyy'), 475822438, to_date('09-12-1983', 'dd-mm-yyyy'), to_date('22-09-2025', 'dd-mm-yyyy'), 1, 345108322, 12781.213320782928144818265584354158782);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (475432614, 'Mayra Mcgee', to_date('11-04-1985', 'dd-mm-yyyy'), 475822438, to_date('10-12-1985', 'dd-mm-yyyy'), to_date('02-12-2035', 'dd-mm-yyyy'), 1, 49629406, 36955.290758696916432087768881494026537);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (960371044, 'Messiah Mercer', to_date('12-09-1956', 'dd-mm-yyyy'), 608832283, to_date('21-03-2017', 'dd-mm-yyyy'), to_date('03-01-2027', 'dd-mm-yyyy'), 1, 482818846, 14830.125203834257539303072854687949088);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (125805491, 'Libby Brady', to_date('18-01-2000', 'dd-mm-yyyy'), 871947790, to_date('07-01-1986', 'dd-mm-yyyy'), to_date('11-11-2040', 'dd-mm-yyyy'), 1, 385892708, 6460.6917386018365141892021229344162595);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (882503173, 'Reynaldo Lucero', to_date('27-06-1961', 'dd-mm-yyyy'), 871947790, to_date('05-07-2016', 'dd-mm-yyyy'), to_date('28-10-2021', 'dd-mm-yyyy'), 2, 113899307, 12728.015897118626541714532106451552137);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (90523324, 'Rowan Walters', to_date('15-04-1952', 'dd-mm-yyyy'), 531238815, to_date('12-09-2010', 'dd-mm-yyyy'), to_date('31-10-2022', 'dd-mm-yyyy'), 1, 19214993, 18261.812510769191954938105957862318251);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (62842027, 'Rohan Patel', to_date('19-03-1993', 'dd-mm-yyyy'), 531238815, to_date('07-06-2010', 'dd-mm-yyyy'), to_date('17-05-2036', 'dd-mm-yyyy'), 2, 640808719, 10434.454257578915755385362224099575086);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (85099344, 'Paxton Rogers', to_date('14-04-1982', 'dd-mm-yyyy'), 648956315, to_date('24-01-2008', 'dd-mm-yyyy'), to_date('31-03-2035', 'dd-mm-yyyy'), 2, 464600526, 9853.403967293084590582143920445108082);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (585949230, 'Alexis Bean', to_date('03-02-1958', 'dd-mm-yyyy'), 648956315, to_date('18-01-1984', 'dd-mm-yyyy'), to_date('24-03-2029', 'dd-mm-yyyy'), 1, 191386480, 7714.7260423594859552218516347632124306);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (663022089, 'Tiara Wilkinson', to_date('04-03-1987', 'dd-mm-yyyy'), 71932811, to_date('09-05-2005', 'dd-mm-yyyy'), to_date('04-11-2032', 'dd-mm-yyyy'), 1, 287878005, 39167.889428843641046185937952811934385);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (138808687, 'Taniya Best', to_date('24-08-1965', 'dd-mm-yyyy'), 71932811, to_date('15-03-1994', 'dd-mm-yyyy'), to_date('28-09-2027', 'dd-mm-yyyy'), 1, 754030724, 31129.151891849221022929140965258406548);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (115866959, 'Kristian Perkins', to_date('18-05-1989', 'dd-mm-yyyy'), 311466467, to_date('03-07-2010', 'dd-mm-yyyy'), to_date('19-05-2025', 'dd-mm-yyyy'), 1, 698473099, 15588.741084621821838545872266386900386);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (67162927, 'Daniella Ballard', to_date('24-12-1984', 'dd-mm-yyyy'), 311466467, to_date('31-01-1991', 'dd-mm-yyyy'), to_date('29-04-2036', 'dd-mm-yyyy'), 1, 111413768, 33188.263086764325995175719588662869881);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (726182643, 'Bridger Nicholson', to_date('19-11-1985', 'dd-mm-yyyy'), 214019947, to_date('24-06-2001', 'dd-mm-yyyy'), to_date('22-11-2026', 'dd-mm-yyyy'), 1, 671660675, 32517.830645086015711877284143543331748);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (867117574, 'Tanner Velazquez', to_date('16-07-1966', 'dd-mm-yyyy'), 214019947, to_date('19-07-2014', 'dd-mm-yyyy'), to_date('18-04-2028', 'dd-mm-yyyy'), 1, 892580017, 17376.763206248971829201311658047671638);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (468320988, 'Kadyn Parker', to_date('18-02-1984', 'dd-mm-yyyy'), 655611592, to_date('17-03-2007', 'dd-mm-yyyy'), to_date('26-05-2028', 'dd-mm-yyyy'), 1, 903626083, 11676.340616349901055793545222959078207);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (845532748, 'Ernesto Crane', to_date('21-10-1962', 'dd-mm-yyyy'), 655611592, to_date('19-02-1992', 'dd-mm-yyyy'), to_date('19-09-2022', 'dd-mm-yyyy'), 1, 620937216, 21739.588129962336816369746995687492643);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (979100171, 'Alma Benson', to_date('16-07-1986', 'dd-mm-yyyy'), 267895569, to_date('10-09-2014', 'dd-mm-yyyy'), to_date('07-11-2020', 'dd-mm-yyyy'), 1, 908000615, 27679.506123549729835394206571691660808);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (202306184, 'Marie Barton', to_date('20-09-1961', 'dd-mm-yyyy'), 267895569, to_date('19-04-2009', 'dd-mm-yyyy'), to_date('26-12-2036', 'dd-mm-yyyy'), 2, 724134639, 20960.752650473838233188729706028847661);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (660108450, 'Lilyana Lamb', to_date('06-07-1999', 'dd-mm-yyyy'), 475822438, to_date('01-10-1990', 'dd-mm-yyyy'), to_date('17-01-2037', 'dd-mm-yyyy'), 2, 985907107, 26600.397393218656988940044750147364545);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (481022444, 'Lewis Stewart', to_date('06-06-1983', 'dd-mm-yyyy'), 475822438, to_date('24-11-1982', 'dd-mm-yyyy'), to_date('06-07-2033', 'dd-mm-yyyy'), 1, 726919780, 7238.2208864002012034252513399468941752);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (41216358, 'Alonso Washington', to_date('28-11-1994', 'dd-mm-yyyy'), 608832283, to_date('16-06-2019', 'dd-mm-yyyy'), to_date('27-10-2020', 'dd-mm-yyyy'), 1, 412079807, 22651.43973872660246913438829773307608);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (325294143, 'Aiyana Russo', to_date('18-09-1991', 'dd-mm-yyyy'), 608832283, to_date('11-03-2018', 'dd-mm-yyyy'), to_date('12-01-2037', 'dd-mm-yyyy'), 1, 709915279, 19694.658117820459809147561947362397598);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (803833678, 'Jaylon Mills', to_date('02-05-1971', 'dd-mm-yyyy'), 871947790, to_date('20-12-2016', 'dd-mm-yyyy'), to_date('30-08-2026', 'dd-mm-yyyy'), 2, 434940113, 23181.265674227473594426017095445360792);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (608473425, 'Drew Love', to_date('12-01-1966', 'dd-mm-yyyy'), 871947790, to_date('26-06-1995', 'dd-mm-yyyy'), to_date('20-05-2021', 'dd-mm-yyyy'), 2, 291741163, 12165.918119916798176692095577910680859);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (109416098, 'Denisse Ball', to_date('10-07-1982', 'dd-mm-yyyy'), 531238815, to_date('17-12-2018', 'dd-mm-yyyy'), to_date('30-01-2039', 'dd-mm-yyyy'), 1, 426148194, 16681.405509343493785367082629876807);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (881549786, 'Lia Michael', to_date('14-04-1973', 'dd-mm-yyyy'), 531238815, to_date('29-10-2008', 'dd-mm-yyyy'), to_date('26-01-2030', 'dd-mm-yyyy'), 2, 64526097, 33353.797024546135018522627723471387936);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (869554266, 'Esteban Frederick', to_date('11-09-1990', 'dd-mm-yyyy'), 648956315, to_date('05-12-2006', 'dd-mm-yyyy'), to_date('13-05-2028', 'dd-mm-yyyy'), 2, 603338542, 36653.010788535970377331561897593965882);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (325939163, 'Addyson Farley', to_date('16-11-1961', 'dd-mm-yyyy'), 648956315, to_date('04-04-1998', 'dd-mm-yyyy'), to_date('26-03-2030', 'dd-mm-yyyy'), 2, 784600813, 9134.3423898980260701787097975103273226);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (599701445, 'Peyton Griffith', to_date('22-10-1951', 'dd-mm-yyyy'), 71932811, to_date('25-11-1982', 'dd-mm-yyyy'), to_date('17-08-2020', 'dd-mm-yyyy'), 2, 70822249, 18541.885710065839482793883653159424288);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (720256910, 'Ronan Holmes', to_date('23-02-1956', 'dd-mm-yyyy'), 71932811, to_date('06-02-1994', 'dd-mm-yyyy'), to_date('11-06-2037', 'dd-mm-yyyy'), 2, 70831716, 14328.463257789680750527825557482493274);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (42734252, 'Heidy Cruz', to_date('15-03-1986', 'dd-mm-yyyy'), 311466467, to_date('27-12-1991', 'dd-mm-yyyy'), to_date('18-05-2022', 'dd-mm-yyyy'), 2, 751988735, 9201.1115399341994018090823608469176845);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (371691541, 'Miracle Gould', to_date('30-11-1984', 'dd-mm-yyyy'), 311466467, to_date('20-12-2019', 'dd-mm-yyyy'), to_date('27-06-2035', 'dd-mm-yyyy'), 1, 365963339, 37217.522537981871169600617740971584758);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (42464775, 'Gunnar Barr', to_date('09-06-1997', 'dd-mm-yyyy'), 214019947, to_date('03-06-2002', 'dd-mm-yyyy'), to_date('30-08-2025', 'dd-mm-yyyy'), 2, 648911084, 30819.180878594967828706807120235036541);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (212036071, 'Chana Meadows', to_date('18-01-1959', 'dd-mm-yyyy'), 214019947, to_date('30-09-2006', 'dd-mm-yyyy'), to_date('29-09-2029', 'dd-mm-yyyy'), 1, 185000152, 6056.7772195842162764627028254601356215);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (558483801, 'Olivia Duncan', to_date('09-08-1973', 'dd-mm-yyyy'), 655611592, to_date('29-02-2012', 'dd-mm-yyyy'), to_date('25-10-2040', 'dd-mm-yyyy'), 2, 710935253, 16215.447677570136176864975958651469595);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (833381050, 'Kolten Clarke', to_date('27-02-1964', 'dd-mm-yyyy'), 655611592, to_date('11-07-2005', 'dd-mm-yyyy'), to_date('01-01-2021', 'dd-mm-yyyy'), 2, 293713935, 33313.318510306708417155743082310357739);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (944474945, 'Milagros Hill', to_date('05-01-1994', 'dd-mm-yyyy'), 267895569, to_date('15-01-1982', 'dd-mm-yyyy'), to_date('14-01-2031', 'dd-mm-yyyy'), 1, 63271602, 18027.925065263299524800245158695893687);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (948300705, 'Libby Dickson', to_date('03-02-1961', 'dd-mm-yyyy'), 267895569, to_date('15-10-2001', 'dd-mm-yyyy'), to_date('27-02-2038', 'dd-mm-yyyy'), 2, 326413904, 28356.0383070519795802116557367318434);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (572710466, 'Kiley Compton', to_date('25-02-1989', 'dd-mm-yyyy'), 475822438, to_date('15-03-1998', 'dd-mm-yyyy'), to_date('10-02-2023', 'dd-mm-yyyy'), 2, 360147273, 27236.526138116180649215524025872792418);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (36653768, 'Taryn Bridges', to_date('19-08-1968', 'dd-mm-yyyy'), 608832283, to_date('01-11-2004', 'dd-mm-yyyy'), to_date('10-05-2034', 'dd-mm-yyyy'), 2, 642196831, 33656.39914505061108675230479292286124);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (609838404, 'Elsie Black', to_date('19-11-1971', 'dd-mm-yyyy'), 608832283, to_date('03-06-1992', 'dd-mm-yyyy'), to_date('17-12-2024', 'dd-mm-yyyy'), 1, 187988627, 25000.312633530483701024021803058821825);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (74246556, 'Bruce Meyer', to_date('18-03-1996', 'dd-mm-yyyy'), 871947790, to_date('08-04-2006', 'dd-mm-yyyy'), to_date('19-04-2031', 'dd-mm-yyyy'), 1, 211681471, 25000.378299588731251471393777068383402);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (69683187, 'Teagan Fritz', to_date('22-09-1951', 'dd-mm-yyyy'), 871947790, to_date('27-02-1990', 'dd-mm-yyyy'), to_date('24-06-2028', 'dd-mm-yyyy'), 2, 503126262, 26684.18786363516707752814178772822681);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (772049123, 'Alfredo Cline', to_date('16-06-1994', 'dd-mm-yyyy'), 531238815, to_date('08-02-2015', 'dd-mm-yyyy'), to_date('24-09-2025', 'dd-mm-yyyy'), 2, 437511476, 34132.269700683266923953969725978945376);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (9637682, 'Alvin Alvarez', to_date('06-02-1994', 'dd-mm-yyyy'), 531238815, to_date('07-10-2000', 'dd-mm-yyyy'), to_date('12-11-2035', 'dd-mm-yyyy'), 2, 991978392, 13307.812488475930709376536895650004232);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (894659176, 'Cayden Henry', to_date('16-04-1968', 'dd-mm-yyyy'), 648956315, to_date('26-09-1991', 'dd-mm-yyyy'), to_date('22-11-2029', 'dd-mm-yyyy'), 1, 897773040, 24762.633196457355346327647205746228471);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (420691439, 'Haiden Shepard', to_date('17-06-1964', 'dd-mm-yyyy'), 71932811, to_date('20-09-1995', 'dd-mm-yyyy'), to_date('23-01-2020', 'dd-mm-yyyy'), 1, 779945885, 28527.361522623696509520686774448988006);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (93706212, 'Braden Summers', to_date('06-07-1993', 'dd-mm-yyyy'), 71932811, to_date('13-12-2004', 'dd-mm-yyyy'), to_date('15-12-2028', 'dd-mm-yyyy'), 2, 726563582, 5540.2358650611680252394985988952698139);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (227081707, 'James Nichols', to_date('03-02-1960', 'dd-mm-yyyy'), 311466467, to_date('16-01-2005', 'dd-mm-yyyy'), to_date('22-11-2026', 'dd-mm-yyyy'), 1, 156171593, 35837.156365628830215646033365604634997);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (670519313, 'Joselyn Chan', to_date('22-04-1964', 'dd-mm-yyyy'), 214019947, to_date('03-04-1986', 'dd-mm-yyyy'), to_date('10-11-2022', 'dd-mm-yyyy'), 1, 388283660, 25986.121671642552951971101348324802173);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (135594200, 'Serena Klein', to_date('14-12-1970', 'dd-mm-yyyy'), 214019947, to_date('28-11-1980', 'dd-mm-yyyy'), to_date('21-05-2032', 'dd-mm-yyyy'), 2, 18795929, 22273.329059396934631082171002708431329);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (829823516, 'Kiana Jimenez', to_date('24-09-1993', 'dd-mm-yyyy'), 655611592, to_date('03-06-2007', 'dd-mm-yyyy'), to_date('18-05-2021', 'dd-mm-yyyy'), 2, 173006051, 31042.784190640829686796137188889747455);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (163199704, 'Tamia Mercado', to_date('03-11-1951', 'dd-mm-yyyy'), 267895569, to_date('18-01-2006', 'dd-mm-yyyy'), to_date('29-01-2037', 'dd-mm-yyyy'), 2, 840454690, 32962.478995010401739244282679799519574);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (651653039, 'Ariel Little', to_date('26-04-1955', 'dd-mm-yyyy'), 475822438, to_date('09-10-1994', 'dd-mm-yyyy'), to_date('22-01-2032', 'dd-mm-yyyy'), 2, 55937608, 9121.2088786137146087798644594047073959);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (334482803, 'Nolan Orozco', to_date('18-05-1988', 'dd-mm-yyyy'), 475822438, to_date('06-08-2013', 'dd-mm-yyyy'), to_date('18-06-2023', 'dd-mm-yyyy'), 1, 719978224, 6775.8236147327071684492877237832163822);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (590390539, 'George Maldonado', to_date('05-11-1984', 'dd-mm-yyyy'), 608832283, to_date('14-07-1984', 'dd-mm-yyyy'), to_date('26-10-2032', 'dd-mm-yyyy'), 2, 834214215, 8183.9222283803925578257005781593370243);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (930997789, 'Leonel Joseph', to_date('07-03-1963', 'dd-mm-yyyy'), 871947790, to_date('07-01-1984', 'dd-mm-yyyy'), to_date('19-09-2023', 'dd-mm-yyyy'), 1, 988386543, 3113.7025271378068915207640205283821411);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (264181465, 'Koen Finley', to_date('09-02-1999', 'dd-mm-yyyy'), 871947790, to_date('12-10-1987', 'dd-mm-yyyy'), to_date('05-07-2038', 'dd-mm-yyyy'), 2, 129407872, 18862.35828701665261189324190396187946);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (675443623, 'Noelle Butler', to_date('22-10-1999', 'dd-mm-yyyy'), 531238815, to_date('02-09-2002', 'dd-mm-yyyy'), to_date('14-03-2025', 'dd-mm-yyyy'), 1, 742852779, 33803.698220835031437731989611021742538);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (98795350, 'Saul Leonard', to_date('22-09-1962', 'dd-mm-yyyy'), 648956315, to_date('11-08-2016', 'dd-mm-yyyy'), to_date('01-05-2037', 'dd-mm-yyyy'), 2, 592650513, 21762.91751536859650591318778158206836);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (291975656, 'Haley Howe', to_date('25-08-1989', 'dd-mm-yyyy'), 648956315, to_date('09-07-2003', 'dd-mm-yyyy'), to_date('06-12-2037', 'dd-mm-yyyy'), 1, 448291127, 16054.515507227283992391226281292025767);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (832411481, 'Josie Mcfarland', to_date('19-04-1978', 'dd-mm-yyyy'), 71932811, to_date('31-05-1985', 'dd-mm-yyyy'), to_date('07-07-2031', 'dd-mm-yyyy'), 1, 653961350, 4932.2485803413571248224693757347971888);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (821772864, 'Yazmin Oconnell', to_date('31-10-1963', 'dd-mm-yyyy'), 311466467, to_date('28-02-2002', 'dd-mm-yyyy'), to_date('16-05-2035', 'dd-mm-yyyy'), 1, 64729682, 29987.070307438608874892745073046970926);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (927420065, 'Declan Wilson', to_date('09-09-1990', 'dd-mm-yyyy'), 214019947, to_date('21-09-1981', 'dd-mm-yyyy'), to_date('12-12-2020', 'dd-mm-yyyy'), 1, 685600354, 34185.92911143343729939184379071854217);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (694973824, 'Iyana Paul', to_date('15-08-1953', 'dd-mm-yyyy'), 648956315, to_date('09-02-2004', 'dd-mm-yyyy'), to_date('25-10-2021', 'dd-mm-yyyy'), 1, 206683768, 28804.18876219195801541084822503836998);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (460241027, 'Damien Hess', to_date('22-12-1968', 'dd-mm-yyyy'), 311466467, to_date('18-08-2013', 'dd-mm-yyyy'), to_date('01-12-2022', 'dd-mm-yyyy'), 1, 171910180, 26501.58159707103441233146267097322762);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (390209868, 'Sammy Bonilla', to_date('04-11-1956', 'dd-mm-yyyy'), 655611592, to_date('05-06-2001', 'dd-mm-yyyy'), to_date('21-04-2037', 'dd-mm-yyyy'), 1, 856592056, 10545.755710349315236677529302239225436);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (47750333, 'Chanel Raymond', to_date('27-04-1973', 'dd-mm-yyyy'), 267895569, to_date('12-12-2012', 'dd-mm-yyyy'), to_date('25-03-2028', 'dd-mm-yyyy'), 2, 677761715, 5732.8015133009514094129673947795150378);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (777271072, 'Valery Leach', to_date('17-06-1959', 'dd-mm-yyyy'), 608832283, to_date('20-01-1980', 'dd-mm-yyyy'), to_date('16-08-2037', 'dd-mm-yyyy'), 2, 434932129, 35912.866754466081705009069248831870624);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (904309366, 'Marshall Barton', to_date('24-11-1993', 'dd-mm-yyyy'), 531238815, to_date('13-12-1980', 'dd-mm-yyyy'), to_date('26-06-2037', 'dd-mm-yyyy'), 1, 452323355, 36590.575938910057280591902941905546397);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (659346126, 'Emmy Strong', to_date('09-09-1973', 'dd-mm-yyyy'), 71932811, to_date('04-05-1996', 'dd-mm-yyyy'), to_date('16-06-2025', 'dd-mm-yyyy'), 1, 18645918, 21335.905268600340922146511364614522048);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (813408967, 'Zaniyah Reese', to_date('19-01-1997', 'dd-mm-yyyy'), 311466467, to_date('14-07-1999', 'dd-mm-yyyy'), to_date('17-03-2035', 'dd-mm-yyyy'), 1, 955095939, 5961.0652840043219342127515090876694865);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (978976997, 'Kelly Murphy', to_date('03-06-1983', 'dd-mm-yyyy'), 608832283, to_date('16-06-2008', 'dd-mm-yyyy'), to_date('18-04-2023', 'dd-mm-yyyy'), 2, 996662084, 30094.418105389213383082205093906409382);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (151713573, 'Phoenix Mcdowell', to_date('20-11-1994', 'dd-mm-yyyy'), 475822438, to_date('10-01-1990', 'dd-mm-yyyy'), to_date('26-08-2032', 'dd-mm-yyyy'), 2, 792958079, 17850.987808947720464222155946218053754);
commit;
prompt 100 records committed...
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5000, 'Isaiah Moreno', to_date('18-12-1954', 'dd-mm-yyyy'), 5004, to_date('04-01-2020', 'dd-mm-yyyy'), to_date('19-10-2020', 'dd-mm-yyyy'), 1, 166, 16769);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5001, 'Russell Carradine', to_date('21-02-1958', 'dd-mm-yyyy'), 5008, to_date('08-04-2020', 'dd-mm-yyyy'), to_date('02-06-2020', 'dd-mm-yyyy'), 2, 503, 6845);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5002, 'Todd Anderson', to_date('04-11-1960', 'dd-mm-yyyy'), 5008, to_date('18-04-2009', 'dd-mm-yyyy'), to_date('03-04-2021', 'dd-mm-yyyy'), 2, 627, 6350);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5004, 'Domingo Hong', to_date('03-11-1957', 'dd-mm-yyyy'), 5007, to_date('13-05-2017', 'dd-mm-yyyy'), to_date('13-01-2025', 'dd-mm-yyyy'), 2, 920, 14382);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5005, 'David Gyllenhaal', to_date('13-07-1960', 'dd-mm-yyyy'), 5009, to_date('16-12-2019', 'dd-mm-yyyy'), to_date('05-11-2025', 'dd-mm-yyyy'), 2, 878, 21384);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5006, 'Roddy Cross', to_date('15-01-1955', 'dd-mm-yyyy'), 5007, to_date('27-01-2013', 'dd-mm-yyyy'), to_date('03-08-2024', 'dd-mm-yyyy'), 1, 404, 5463);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5007, 'Kim Glover', to_date('08-06-1955', 'dd-mm-yyyy'), 5003, to_date('25-07-2015', 'dd-mm-yyyy'), to_date('04-04-2025', 'dd-mm-yyyy'), 2, 848, 18894);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5008, 'Wendy Downey', to_date('10-12-1957', 'dd-mm-yyyy'), 5001, to_date('05-08-2016', 'dd-mm-yyyy'), to_date('09-04-2023', 'dd-mm-yyyy'), 2, 316, 6122);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5011, 'Mae Cherry', to_date('05-01-1952', 'dd-mm-yyyy'), 5009, to_date('16-05-2015', 'dd-mm-yyyy'), to_date('25-12-2024', 'dd-mm-yyyy'), 2, 731, 10591);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5012, 'Rick Sizemore', to_date('16-01-1955', 'dd-mm-yyyy'), 5008, to_date('20-10-2011', 'dd-mm-yyyy'), to_date('21-12-2024', 'dd-mm-yyyy'), 2, 14, 20722);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5013, 'Mia Strathairn', to_date('10-05-1957', 'dd-mm-yyyy'), 5003, to_date('17-05-2015', 'dd-mm-yyyy'), to_date('05-07-2024', 'dd-mm-yyyy'), 2, 853, 18032);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5014, 'Rosanna Napolitano', to_date('17-08-1956', 'dd-mm-yyyy'), 5003, to_date('29-03-2009', 'dd-mm-yyyy'), to_date('30-08-2022', 'dd-mm-yyyy'), 1, 642, 21995);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5016, 'Mykelti Berenger', to_date('13-11-1960', 'dd-mm-yyyy'), 5006, to_date('14-04-2008', 'dd-mm-yyyy'), to_date('03-08-2020', 'dd-mm-yyyy'), 2, 325, 21494);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5017, 'Albertina Mellencamp', to_date('28-06-1954', 'dd-mm-yyyy'), 5005, to_date('20-01-2013', 'dd-mm-yyyy'), to_date('16-01-2022', 'dd-mm-yyyy'), 2, 877, 4779);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5018, 'Ellen Kutcher', to_date('09-07-1953', 'dd-mm-yyyy'), 5001, to_date('01-11-2011', 'dd-mm-yyyy'), to_date('29-10-2023', 'dd-mm-yyyy'), 1, 914, 11830);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5019, 'Sarah Turturro', to_date('16-07-1956', 'dd-mm-yyyy'), 5009, to_date('10-07-2017', 'dd-mm-yyyy'), to_date('22-11-2022', 'dd-mm-yyyy'), 1, 578, 12855);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5020, 'Nikka Soul', to_date('10-04-1951', 'dd-mm-yyyy'), 5003, to_date('05-04-2020', 'dd-mm-yyyy'), to_date('21-09-2020', 'dd-mm-yyyy'), 1, 175, 10439);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5022, 'Anna Rains', to_date('14-01-1952', 'dd-mm-yyyy'), 5008, to_date('25-12-2016', 'dd-mm-yyyy'), to_date('11-07-2024', 'dd-mm-yyyy'), 1, 341, 16873);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5023, 'Jessica Dolenz', to_date('12-12-1955', 'dd-mm-yyyy'), 5003, to_date('26-11-2013', 'dd-mm-yyyy'), to_date('06-01-2022', 'dd-mm-yyyy'), 2, 155, 9141);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5025, 'Donald Giraldo', to_date('24-02-1957', 'dd-mm-yyyy'), 5008, to_date('20-08-2016', 'dd-mm-yyyy'), to_date('16-10-2024', 'dd-mm-yyyy'), 2, 732, 14283);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5026, 'Donald Giraldo', to_date('19-02-1958', 'dd-mm-yyyy'), 5004, to_date('04-04-2016', 'dd-mm-yyyy'), to_date('22-12-2021', 'dd-mm-yyyy'), 1, 732, 14454);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5028, 'Lydia Douglas', to_date('12-03-1952', 'dd-mm-yyyy'), 5001, to_date('29-12-2016', 'dd-mm-yyyy'), to_date('24-11-2021', 'dd-mm-yyyy'), 1, 8, 20730);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5029, 'Vanessa Kattan', to_date('02-05-1953', 'dd-mm-yyyy'), 5009, to_date('28-04-2013', 'dd-mm-yyyy'), to_date('17-11-2021', 'dd-mm-yyyy'), 2, 280, 9948);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5030, 'Harriet Jonze', to_date('11-09-1960', 'dd-mm-yyyy'), 5009, to_date('17-01-2008', 'dd-mm-yyyy'), to_date('06-09-2021', 'dd-mm-yyyy'), 1, 736, 20254);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5031, 'Ray Burmester', to_date('24-02-1958', 'dd-mm-yyyy'), 5004, to_date('22-11-2008', 'dd-mm-yyyy'), to_date('07-08-2025', 'dd-mm-yyyy'), 2, 56, 14712);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5032, 'Larry Drive', to_date('30-03-1958', 'dd-mm-yyyy'), 5001, to_date('30-12-2012', 'dd-mm-yyyy'), to_date('27-03-2025', 'dd-mm-yyyy'), 1, 193, 5439);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5034, 'Micky Parsons', to_date('19-04-1951', 'dd-mm-yyyy'), 5007, to_date('15-12-2011', 'dd-mm-yyyy'), to_date('15-01-2022', 'dd-mm-yyyy'), 2, 344, 4878);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5035, 'Marley Moorer', to_date('02-07-1954', 'dd-mm-yyyy'), 5002, to_date('12-08-2015', 'dd-mm-yyyy'), to_date('26-09-2024', 'dd-mm-yyyy'), 1, 750, 17652);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5036, 'Christian Finn', to_date('07-12-1955', 'dd-mm-yyyy'), 5005, to_date('30-01-2019', 'dd-mm-yyyy'), to_date('28-06-2024', 'dd-mm-yyyy'), 2, 322, 5319);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5037, 'Anna Rains', to_date('19-02-1954', 'dd-mm-yyyy'), 5007, to_date('20-06-2017', 'dd-mm-yyyy'), to_date('03-11-2025', 'dd-mm-yyyy'), 2, 341, 8360);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5040, 'Murray Douglas', to_date('02-05-1959', 'dd-mm-yyyy'), 5008, to_date('07-04-2010', 'dd-mm-yyyy'), to_date('10-03-2021', 'dd-mm-yyyy'), 1, 156, 16463);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5041, 'Gordon Womack', to_date('13-11-1950', 'dd-mm-yyyy'), 5005, to_date('18-09-2015', 'dd-mm-yyyy'), to_date('16-08-2022', 'dd-mm-yyyy'), 1, 729, 10690);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5042, 'Thomas Craig', to_date('01-07-1960', 'dd-mm-yyyy'), 5002, to_date('06-03-2016', 'dd-mm-yyyy'), to_date('09-10-2022', 'dd-mm-yyyy'), 2, 607, 19329);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5043, 'Sheryl Hartnett', to_date('01-12-1956', 'dd-mm-yyyy'), 5006, to_date('13-09-2014', 'dd-mm-yyyy'), to_date('17-11-2021', 'dd-mm-yyyy'), 2, 708, 10613);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5044, 'Lena Sandler', to_date('23-03-1958', 'dd-mm-yyyy'), 5002, to_date('21-05-2009', 'dd-mm-yyyy'), to_date('21-11-2021', 'dd-mm-yyyy'), 2, 955, 12189);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5046, 'Hector Pleasence', to_date('16-10-1959', 'dd-mm-yyyy'), 5009, to_date('07-07-2019', 'dd-mm-yyyy'), to_date('26-03-2021', 'dd-mm-yyyy'), 2, 747, 12979);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5047, 'Halle Imperioli', to_date('01-07-1951', 'dd-mm-yyyy'), 5007, to_date('20-07-2019', 'dd-mm-yyyy'), to_date('31-01-2022', 'dd-mm-yyyy'), 1, 547, 6330);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5048, 'Don Lineback', to_date('08-05-1955', 'dd-mm-yyyy'), 5003, to_date('27-06-2009', 'dd-mm-yyyy'), to_date('03-04-2025', 'dd-mm-yyyy'), 1, 339, 16830);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5049, 'Kay Coburn', to_date('13-08-1958', 'dd-mm-yyyy'), 5008, to_date('08-03-2015', 'dd-mm-yyyy'), to_date('01-10-2023', 'dd-mm-yyyy'), 1, 365, 12266);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5050, 'Karon Leachman', to_date('06-09-1953', 'dd-mm-yyyy'), 5005, to_date('26-09-2008', 'dd-mm-yyyy'), to_date('29-05-2021', 'dd-mm-yyyy'), 2, 131, 16725);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5052, 'Vanessa Vance', to_date('06-07-1953', 'dd-mm-yyyy'), 5004, to_date('04-08-2018', 'dd-mm-yyyy'), to_date('05-11-2021', 'dd-mm-yyyy'), 2, 410, 6909);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5054, 'Nina Bassett', to_date('23-03-1955', 'dd-mm-yyyy'), 5002, to_date('01-12-2015', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'), 2, 479, 10085);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5055, 'Cliff Heche', to_date('24-10-1951', 'dd-mm-yyyy'), 5009, to_date('11-08-2015', 'dd-mm-yyyy'), to_date('05-04-2022', 'dd-mm-yyyy'), 1, 700, 19565);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5057, 'Liam Aaron', to_date('24-12-1957', 'dd-mm-yyyy'), 5002, to_date('24-04-2016', 'dd-mm-yyyy'), to_date('25-04-2022', 'dd-mm-yyyy'), 1, 527, 16316);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5058, 'Nikki Close', to_date('11-01-1953', 'dd-mm-yyyy'), 5008, to_date('19-05-2008', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'), 1, 727, 20117);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5059, 'Domingo Hong', to_date('13-01-1960', 'dd-mm-yyyy'), 5010, to_date('08-05-2017', 'dd-mm-yyyy'), to_date('30-05-2025', 'dd-mm-yyyy'), 1, 920, 19088);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5061, 'King Hershey', to_date('12-11-1952', 'dd-mm-yyyy'), 5005, to_date('04-09-2010', 'dd-mm-yyyy'), to_date('09-07-2022', 'dd-mm-yyyy'), 1, 386, 19092);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5062, 'Cyndi Ferrer', to_date('27-09-1954', 'dd-mm-yyyy'), 5006, to_date('26-09-2019', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'), 1, 511, 17085);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5064, 'Emm MacNeil', to_date('01-08-1952', 'dd-mm-yyyy'), 5003, to_date('07-05-2018', 'dd-mm-yyyy'), to_date('08-08-2023', 'dd-mm-yyyy'), 1, 776, 16368);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5067, 'Mae Cherry', to_date('17-09-1951', 'dd-mm-yyyy'), 5009, to_date('19-08-2015', 'dd-mm-yyyy'), to_date('17-11-2024', 'dd-mm-yyyy'), 1, 731, 20834);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5068, 'Walter Rosas', to_date('09-06-1954', 'dd-mm-yyyy'), 5004, to_date('02-10-2012', 'dd-mm-yyyy'), to_date('30-03-2024', 'dd-mm-yyyy'), 2, 660, 9540);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5070, 'Anthony Ribisi', to_date('06-07-1956', 'dd-mm-yyyy'), 5003, to_date('06-09-2015', 'dd-mm-yyyy'), to_date('23-09-2024', 'dd-mm-yyyy'), 2, 835, 5185);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5073, 'Gilberto Rea', to_date('29-06-1950', 'dd-mm-yyyy'), 5002, to_date('12-02-2018', 'dd-mm-yyyy'), to_date('16-09-2022', 'dd-mm-yyyy'), 1, 843, 5417);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5076, 'Chrissie Zahn', to_date('18-05-1960', 'dd-mm-yyyy'), 5007, to_date('04-09-2010', 'dd-mm-yyyy'), to_date('27-10-2025', 'dd-mm-yyyy'), 1, 924, 5352);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5078, 'Fats Walker', to_date('15-03-1959', 'dd-mm-yyyy'), 5005, to_date('06-09-2019', 'dd-mm-yyyy'), to_date('19-09-2021', 'dd-mm-yyyy'), 2, 845, 17794);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5079, 'Tyrone Sledge', to_date('10-05-1955', 'dd-mm-yyyy'), 5008, to_date('06-05-2009', 'dd-mm-yyyy'), to_date('12-02-2023', 'dd-mm-yyyy'), 2, 850, 19605);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5081, 'Gabrielle Hampton', to_date('08-01-1953', 'dd-mm-yyyy'), 5007, to_date('06-03-2008', 'dd-mm-yyyy'), to_date('22-11-2022', 'dd-mm-yyyy'), 2, 932, 16258);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5082, 'Pamela Beals', to_date('17-06-1952', 'dd-mm-yyyy'), 5007, to_date('05-08-2014', 'dd-mm-yyyy'), to_date('22-12-2025', 'dd-mm-yyyy'), 2, 840, 12343);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5085, 'Etta Stills', to_date('11-09-1960', 'dd-mm-yyyy'), 5009, to_date('17-06-2013', 'dd-mm-yyyy'), to_date('15-03-2023', 'dd-mm-yyyy'), 2, 551, 19795);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5087, 'Debi Chandler', to_date('30-10-1950', 'dd-mm-yyyy'), 5007, to_date('02-05-2019', 'dd-mm-yyyy'), to_date('18-10-2020', 'dd-mm-yyyy'), 1, 521, 10063);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5088, 'Gaby Coughlan', to_date('11-06-1957', 'dd-mm-yyyy'), 5003, to_date('28-03-2017', 'dd-mm-yyyy'), to_date('19-06-2022', 'dd-mm-yyyy'), 1, 94, 6513);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5090, 'Timothy McKennitt', to_date('14-03-1952', 'dd-mm-yyyy'), 5004, to_date('04-10-2014', 'dd-mm-yyyy'), to_date('08-12-2022', 'dd-mm-yyyy'), 2, 446, 14015);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5091, 'Ahmad Gill', to_date('08-10-1954', 'dd-mm-yyyy'), 5009, to_date('18-09-2008', 'dd-mm-yyyy'), to_date('26-04-2024', 'dd-mm-yyyy'), 2, 921, 21671);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5095, 'Guy Tobolowsky', to_date('05-10-1955', 'dd-mm-yyyy'), 5007, to_date('05-05-2019', 'dd-mm-yyyy'), to_date('19-03-2022', 'dd-mm-yyyy'), 2, 243, 6805);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5098, 'Diane Kattan', to_date('14-04-1954', 'dd-mm-yyyy'), 5008, to_date('03-04-2008', 'dd-mm-yyyy'), to_date('12-11-2022', 'dd-mm-yyyy'), 1, 209, 16821);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5099, 'Dwight Moriarty', to_date('03-12-1954', 'dd-mm-yyyy'), 5002, to_date('31-03-2018', 'dd-mm-yyyy'), to_date('03-12-2021', 'dd-mm-yyyy'), 1, 107, 10003);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5101, 'Bob Robbins', to_date('17-12-1959', 'dd-mm-yyyy'), 5002, to_date('20-05-2020', 'dd-mm-yyyy'), to_date('15-11-2021', 'dd-mm-yyyy'), 1, 772, 18621);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5104, 'Roy Borgnine', to_date('13-01-1959', 'dd-mm-yyyy'), 5003, to_date('25-01-2009', 'dd-mm-yyyy'), to_date('25-09-2023', 'dd-mm-yyyy'), 1, 321, 17881);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5106, 'Owen Viterelli', to_date('30-04-1954', 'dd-mm-yyyy'), 5006, to_date('10-06-2008', 'dd-mm-yyyy'), to_date('16-02-2024', 'dd-mm-yyyy'), 1, 755, 5701);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5107, 'Natascha Sampson', to_date('15-07-1953', 'dd-mm-yyyy'), 5006, to_date('04-05-2019', 'dd-mm-yyyy'), to_date('25-10-2024', 'dd-mm-yyyy'), 1, 548, 16787);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5109, 'Benjamin Lennox', to_date('19-10-1958', 'dd-mm-yyyy'), 5008, to_date('26-06-2015', 'dd-mm-yyyy'), to_date('23-02-2025', 'dd-mm-yyyy'), 2, 188, 8952);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5111, 'Kyra Boone', to_date('15-11-1958', 'dd-mm-yyyy'), 5004, to_date('12-08-2014', 'dd-mm-yyyy'), to_date('13-10-2020', 'dd-mm-yyyy'), 1, 715, 11497);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5113, 'Isaiah Dayne', to_date('04-04-1957', 'dd-mm-yyyy'), 5002, to_date('07-03-2008', 'dd-mm-yyyy'), to_date('14-05-2024', 'dd-mm-yyyy'), 1, 684, 21333);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5115, 'Minnie DiBiasio', to_date('16-01-1950', 'dd-mm-yyyy'), 5006, to_date('05-02-2009', 'dd-mm-yyyy'), to_date('09-11-2022', 'dd-mm-yyyy'), 1, 275, 17991);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5117, 'Timothy Rivers', to_date('22-04-1955', 'dd-mm-yyyy'), 5009, to_date('08-03-2011', 'dd-mm-yyyy'), to_date('26-10-2023', 'dd-mm-yyyy'), 1, 603, 10096);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5118, 'Betty Polley', to_date('06-01-1956', 'dd-mm-yyyy'), 5008, to_date('30-08-2011', 'dd-mm-yyyy'), to_date('14-12-2025', 'dd-mm-yyyy'), 1, 448, 21374);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5122, 'Chad Torn', to_date('27-12-1951', 'dd-mm-yyyy'), 5009, to_date('10-12-2013', 'dd-mm-yyyy'), to_date('06-06-2021', 'dd-mm-yyyy'), 1, 601, 6200);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5124, 'Samuel Carlisle', to_date('03-03-1959', 'dd-mm-yyyy'), 5001, to_date('26-02-2011', 'dd-mm-yyyy'), to_date('01-05-2022', 'dd-mm-yyyy'), 1, 938, 13120);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5126, 'Oliver Hornsby', to_date('12-09-1960', 'dd-mm-yyyy'), 5008, to_date('09-09-2013', 'dd-mm-yyyy'), to_date('07-08-2020', 'dd-mm-yyyy'), 2, 852, 9717);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5127, 'Corey Brown', to_date('14-09-1960', 'dd-mm-yyyy'), 5009, to_date('13-03-2011', 'dd-mm-yyyy'), to_date('09-11-2025', 'dd-mm-yyyy'), 1, 377, 20645);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5130, 'Alana Shalhoub', to_date('21-02-1956', 'dd-mm-yyyy'), 5006, to_date('05-04-2018', 'dd-mm-yyyy'), to_date('21-10-2024', 'dd-mm-yyyy'), 1, 177, 20387);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5132, 'Collin Englund', to_date('17-08-1953', 'dd-mm-yyyy'), 5009, to_date('11-05-2014', 'dd-mm-yyyy'), to_date('18-06-2024', 'dd-mm-yyyy'), 1, 432, 9801);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5133, 'Art Weston', to_date('18-03-1953', 'dd-mm-yyyy'), 5002, to_date('22-11-2013', 'dd-mm-yyyy'), to_date('07-04-2023', 'dd-mm-yyyy'), 2, 831, 15691);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5135, 'Stephanie Horizon', to_date('12-10-1951', 'dd-mm-yyyy'), 5007, to_date('15-01-2009', 'dd-mm-yyyy'), to_date('01-03-2021', 'dd-mm-yyyy'), 1, 963, 21539);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5137, 'Ralph Hopkins', to_date('02-09-1951', 'dd-mm-yyyy'), 5004, to_date('06-10-2014', 'dd-mm-yyyy'), to_date('25-12-2021', 'dd-mm-yyyy'), 2, 985, 9942);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5140, 'Maxine Bullock', to_date('24-01-1959', 'dd-mm-yyyy'), 5008, to_date('14-03-2017', 'dd-mm-yyyy'), to_date('11-08-2024', 'dd-mm-yyyy'), 2, 310, 6387);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5142, 'Dan Botti', to_date('19-10-1958', 'dd-mm-yyyy'), 5007, to_date('06-07-2010', 'dd-mm-yyyy'), to_date('23-02-2022', 'dd-mm-yyyy'), 2, 82, 12802);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5144, 'Corey Day', to_date('28-09-1954', 'dd-mm-yyyy'), 5009, to_date('13-12-2016', 'dd-mm-yyyy'), to_date('07-02-2024', 'dd-mm-yyyy'), 2, 862, 4552);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5146, 'Art Weston', to_date('24-02-1957', 'dd-mm-yyyy'), 5010, to_date('18-02-2020', 'dd-mm-yyyy'), to_date('03-09-2023', 'dd-mm-yyyy'), 1, 831, 20457);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5147, 'Blair Caviezel', to_date('30-08-1959', 'dd-mm-yyyy'), 5008, to_date('26-12-2008', 'dd-mm-yyyy'), to_date('28-10-2023', 'dd-mm-yyyy'), 2, 372, 7635);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5150, 'Omar Puckett', to_date('22-09-1956', 'dd-mm-yyyy'), 5002, to_date('14-07-2010', 'dd-mm-yyyy'), to_date('11-08-2025', 'dd-mm-yyyy'), 1, 886, 15045);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5152, 'William Murdock', to_date('29-09-1960', 'dd-mm-yyyy'), 5010, to_date('29-11-2013', 'dd-mm-yyyy'), to_date('24-04-2023', 'dd-mm-yyyy'), 1, 898, 12403);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5154, 'Rip Pitney', to_date('07-10-1958', 'dd-mm-yyyy'), 5005, to_date('31-10-2011', 'dd-mm-yyyy'), to_date('13-06-2020', 'dd-mm-yyyy'), 2, 857, 8132);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5155, 'Rhona Connick', to_date('18-01-1960', 'dd-mm-yyyy'), 5007, to_date('16-05-2014', 'dd-mm-yyyy'), to_date('22-12-2022', 'dd-mm-yyyy'), 1, 639, 14932);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5156, 'Ruth Lopez', to_date('10-10-1958', 'dd-mm-yyyy'), 5002, to_date('05-02-2009', 'dd-mm-yyyy'), to_date('30-09-2020', 'dd-mm-yyyy'), 2, 438, 12811);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5160, 'Cheech McCoy', to_date('16-07-1952', 'dd-mm-yyyy'), 5008, to_date('04-07-2014', 'dd-mm-yyyy'), to_date('24-08-2020', 'dd-mm-yyyy'), 2, 210, 4749);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5161, 'Saffron Gosdin', to_date('21-08-1956', 'dd-mm-yyyy'), 5003, to_date('23-06-2010', 'dd-mm-yyyy'), to_date('29-03-2021', 'dd-mm-yyyy'), 1, 654, 5714);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5163, 'Marty Scorsese', to_date('31-03-1959', 'dd-mm-yyyy'), 5010, to_date('07-11-2012', 'dd-mm-yyyy'), to_date('08-12-2023', 'dd-mm-yyyy'), 2, 223, 17003);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5164, 'Vincent Peniston', to_date('29-08-1960', 'dd-mm-yyyy'), 5002, to_date('03-02-2019', 'dd-mm-yyyy'), to_date('29-11-2021', 'dd-mm-yyyy'), 2, 581, 6715);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5166, 'Ahmad Gill', to_date('13-01-1959', 'dd-mm-yyyy'), 5002, to_date('07-09-2008', 'dd-mm-yyyy'), to_date('07-06-2022', 'dd-mm-yyyy'), 2, 921, 13207);
commit;
prompt 200 records committed...
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5170, 'Tommy Moffat', to_date('07-09-1951', 'dd-mm-yyyy'), 5005, to_date('11-01-2016', 'dd-mm-yyyy'), to_date('21-10-2024', 'dd-mm-yyyy'), 1, 952, 8843);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5172, 'Donald Giraldo', to_date('31-12-1959', 'dd-mm-yyyy'), 5008, to_date('28-02-2018', 'dd-mm-yyyy'), to_date('22-03-2025', 'dd-mm-yyyy'), 1, 732, 12461);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5173, 'Greg Bandy', to_date('21-02-1957', 'dd-mm-yyyy'), 5006, to_date('05-09-2015', 'dd-mm-yyyy'), to_date('19-06-2023', 'dd-mm-yyyy'), 2, 861, 20397);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5175, 'Joan Hyde', to_date('27-11-1951', 'dd-mm-yyyy'), 5009, to_date('02-02-2020', 'dd-mm-yyyy'), to_date('18-06-2021', 'dd-mm-yyyy'), 1, 274, 8998);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5178, 'Shawn Gray', to_date('16-12-1956', 'dd-mm-yyyy'), 5003, to_date('02-12-2018', 'dd-mm-yyyy'), to_date('19-07-2024', 'dd-mm-yyyy'), 1, 795, 9324);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5179, 'Jake Aaron', to_date('21-05-1959', 'dd-mm-yyyy'), 5005, to_date('04-11-2011', 'dd-mm-yyyy'), to_date('09-03-2022', 'dd-mm-yyyy'), 2, 496, 21616);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5181, 'Christmas Whitman', to_date('01-12-1958', 'dd-mm-yyyy'), 5008, to_date('12-06-2019', 'dd-mm-yyyy'), to_date('29-09-2022', 'dd-mm-yyyy'), 2, 454, 9814);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5182, 'Trey Weaver', to_date('23-01-1956', 'dd-mm-yyyy'), 5005, to_date('05-09-2016', 'dd-mm-yyyy'), to_date('05-07-2023', 'dd-mm-yyyy'), 2, 37, 12312);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5184, 'Tanya Farrell', to_date('03-08-1956', 'dd-mm-yyyy'), 5006, to_date('02-02-2008', 'dd-mm-yyyy'), to_date('01-06-2021', 'dd-mm-yyyy'), 2, 352, 19484);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5187, 'Cheryl Liotta', to_date('08-08-1960', 'dd-mm-yyyy'), 5005, to_date('17-04-2018', 'dd-mm-yyyy'), to_date('05-12-2025', 'dd-mm-yyyy'), 2, 353, 16769);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5188, 'Aimee Tierney', to_date('31-10-1956', 'dd-mm-yyyy'), 5006, to_date('08-07-2012', 'dd-mm-yyyy'), to_date('14-02-2022', 'dd-mm-yyyy'), 1, 61, 17415);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5190, 'Roberta Puckett', to_date('13-02-1952', 'dd-mm-yyyy'), 5004, to_date('28-09-2015', 'dd-mm-yyyy'), to_date('13-11-2020', 'dd-mm-yyyy'), 1, 34, 6819);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5193, 'Jean-Luc McBride', to_date('13-12-1954', 'dd-mm-yyyy'), 5003, to_date('22-02-2011', 'dd-mm-yyyy'), to_date('31-10-2022', 'dd-mm-yyyy'), 1, 150, 17366);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5196, 'Gaby Coughlan', to_date('16-04-1956', 'dd-mm-yyyy'), 5005, to_date('16-05-2009', 'dd-mm-yyyy'), to_date('16-10-2024', 'dd-mm-yyyy'), 2, 94, 18662);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5198, 'Cuba Pullman', to_date('26-12-1952', 'dd-mm-yyyy'), 5010, to_date('27-12-2016', 'dd-mm-yyyy'), to_date('28-09-2020', 'dd-mm-yyyy'), 1, 423, 8644);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5199, 'Marlon Rowlands', to_date('14-10-1960', 'dd-mm-yyyy'), 5004, to_date('23-05-2019', 'dd-mm-yyyy'), to_date('28-05-2021', 'dd-mm-yyyy'), 2, 154, 17246);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5200, 'Gilberto Hewett', to_date('26-01-1953', 'dd-mm-yyyy'), 5009, to_date('04-11-2012', 'dd-mm-yyyy'), to_date('09-01-2021', 'dd-mm-yyyy'), 2, 252, 21688);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5201, 'Halle Imperioli', to_date('23-01-1955', 'dd-mm-yyyy'), 5001, to_date('16-12-2016', 'dd-mm-yyyy'), to_date('05-08-2022', 'dd-mm-yyyy'), 2, 547, 18386);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5202, 'Joseph Brosnan', to_date('02-09-1954', 'dd-mm-yyyy'), 5010, to_date('27-07-2015', 'dd-mm-yyyy'), to_date('11-09-2023', 'dd-mm-yyyy'), 1, 269, 9737);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5203, 'Mary Sewell', to_date('30-01-1957', 'dd-mm-yyyy'), 5007, to_date('09-06-2016', 'dd-mm-yyyy'), to_date('16-02-2022', 'dd-mm-yyyy'), 2, 513, 10582);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5204, 'Karon Zeta-Jones', to_date('11-07-1954', 'dd-mm-yyyy'), 5006, to_date('16-04-2014', 'dd-mm-yyyy'), to_date('06-01-2022', 'dd-mm-yyyy'), 1, 189, 16635);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5205, 'Rhea Lorenz', to_date('22-10-1954', 'dd-mm-yyyy'), 5003, to_date('05-01-2011', 'dd-mm-yyyy'), to_date('05-03-2024', 'dd-mm-yyyy'), 1, 809, 5899);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5206, 'Simon Murphy', to_date('12-12-1958', 'dd-mm-yyyy'), 5010, to_date('04-07-2017', 'dd-mm-yyyy'), to_date('28-08-2020', 'dd-mm-yyyy'), 2, 500, 7845);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5207, 'Larry Randal', to_date('13-05-1960', 'dd-mm-yyyy'), 5004, to_date('23-07-2010', 'dd-mm-yyyy'), to_date('07-07-2023', 'dd-mm-yyyy'), 2, 703, 12616);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5208, 'Percy Place', to_date('02-09-1959', 'dd-mm-yyyy'), 5004, to_date('19-01-2013', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'), 2, 940, 9549);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5209, 'Vertical Goodall', to_date('30-06-1954', 'dd-mm-yyyy'), 5001, to_date('11-04-2011', 'dd-mm-yyyy'), to_date('30-09-2020', 'dd-mm-yyyy'), 1, 230, 7541);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5210, 'Shelby Murphy', to_date('03-11-1960', 'dd-mm-yyyy'), 5007, to_date('10-06-2012', 'dd-mm-yyyy'), to_date('27-07-2025', 'dd-mm-yyyy'), 2, 613, 13655);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5212, 'Spike Firth', to_date('11-10-1950', 'dd-mm-yyyy'), 5001, to_date('21-10-2018', 'dd-mm-yyyy'), to_date('23-03-2024', 'dd-mm-yyyy'), 1, 566, 6580);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5213, 'Jarvis Rubinek', to_date('23-10-1958', 'dd-mm-yyyy'), 5003, to_date('13-03-2008', 'dd-mm-yyyy'), to_date('30-11-2020', 'dd-mm-yyyy'), 1, 298, 12421);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5214, 'Ali Plowright', to_date('01-12-1955', 'dd-mm-yyyy'), 5003, to_date('13-05-2020', 'dd-mm-yyyy'), to_date('20-12-2024', 'dd-mm-yyyy'), 1, 212, 15736);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5215, 'Lucinda Thomson', to_date('21-06-1953', 'dd-mm-yyyy'), 5006, to_date('01-05-2016', 'dd-mm-yyyy'), to_date('11-04-2021', 'dd-mm-yyyy'), 1, 192, 14479);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5216, 'Candice Gayle', to_date('04-10-1954', 'dd-mm-yyyy'), 5001, to_date('04-03-2019', 'dd-mm-yyyy'), to_date('14-12-2025', 'dd-mm-yyyy'), 2, 616, 16921);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5217, 'Woody Keeslar', to_date('05-03-1957', 'dd-mm-yyyy'), 5008, to_date('15-12-2011', 'dd-mm-yyyy'), to_date('31-10-2025', 'dd-mm-yyyy'), 2, 631, 8545);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5218, 'Charles Stanton', to_date('29-08-1952', 'dd-mm-yyyy'), 5004, to_date('17-02-2015', 'dd-mm-yyyy'), to_date('20-07-2020', 'dd-mm-yyyy'), 1, 97, 4100);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5219, 'Gena Hornsby', to_date('18-03-1952', 'dd-mm-yyyy'), 5002, to_date('09-03-2011', 'dd-mm-yyyy'), to_date('13-07-2022', 'dd-mm-yyyy'), 2, 494, 15734);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5220, 'Debi Russell', to_date('02-04-1955', 'dd-mm-yyyy'), 5003, to_date('10-02-2018', 'dd-mm-yyyy'), to_date('02-12-2023', 'dd-mm-yyyy'), 1, 214, 10845);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5221, 'Russell Humphrey', to_date('08-07-1954', 'dd-mm-yyyy'), 5004, to_date('07-09-2019', 'dd-mm-yyyy'), to_date('22-10-2020', 'dd-mm-yyyy'), 1, 967, 17457);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5222, 'Guy Redford', to_date('01-05-1956', 'dd-mm-yyyy'), 5003, to_date('07-11-2019', 'dd-mm-yyyy'), to_date('02-11-2022', 'dd-mm-yyyy'), 2, 745, 15636);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5224, 'Val Trejo', to_date('19-11-1960', 'dd-mm-yyyy'), 5005, to_date('11-11-2009', 'dd-mm-yyyy'), to_date('24-07-2023', 'dd-mm-yyyy'), 2, 122, 8039);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5225, 'Ruth Flatts', to_date('29-04-1957', 'dd-mm-yyyy'), 5004, to_date('04-11-2018', 'dd-mm-yyyy'), to_date('02-10-2025', 'dd-mm-yyyy'), 2, 187, 15146);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5226, 'Rick Jeter', to_date('22-09-1952', 'dd-mm-yyyy'), 5008, to_date('26-02-2017', 'dd-mm-yyyy'), to_date('10-11-2024', 'dd-mm-yyyy'), 1, 676, 18901);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5227, 'Will Torn', to_date('25-11-1955', 'dd-mm-yyyy'), 5004, to_date('03-01-2008', 'dd-mm-yyyy'), to_date('20-02-2022', 'dd-mm-yyyy'), 1, 615, 7344);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5228, 'Carlene Hawthorne', to_date('30-10-1958', 'dd-mm-yyyy'), 5005, to_date('21-01-2017', 'dd-mm-yyyy'), to_date('18-11-2025', 'dd-mm-yyyy'), 2, 401, 7969);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5229, 'Cherry Costner', to_date('16-08-1959', 'dd-mm-yyyy'), 5005, to_date('20-10-2014', 'dd-mm-yyyy'), to_date('28-06-2021', 'dd-mm-yyyy'), 2, 641, 12288);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5230, 'Carla Stoltz', to_date('13-01-1959', 'dd-mm-yyyy'), 5001, to_date('02-06-2015', 'dd-mm-yyyy'), to_date('20-02-2025', 'dd-mm-yyyy'), 1, 430, 18237);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5231, 'Geggy Uggams', to_date('25-09-1952', 'dd-mm-yyyy'), 5002, to_date('06-11-2019', 'dd-mm-yyyy'), to_date('28-10-2025', 'dd-mm-yyyy'), 1, 538, 18649);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5232, 'Christmas Lennix', to_date('05-02-1953', 'dd-mm-yyyy'), 5009, to_date('11-05-2014', 'dd-mm-yyyy'), to_date('17-11-2022', 'dd-mm-yyyy'), 2, 516, 18488);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5233, 'Don Lineback', to_date('08-01-1953', 'dd-mm-yyyy'), 5002, to_date('25-11-2011', 'dd-mm-yyyy'), to_date('03-09-2022', 'dd-mm-yyyy'), 2, 339, 13442);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5234, 'Madeleine Dickinson', to_date('19-04-1953', 'dd-mm-yyyy'), 5007, to_date('08-06-2019', 'dd-mm-yyyy'), to_date('12-08-2025', 'dd-mm-yyyy'), 2, 145, 5675);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5235, 'Rebeka Schwarzenegger', to_date('16-03-1956', 'dd-mm-yyyy'), 5007, to_date('20-02-2018', 'dd-mm-yyyy'), to_date('21-08-2020', 'dd-mm-yyyy'), 2, 896, 12699);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5237, 'Treat Wine', to_date('02-02-1955', 'dd-mm-yyyy'), 5002, to_date('01-11-2016', 'dd-mm-yyyy'), to_date('23-03-2022', 'dd-mm-yyyy'), 2, 801, 11260);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5238, 'Casey Beckinsale', to_date('10-04-1951', 'dd-mm-yyyy'), 5008, to_date('30-01-2017', 'dd-mm-yyyy'), to_date('23-10-2020', 'dd-mm-yyyy'), 2, 962, 5602);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5239, 'Gates Cassel', to_date('29-01-1954', 'dd-mm-yyyy'), 5002, to_date('10-06-2009', 'dd-mm-yyyy'), to_date('11-11-2025', 'dd-mm-yyyy'), 2, 165, 8869);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5240, 'Ray Burmester', to_date('15-06-1950', 'dd-mm-yyyy'), 5006, to_date('02-10-2018', 'dd-mm-yyyy'), to_date('09-01-2024', 'dd-mm-yyyy'), 2, 56, 16225);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5241, 'Timothy Rivers', to_date('25-03-1959', 'dd-mm-yyyy'), 5006, to_date('05-03-2012', 'dd-mm-yyyy'), to_date('16-12-2024', 'dd-mm-yyyy'), 2, 603, 14340);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5242, 'Yaphet Reeves', to_date('23-10-1952', 'dd-mm-yyyy'), 5010, to_date('30-08-2009', 'dd-mm-yyyy'), to_date('08-11-2023', 'dd-mm-yyyy'), 1, 760, 11650);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5243, 'Bradley Pitney', to_date('02-11-1956', 'dd-mm-yyyy'), 5005, to_date('15-03-2016', 'dd-mm-yyyy'), to_date('23-04-2024', 'dd-mm-yyyy'), 1, 162, 20585);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5244, 'Cherry Costner', to_date('27-05-1954', 'dd-mm-yyyy'), 5002, to_date('11-04-2014', 'dd-mm-yyyy'), to_date('14-10-2021', 'dd-mm-yyyy'), 1, 641, 9833);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5245, 'Jonatha Oldman', to_date('20-11-1958', 'dd-mm-yyyy'), 5008, to_date('28-04-2012', 'dd-mm-yyyy'), to_date('11-12-2020', 'dd-mm-yyyy'), 1, 937, 21793);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5246, 'Clay Cartlidge', to_date('28-01-1953', 'dd-mm-yyyy'), 5002, to_date('24-06-2017', 'dd-mm-yyyy'), to_date('21-08-2025', 'dd-mm-yyyy'), 1, 926, 15790);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5247, 'Debby Aykroyd', to_date('05-08-1950', 'dd-mm-yyyy'), 5005, to_date('26-10-2018', 'dd-mm-yyyy'), to_date('13-11-2022', 'dd-mm-yyyy'), 2, 814, 4124);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5249, 'Carlene Tate', to_date('07-12-1960', 'dd-mm-yyyy'), 5007, to_date('04-06-2019', 'dd-mm-yyyy'), to_date('29-02-2024', 'dd-mm-yyyy'), 1, 702, 6121);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5060, 'Maxine Bullock', to_date('28-02-1957', 'dd-mm-yyyy'), 5001, to_date('09-09-2018', 'dd-mm-yyyy'), to_date('09-09-2024', 'dd-mm-yyyy'), 2, 310, 7602);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5063, 'Rhett Carmen', to_date('15-10-1951', 'dd-mm-yyyy'), 5005, to_date('09-11-2017', 'dd-mm-yyyy'), to_date('18-03-2021', 'dd-mm-yyyy'), 2, 499, 13308);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5066, 'Penelope Dafoe', to_date('22-10-1960', 'dd-mm-yyyy'), 5008, to_date('17-07-2016', 'dd-mm-yyyy'), to_date('27-09-2022', 'dd-mm-yyyy'), 2, 144, 20745);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5069, 'Desmond Eldard', to_date('27-04-1959', 'dd-mm-yyyy'), 5003, to_date('20-11-2019', 'dd-mm-yyyy'), to_date('08-05-2023', 'dd-mm-yyyy'), 2, 272, 7354);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5071, 'Merillee Whitaker', to_date('15-05-1956', 'dd-mm-yyyy'), 5005, to_date('03-10-2012', 'dd-mm-yyyy'), to_date('22-08-2020', 'dd-mm-yyyy'), 1, 456, 10997);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5075, 'Cathy Coolidge', to_date('15-12-1952', 'dd-mm-yyyy'), 5004, to_date('21-08-2010', 'dd-mm-yyyy'), to_date('07-10-2025', 'dd-mm-yyyy'), 2, 75, 17007);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5077, 'Johnny Clayton', to_date('22-05-1951', 'dd-mm-yyyy'), 5004, to_date('03-01-2010', 'dd-mm-yyyy'), to_date('22-12-2021', 'dd-mm-yyyy'), 2, 488, 5708);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5080, 'Noah O''Sullivan', to_date('25-05-1957', 'dd-mm-yyyy'), 5007, to_date('18-07-2011', 'dd-mm-yyyy'), to_date('18-07-2025', 'dd-mm-yyyy'), 2, 396, 20107);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5083, 'Jeff Reynolds', to_date('26-12-1951', 'dd-mm-yyyy'), 5001, to_date('08-10-2015', 'dd-mm-yyyy'), to_date('01-04-2025', 'dd-mm-yyyy'), 1, 141, 7093);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5086, 'Bridget Dayne', to_date('10-05-1952', 'dd-mm-yyyy'), 5009, to_date('07-08-2010', 'dd-mm-yyyy'), to_date('12-09-2020', 'dd-mm-yyyy'), 1, 614, 16637);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5089, 'Merillee Hughes', to_date('07-06-1953', 'dd-mm-yyyy'), 5007, to_date('21-04-2008', 'dd-mm-yyyy'), to_date('14-06-2022', 'dd-mm-yyyy'), 2, 118, 21176);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5094, 'Freda Van Der Beek', to_date('06-02-1952', 'dd-mm-yyyy'), 5004, to_date('05-10-2014', 'dd-mm-yyyy'), to_date('19-06-2021', 'dd-mm-yyyy'), 1, 486, 12508);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5097, 'Derrick Pierce', to_date('08-10-1951', 'dd-mm-yyyy'), 5003, to_date('08-05-2014', 'dd-mm-yyyy'), to_date('26-08-2022', 'dd-mm-yyyy'), 2, 31, 13336);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5100, 'Suzi Colon', to_date('07-07-1957', 'dd-mm-yyyy'), 5002, to_date('10-12-2013', 'dd-mm-yyyy'), to_date('06-02-2025', 'dd-mm-yyyy'), 1, 49, 10748);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5103, 'Chalee Martinez', to_date('21-02-1953', 'dd-mm-yyyy'), 5004, to_date('17-06-2019', 'dd-mm-yyyy'), to_date('27-02-2022', 'dd-mm-yyyy'), 2, 648, 16430);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5105, 'Rodney Fender', to_date('07-02-1950', 'dd-mm-yyyy'), 5004, to_date('15-07-2013', 'dd-mm-yyyy'), to_date('26-03-2025', 'dd-mm-yyyy'), 1, 712, 8072);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5108, 'Ivan Matheson', to_date('01-08-1954', 'dd-mm-yyyy'), 5004, to_date('10-03-2015', 'dd-mm-yyyy'), to_date('22-10-2023', 'dd-mm-yyyy'), 2, 930, 14078);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5110, 'Julia De Almeida', to_date('25-11-1952', 'dd-mm-yyyy'), 5004, to_date('19-11-2008', 'dd-mm-yyyy'), to_date('23-06-2021', 'dd-mm-yyyy'), 1, 26, 18686);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5114, 'Carlene Tate', to_date('09-03-1957', 'dd-mm-yyyy'), 5001, to_date('10-11-2015', 'dd-mm-yyyy'), to_date('16-02-2023', 'dd-mm-yyyy'), 2, 702, 7259);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5116, 'Lynette Butler', to_date('19-07-1957', 'dd-mm-yyyy'), 5008, to_date('08-03-2016', 'dd-mm-yyyy'), to_date('13-10-2023', 'dd-mm-yyyy'), 2, 455, 10101);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5119, 'Rowan Clark', to_date('18-03-1955', 'dd-mm-yyyy'), 5006, to_date('08-06-2017', 'dd-mm-yyyy'), to_date('22-11-2024', 'dd-mm-yyyy'), 1, 825, 5448);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5123, 'Wesley Osbourne', to_date('29-05-1955', 'dd-mm-yyyy'), 5004, to_date('04-03-2015', 'dd-mm-yyyy'), to_date('02-09-2024', 'dd-mm-yyyy'), 1, 81, 9847);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5125, 'Pat Beckham', to_date('21-06-1955', 'dd-mm-yyyy'), 5004, to_date('02-01-2016', 'dd-mm-yyyy'), to_date('23-09-2023', 'dd-mm-yyyy'), 2, 667, 9698);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5128, 'Rick Harary', to_date('18-01-1959', 'dd-mm-yyyy'), 5005, to_date('20-06-2019', 'dd-mm-yyyy'), to_date('29-10-2022', 'dd-mm-yyyy'), 2, 671, 15761);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5131, 'Ethan Sinatra', to_date('27-08-1959', 'dd-mm-yyyy'), 5003, to_date('28-10-2011', 'dd-mm-yyyy'), to_date('19-04-2025', 'dd-mm-yyyy'), 1, 668, 8953);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5134, 'Bernie Linney', to_date('27-05-1952', 'dd-mm-yyyy'), 5002, to_date('26-02-2019', 'dd-mm-yyyy'), to_date('29-09-2022', 'dd-mm-yyyy'), 2, 761, 12908);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5139, 'Bill Faithfull', to_date('04-03-1957', 'dd-mm-yyyy'), 5006, to_date('19-10-2016', 'dd-mm-yyyy'), to_date('26-12-2022', 'dd-mm-yyyy'), 2, 361, 17502);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5141, 'Terrence Vaughn', to_date('07-03-1959', 'dd-mm-yyyy'), 5008, to_date('22-05-2012', 'dd-mm-yyyy'), to_date('08-03-2021', 'dd-mm-yyyy'), 2, 881, 20679);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5145, 'Dwight Secada', to_date('05-04-1957', 'dd-mm-yyyy'), 5001, to_date('10-05-2011', 'dd-mm-yyyy'), to_date('20-08-2021', 'dd-mm-yyyy'), 1, 869, 9848);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5148, 'Leslie Diesel', to_date('21-11-1959', 'dd-mm-yyyy'), 5008, to_date('24-06-2017', 'dd-mm-yyyy'), to_date('10-03-2022', 'dd-mm-yyyy'), 2, 651, 9542);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5151, 'Angelina Lunch', to_date('08-09-1957', 'dd-mm-yyyy'), 5008, to_date('22-11-2014', 'dd-mm-yyyy'), to_date('30-06-2025', 'dd-mm-yyyy'), 2, 585, 19560);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5153, 'Melba Jeffreys', to_date('22-08-1958', 'dd-mm-yyyy'), 5002, to_date('08-05-2009', 'dd-mm-yyyy'), to_date('28-01-2023', 'dd-mm-yyyy'), 1, 644, 17746);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5157, 'Cornell Stevenson', to_date('10-12-1957', 'dd-mm-yyyy'), 5006, to_date('12-05-2019', 'dd-mm-yyyy'), to_date('03-09-2023', 'dd-mm-yyyy'), 2, 146, 12621);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5159, 'Udo Chapman', to_date('28-05-1954', 'dd-mm-yyyy'), 5005, to_date('30-01-2010', 'dd-mm-yyyy'), to_date('17-06-2021', 'dd-mm-yyyy'), 1, 251, 6301);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5162, 'Kelli Gryner', to_date('10-09-1955', 'dd-mm-yyyy'), 5005, to_date('19-12-2011', 'dd-mm-yyyy'), to_date('31-08-2022', 'dd-mm-yyyy'), 1, 140, 15126);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5165, 'Joy Reeve', to_date('26-06-1954', 'dd-mm-yyyy'), 5003, to_date('29-06-2009', 'dd-mm-yyyy'), to_date('15-02-2022', 'dd-mm-yyyy'), 1, 331, 17381);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5168, 'Andre Quinn', to_date('02-06-1960', 'dd-mm-yyyy'), 5008, to_date('04-03-2008', 'dd-mm-yyyy'), to_date('19-10-2024', 'dd-mm-yyyy'), 1, 379, 14671);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5171, 'Caroline Huston', to_date('14-04-1955', 'dd-mm-yyyy'), 5007, to_date('12-05-2013', 'dd-mm-yyyy'), to_date('09-04-2023', 'dd-mm-yyyy'), 1, 261, 11230);
commit;
prompt 300 records committed...
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5174, 'Denise Red', to_date('24-07-1958', 'dd-mm-yyyy'), 5006, to_date('12-02-2010', 'dd-mm-yyyy'), to_date('23-01-2024', 'dd-mm-yyyy'), 1, 507, 12201);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5177, 'Mitchell Himmelman', to_date('28-03-1957', 'dd-mm-yyyy'), 5001, to_date('16-09-2018', 'dd-mm-yyyy'), to_date('22-08-2024', 'dd-mm-yyyy'), 1, 875, 13944);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5180, 'Val Coolidge', to_date('27-01-1951', 'dd-mm-yyyy'), 5002, to_date('19-02-2015', 'dd-mm-yyyy'), to_date('13-10-2022', 'dd-mm-yyyy'), 1, 933, 13285);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5185, 'Vivica Darren', to_date('06-11-1955', 'dd-mm-yyyy'), 5004, to_date('30-03-2010', 'dd-mm-yyyy'), to_date('25-07-2020', 'dd-mm-yyyy'), 2, 659, 10594);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5189, 'Larry Randal', to_date('20-12-1957', 'dd-mm-yyyy'), 5007, to_date('10-07-2008', 'dd-mm-yyyy'), to_date('04-12-2020', 'dd-mm-yyyy'), 1, 703, 11396);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5191, 'Donna Parish', to_date('16-05-1951', 'dd-mm-yyyy'), 5009, to_date('26-03-2014', 'dd-mm-yyyy'), to_date('22-11-2023', 'dd-mm-yyyy'), 2, 484, 21278);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5194, 'Cherry Costner', to_date('29-11-1952', 'dd-mm-yyyy'), 5004, to_date('03-03-2013', 'dd-mm-yyyy'), to_date('04-08-2024', 'dd-mm-yyyy'), 2, 641, 13131);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5197, 'Alec Haynes', to_date('04-06-1950', 'dd-mm-yyyy'), 5008, to_date('07-01-2018', 'dd-mm-yyyy'), to_date('30-07-2022', 'dd-mm-yyyy'), 2, 47, 15788);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5003, 'Rachel Cummings', to_date('27-05-1952', 'dd-mm-yyyy'), 5005, to_date('16-04-2008', 'dd-mm-yyyy'), to_date('23-01-2025', 'dd-mm-yyyy'), 2, 387, 6202);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5009, 'Austin Bruce', to_date('29-08-1950', 'dd-mm-yyyy'), 5008, to_date('30-12-2016', 'dd-mm-yyyy'), to_date('23-07-2024', 'dd-mm-yyyy'), 2, 360, 19384);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5015, 'Jet Bacharach', to_date('22-04-1958', 'dd-mm-yyyy'), 5009, to_date('11-06-2016', 'dd-mm-yyyy'), to_date('13-06-2023', 'dd-mm-yyyy'), 1, 103, 12747);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5021, 'Morris Savage', to_date('02-07-1956', 'dd-mm-yyyy'), 5001, to_date('01-07-2011', 'dd-mm-yyyy'), to_date('21-07-2021', 'dd-mm-yyyy'), 2, 257, 9929);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5027, 'Tanya Farrell', to_date('18-08-1950', 'dd-mm-yyyy'), 5007, to_date('11-11-2010', 'dd-mm-yyyy'), to_date('27-11-2024', 'dd-mm-yyyy'), 1, 352, 9317);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5033, 'Debi Russell', to_date('20-01-1951', 'dd-mm-yyyy'), 5001, to_date('20-12-2009', 'dd-mm-yyyy'), to_date('19-12-2022', 'dd-mm-yyyy'), 2, 214, 14895);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5039, 'Harrison Cocker', to_date('27-01-1952', 'dd-mm-yyyy'), 5006, to_date('11-03-2018', 'dd-mm-yyyy'), to_date('27-06-2024', 'dd-mm-yyyy'), 2, 48, 8416);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5045, 'Chloe Rubinek', to_date('12-03-1954', 'dd-mm-yyyy'), 5007, to_date('16-10-2013', 'dd-mm-yyyy'), to_date('30-09-2021', 'dd-mm-yyyy'), 1, 880, 13718);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5051, 'Domingo Hong', to_date('17-02-1955', 'dd-mm-yyyy'), 5009, to_date('17-01-2011', 'dd-mm-yyyy'), to_date('19-01-2022', 'dd-mm-yyyy'), 2, 920, 12890);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5056, 'Julia De Almeida', to_date('18-04-1954', 'dd-mm-yyyy'), 5006, to_date('30-11-2010', 'dd-mm-yyyy'), to_date('05-09-2023', 'dd-mm-yyyy'), 1, 26, 21948);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5065, 'Wang Lofgren', to_date('10-03-1955', 'dd-mm-yyyy'), 5010, to_date('01-09-2010', 'dd-mm-yyyy'), to_date('16-04-2025', 'dd-mm-yyyy'), 1, 628, 13330);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5074, 'Rupert Harrelson', to_date('16-10-1958', 'dd-mm-yyyy'), 5002, to_date('01-08-2014', 'dd-mm-yyyy'), to_date('18-02-2022', 'dd-mm-yyyy'), 2, 138, 4722);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5084, 'King McKean', to_date('01-07-1959', 'dd-mm-yyyy'), 5004, to_date('26-12-2014', 'dd-mm-yyyy'), to_date('28-06-2025', 'dd-mm-yyyy'), 2, 910, 10869);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5093, 'Emerson Neuwirth', to_date('26-10-1950', 'dd-mm-yyyy'), 5005, to_date('14-11-2019', 'dd-mm-yyyy'), to_date('01-07-2022', 'dd-mm-yyyy'), 1, 29, 9479);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5102, 'Ralph Hopkins', to_date('17-07-1951', 'dd-mm-yyyy'), 5008, to_date('09-03-2008', 'dd-mm-yyyy'), to_date('14-04-2021', 'dd-mm-yyyy'), 2, 985, 12636);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5112, 'Coley O''Hara', to_date('30-09-1954', 'dd-mm-yyyy'), 5002, to_date('12-02-2013', 'dd-mm-yyyy'), to_date('05-05-2023', 'dd-mm-yyyy'), 2, 783, 14427);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5121, 'Ruth McGovern', to_date('19-09-1958', 'dd-mm-yyyy'), 5003, to_date('24-05-2015', 'dd-mm-yyyy'), to_date('11-09-2022', 'dd-mm-yyyy'), 2, 84, 4259);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5129, 'Tyrone Sledge', to_date('21-08-1950', 'dd-mm-yyyy'), 5005, to_date('10-11-2017', 'dd-mm-yyyy'), to_date('13-03-2021', 'dd-mm-yyyy'), 2, 850, 21882);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5138, 'Rebeka Schwarzenegger', to_date('04-01-1954', 'dd-mm-yyyy'), 5008, to_date('30-11-2017', 'dd-mm-yyyy'), to_date('20-02-2023', 'dd-mm-yyyy'), 2, 896, 10520);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5149, 'Ani Neill', to_date('19-07-1951', 'dd-mm-yyyy'), 5005, to_date('05-02-2017', 'dd-mm-yyyy'), to_date('15-08-2020', 'dd-mm-yyyy'), 2, 545, 12451);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5158, 'Russell Carradine', to_date('14-05-1959', 'dd-mm-yyyy'), 5009, to_date('08-09-2011', 'dd-mm-yyyy'), to_date('21-12-2020', 'dd-mm-yyyy'), 2, 503, 8818);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5167, 'Naomi Lovitz', to_date('09-05-1959', 'dd-mm-yyyy'), 5001, to_date('03-07-2014', 'dd-mm-yyyy'), to_date('20-05-2021', 'dd-mm-yyyy'), 2, 508, 12182);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5176, 'Cathy Coolidge', to_date('29-05-1955', 'dd-mm-yyyy'), 5010, to_date('09-06-2017', 'dd-mm-yyyy'), to_date('13-09-2025', 'dd-mm-yyyy'), 1, 75, 16903);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5186, 'Vonda Hyde', to_date('21-12-1952', 'dd-mm-yyyy'), 5004, to_date('08-11-2016', 'dd-mm-yyyy'), to_date('28-06-2021', 'dd-mm-yyyy'), 2, 832, 14675);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5195, 'Don Sepulveda', to_date('14-07-1957', 'dd-mm-yyyy'), 5006, to_date('19-04-2016', 'dd-mm-yyyy'), to_date('08-05-2025', 'dd-mm-yyyy'), 2, 592, 9005);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5010, 'Rick Jeter', to_date('21-02-1953', 'dd-mm-yyyy'), 5002, to_date('04-01-2008', 'dd-mm-yyyy'), to_date('30-07-2020', 'dd-mm-yyyy'), 2, 676, 8672);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5024, 'Joy Reeve', to_date('06-11-1957', 'dd-mm-yyyy'), 5003, to_date('03-11-2013', 'dd-mm-yyyy'), to_date('24-06-2022', 'dd-mm-yyyy'), 1, 331, 20223);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5038, 'Dom Simpson', to_date('01-03-1952', 'dd-mm-yyyy'), 5009, to_date('03-09-2012', 'dd-mm-yyyy'), to_date('24-06-2024', 'dd-mm-yyyy'), 1, 758, 7259);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5053, 'Seth Milsap', to_date('13-12-1950', 'dd-mm-yyyy'), 5004, to_date('13-08-2012', 'dd-mm-yyyy'), to_date('25-09-2024', 'dd-mm-yyyy'), 2, 201, 13869);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5072, 'Hugo Durning', to_date('22-12-1960', 'dd-mm-yyyy'), 5007, to_date('22-02-2019', 'dd-mm-yyyy'), to_date('07-11-2024', 'dd-mm-yyyy'), 1, 340, 20694);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5096, 'Vanessa Vance', to_date('16-09-1955', 'dd-mm-yyyy'), 5004, to_date('01-03-2017', 'dd-mm-yyyy'), to_date('20-12-2022', 'dd-mm-yyyy'), 1, 410, 8330);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5120, 'Grant Atlas', to_date('22-11-1956', 'dd-mm-yyyy'), 5006, to_date('08-02-2013', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'), 2, 528, 10815);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5143, 'Miranda Tinsley', to_date('15-10-1958', 'dd-mm-yyyy'), 5007, to_date('20-06-2008', 'dd-mm-yyyy'), to_date('21-09-2023', 'dd-mm-yyyy'), 1, 111, 10965);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5169, 'Harris Valentin', to_date('19-03-1957', 'dd-mm-yyyy'), 5003, to_date('28-05-2008', 'dd-mm-yyyy'), to_date('06-01-2024', 'dd-mm-yyyy'), 1, 953, 7096);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5192, 'Samantha Lunch', to_date('11-04-1958', 'dd-mm-yyyy'), 5010, to_date('13-01-2008', 'dd-mm-yyyy'), to_date('26-01-2023', 'dd-mm-yyyy'), 1, 757, 17042);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5211, 'Nikki Close', to_date('23-11-1954', 'dd-mm-yyyy'), 5007, to_date('19-05-2017', 'dd-mm-yyyy'), to_date('22-12-2024', 'dd-mm-yyyy'), 2, 727, 9049);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5223, 'Patty Herrmann', to_date('31-07-1956', 'dd-mm-yyyy'), 5002, to_date('14-11-2015', 'dd-mm-yyyy'), to_date('03-05-2023', 'dd-mm-yyyy'), 2, 958, 13112);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5236, 'Edgar Bello', to_date('22-10-1953', 'dd-mm-yyyy'), 5004, to_date('24-12-2008', 'dd-mm-yyyy'), to_date('03-12-2021', 'dd-mm-yyyy'), 1, 3, 11401);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5248, 'Nik Kweller', to_date('18-04-1959', 'dd-mm-yyyy'), 5004, to_date('02-12-2018', 'dd-mm-yyyy'), to_date('13-12-2022', 'dd-mm-yyyy'), 1, 996, 20233);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5092, 'Nina Bassett', to_date('24-12-1956', 'dd-mm-yyyy'), 5010, to_date('27-09-2016', 'dd-mm-yyyy'), to_date('17-03-2023', 'dd-mm-yyyy'), 1, 479, 6584);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5136, 'Karon Leachman', to_date('30-05-1959', 'dd-mm-yyyy'), 5004, to_date('22-03-2018', 'dd-mm-yyyy'), to_date('03-11-2024', 'dd-mm-yyyy'), 1, 131, 19748);
insert into WORKER (workerid, workername, birthdate, itsboss_workerid, startdate, enddate, type, citizenid, salary)
values (5183, 'Kenny Jane', to_date('16-05-1953', 'dd-mm-yyyy'), 5002, to_date('16-11-2016', 'dd-mm-yyyy'), to_date('26-02-2025', 'dd-mm-yyyy'), 2, 539, 19269);
commit;
prompt 350 records loaded
prompt Enabling foreign key constraints for CITIZEN...
alter table CITIZEN enable constraint SYS_C007479;
prompt Enabling foreign key constraints for CLERK...
alter table CLERK enable constraint SYS_C007535;
prompt Enabling foreign key constraints for HEALTHINSTITUTION...
alter table HEALTHINSTITUTION enable constraint SYS_C007571;
alter table HEALTHINSTITUTION enable constraint SYS_C007572;
prompt Enabling foreign key constraints for DEPARTMENT...
alter table DEPARTMENT enable constraint SYS_C007606;
alter table DEPARTMENT enable constraint SYS_C007607;
prompt Enabling foreign key constraints for LICENSING...
alter table LICENSING enable constraint SYS_C007477;
prompt Enabling foreign key constraints for DOCTOR...
alter table DOCTOR enable constraint SYS_C007482;
prompt Enabling foreign key constraints for HOSPITALIZEDAT...
alter table HOSPITALIZEDAT enable constraint SYS_C007483;
prompt Enabling foreign key constraints for INSTRUCTOR...
alter table INSTRUCTOR enable constraint SYS_C007565;
prompt Enabling foreign key constraints for SCHEDULE...
alter table SCHEDULE enable constraint SYS_C007553;
alter table SCHEDULE enable constraint SYS_C007554;
prompt Enabling foreign key constraints for TREATED_BY...
alter table TREATED_BY enable constraint SYS_C007424;
alter table TREATED_BY enable constraint SYS_C007484;
prompt Enabling foreign key constraints for WORKER...
alter table WORKER enable constraint SYS_C007441;
prompt Enabling triggers for ACTIVITY...
alter table ACTIVITY enable all triggers;
prompt Enabling triggers for AREA...
alter table AREA enable all triggers;
prompt Enabling triggers for BELONGS_TO...
alter table BELONGS_TO enable all triggers;
prompt Enabling triggers for CITY...
alter table CITY enable all triggers;
prompt Enabling triggers for CITIZEN...
alter table CITIZEN enable all triggers;
prompt Enabling triggers for CLERK...
alter table CLERK enable all triggers;
prompt Enabling triggers for FIELD...
alter table FIELD enable all triggers;
prompt Enabling triggers for HEALTHINSTITUTION...
alter table HEALTHINSTITUTION enable all triggers;
prompt Enabling triggers for DEPARTMENT...
alter table DEPARTMENT enable all triggers;
prompt Enabling triggers for LICENSING...
alter table LICENSING enable all triggers;
prompt Enabling triggers for DOCTOR...
alter table DOCTOR enable all triggers;
prompt Enabling triggers for HEALTH_PROFESSION...
alter table HEALTH_PROFESSION enable all triggers;
prompt Enabling triggers for HOSPITALIZEDAT...
alter table HOSPITALIZEDAT enable all triggers;
prompt Enabling triggers for INSTRUCTOR...
alter table INSTRUCTOR enable all triggers;
prompt Enabling triggers for LICENSE...
alter table LICENSE enable all triggers;
prompt Enabling triggers for PARTICIPATES_IN...
alter table PARTICIPATES_IN enable all triggers;
prompt Enabling triggers for SCHEDULE...
alter table SCHEDULE enable all triggers;
prompt Enabling triggers for TREATED_BY...
alter table TREATED_BY enable all triggers;
prompt Enabling triggers for WORKAT...
alter table WORKAT enable all triggers;
prompt Enabling triggers for WORKER...
alter table WORKER enable all triggers;

set feedback on
set define on
prompt Done
