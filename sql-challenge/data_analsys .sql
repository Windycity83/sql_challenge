--#1 
SELECT emp.emp_no,emp.last_name,emp.first_name,emp.sex,sal.salary
FROM employees AS emp
LEFT JOIN salaries AS sal
on emp.emp_no = sal.emp_no

--#2 List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp.first_name,emp.last_name,emp.hire_date
FROM employees AS emp 
WHERE emp.hire_date BETWEEN '1986-01-01' AND '1986-12-31'

--#3 List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.

SELECT dm.dept_no,dpt.dept_name,dm.emp_no,emps.last_name,emps.first_name
FROM dept_manager AS dm 
INNER JOIN departments AS dpt 
on (dm.dept_no = dpt.dept_no)
INNER JOIN employees AS emps
ON emps.emp_no = dm.emp_no

--#4 List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name.

SELECT  d.dept_no,emp.emp_no, emp.last_name,emp.first_name,d.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS de
ON (emp.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (d.dept_no = d.dept_no)

--#5 List first name, last name, and sex of each employee whose first name is Hercules
--and whose last name begins with the letter B?

SELECT emp.first_name,emp.last_name,emp.sex
FROM employees AS emp	
WHERE emp.first_name = 'Hercules' AND emp.last_name LIKE 'B%';

--#6 List each employee in the Sales department, including their employee number, last name, 
--and first name?SELECT employee_number, last_name, first_name
SELECT emp.emp_no, emp.last_name, emp.first_name
FROM employees AS emp
INNER JOIN dept_emp AS dpe ON dpe.emp_no = emp.emp_no
INNER JOIN  departments as dpt
ON dpe.dept_no = dpt.dept_no
WHERE dpt.dept_name = 'Sales';

--#7 List each employee in the Sales and Development departments, including their employee number, last name,
--first name, and department name?

SELECT dpe.dept_no, dpe.emp_no, emp.last_name, emp.first_name, de.dept_name
FROM employees AS emp
JOIN dept_emp AS dpe ON emp.emp_no = dpe.emp_no
JOIN departments AS de ON dpe.dept_no = de.dept_no
WHERE de.dept_name IN ('Sales', 'Development');


--#8 List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name)?

SELECT emp.last_name, COUNT(emp.emp_no) as num_last_name
FROM employees as emp
GROUP BY emp.last_name
ORDER BY num_last_name ASC;
 
