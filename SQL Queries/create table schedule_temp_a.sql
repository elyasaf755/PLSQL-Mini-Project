create table schedule_temp_a(
       meetingtime date not null,
       clerkid number(9) not null,
       citizenid integer not null,
       PRIMARY KEY (meetingtime, clerkid, citizenid),
       FOREIGN KEY (clerkid) REFERENCES clerk(clerkid),
       FOREIGN KEY (citizenid) REFERENCES citizen(citizenid)
);
