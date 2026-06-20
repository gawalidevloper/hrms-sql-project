USE hrms;

-- Lowest salary employee
SELECT employee, net_salary FROM net_salary_view WHERE net_salary = (SELECT MIN(net_salary) FROM net_salary_view);

-- Department with maximum employees
SELECT departments.department_name, COUNT(*) AS total_employee 
FROM departments 
JOIN employees ON employees.department_id = departments.department_id
GROUP BY departments.department_id, departments.department_name
LIMIT 1;

-- Employees Without Leave Requests
SELECT CONCAT(employees.first_name,' ',employees.last_name) AS name FROM employees
LEFT JOIN leave_requests ON employees.employee_id = leave_requests.employee_id;

-- Employees with Highest Salary in Each Department
SELECT d.department_name,
       CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
       s.basic_salary
FROM employees e
JOIN salary s
ON e.employee_id = s.employee_id
JOIN departments d
ON e.department_id = d.department_id
WHERE (e.department_id, s.basic_salary) IN (
    SELECT e.department_id,
           MAX(s.basic_salary)
    FROM employees e
    JOIN salary s
    ON e.employee_id = s.employee_id
    GROUP BY e.department_id
);


SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
       ROUND(
           SUM(CASE
                   WHEN a.status = 'Present'
                   THEN 1
                   ELSE 0
               END) * 100.0 / COUNT(*),
           2
       ) AS attendance_percentage
FROM employees e
JOIN attendance a
ON e.employee_id = a.employee_id
GROUP BY e.employee_id;

-- employee_department_view
CREATE VIEW employee_department_view AS
SELECT e.employee_id,
       CONCAT(e.first_name,' ',e.last_name) AS employee_name,
       d.department_name,
       e.email,
       e.phone,
       e.hire_date
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

SELECT * FROM employee_department_view;

-- attendance_report_view
CREATE VIEW attendance_report_view AS
SELECT CONCAT(e.first_name,' ',e.last_name) AS employee_name,
       d.department_name,
       a.attendance_date,
       a.status
FROM employees e
JOIN attendance a
ON e.employee_id = a.employee_id
JOIN departments d
ON e.department_id = d.department_id;

SELECT * FROM attendance_report_view;


-- payroll_report_view
CREATE VIEW payroll_report_view AS
SELECT CONCAT(e.first_name,' ',e.last_name) AS employee_name,
       d.department_name,
       s.basic_salary,
       s.hra,
       s.bonus,
       s.deduction,
       (s.basic_salary+s.hra+s.bonus-s.deduction) AS net_salary
FROM employees e
JOIN salary s
ON e.employee_id = s.employee_id
JOIN departments d
ON e.department_id = d.department_id;

SELECT * FROM payroll_report_view;

DELIMITER $$

CREATE PROCEDURE AddEmployee(
IN p_first_name VARCHAR(50),
IN p_last_name VARCHAR(50),
IN p_email VARCHAR(100),
IN p_phone VARCHAR(15),
IN p_gender ENUM('Male','Female'),
IN p_hire_date DATE,
IN p_department_id INT
)
BEGIN

INSERT INTO employees(
first_name,
last_name,
email,
phone,
gender,
hire_date,
department_id
)
VALUES(
p_first_name,
p_last_name,
p_email,
p_phone,
p_gender,
p_hire_date,
p_department_id
);

END$$

DELIMITER ;

CALL AddEmployee(
'Virat',
'Kohli',
'virat@gmail.com',
'9876543210',
'Male',
'2025-07-01',
1
);

SHOW PROCEDURE STATUS WHERE Db = 'hrms';
