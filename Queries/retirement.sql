SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
	retirement_info.last_name,
    employee_departments.to_date
FROM retirement_info
LEFT JOIN employee_departments
ON retirement_info.emp_no = employee_departments.emp_no;

SELECT ri.emp_no,
    ri.first_name,
ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN employee_departments as de
ON ri.emp_no = de.emp_no;

SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
    de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN employee_departments as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO current_emp_count
FROM current_emp as ce
LEFT JOIN employee_departments as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT emp_no,
    first_name,
    last_name,
    gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');	

SELECT e.emp_no,
    e.first_name,
    e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN employee_departments as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

SELECT * From retirement_info

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
-- INTO dept_info
FROM current_emp as ce
INNER JOIN employee_departments AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

--List of retirement_info table, only tailored for the Sales team
SELECT re.emp_no,
re.first_name,
re.last_name,
de.dept_no
FROM retirement_info as re
INNER JOIN employee_departments as de
ON (re.emp_no=de.emp_no) 
WHERE de.dept_no = ('d007');

SELECT * FROM departments

SELECT re.emp_no,
 re.first_name,
 re.last_name,
 de.dept_no,
 d.dept_name
FROM retirement_info as re
INNER JOIN employee_departments as de
ON (re.emp_no=de.emp_no) 
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE de.dept_no IN ('d007','d005');   


--Create total employees table with title by emp_no
SELECT DISTINCT ON (e.emp_no)e.emp_no,
       e.first_name,
       e.last_name,
	   t.title,   
	   t.to_date
INTO employee_title
FROM employees as e
INNER JOIN title as t
ON e.emp_no = t.emp_no
WHERE t.to_date = ('9999-01-01')
ORDER BY e.emp_no,t.to_date DESC

--Retrieve the number of employees by their most recent job title 
SELECT COUNT(title),et.title
INTO employee_title_count
FROM employee_title as et
GROUP BY title
ORDER BY COUNT DESC

SELECT COUNT(title),me.title
--INTO mentorship_elegibility_count
FROM mentorship_elegibility as me
GROUP BY title
ORDER BY COUNT DESC