begin
insert into worker_temp_a
select * from worker_a;
commit;
end;
