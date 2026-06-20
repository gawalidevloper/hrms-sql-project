-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hrms
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendance_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `attendance_date` date DEFAULT NULL,
  `status` enum('PRESENT','ABSENT','LEAVE') DEFAULT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,1,'2025-06-01','PRESENT'),(2,2,'2025-06-01','PRESENT'),(3,3,'2025-06-01','ABSENT'),(4,4,'2025-06-01','LEAVE'),(5,5,'2025-06-01','PRESENT'),(6,6,'2025-06-01','PRESENT'),(7,7,'2025-06-01','ABSENT'),(8,8,'2025-06-01','PRESENT'),(9,9,'2025-06-01','LEAVE'),(10,10,'2025-06-01','PRESENT'),(11,1,'2025-06-02','PRESENT'),(12,2,'2025-06-02','ABSENT'),(13,3,'2025-06-02','PRESENT'),(14,4,'2025-06-02','PRESENT'),(15,5,'2025-06-02','LEAVE'),(16,6,'2025-06-02','PRESENT'),(17,7,'2025-06-02','PRESENT'),(18,8,'2025-06-02','ABSENT'),(19,9,'2025-06-02','PRESENT'),(20,10,'2025-06-02','PRESENT'),(21,1,'2025-06-03','LEAVE'),(22,2,'2025-06-03','PRESENT'),(23,3,'2025-06-03','PRESENT'),(24,4,'2025-06-03','ABSENT'),(25,5,'2025-06-03','PRESENT'),(26,6,'2025-06-03','PRESENT'),(27,7,'2025-06-03','LEAVE'),(28,8,'2025-06-03','PRESENT'),(29,9,'2025-06-03','PRESENT'),(30,10,'2025-06-03','ABSENT');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `attendance_report_view`
--

DROP TABLE IF EXISTS `attendance_report_view`;
/*!50001 DROP VIEW IF EXISTS `attendance_report_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `attendance_report_view` AS SELECT 
 1 AS `employee_name`,
 1 AS `department_name`,
 1 AS `attendance_date`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'IT'),(2,'HR'),(3,'FINANCE'),(4,'SALES'),(5,'MARKETING');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employee_department_view`
--

DROP TABLE IF EXISTS `employee_department_view`;
/*!50001 DROP VIEW IF EXISTS `employee_department_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_department_view` AS SELECT 
 1 AS `employee_id`,
 1 AS `employee_name`,
 1 AS `department_name`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `hire_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee_log`
--

DROP TABLE IF EXISTS `employee_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `action_performed` varchar(20) DEFAULT NULL,
  `action_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_log`
--

LOCK TABLES `employee_log` WRITE;
/*!40000 ALTER TABLE `employee_log` DISABLE KEYS */;
INSERT INTO `employee_log` VALUES (1,12,'INSERT','2026-06-20 18:52:07');
/*!40000 ALTER TABLE `employee_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `gender` enum('MALE','FEMALE') DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'John','Smith','john.smith@example.com','9876543210','MALE','2021-03-15',1),(2,'Emma','Johnson','emma.johnson@example.com','9876543211','FEMALE','2020-07-22',2),(3,'Michael','Brown','michael.brown@example.com','9876543212','MALE','2019-11-10',3),(4,'Sophia','Davis','sophia.davis@example.com','9876543213','FEMALE','2022-01-05',1),(5,'William','Miller','william.miller@example.com','9876543214','MALE','2018-09-18',4),(6,'Olivia','Wilson','olivia.wilson@example.com','9876543215','FEMALE','2023-05-30',2),(7,'James','Moore','james.moore@example.com','9876543216','MALE','2020-12-14',5),(8,'Ava','Taylor','ava.taylor@example.com','9876543217','FEMALE','2021-08-25',3),(9,'Benjamin','Anderson','ben.anderson@example.com','9876543218','MALE','2019-06-12',4),(10,'Mia','Thomas','mia.thomas@example.com','9876543219','FEMALE','2022-10-08',5),(11,'Virat','Kohli','virat@gmail.com','9876543210','MALE','2025-07-01',1),(12,'Sachin','Tendulkar','sachin@gmail.com','9999999999','MALE','2025-07-01',1);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_requests`
--

DROP TABLE IF EXISTS `leave_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_requests` (
  `leave_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `leave_type` varchar(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT NULL,
  PRIMARY KEY (`leave_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `leave_requests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_requests`
--

LOCK TABLES `leave_requests` WRITE;
/*!40000 ALTER TABLE `leave_requests` DISABLE KEYS */;
INSERT INTO `leave_requests` VALUES (1,1,'Sick Leave','2025-06-10','2025-06-12','Approved'),(2,2,'Casual Leave','2025-06-15','2025-06-16','Pending'),(3,3,'Vacation','2025-07-01','2025-07-05','Approved'),(4,4,'Sick Leave','2025-06-20','2025-06-21','Rejected'),(5,5,'Casual Leave','2025-06-25','2025-06-25','Approved'),(6,6,'Vacation','2025-08-10','2025-08-15','Pending'),(7,7,'Emergency Leave','2025-06-18','2025-06-19','Approved'),(8,8,'Sick Leave','2025-06-22','2025-06-24','Approved'),(9,9,'Vacation','2025-09-01','2025-09-10','Pending'),(10,10,'Casual Leave','2025-06-28','2025-06-29','Rejected'),(11,1,'Vacation','2025-12-20','2025-12-25','Pending'),(12,3,'Casual Leave','2025-07-15','2025-07-16','Approved'),(13,5,'Sick Leave','2025-06-30','2025-07-02','Approved'),(14,7,'Vacation','2025-10-05','2025-10-12','Pending'),(15,9,'Emergency Leave','2025-06-17','2025-06-18','Rejected');
/*!40000 ALTER TABLE `leave_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `net_salary_view`
--

DROP TABLE IF EXISTS `net_salary_view`;
/*!50001 DROP VIEW IF EXISTS `net_salary_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `net_salary_view` AS SELECT 
 1 AS `employee_id`,
 1 AS `employee`,
 1 AS `net_salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll` (
  `payroll_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `pay_month` varchar(20) DEFAULT NULL,
  `net_salary` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`payroll_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
INSERT INTO `payroll` VALUES (1,1,'January 2025',63000.00,'2025-01-31'),(2,2,'January 2025',75500.00,'2025-01-31'),(3,3,'January 2025',68700.00,'2025-01-31'),(4,4,'January 2025',89000.00,'2025-01-31'),(5,5,'January 2025',56500.00,'2025-01-31'),(6,6,'January 2025',82200.00,'2025-01-31'),(7,7,'January 2025',65300.00,'2025-01-31'),(8,8,'January 2025',72900.00,'2025-01-31'),(9,9,'January 2025',95500.00,'2025-01-31'),(10,10,'January 2025',60100.00,'2025-01-31'),(11,1,'February 2025',63500.00,'2025-02-28'),(12,2,'February 2025',76000.00,'2025-02-28'),(13,3,'February 2025',69000.00,'2025-02-28'),(14,4,'February 2025',89500.00,'2025-02-28'),(15,5,'February 2025',57000.00,'2025-02-28'),(16,5,'June 2026',79000.00,'2026-06-21');
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `payroll_report_view`
--

DROP TABLE IF EXISTS `payroll_report_view`;
/*!50001 DROP VIEW IF EXISTS `payroll_report_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `payroll_report_view` AS SELECT 
 1 AS `employee_name`,
 1 AS `department_name`,
 1 AS `basic_salary`,
 1 AS `hra`,
 1 AS `bonus`,
 1 AS `deduction`,
 1 AS `net_salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `salary_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `basic_salary` decimal(10,2) DEFAULT NULL,
  `hra` decimal(10,2) DEFAULT NULL,
  `bonus` decimal(10,2) DEFAULT NULL,
  `deduction` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`salary_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,1,65000.00,10000.00,5000.00,2000.00),(2,2,60000.00,12000.00,6000.00,2500.00),(3,3,55000.00,11000.00,4500.00,1800.00),(4,4,70000.00,14000.00,8000.00,3000.00),(5,5,45000.00,9000.00,4000.00,1500.00),(6,6,65000.00,13000.00,7000.00,2800.00),(7,7,52000.00,10400.00,4800.00,1900.00),(8,8,58000.00,11600.00,5500.00,2200.00),(9,9,75000.00,15000.00,9000.00,3500.00),(10,10,48000.00,9600.00,4200.00,1700.00),(11,5,70000.00,7000.00,3000.00,1000.00);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_audit`
--

DROP TABLE IF EXISTS `salary_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_audit` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `old_salary` decimal(10,2) DEFAULT NULL,
  `new_salary` decimal(10,2) DEFAULT NULL,
  `change_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_audit`
--

LOCK TABLES `salary_audit` WRITE;
/*!40000 ALTER TABLE `salary_audit` DISABLE KEYS */;
INSERT INTO `salary_audit` VALUES (1,1,50000.00,65000.00,'2026-06-20 18:51:33');
/*!40000 ALTER TABLE `salary_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `attendance_report_view`
--

/*!50001 DROP VIEW IF EXISTS `attendance_report_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `attendance_report_view` AS select concat(`e`.`first_name`,' ',`e`.`last_name`) AS `employee_name`,`d`.`department_name` AS `department_name`,`a`.`attendance_date` AS `attendance_date`,`a`.`status` AS `status` from ((`employees` `e` join `attendance` `a` on((`e`.`employee_id` = `a`.`employee_id`))) join `departments` `d` on((`e`.`department_id` = `d`.`department_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_department_view`
--

/*!50001 DROP VIEW IF EXISTS `employee_department_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_department_view` AS select `e`.`employee_id` AS `employee_id`,concat(`e`.`first_name`,' ',`e`.`last_name`) AS `employee_name`,`d`.`department_name` AS `department_name`,`e`.`email` AS `email`,`e`.`phone` AS `phone`,`e`.`hire_date` AS `hire_date` from (`employees` `e` join `departments` `d` on((`e`.`department_id` = `d`.`department_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `net_salary_view`
--

/*!50001 DROP VIEW IF EXISTS `net_salary_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `net_salary_view` AS select `employees`.`employee_id` AS `employee_id`,concat(`employees`.`first_name`,' ',`employees`.`last_name`) AS `employee`,(((`salary`.`basic_salary` + `salary`.`hra`) + `salary`.`bonus`) - `salary`.`deduction`) AS `net_salary` from (`employees` join `salary` on((`employees`.`employee_id` = `salary`.`employee_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `payroll_report_view`
--

/*!50001 DROP VIEW IF EXISTS `payroll_report_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `payroll_report_view` AS select concat(`e`.`first_name`,' ',`e`.`last_name`) AS `employee_name`,`d`.`department_name` AS `department_name`,`s`.`basic_salary` AS `basic_salary`,`s`.`hra` AS `hra`,`s`.`bonus` AS `bonus`,`s`.`deduction` AS `deduction`,(((`s`.`basic_salary` + `s`.`hra`) + `s`.`bonus`) - `s`.`deduction`) AS `net_salary` from ((`employees` `e` join `salary` `s` on((`e`.`employee_id` = `s`.`employee_id`))) join `departments` `d` on((`e`.`department_id` = `d`.`department_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-21  0:44:03
