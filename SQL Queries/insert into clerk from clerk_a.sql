insert into clerk(clerkid,
                  clerkname,
                  bossid,
                  areaid,
                  salary,
                  hireyear,
                  rating)
select clerkid, 
       clerkname, 
       bossid, 
       areaid, 
       salary, 
       EXTRACT(YEAR FROM TO_DATE(hireyear, 'DD-MON-RR')), 
       rating 
from clerk_a;
commit;
