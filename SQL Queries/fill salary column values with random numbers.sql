begin
update worker_temp set salary = dbms_random.value(3000, 40000);
commit;
end;
