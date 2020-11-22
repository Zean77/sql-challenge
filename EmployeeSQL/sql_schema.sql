--Data Engineering

CREATE TABLE Departments(
dept_no VARCHAR(10) NOT NULL PRIMARY KEY,
dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE Employees(
emp_no VARCHAR(20) NOT NULL PRIMARY KEY,
emp_title_id VARCHAR (20) NOT NULL,
birth_date VARCHAR(30) NOT NULL,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
sex VARCHAR (5) NOT NULL,
hire_date VARCHAR (30) NOT NULL,
FOREIGN KEY (emp_title_id) REFERENCES Titles (title_id)
);

CREATE TABLE Salaries(
emp_no VARCHAR(20) NOT NULL,
salary INTEGER NOT NULL,
PRIMARY KEY(emp_no, salary),
FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Titles(
title_id VARCHAR(10) NOT NULL PRIMARY KEY,
title VARCHAR (30) NOT NULL
);

CREATE TABLE Dept_Manager(
dept_no VARCHAR(10) NOT NULL,
emp_no VARCHAR (20) NOT NULL,
PRIMARY KEY (dept_no, emp_no),
FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

CREATE TABLE Dept_Emp(
emp_no VARCHAR(20) NOT NULL,
dept_no VARCHAR (10) NOT NULL,
PRIMARY KEY (emp_no, dept_no),
FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);
SELECT * FROM Departments;
SELECT * FROM Dept_Emp;
SELECT * FROM Dept_Manager;
SELECT * FROM Employees;
SELECT * FROM Salaries;
SELECT * FROM Titles;

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











