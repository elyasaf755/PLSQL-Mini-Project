create table department_temp_a(
       depid integer not null,
       healthinstid number(3) not null,
       depname varchar2(50) not null,
       cityid integer not null,
       numberofbeds number(4) not null,
       PRIMARY KEY (depid, healthinstid),
       FOREIGN KEY (healthinstid) REFERENCES healthinstitution(healthinstid),
       FOREIGN KEY (cityid) REFERENCES city(cityid)
);
