insert into clerk(clerkid,
                  clerkname,
                  bossid,
                  areaid,
                  salary,
                  hireyear,
                  rating)
select clerkid, clerkname, bossid, areaid, salary, hireyear, rating from clerk_b;
commit;
