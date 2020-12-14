insert into department_temp_a(depid,
                              healthinstid,
                              depname,
                              cityid,
                              numberofbeds)
select deptid, null, depname, cityid, null from department_a;
commit;                             
