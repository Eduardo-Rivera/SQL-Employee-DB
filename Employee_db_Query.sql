SELECT * FROM "Department_Employee";
SELECT * FROM "Department_Manager";
SELECT * FROM "Departments";
SELECT * FROM "Employees";
SELECT * FROM "Salaries";
SELECT * FROM "Titles";

-- List of employee number, last name, first name, gender, and salary
SELECT s.Employee_ID, e.Last_Name, e.First_Name, e.Gender, s.Salary
FROM "Employees" AS e
INNER JOIN "Salaries" AS s
	ON s.Employee_ID = e.ID;
	
-- List of employees who were hired in 1986
SELECT * FROM "Employees"
WHERE hire_date LIKE '1986%'

-- List of the manager of each department with ...
-- ... department number, department name, employee number
-- ... last name, first name, start and end employment dates
SELECT dm.department_id, d.department_name, dm.employee_id, e.last_name,
	   e.first_name, dm.start_date, dm.end_date
FROM "Departments" AS d 
RIGHT JOIN "department_manager" AS dm
	ON d.id = dm.department_id
LEFT JOIN "Employees" AS e
	ON e.id = dm.employee_id
	
-- List of the department of each employee with ...
-- ... employee number, last name, first name, and department name
SELECT de.employee_id, e.last_name, e.first_name, d.department_name
FROM "Employees" AS e
RIGHT JOIN "department_employee" AS de
	ON e.id = de.employee_id
LEFT JOIN "Departments" AS d
	ON d.id = de.department_id
	
-- List of all employees whose first name is Hercules and last names 
-- begin with B
SELECT * FROM "Employees" 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- List of all employees in the Sales department with ...
-- ... employee number, last name, first name, department name
SELECT de.employee_id, e.last_name, e.first_name, d.department_name
FROM "Employees" AS e
RIGHT JOIN "department_employee" AS de
	ON e.id = de.employee_id
LEFT JOIN "Departments" AS d
	ON d.id = de.department_id
WHERE d.department_name = 'Sales'

-- List of all employees in the Sales and Development departments with ...
-- ... employee number, last name, first name, department name
SELECT de.employee_id, e.last_name, e.first_name, d.department_name
FROM "Employees" AS e
RIGHT JOIN "department_employee" AS de
	ON e.id = de.employee_id
LEFT JOIN "Departments" AS d
	ON d.id = de.department_id
WHERE d.department_name = 'Sales' OR d.department_name = 'Development'

-- Frequency count of employee last names, in descending order
SELECT last_name, count(last_name) AS "Frequency of Last Name"
FROM "Employees"
GROUP BY last_name
ORDER BY "Frequency of Last Name" DESC