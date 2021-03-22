-- query 1
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary  from employees as emp
	JOIN salaries as sal on emp.emp_no = sal.emp_no	
;
-- query 2
SELECT emp.first_name, emp.last_name, emp.hire_date from employees as emp
	where emp.hire_date >= '1/1/1986'
	and emp.hire_date <= '12/31/1986'
;
-- query 5
SELECT emp.first_name, emp.last_name, emp.sex from employees as emp
	where emp.first_name = 'Hercules'
	and emp.last_name like 'B%'
;
-- query 6
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, dept.dept_name from employees as emp
	JOIN dept_emp as deptE on emp.emp_no = deptE.emp_no	
	JOIN departments as dept on deptE.dept_no = dept.dept_no
	WHERE dept.dept_name = 'Sales'
;	
-- query 7
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, dept.dept_name from employees as emp
	JOIN dept_emp as deptE on emp.emp_no = deptE.emp_no	
	JOIN departments as dept on deptE.dept_no = dept.dept_no
	WHERE dept.dept_name = 'Sales' or dept.dept_name = 'Development'
;	
-- query 4
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name from employees as emp
	JOIN dept_emp as deptE on emp.emp_no = deptE.emp_no	
	JOIN departments as dept on deptE.dept_no = dept.dept_no	
;
-- query 3
SELECT deptM.dept_no, dept.dept_name, deptM.emp_no, emp.last_name, emp.first_name from dept_manager as deptM
	JOIN departments as dept on deptM.dept_no = dept.dept_no	
	JOIN employees as emp on emp.emp_no = deptM.emp_no	
;
-- query 8
SELECT last_name, count(last_name) from employees group by last_name order by count desc
;