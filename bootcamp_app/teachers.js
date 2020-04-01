const {Pool} = require("pg");

const pool = new Pool({
  host: "localhost",
  port: 4000,
  database: "bootcampx"
});

const cohort = process.argv[2];
const query = `
SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
FROM assistance_requests
  JOIN teachers ON teachers.id = assistance_requests.teacher_id
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = $1
ORDER BY teachers.name
`;

const values = [`${cohort || "JUL02"}`];

pool.query(query, values).then(resp => {
  resp.rows.forEach(teacher => console.log(`${teacher.cohort}: ${teacher.teacher}`));
}
).catch(err => console.error("query error", err.stack));