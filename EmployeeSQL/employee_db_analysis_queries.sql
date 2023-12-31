--Data Analysis
-- 1. List the employee number, last name, first name, sex, and salary of each employee.
-- Note: remove LIMIT clause to see all.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employee emp, salaries sal
WHERE emp.emp_no = sal.emp_no
LIMIT 1000;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
-- Note: remove LIMIT clause to see all.
SELECT first_name, last_name, hire_date
FROM employee
WHERE EXTRACT(year FROM hire_date) = '1986'
LIMIT 1000;


-- 3. List the manager of each department along with their:
----  department number, department name, employee number, last name, and first name.
SELECT dept.dept_no, dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM departments dept
INNER JOIN dept_manager dm ON dept.dept_no = dm.dept_no
INNER JOIN employee emp ON emp.emp_no = dm.emp_no
ORDER BY dept.dept_no;


-- 4. List the department number for each employee 
----  along with that employee’s employee number, last name, first name, and department name.
-- Note: remove LIMIT clause to see all.
SELECT  de.dept_no, emp.emp_no, emp.last_name, emp.first_name, dept.dept_name 
FROM departments dept
INNER JOIN dept_emp de ON dept.dept_no = de.dept_no
INNER JOIN employee emp ON emp.emp_no = de.emp_no
ORDER BY de.dept_no
LIMIT 1000;


-- 5. List first name, last name, and sex of each employee whose first name is Hercules 
----  and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules' AND last_name like 'B%';


-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM departments dept
INNER JOIN dept_emp de ON dept.dept_no = de.dept_no
INNER JOIN employee emp ON emp.emp_no = de.emp_no
WHERE dept.dept_name = 'Sales';


-- Note: remove LIMIT clause to see all.
-- 7. List each employee in the Sales and Development departments,
----  including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM departments dept
INNER JOIN dept_emp de ON dept.dept_no = de.dept_no
INNER JOIN employee emp ON emp.emp_no = de.emp_no
WHERE dept.dept_name IN ('Sales','Development')
LIMIT 1000; 

-- 8. List the frequency counts, in descending order, 
----  of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS "frequency_counts"
FROM employee
GROUP BY last_name
ORDER BY "frequency_counts" DESC;