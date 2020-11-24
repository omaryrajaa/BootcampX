SELECT students.name as student_name, AVG(assignment_submissions.duration) as average_completion_time, AVG(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON students.id = student_id
JOIN assignments ON assignment_id = assignments.id
WHERE end_date IS NULL
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY average_completion_time;