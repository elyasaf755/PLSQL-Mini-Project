begin
update worker_temp_a
set itsboss_workerid = dbms_random.value(5001, 5010)
where itsboss_workerid is null;
commit;
end;
