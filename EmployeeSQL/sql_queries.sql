--1
--Display all employees information regarding first and last name, gender, and salary. 
--Ordered search results by employee number, to switch to order by salary change 1 to 5
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees e
join salaries s 
    on s.emp_no = e.emp_no
order by 1;

--2
--Display all employees hired in the year 1986
--The between statement is inclusive so it is best to include 01-01 and 12-31 from 1986 instead of 1985 and 1987
select * from employees where hire_date between '1986-01-01' and '1986-12-31';

--3
--List the manager of each department with their department number, department name, the manager's employee number,\
--last name, first name, and start and end employment dates.
--Order by 3 to order by employee number
select m.dept_no, d.dept_name, m.emp_no, e.first_name, e.last_name, m.from_date, m.to_date
from dept_manager as m
join employees as e on
    m.emp_no = e.emp_no
join departments as d
    on d.dept_no = m.dept_no
order by 3;

--4
-- List the department of each employee with the following information: employee number, last name, first name, and department name.
--Ordering by 1 to sort by the employee number column
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de 
    on e.emp_no = de.emp_no
left join departments d 
    on d.dept_no = de.dept_no 
order by 1;

--5
--List all employees whose first name is "Hercules" and last names begin with "B."
select * from employees where first_name='Hercules'and last_name like 'B%'

--6
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e 
inner join dept_emp de 
    on e.emp_no = de.emp_no
inner join departments d 
    on de.dept_no = d.dept_no
where d.dept_name = 'Sales'

--7
--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de
	on e.emp_no = de.emp_no
join departments as d
	on d.dept_no = de.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';

--8
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as num_names from employees
group by last_name
order by num_names desc;