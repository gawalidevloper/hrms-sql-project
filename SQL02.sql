USE hrms;
-- Display employee name and their department 
SELECT CONCAT(employees.first_name,' ', employees.last_name) AS name, departments.department_name
FROM departments
INNER JOIN employees ON departments.department_id = employees.department_id;

-- Show Attendance record
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS Name,
       departments.department_name,
       attendance.status,
       attendance.attendance_date
FROM employees
JOIN attendance
    ON employees.employee_id = attendance.employee_id
JOIN departments
    ON employees.department_id = departments.department_id;

-- Dispaly Employee Salary
SELECT CONCAT(employees.first_name,' ', employees.last_name) AS name, departments.department_name, salary.basic_salary, salary.hra, salary.bonus, salary.deduction
FROM departments
	JOIN employees 
		ON departments.department_id = employees.department_id
	JOIN Salary
		ON employees.employee_id = salary.employee_id;
        
-- Calculate net salary
SELECT CONCAT(employees.first_name,' ', employees.last_name) AS name, departments.department_name, (salary.basic_salary+salary.hra+salary.bonus-salary.deduction) AS net_salary
FROM departments
	JOIN employees 
		ON departments.department_id = employees.department_id
	JOIN Salary
		ON employees.employee_id = salary.employee_id;
        
-- View for calculation of net salary 
CREATE VIEW net_salary_view AS
SELECT employees.employee_id,
	   concat(employees.first_name,' ', employees.last_name) AS employee,
       (salary.basic_salary + salary.hra + salary.bonus - salary.deduction) AS net_salary
FROM employees
JOIN salary ON employees.employee_id = salary.employee_id;

SELECT * FROM net_salary_view;

-- Show employees whose salary is greater than 50000
SELECT employee, net_salary FROM net_salary_view WHERE net_salary > 50000;

-- Count employees in each department
SELECT departments.department_name, COUNT(*) AS total_employee 
FROM departments 
JOIN employees ON employees.department_id = departments.department_id
GROUP BY departments.department_id;

-- Find highest salary
SELECT employee, net_salary FROM net_salary_view WHERE net_salary = (SELECT MAX(net_salary) FROM net_salary_view);

-- Find average salary
SELECT AVG(net_salary) FROM net_salary_view;

-- Show approved leave requests
SELECT CONCAT(employees.first_name,' ', employees.last_name) AS name, leave_requests.leave_type, leave_requests.start_date, leave_requests.end_date
FROM employees
JOIN leave_requests ON leave_requests.employee_id = employees.employee_id
WHERE leave_requests.status = 'Approved';

-- Create payroll report
SELECT CONCAT(employees.first_name,' ', employees.last_name) AS name, payroll.pay_month, payroll.net_salary, payroll.payment_date
FROM employees
JOIN payroll ON payroll.employee_id = employees.employee_id;