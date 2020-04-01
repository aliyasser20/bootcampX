SELECT avg(total_duration) AS average_total_duration
FROM (
SELECT cohorts.name AS name, sum(completed_at - started_at) AS total_duration
  FROM assistance_requests
    JOIN students ON students.id = assistance_requests.student_id
    JOIN cohorts ON cohorts.id = students.cohort_id
  GROUP BY cohorts.name
  ORDER BY sum(completed_at - started_at) ASC
) AS total_durations;
