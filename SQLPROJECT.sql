--This worksheet contains the basics required to make an
--employment management system.

--Although the project requires a new schema, everything exists 
--within this schema for the project
SET SERVEROUTPUT ON;




Select *
from employees
WHERE email = 'mzucker';



--View to display all employees sorted by department
Create or replace VIEW vu_employees AS 
Select first_name, last_name, email, department_id, job_id
from employees
Order by department_id;

Select * FROM vu_employees;


--View to display all employees sorted by position
Create or replace View vu_emp_by_job AS
Select first_name, last_name, email, department_id, j.job_title
from employees e
Join jobs j
ON e.job_id = j.job_id
Order by j.job_title;

Select * FROM vu_emp_by_job;


--Use aggregate fucntions to display information:
--Average salary by department
Create or replace view vu_avg_sal AS
Select ROUND(AVG(salary),2) AS Average_Salary, department_id
from employees
group by(department_id)
Order by department_id;

Select * FROM vu_avg_sal;

--# of employees per department
Create or replace view vu_emp_count AS
Select Count(*) as Employee_Count, d.department_name
From employees e
Join departments d
on e.department_id = d.department_id
group by d.department_name
Order by d.department_name;

Select * FROM vu_emp_count;


--Show range of salary per department
Create or replace view vu_sal_range AS
Select Min(e.salary)||'-' ||Max(e.salary) AS Salary_RANGE, d.department_name
from employees e
join departments d
on e.department_id = d.department_id
group by d.department_name;

Select * FROM vu_sal_range;









/*
--Use case to maybe display 1,2,3,4,5 to choose which report they want
Select job_id
from employees;
--Use substition variables like add employee names
SET DEFINE ON;
Insert INTO employees(employee_id,first_name, last_name,email,hire_date,job_id)
Values(employees_seq.nextval,'&first_name', '&last_name','&email',SYSDATE,'&job_id');



Select *
from employees
where first_name = 'mark';
--use substition variables to change department

Update employees
SET department_id = &department_id
WHERE employee_id = &employee_id;

--use substitution variables to job_id

Update employees
SET job_id = '&job_id'
WHERE employee_id = &employee_id;
*/