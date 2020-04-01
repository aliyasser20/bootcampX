SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
FROM assistance_requests
  JOIN teachers ON teachers.id = assistance_requests.teacher_id
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
ORDER BY teachers.name