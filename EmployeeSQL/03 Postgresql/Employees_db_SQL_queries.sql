-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.sex as "Gender", 
    s.salary
FROM salaries as s
INNER JOIN employees as e 
    ON e.emp_no = s.emp_no
ORDER BY e.emp_no ASC;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, 
    last_name, 
    hire_date
FROM employees
WHERE hire_date 
    BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date ASC;

-- List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.
SELECT d.dept_no, 
    d.dept_name, 
    e.emp_no, 
    e.first_name, 
    e.last_name 
FROM departments as d
INNER JOIN dept_manager as dm
    ON dm.dept_no = d.dept_no
INNER JOIN employees as e
    ON e.emp_no = dm.emp_no;
	
-- List the department of each employee with the following information: employee number, last name, first name, 
-- and department name.
SELECT e.emp_no, 
    e.first_name, 
    e.last_name, 
    d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
    ON de.emp_no = e.emp_no
INNER JOIN departments as d
    ON d.dept_no = de.dept_no
ORDER BY e.emp_no, 
    d.dept_name;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, 
    e.last_name, 
    e.sex as "Gender"
FROM employees as e
WHERE e.first_name = 'Hercules'
    AND e.last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
    d.dept_name,
	e.emp_no,
	e.first_name,
    e.last_name 
FROM
    employees as e
INNER JOIN
    dept_emp as de
    ON de.emp_no = e.emp_no
INNER JOIN
	departments as d
    ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, 
-- and department name.
SELECT 
    d.dept_name,
	e.emp_no,
	e.first_name,
    e.last_name 
FROM
    employees AS e
INNER JOIN
    dept_emp as de
	ON de.emp_no = e.emp_no
INNER JOIN
	departments as d
	ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR
    d.dept_name = 'Development'
ORDER BY d.dept_name, e.emp_no;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
	e.last_name,
	COUNT (e.last_name) as total
FROM
	employees as e
GROUP BY
	e.last_name
ORDER BY
    total DESC;
