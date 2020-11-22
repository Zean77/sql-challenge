--Data Analysis
--1. List the following details of each employee: 
--employee number, last name, first name, sex, and salary.
SELECT e.emp_no, last_name, first_name, sex, salary 
FROM Employees AS e 
INNER JOIN Salaries AS s
ON e.emp_no = s.emp_no;

--2. List first name, last name, and hire date for 
--employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM Employees
WHERE hire_date LIKE'%1986%'

--3. List the manager of each department with the 
--following information: department number, department name,
--the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name,e.first_name 
FROM Dept_Manager AS dm
LEFT JOIN Departments AS d 
ON d.dept_no = dm.dept_no
LEFT JOIN Employees AS e
ON dm.emp_no = e.emp_no
ORDER BY d.dept_no
--4. List the department of each employee with the following 
--information: employee number, last name, first name, 
--and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees AS e
LEFT JOIN Dept_Emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN Departments AS d
ON de.dept_no = d.dept_no
ORDER BY e.emp_no

--5. List first name, last name, and sex for employees 
--whose first name is "Hercules" and 
--last names begin with "B."
SELECT first_name, last_name, sex 
FROM Employees 
WHERE first_name ='Hercules' AND
last_name LIKE 'B%'

--6. List all employees in the Sales department, 
--including their employee number, last name, 
--first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Departments AS d
LEFT JOIN Dept_Emp as de
ON d.dept_no = de.dept_no
LEFT JOIN Employees as e
ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, 
--first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Departments AS d
LEFT JOIN Dept_Emp as de
ON d.dept_no = de.dept_no
LEFT JOIN Employees as e
ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY e.emp_no

--8. In descending order, list the frequency count 
--of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS last_name_freq
FROM Employees 
GROUP BY last_name
ORDER BY last_name_freq DESC











