-- 1. Counts employees for each department using GROUP BY.
SELECT department_id, COUNT(*) AS total_employees
FROM hr.employees
GROUP BY department_id;
-- done executed

-- 2. Computes the average salary for each department.
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;
-- done executed

-- 3.Summarizes total salaries per department and selects the highest one. to get top or botton do order by
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC
FETCH FIRST 1 ROW ONLY;
-- done executed

-- 4. Finds the highest and lowest salary within each job role. max for highest and min for lowest
SELECT job_id, MAX(salary) AS max_salary, MIN(salary) AS min_salary
FROM HR.employees
GROUP BY job_id;
-- done executed

-- 5. Extracts year from hire_date and counts employees hired per year. (this is a bit confused but now ok)
SELECT EXTRACT(YEAR FROM hire_date) AS hire_year, COUNT(*) AS total_employees
FROM hr.employees
GROUP BY EXTRACT(YEAR FROM hire_date)
ORDER BY hire_year;
-- done executed

-- 6. Uses RANK() to assign ranks based on salary in each department. (do practise more about partition by, group by understood, order by practise, to assign rank use "rank over" function)
SELECT department_id, employee_id, salary, 
       RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
FROM hr.employees;
-- done , executed

-- 7. Uses RANK() to rank employees based on salary and filters top 3.
SELECT department_id, employee_id, salary
FROM (
    SELECT department_id, employee_id, salary, 
           RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
    FROM HR.employees
) WHERE salary_rank <= 3;
-- done executed

-- 8.Uses DENSE_RANK() to identify employees with the second-highest salary per department.
SELECT department_id, employee_id, salary
FROM (
    SELECT department_id, employee_id, salary, 
           DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
    FROM employees
) WHERE salary_rank = 2;
-- done, executed

-- 9. Uses SUM() OVER() to create a running total of salaries. (running means cumulative, ask sir and clarify one more time)
SELECT employee_id, hire_date, salary, 
       SUM(salary) OVER (ORDER BY hire_date) AS cumulative_salary
FROM employees;
-- executed but need to practise more

-- 10. Uses ROW_NUMBER() to assign a unique row number per department. (koncham complex edi)
SELECT department_id, employee_id, 
       ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY employee_id) AS row_num
FROM HR.employees;
-- done, executed and understood

-- 11. Uses LEAD() to compare an employee's salary with the next highest. (koncham complex edi
SELECT employee_id, salary, 
       LEAD(salary) OVER (ORDER BY salary DESC) - salary AS salary_diff
FROM hr.employees;
-- done executed

-- 12. Uses LAG() to get the previous salary entry for each employee. (koncham complex edi)
SELECT employee_id, salary, hire_date, 
       LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) AS prev_salary
FROM hr.employees;
-- done executed

-- 13. Uses LAG() to compare an employee's current and previous salaries. (lag is more complex)
SELECT employee_id, hire_date, salary, 
       LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) AS prev_salary,
       CASE WHEN salary > LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) 
            THEN 'Increased' ELSE 'Decreased' END AS salary_trend
FROM hr.employees;
-- done executed, more and more practise

-- 14. Computes average salary grouped by year of hire.
SELECT EXTRACT(YEAR FROM hire_date) AS hire_year, AVG(salary) AS avg_salary
FROM hr.employees
GROUP BY EXTRACT(YEAR FROM hire_date)
ORDER BY hire_year;
-- done executed, good and easy understood

-- 15. Counts employees for each job role using GROUP BY.
SELECT job_id, COUNT(*) AS total_employees
FROM HR.employees
GROUP BY job_id;
-- done executed, good one

-- 16. Sums salaries of employees under each manager.
SELECT manager_id, SUM(salary) AS total_team_salary
FROM employees
GROUP BY manager_id;
-- done executed.

-- 17. Uses RANK() to find the highest-paid employee in each department.
SELECT department_id, employee_id, salary
FROM (
    SELECT department_id, employee_id, salary,
           RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
    FROM HR.employees
) WHERE salary_rank = 1;
-- done executed

-- 18. Uses SUM() OVER() to compute cumulative salary totals.
SELECT department_id, employee_id, salary, 
       SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_date) AS running_total
FROM HR.employees;
-- done executed

-- 19. Uses a subquery to filter employees earning above department average.
SELECT employee_id, department_id, salary
FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id);
-- done executed

--20. Uses RANK() to order employees by hire date per department.
SELECT employee_id, department_id, hire_date, 
       RANK() OVER (PARTITION BY department_id ORDER BY hire_date ASC) AS experience_rank
FROM hr.employees;
-- done executed

-- 21. Uses AVG() OVER() to compute salary difference from department average.
SELECT employee_id, department_id, salary, 
       salary - AVG(salary) OVER (PARTITION BY department_id) AS salary_diff
FROM employees;
-- done executed

-- 22. Counts employees in each department and selects the highest.
SELECT department_id, COUNT(*) AS total_hired
FROM hr.employees
GROUP BY department_id
ORDER BY total_hired DESC
FETCH FIRST 1 ROW ONLY;
-- done executed

-- 23. -- Uses COUNT() OVER() to count employees hired in the same month-year. (this is totally confusing)
SELECT employee_id, hire_date, 
       COUNT(*) OVER (PARTITION BY EXTRACT(MONTH FROM hire_date), EXTRACT(YEAR FROM hire_date)) AS same_month_hires
FROM HR.employees;
-- done executed (this is totally confusing)

-- 24. Uses AVG() OVER() with ROWS BETWEEN for moving average calculation.
SELECT employee_id, hire_date, salary, 
       AVG(salary) OVER (ORDER BY hire_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_avg_salary
FROM HR.employees;
--- done executed (this is totally confusing)

-- 25. Uses a subquery to compare employee salary with manager's team average.
SELECT e.employee_id, e.manager_id, e.salary
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE manager_id = e.manager_id);
-- done executed

--26. Uses a subquery to compare employee salary with manager's team average.
SELECT e.employee_id, e.manager_id, e.salary
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE manager_id = e.manager_id);
-- done executed















