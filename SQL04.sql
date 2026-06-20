USE hrms;

-- Audit Salary Changes
CREATE TABLE salary_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER $$

CREATE TRIGGER before_salary_update
BEFORE UPDATE
ON salary
FOR EACH ROW
BEGIN

INSERT INTO salary_audit(
employee_id,
old_salary,
new_salary
)
VALUES(
OLD.employee_id,
OLD.basic_salary,
NEW.basic_salary
);

END$$

DELIMITER ;
UPDATE salary
SET basic_salary = 65000
WHERE employee_id = 1;

-- Log New Employees
CREATE TABLE employee_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    action_performed VARCHAR(20),
    action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER $$

CREATE TRIGGER after_employee_insert
AFTER INSERT
ON employees
FOR EACH ROW
BEGIN

INSERT INTO employee_log(
employee_id,
action_performed
)
VALUES(
NEW.employee_id,
'INSERT'
);

END$$

DELIMITER ;
INSERT INTO employees
(first_name,last_name,email,phone,gender,hire_date,department_id)
VALUES
('Sachin','Tendulkar','sachin@gmail.com','9999999999',
'Male','2025-07-01',1);

DELIMITER $$


-- Prevent Negative Salary
DELIMITER $$

CREATE TRIGGER check_salary
BEFORE INSERT
ON salary
FOR EACH ROW
BEGIN

IF NEW.basic_salary < 0 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Salary cannot be negative';
END IF;

END$$

DELIMITER ;

-- INSERT INTO salary
-- (employee_id,basic_salary,hra,bonus,deduction)
-- VALUES
-- (10,-50000,5000,2000,1000);


-- Auto Generate Payroll Record
DELIMITER $$

CREATE TRIGGER after_salary_insert
AFTER INSERT
ON salary
FOR EACH ROW
BEGIN

INSERT INTO payroll(
employee_id,
pay_month,
net_salary,
payment_date
)
VALUES(
NEW.employee_id,
DATE_FORMAT(CURDATE(),'%M %Y'),
NEW.basic_salary+NEW.hra+NEW.bonus-NEW.deduction,
CURDATE()
);

END$$

DELIMITER ;

INSERT INTO salary
(employee_id,basic_salary,hra,bonus,deduction)
VALUES
(5,70000,7000,3000,1000);