-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- HP ERD

CREATE TABLE "departments" (
    "dept_no" VARCHAR(50)   NOT NULL,
    "dept_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(50)   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(30)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(5)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(30)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

SELECT * FROM salaries;

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