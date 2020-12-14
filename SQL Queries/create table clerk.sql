create table CLERK
(
  clerkid   number(9),
  clerkname VARCHAR2(50),
  bossid    number(9),
  areaid    number(3),
  salary    FLOAT,
  hireyear  number(4),
  rating    number(2),
  PRIMARY KEY (clerkid),
  FOREIGN KEY (areaid) REFERENCES area(areaid)
)
