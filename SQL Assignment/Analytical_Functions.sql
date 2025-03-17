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

-- Uses LAG() to compare an employee's current and previous salaries. (lag is more complex)
SELECT employee_id, hire_date, salary, 
       LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) AS prev_salary,
       CASE WHEN salary > LAG(salary) OVER (PARTITION BY employee_id ORDER BY hire_date) 
            THEN 'Increased' ELSE 'Decreased' END AS salary_trend
FROM employees;
-- done executed, more and more practise









