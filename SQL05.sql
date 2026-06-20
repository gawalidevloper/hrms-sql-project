USE hrms;

DELIMITER $$

CREATE FUNCTION CalculateNetSalary(
    basic DECIMAL(10,2),
    hra DECIMAL(10,2),
    bonus DECIMAL(10,2),
    deduction DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN basic + hra + bonus - deduction;
END$$

DELIMITER ;

SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    CalculateNetSalary(
        s.basic_salary,
        s.hra,
        s.bonus,
        s.deduction
    ) AS net_salary
FROM employees e
JOIN salary s
ON e.employee_id = s.employee_id;