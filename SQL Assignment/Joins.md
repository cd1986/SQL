-- 1. Retrieve employee names and their department names using INNER JOIN
SELECT e.employee_id, e.employee_name, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d ON e.department_id = d.department_id;
-- done executed

-- 2. Retrieve all employees and their respective department names (including those without a department) using LEFT JOIN
SELECT e.employee_id, e.employee_name, d.department_name
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id;
-- done executed

-- 3. Retrieve all departments and employees (including departments without employees) using RIGHT JOIN
SELECT e.EMPLOYEE_ID, CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS employee_name, d.department_name
FROM hr.employees e
RIGHT JOIN hr.departments d ON e.department_id = d.department_id;
-- done executed

-- 4. Retrieve all employees and their department names using FULL OUTER JOIN
SELECT e.employee_id,CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS employee_name, d.department_name
FROM HR.employees e
FULL OUTER JOIN HR.departments d ON e.department_id = d.department_id;
--done executed







