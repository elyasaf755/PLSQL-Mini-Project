update clerk_b
set areaid = (dbms_random.value(1,20))
where areaid is null;
commit;
