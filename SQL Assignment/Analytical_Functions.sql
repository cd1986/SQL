-- Counts employees for each department using GROUP BY.
SELECT department_id, COUNT(*) AS total_employees
FROM hr.employees
GROUP BY department_id;
-- done executed
