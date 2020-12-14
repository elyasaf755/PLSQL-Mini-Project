insert into schedule(meetingtime,
                            clerkid,
                            citizenid)
select meetingtime, clerkid, citizenid from schedule_a
commit;
