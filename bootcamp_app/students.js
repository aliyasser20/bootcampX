const month = process.argv[2];
const limit = process.argv[3];

const {Pool} = require("pg");

const pool = new Pool({
  host: "localhost",
  port: 4000,
  database: "bootcampx"
});

const query = `
SELECT students.id, students.name as name, cohorts.name as cohort
FROM students
JOIN cohorts on cohorts.id = students.cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`;

const values = [`${month}%`, limit];

pool.query(query, values)
  .then(res => {
    res.rows.forEach(el => console.log(`${el.name} has an id of ${el.id} and was in the ${el.cohort} cohort`));
  })
  .catch(err => console.error("query error", err.stack));