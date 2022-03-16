CREATE TABLE departments (
  dept_no VARCHAR(5)  PRIMARY KEY,
  dept_name VARCHAR(50) NOT NULL
);


CREATE TABLE title 
(
title_id VARCHAR(8) PRIMARY KEY ,
title VARCHAR(25) NOT NULL
) ;

CREATE TABLE employee 
(
emp_no INT PRIMARY KEY ,
emp_title_id  VARCHAR(8),
birth_date	VARCHAR(15) NOT NULL,
first_name	VARCHAR(25) NOT NULL,
last_name	VARCHAR(25) NOT NULL,
sex_type VARCHAR(1) NOT NULL,
hire_date varchar (15) NOT NULL,
FOREIGN KEY (emp_title_id) REFERENCES title(title_id)
)
ALTER TABLE employee
ALTER COLUMN hire_date TYPE DATE 
using to_date(hire_date, 'MM-dd-YYYY');

--Single dept Many employees 
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
 	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--Single dept Many employees 
CREATE TABLE dept_manager (
 dept_no VARCHAR(5) NOT NULL,
 emp_no INT NOT NULL,
 FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
 FOREIGN KEY (dept_no) REFERENCES departments(dept_no) 
);

	
CREATE TABLE salary 
(
emp_no INT NOT NULL,
salary INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
)

