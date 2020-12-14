insert into department_temp_b(depid,
                              healthinstid,
                              depname,
                              cityid,
                              numberofbeds)
select depid, healthinstid, depname, null, numberofbeds from department_b;
commit;                             
