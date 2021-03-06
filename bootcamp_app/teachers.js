const { Pool } = require('pg');

//connect to bootcampx database
const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2];
const  values = [`%${cohortName}%`];
const queryString = `
SELECT teachers.name AS teacher, cohorts.name AS cohort, COUNT(assistance_requests.*) AS total_assistances 
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
`;

pool.query(queryString, values)
  .then(res => {
    res.rows.forEach(row => {
      console.log(`${row.cohort}: ${row.teacher}`);
    });
  }).catch(err => console.error('query error', err.stack));