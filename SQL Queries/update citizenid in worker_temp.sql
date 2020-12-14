begin
update worker_temp w
set citizenid = (select citizenid from citizen_b c where c.citizenname = w.workername);
commit;
end;
