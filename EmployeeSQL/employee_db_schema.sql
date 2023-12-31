CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(30)
);

-- SELECT * FROM titles LIMIT 10;

CREATE TABLE employee (
	emp_no INTEGER PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	sex VARCHAR(2),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
-- SELECT * FROM employee LIMIT 10;

CREATE TABLE salaries (
	emp_no INTEGER PRIMARY KEY,
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
	);
SELECT * FROM salaries LIMIT 100;	

CREATE TABLE departments (
	dept_no VARCHAR(5) PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
	);
-- SELECT * FROM departments LIMIT 10;

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(5) NOT NULL,
	PRIMARY KEY(dept_no,emp_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
-- SELECT * FROM dept_emp LIMIT 10;

CREATE TABLE dept_manager (
	dept_no VARCHAR(5) NOT NULL,
	emp_no	INTEGER NOT NULL,
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no) REFERENCES employee(emp_no)
);
-- SELECT * FROM dept_manager LIMIT 10;