insert into department(depid,
                       healthinstid,
                       depname,
                       cityid,
                       numberofbeds)
select depid, healthinstid, depname, cityid, numberofbeds from department_temp_b b
where b.depid not in (select depid from department);
commit;                             
