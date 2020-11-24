SELECT day, COUNT(assignments.*) as total_assignments
FROM assignments
GROUP by day
ORDER by day;