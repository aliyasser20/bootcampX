-- SELECT name, max(average_assistance_time) AS average_assistance_time
-- FROM (SELECT cohorts.name AS name, avg(completed_at - started_at) AS average_assistance_time
--   FROM assistance_requests
--     JOIN students ON students.id = assistance_requests.student_id
--     JOIN cohorts ON cohorts.id = students.cohort_id
--   GROUP BY cohorts.name) AS averages
-- WHERE average_assistance_time = (SELECT max(average_assistance_time)
-- FROM (SELECT cohorts.name AS name, avg(completed_at - started_at) AS average_assistance_time
--   FROM assistance_requests
--     JOIN students ON students.id = assistance_requests.student_id
--     JOIN cohorts ON cohorts.id = students.cohort_id
--   GROUP BY cohorts.name) AS averages
-- )
-- GROUP BY name;

SELECT cohorts.name, avg(completed_at - started_at) AS average_assistance_time
FROM assistance_requests
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;