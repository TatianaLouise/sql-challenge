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

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name 
From employees e
Join dept_emp de on e.emp_no = de.emp_no
Join departments d on de.dept_no = d.dept_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
Select first_name, last_name, sex
From employees
Where first_name = 'Hercules' and last_name like 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.
-- Check which dept_no is sales
Select * from departments;

-- sales is department d007
Select e.emp_no, e.last_name, e.first_name
From employees e
Where emp_no in 
(
	Select emp_no
	From dept_emp
	Where dept_no = 'd007'
);

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- Check which dept_no is Development
Select * from departments;

-- sales is department d005
Select e.emp_no, e.last_name, e.first_name, d.dept_name
From employees e
Join dept_emp on e.emp_no = dept_emp.emp_no
Join departments d on dept_emp.dept_no = d.dept_no
Where d.dept_no = 'd005' or d.dept_no = 'd007';

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
Select last_name, Count(last_name) as "Frequency count"
From employees
Group by last_name
Order by "Frequency count" desc;
