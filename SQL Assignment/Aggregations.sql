-- 1. count the number of employees in each department
select department_id, COUNT(*) AS total_employees 
from hr.employees
group by department_id;
-- done, executed

-- 2. find the avg sal in each dept
select department_id, avg(salary) AS avg_salary
from hr.employees
group by department_id;
-- done, executed

-- 3. highest and lowest salaries in each dept
select department_id, MAX(salary), as max_salary, MIN(Salary) as min_salary
from hr.employees
group by department_id;
-- done executed

-- 4. finding the total salary paid in department
select department_id, sum(salary), as total_salary
from hr.employees
group by department_id;
-- done executed

-- 5. Count the no of employees in each job role
SELECT job_id, COUNT(*) AS total_employees
FROM hr.employees
GROUP BY job_id;
-- done, executed

-- 6. Find the avg salary for each job role
SELECT job_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY job_id;
-- done executed

-- 7. Find the maximum salary for each job role
SELECT job_id, MAX(salary) AS max_salary
FROM hr.employees
GROUP BY job_id;
-- done executed

-- 8. Find the minimum salary for each job role
SELECT job_id, MIN(salary) AS min_salary
FROM hr.employees
GROUP BY job_id;
-- done executed

-- 9. Find the total salary paid for each job role
SELECT job_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY job_id;
-- done executed


-- 10. Count the number of employees hired in each year
SELECT EXTRACT(YEAR FROM hire_date) AS hire_year, COUNT(*) AS total_employees
FROM hr.employees
GROUP BY EXTRACT(YEAR FROM hire_date)
ORDER BY hire_year;
-- done, executed

-- 11. Find the total salary paid in each location
SELECT d.location_id, SUM(e.salary) AS total_salary
FROM HR.employees e
JOIN HR.departments d ON e.department_id = d.department_id
GROUP BY d.location_id;
-- done, executed

-- 12. Find the number of employees in each manager's team
SELECT manager_id, COUNT(*) AS team_size
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;
-- done, executed

-- 13. Find the highest salary for each manager
SELECT manager_id, MAX(salary) AS max_salary
FROM hr.employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;
-- done executed

-- 14. Find the average salary for each manager's team
SELECT manager_id, AVG(salary) AS avg_salary
FROM hr.employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;
-- done executed

-- 15. Count the number of employees hired in each month of the year
SELECT EXTRACT(MONTH FROM hire_date) AS hire_month, COUNT(*) AS total_hired
FROM hr.employees
GROUP BY EXTRACT(MONTH FROM hire_date)
ORDER BY hire_month;
-- done, executed

-- 16. Find the department with the highest total salary
SELECT department_id, SUM(salary) AS total_salary
FROM hr.employees
GROUP BY department_id
ORDER BY total_salary DESC
FETCH FIRST 1 ROW ONLY;
-- done, executed

-- 17. Find the job role with the highest average salary
SELECT job_id, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY job_id
ORDER BY avg_salary DESC
FETCH FIRST 1 ROW ONLY;
-- done, executed

-- 18. Find the number of employees in each city
SELECT l.city, COUNT(*) AS total_employees
FROM hr.employees e
JOIN hr.departments d ON e.department_id = d.department_id
JOIN hr.locations l ON d.location_id = l.location_id
GROUP BY l.city;
-- done, executed

-- 19. Find the number of employees who have a commission, grouped by department
SELECT department_id, COUNT(*) AS employees_with_commission
FROM hr.employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;
-- done, executed

-- 20. Find the sum of salaries for employees who have a commission, grouped by department
SELECT department_id, SUM(salary) AS total_salary_with_commission
FROM hr.employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;
--done executed
