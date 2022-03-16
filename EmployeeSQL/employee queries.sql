select * from departments;	
select * from employee;
select * from title;

select * from dept_emp;
select * from dept_manager;

select * from salary;

--  List the following details of each employee: employee number, last name, first name, sex, and salary.
select last_name ,first_name ,sex_type  as sex, salary 
from employee as e 
left join salary as s on e.emp_no = s.emp_no;


--List first name, last name, and hire date for employees who were hired in 1986.
select last_name ,first_name , hire_date 
from employee
where  extract(year from hire_date) = 1986

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select m.dept_no,d.dept_name,m.emp_no,last_name ,first_name
from dept_manager as m 
join departments as d on m.dept_no = d.dept_no
join employee as e on m.emp_no = e.emp_no


--List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no,last_name ,first_name , d.dept_name
from employee as e 
join dept_emp as de on  e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name ,last_name ,sex_type  as sex 
from employee as e 
where  first_name = 'Hercules' and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no,last_name ,first_name , d.dept_name
from employee as e 
join dept_emp as de on  e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
where dept_name like '%Sale%'


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no,last_name ,first_name , d.dept_name
from employee as e 
join dept_emp as de on  e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
where dept_name IN ('Sales' , 'Development')


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last nam
select last_name , count(*) 
from employee as e
group by last_name 
order by last_name desc
