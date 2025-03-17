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


-- 5. Retrieve employees who do not belong to any department using LEFT JOIN with NULL check
SELECT e.employee_id, CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS employee_name
FROM hr.employees e
LEFT JOIN hr.departments d ON e.department_id = d.department_id
WHERE d.department_id IS NULL;
-- done executed

-- 6. Retrieve departments that have no employees using RIGHT JOIN with NULL check
SELECT d.department_id, d.department_name
FROM hr.employees e
RIGHT JOIN hr.departments d ON e.department_id = d.department_id
WHERE e.employee_id IS NULL;
-- done executed

-- 7. Retrieve employees along with their manager names using SELF JOIN
SELECT e.employee_id, CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS employee_name, m.employee_name AS manager_name
FROM hr.employees e
LEFT JOIN hr.employees m ON e.manager_id = m.employee_id;
-- done executed

-- 8. Retrieve employees along with their job title using INNER JOIN
SELECT e.employee_id, CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS employee_name, j.job_title
FROM hr.employees e
INNER JOIN hr.jobs j ON e.job_id = j.job_id;
-- done executed

-- 9. Retrieve employees along with the location of their department using INNER JOIN
SELECT e.employee_id,CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS employee_name, d.department_name, l.city
FROM HR.employees e
INNER JOIN hr.departments d ON e.department_id = d.department_id
INNER JOIN HR.locations l ON d.location_id = l.location_id;
-- done executed

-- 10. Retrieve employees and the projects they are assigned to using INNER JOIN
SELECT e.employee_id,CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS employee_name, p.name
FROM hr.employees e
INNER JOIN PROJECTS.projects p ON e.employee_id = p.id;
-- done executed, but did not get result

-- 10. Retrieve employees and the projects they are assigned to using INNER JOIN
SELECT e.employee_id,CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS employee_name, p.name
FROM hr.employees e
INNER JOIN PROJECTS.projects p ON e.employee_id = p.id;
-- done executed, but did not get result

-- 11. Retrieve employees who have not been assigned to any project using LEFT JOIN
-- select * from hr.EMPLOYEES;
SELECT e.employee_id, CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS employee_name
FROM HR.employees e
LEFT JOIN PROJECTS.projects p ON e.employee_id = p.id
WHERE p.id IS NULL;
-- done executed

-- 12. Retrieve project names along with the department handling them using INNER JOIN
SELECT p.name, d.department_name
FROM PROJECTS.projects p
INNER JOIN hr.departments d ON p.id = d.department_id;
-- done executed but did not get the result

-- 13. Retrieve employees along with the names of their training programs using INNER JOIN
SELECT e.employee_id, e.employee_name, t.training_name
FROM employees e
INNER JOIN training_programs t ON e.training_id = t.training_id;
-- not executed, training_programs not available , table is not available need to check with

-- 14. Retrieve employees who have not attended any training programs using LEFT JOIN
SELECT e.employee_id, e.employee_name
FROM employees e
LEFT JOIN training_programs t ON e.training_id = t.training_id
WHERE t.training_id IS NULL;
-- not executed, training_programs not available , table is not available need to check with


SELECT OWNER, TABLE_NAME, COLUMN_NAME  
FROM ALL_TAB_COLUMNS  
WHERE COLUMN_NAME = 'YOUR_COLUMN_NAME';

-- 15. Retrieve employee names and their assigned shifts using INNER JOIN
SELECT e.employee_id, e.employee_name, s.shift_timing
FROM employees e
INNER JOIN shifts s ON e.shift_id = s.shift_id;
-- not executed, training_programs not available , table is not available need to check with

-- 16. Retrieve employees who do not have an assigned shift using LEFT JOIN
SELECT e.employee_id, e.employee_name
FROM employees e
LEFT JOIN shifts s ON e.shift_id = s.shift_id
WHERE s.shift_id IS NULL;
-- not executed, training_programs not available , table is not available need to check with

-- 17. Retrieve employees, their department names, and their assigned project names using multiple INNER JOINs
SELECT e.employee_id, CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS employee_name, d.department_name, p.name
FROM HR.employees e
INNER JOIN hr.departments d ON e.department_id = d.department_id
INNER JOIN PROJECTS.projects p ON e.employee_id = p.id;
-- done executed but did not get the result

-- 18. Retrieve employees who have worked on more than one project using INNER JOIN and GROUP BY
SELECT e.employee_id, CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS employee_name, COUNT(p.id) AS project_count
FROM HR.employees e
INNER JOIN PROJECTS.projects p ON e.employee_id = p.id
GROUP BY e.employee_id, CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS employee_name,
HAVING COUNT(p.id) > 1;
-- done executed but did not get the result




























