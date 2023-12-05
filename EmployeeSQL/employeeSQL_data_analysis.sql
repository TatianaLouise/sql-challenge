---1. List the employee number, last name, first name, sex, and salary of each employee.
Select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
From employees e
Inner Join salaries s
ON e.emp_no=s.emp_no;

--- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
Select first_name, last_name, TO_CHAR(hire_date, 'MM/DD/YYYY') AS hire_date_str
From employees
Where extract (YEAR FROM hire_date) = 1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select dm.dept_no, departments.dept_name, dm.emp_no, employees.last_name, employees.first_name
From dept_manager dm
Inner Join departments ON dm.dept_no = departments.dept_no
Inner Join employees ON dm.emp_no = employees.emp_no;
