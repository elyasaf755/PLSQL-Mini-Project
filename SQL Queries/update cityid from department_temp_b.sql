update department_temp_b
set cityid = (dbms_random.value(1,30))
where cityid is null;
commit;
