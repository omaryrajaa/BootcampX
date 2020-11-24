SELECT day, COUNT(*) as total_assignments
FROM assignments
GROUP by day
HAVING COUNT(*) >= 10
ORDER by day;