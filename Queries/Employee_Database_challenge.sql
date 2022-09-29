--Create a Retirement Titles table that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955.
SELECT e.emp_no,
	   e.first_name,
       e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
INTO retirement_titles 
FROM employees as e
INNER JOIN title as t
ON (e.emp_no= t.emp_no) 
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
ORDER BY emp_no;

SELECT * From retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no)rt.emp_no,
       rt.first_name,
       rt.last_name,
	   rt.title   
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * From unique_titles

--Retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT(title),ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT DESC

SELECT * From retiring_titles

--Create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.

SELECT DISTINCT ON (e.emp_no)e.emp_no,
	   e.first_name,
       e.last_name,
	   e.birth_date,
	   ed.from_date,
	   ed.to_date,
	   t.title
INTO mentorship_elegibility
FROM employees as e
INNER JOIN employee_departments as ed
ON (e.emp_no= ed.emp_no) 
INNER JOIN title as t
ON (e.emp_no= t.emp_no) 
WHERE ed.to_date = ('9999-01-01')
AND(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') 
ORDER BY e.emp_no,t.to_date DESC;

--Create employees table with title by emp_no order
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

SELECT * From employee_title

--Retrieve the number of employees by their most recent job title 
SELECT COUNT(title),et.title
INTO employee_title_count
FROM employee_title as et
GROUP BY title
ORDER BY COUNT DESC

-- Count mentorship elegibility table by title
SELECT COUNT(title),me.title
INTO mentorship_elegibility_count
FROM mentorship_elegibility as me
GROUP BY title
ORDER BY COUNT DESC

