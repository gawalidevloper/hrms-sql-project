CREATE DATABASE hrms;
USE hrms;

CREATE TABLE departments(
	department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

INSERT INTO departments(department_name) VALUES
	('IT'),
    ('HR'),
    ('FINANCE'),
    ('SALES'),
    ('MARKETING');

SELECT * FROM departments;
    
CREATE TABLE employees(
	employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    gender ENUM('MALE','FEMALE'),
    hire_date DATE,
    department_id INT,
    FOREIGN KEY(department_id) REFERENCES departments(department_id)
);
INSERT INTO employees
(first_name, last_name, email, phone, gender, hire_date, department_id)
VALUES
('John', 'Smith', 'john.smith@example.com', '9876543210', 'MALE', '2021-03-15', 1),
('Emma', 'Johnson', 'emma.johnson@example.com', '9876543211', 'FEMALE', '2020-07-22', 2),
('Michael', 'Brown', 'michael.brown@example.com', '9876543212', 'MALE', '2019-11-10', 3),
('Sophia', 'Davis', 'sophia.davis@example.com', '9876543213', 'FEMALE', '2022-01-05', 1),
('William', 'Miller', 'william.miller@example.com', '9876543214', 'MALE', '2018-09-18', 4),
('Olivia', 'Wilson', 'olivia.wilson@example.com', '9876543215', 'FEMALE', '2023-05-30', 2),
('James', 'Moore', 'james.moore@example.com', '9876543216', 'MALE', '2020-12-14', 5),
('Ava', 'Taylor', 'ava.taylor@example.com', '9876543217', 'FEMALE', '2021-08-25', 3),
('Benjamin', 'Anderson', 'ben.anderson@example.com', '9876543218', 'MALE', '2019-06-12', 4),
('Mia', 'Thomas', 'mia.thomas@example.com', '9876543219', 'FEMALE', '2022-10-08', 5);


SELECT * FROM employees;

CREATE TABLE attendance(
	attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    attendance_date DATE,
    status ENUM('PRESENT','ABSENT','LEAVE'),
    FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);

INSERT INTO attendance (employee_id, attendance_date, status)
VALUES
(1, '2025-06-01', 'PRESENT'),
(2, '2025-06-01', 'PRESENT'),
(3, '2025-06-01', 'ABSENT'),
(4, '2025-06-01', 'LEAVE'),
(5, '2025-06-01', 'PRESENT'),
(6, '2025-06-01', 'PRESENT'),
(7, '2025-06-01', 'ABSENT'),
(8, '2025-06-01', 'PRESENT'),
(9, '2025-06-01', 'LEAVE'),
(10, '2025-06-01', 'PRESENT'),
(1, '2025-06-02', 'PRESENT'),
(2, '2025-06-02', 'ABSENT'),
(3, '2025-06-02', 'PRESENT'),
(4, '2025-06-02', 'PRESENT'),
(5, '2025-06-02', 'LEAVE'),
(6, '2025-06-02', 'PRESENT'),
(7, '2025-06-02', 'PRESENT'),
(8, '2025-06-02', 'ABSENT'),
(9, '2025-06-02', 'PRESENT'),
(10, '2025-06-02', 'PRESENT'),
(1, '2025-06-03', 'LEAVE'),
(2, '2025-06-03', 'PRESENT'),
(3, '2025-06-03', 'PRESENT'),
(4, '2025-06-03', 'ABSENT'),
(5, '2025-06-03', 'PRESENT'),
(6, '2025-06-03', 'PRESENT'),
(7, '2025-06-03', 'LEAVE'),
(8, '2025-06-03', 'PRESENT'),
(9, '2025-06-03', 'PRESENT'),
(10, '2025-06-03', 'ABSENT');


SELECT * FROM attendance;

CREATE TABLE salary(
	salary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    basic_salary DECIMAL(10,2),
    hra DECIMAL(10,2),
    bonus DECIMAL(10,2),
    deduction DECIMAL(10,2),
    FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);

INSERT INTO salary
(employee_id, basic_salary, hra, bonus, deduction)
VALUES
(1, 50000.00, 10000.00, 5000.00, 2000.00),
(2, 60000.00, 12000.00, 6000.00, 2500.00),
(3, 55000.00, 11000.00, 4500.00, 1800.00),
(4, 70000.00, 14000.00, 8000.00, 3000.00),
(5, 45000.00, 9000.00, 4000.00, 1500.00),
(6, 65000.00, 13000.00, 7000.00, 2800.00),
(7, 52000.00, 10400.00, 4800.00, 1900.00),
(8, 58000.00, 11600.00, 5500.00, 2200.00),
(9, 75000.00, 15000.00, 9000.00, 3500.00),
(10, 48000.00, 9600.00, 4200.00, 1700.00);


SELECT * FROM salary;

CREATE TABLE leave_requests(
    leave_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    leave_type VARCHAR(20),
    start_date DATE,
    end_date DATE,
    status ENUM('Pending','Approved','Rejected'),
    FOREIGN KEY(employee_id)
    REFERENCES employees(employee_id)
);

INSERT INTO leave_requests
(employee_id, leave_type, start_date, end_date, status)
VALUES
(1, 'Sick Leave', '2025-06-10', '2025-06-12', 'Approved'),
(2, 'Casual Leave', '2025-06-15', '2025-06-16', 'Pending'),
(3, 'Vacation', '2025-07-01', '2025-07-05', 'Approved'),
(4, 'Sick Leave', '2025-06-20', '2025-06-21', 'Rejected'),
(5, 'Casual Leave', '2025-06-25', '2025-06-25', 'Approved'),
(6, 'Vacation', '2025-08-10', '2025-08-15', 'Pending'),
(7, 'Emergency Leave', '2025-06-18', '2025-06-19', 'Approved'),
(8, 'Sick Leave', '2025-06-22', '2025-06-24', 'Approved'),
(9, 'Vacation', '2025-09-01', '2025-09-10', 'Pending'),
(10, 'Casual Leave', '2025-06-28', '2025-06-29', 'Rejected'),
(1, 'Vacation', '2025-12-20', '2025-12-25', 'Pending'),
(3, 'Casual Leave', '2025-07-15', '2025-07-16', 'Approved'),
(5, 'Sick Leave', '2025-06-30', '2025-07-02', 'Approved'),
(7, 'Vacation', '2025-10-05', '2025-10-12', 'Pending'),
(9, 'Emergency Leave', '2025-06-17', '2025-06-18', 'Rejected');


SELECT * FROM leave_requests;

CREATE TABLE payroll(
    payroll_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    pay_month VARCHAR(20),
    net_salary DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY(employee_id)
    REFERENCES employees(employee_id)
);

INSERT INTO payroll
(employee_id, pay_month, net_salary, payment_date)
VALUES
(1, 'January 2025', 63000.00, '2025-01-31'),
(2, 'January 2025', 75500.00, '2025-01-31'),
(3, 'January 2025', 68700.00, '2025-01-31'),
(4, 'January 2025', 89000.00, '2025-01-31'),
(5, 'January 2025', 56500.00, '2025-01-31'),
(6, 'January 2025', 82200.00, '2025-01-31'),
(7, 'January 2025', 65300.00, '2025-01-31'),
(8, 'January 2025', 72900.00, '2025-01-31'),
(9, 'January 2025', 95500.00, '2025-01-31'),
(10, 'January 2025', 60100.00, '2025-01-31'),
(1, 'February 2025', 63500.00, '2025-02-28'),
(2, 'February 2025', 76000.00, '2025-02-28'),
(3, 'February 2025', 69000.00, '2025-02-28'),
(4, 'February 2025', 89500.00, '2025-02-28'),
(5, 'February 2025', 57000.00, '2025-02-28');

SELECT * FROM payroll;