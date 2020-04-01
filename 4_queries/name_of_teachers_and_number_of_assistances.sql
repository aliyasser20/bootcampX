SELECT teachers.name AS teacher, cohorts.name AS cohort, count(assistance_requests.*) AS total_assistances
FROM assistance_requests
  JOIN teachers ON teachers.id = assistance_requests.teacher_id
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name