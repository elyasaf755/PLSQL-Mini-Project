create table worker(
  workerid number(9),
  workername varchar2(50),
  birthdate date,
  itsboss_workerid number(9),
  startdate date,
  enddate date,
  type integer,
  citizenid integer,
  salary float
)
