SELECT clerkid, COUNT(*)
FROM clerk_temp
GROUP BY clerkid
HAVING COUNT(*) > 1
