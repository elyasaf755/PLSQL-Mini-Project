insert into schedule_temp_a(meetingtime,
                            clerkid,
                            citizenid)
select meetingtime, clerkid, citizenid from schedule_a
where clerkid in (select clerkid from clerk_a) and citizenid in (select citizenid from citizen);
commit;
