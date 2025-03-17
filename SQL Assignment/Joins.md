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




