-- FAANG / Second Highest Salary

WITH salary_with_rank AS (
  SELECT salary, DENSE_RANK() OVER (order by salary DESC) as rank
  FROM employee
)

SELECT DISTINCT salary
FROM salary_with_rank
WHERE rank = 2;

-- Alternative solution
SELECT MAX(salary)
FROM employee
WHERE salary < (
  SELECT MAX(salary)
  FROM employee
);
