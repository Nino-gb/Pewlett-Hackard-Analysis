Analysis

## Overview
 
Pewlett Hackard in a large company who have thousands of employees. The Human Resources Department is getting ready for a possible mass employee retirement in the next few years. Upcoming retirement would leave a thousand of job opening therefore Human Resources must conduct an employee research to determinate who is going to retire in the next few years and how many position need to be filled. To perform this task they need to generate a list of the employee eligible for retirement packege by building an employee database in SQL , applying data modeling, engineering and analysis skills.

## Purpose
 
Create and analyze employees database , discover number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program which is a program with experienced and successful employees who will step back into a part-time role mentoring newly hired folks instead of retiring completely.


## Results: 

### Deliverable 1: The Number of Retiring Employees by Title 

#### Create a Retirement Title table by to filter retiring employee from the rest of the employees;




- Retrieve the emp_no, first_name, and last_name columns from the Employees table.

- Retrieve the title, from_date, and to_date columns from the Titles table.

- Use INTO clause to create the table

- Join both tables on the primary key (emp_no)

- Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.


#### Create a Unique Title label that will hold Number of Retiring Employees by Title without duplicate information




- Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.

- Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.

- Exclude those employees that have already left the company by filtering on to_date to keep only those dates that are equal to '9999-01-01'.

- Use INTO clause to create the table

- Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.


#### Create rerouting title table with the number of employees by their most recent job title who are about to retire.





- Retrieve the number of titles from the Unique Titles table.

- Use INTO clause to create the table to hold the required information.

- Group the table by title, then sort the count column in descending order.


### Deliverable 2: The Employees Eligible for the Mentorship Program 




- Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.

- Retrieve the from_date and to_date columns from the Department Employee table.

- Retrieve the title column from the Titles table.

- Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.

- Join the Employees and the Department Employee tables on the primary key.

- Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965

- Join the Employees and the Titles tables on the primary key.

- Order the table by the employee number.



## Summary: 


### How many roles will need to be filled as the "silver tsunami" begins to make an impact?

Human Resources will need to recruit and fill out 72,458 positions in the next few years.

### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees? 

There is enough mentors for Senior Staff, Senior Engineer, Staff, Technique Leader and Assistance Engineer. However, there is none mentor for Managers (refer to mentorship title count table)

