-- Data Analysis Queries

-- 1. Employee Number, last name, first name, sex, salary
select e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    salaries.salary
from employees e
inner join salaries on
    employees.emp_no = salaries.emp_no
;
    
   
-- 2. First name, last name, hire date within 1986
select first_name,
   	last_name,
   	hire_date
from employees e 
where date_part('year', hire_date) = 1986
;
   
  
-- 3. Manager, department number, department name, employee number, last name, first name
select dept_manager.dept_no,
  	departments.dept_name,
  	dept_manager.emp_no,
  	employees.first_name,
  	employees.last_name
from  dept_manager
inner join departments on
  dept_manager.dept_no = departments.dept_no 
inner join employees on 
  dept_manager.emp_no =  employees.emp_no
;
  	
  
-- 4. Department number for each employee, employee number, last name, first, name, department name
select dept_emp.dept_no,
  	dept_emp.emp_no,
  	employees.last_name,
  	employees.first_name,
  	departments.dept_name
from dept_emp 
inner join employees on 
  dept_emp.emp_no = employees.emp_no
inner join departments on
  dept_emp.dept_no = departments.dept_no 
;
 
 
 -- 5. First name, last name, sex of employee where fn: Hercules ln: B
 select first_name,
 	last_name,
 	sex
 from employees e 
 where first_name = 'Hercules'
 and last_name like 'B%'
 ;


-- 6. Sales department employees: employee number, last name, first name
select employees.emp_no,
	employees.last_name,
	employees.first_name 
from  employees 
inner join dept_emp 
	on employees.emp_no = dept_emp.emp_no 
inner join departments 
	on departments.dept_no = dept_emp.dept_no 
where departments.dept_name = 'Sales'
;
 

-- 7. Sales and delevopment department employees: employee number, last name, first name, department  name
select employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from  employees 
inner join dept_emp 
	on employees.emp_no = dept_emp.emp_no 
inner join departments 
	on departments.dept_no = dept_emp.dept_no 
where departments.dept_name in ('Sales', 'Development')
;


-- 8. Frequency counts of employee last names in descending order
select last_name,
	count(last_name)
from employees e 
group by last_name 
order by count(last_name) desc 
;