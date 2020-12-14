begin
update worker_temp_a w
set workername = (select citizenname from citizen c where c.citizenid = w.citizenid);
commit;
end;
