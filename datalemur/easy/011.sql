-- FAANG / Well Paid Employees

SELECT e1.employee_id as employee_id, e1.name as employee_name
FROM employee e1
INNER JOIN employee e2 ON e1.manager_id = e2.employee_id
AND e1.salary > e2.salary;
