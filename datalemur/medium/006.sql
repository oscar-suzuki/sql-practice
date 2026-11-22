-- FAANG / Top Three Salaries

WITH emp_with_ranking AS (
  SELECT
    department_name,
    name,
    salary,
    DENSE_RANK() OVER (
      PARTITION BY department.department_name
      ORDER BY employee.salary DESC
    ) as ranking
  FROM employee
  INNER JOIN department
  ON employee.department_id = department.department_id
)
SELECT
  department_name,
  name,
  salary
FROM emp_with_ranking
WHERE ranking <= 3
ORDER BY department_name, salary DESC, name;
