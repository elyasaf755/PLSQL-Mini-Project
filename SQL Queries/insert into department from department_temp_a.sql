insert into department(depid,
                       healthinstid,
                       depname,
                       cityid,
                       numberofbeds)
select depid, healthinstid, depname, cityid, numberofbeds from department_temp_a
where healthinstid in (select healthinstid from healthinstitution);
commit;                             
