SELECT cohorts.name, COUNT(students.id) as student_count
FROM cohorts
JOIN students ON cohorts.id = cohort_id
GROUP BY cohorts.name
HAVING COUNT(students.id) >= 18
ORDER BY COUNT(students.id);
