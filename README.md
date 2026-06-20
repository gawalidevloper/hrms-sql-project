# 🏢 HRMS — Human Resource Management System (MySQL)

A complete **Human Resource Management System** built with MySQL, covering employee management, attendance tracking, payroll processing, salary management, and leave requests — with stored procedures, triggers, views, and custom functions.

---

## 📁 Project Structure

```
hrms-sql-project/
├── SQL01.sql          # Database setup: tables & seed data
├── SQL02.sql          # Queries: joins, views, aggregations
├── SQL03.sql          # Advanced queries, views & stored procedure
├── SQL04.sql          # Triggers: audit, logging, validation, automation
├── SQL05.sql          # Custom function: CalculateNetSalary
├── hrms_project.sql   # Full MySQL dump (all-in-one import file)
└── README.md
```

---

## 🗄️ Database Schema

| Table | Description |
|---|---|
| `departments` | IT, HR, Finance, Sales, Marketing |
| `employees` | Employee personal & job info |
| `attendance` | Daily attendance records (Present / Absent / Leave) |
| `salary` | Basic salary, HRA, bonus, deduction per employee |
| `leave_requests` | Leave applications with approval status |
| `payroll` | Monthly net salary payment records |
| `salary_audit` | Auto-logged salary change history (via trigger) |
| `employee_log` | Auto-logged new employee insertions (via trigger) |

---

## ⚙️ Features

### 📋 SQL01 — Schema & Data
- Creates the `hrms` database and all 6 core tables
- Seeds 10 departments, employees, attendance records, salary entries, leave requests, and payroll data

### 🔍 SQL02 — Queries & Views
- Employee ↔ Department joins
- Attendance reports
- Salary breakdown and net salary calculation
- `net_salary_view` — reusable salary view
- Employees earning above ₹50,000
- Department-wise employee count
- Highest and average salary queries
- Approved leave requests
- Payroll report

### 📊 SQL03 — Advanced Queries, Views & Procedure
- Lowest salary employee
- Department with maximum employees
- Employees with no leave requests (LEFT JOIN)
- Top earner per department (correlated subquery)
- Attendance percentage per employee
- Three reusable views:
  - `employee_department_view`
  - `attendance_report_view`
  - `payroll_report_view`
- `AddEmployee` stored procedure for safe employee insertion

### ⚡ SQL04 — Triggers
| Trigger | Event | Purpose |
|---|---|---|
| `before_salary_update` | BEFORE UPDATE on `salary` | Logs old vs new salary to `salary_audit` |
| `after_employee_insert` | AFTER INSERT on `employees` | Logs new hire to `employee_log` |
| `check_salary` | BEFORE INSERT on `salary` | Prevents negative salary values |
| `after_salary_insert` | AFTER INSERT on `salary` | Auto-generates payroll record |

### 🧮 SQL05 — Custom Function
- `CalculateNetSalary(basic, hra, bonus, deduction)` — reusable scalar function returning net pay

---

## 🚀 Getting Started

### Prerequisites
- MySQL 8.0+
- MySQL Workbench or any MySQL client

### Import (Quickest Way)
Use the full dump file to set up everything in one step:
```sql
source hrms_project.sql;
```

### Step-by-Step Setup
Run the files in order:
```sql
source SQL01.sql;   -- Create schema & insert data
source SQL02.sql;   -- Run basic queries & create views
source SQL03.sql;   -- Advanced queries, views, procedure
source SQL04.sql;   -- Set up triggers
source SQL05.sql;   -- Create CalculateNetSalary function
```

---

## 🧪 Sample Queries

```sql
-- Net salary for all employees
SELECT * FROM net_salary_view;

-- Top earner
SELECT employee, net_salary FROM net_salary_view
WHERE net_salary = (SELECT MAX(net_salary) FROM net_salary_view);

-- Attendance percentage
SELECT employee_name, attendance_percentage
FROM attendance_report_view;

-- Add a new employee via procedure
CALL AddEmployee('Jane', 'Doe', 'jane@example.com', '9876500000', 'Female', '2025-07-01', 2);

-- Use custom function
SELECT CalculateNetSalary(50000, 10000, 5000, 2000) AS net_salary;
```

---

## 🛠️ Tech Stack
- **Database:** MySQL 8.0
- **Concepts Used:** DDL, DML, Joins, Subqueries, Aggregate Functions, Views, Stored Procedures, Triggers, User-Defined Functions

---

## 👤 Author

> Feel free to fork, star ⭐, and contribute!
