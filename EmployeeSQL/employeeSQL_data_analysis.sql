---1. List the employee number, last name, first name, sex, and salary of each employee.
Select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
From employees e
Inner Join salaries s
ON e.emp_no=s.emp_no;

--- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, TO_CHAR(hire_date, 'MM/DD/YYYY') AS hire_date_str
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. 