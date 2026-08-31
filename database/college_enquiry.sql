-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: college_enquiry
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','ACNJ_Admin_123','ACNJ University Administrator','admin@acnjuniversity.edu','2026-08-30 11:14:03');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admissions`
--

DROP TABLE IF EXISTS `admissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admissions` (
  `admission_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `admission_process` text,
  `required_documents` text,
  `selection_process` text,
  `application_start_date` date DEFAULT NULL,
  `application_end_date` date DEFAULT NULL,
  PRIMARY KEY (`admission_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `admissions_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admissions`
--

LOCK TABLES `admissions` WRITE;
/*!40000 ALTER TABLE `admissions` DISABLE KEYS */;
INSERT INTO `admissions` VALUES (1,1,'Applicants can apply through the university admission portal by completing the application form and submitting the required documents.','Class 10 certificate, Class 12 certificate, identity proof, passport-size photographs.','Admission based on eligibility and availability of seats.','2026-05-01','2026-07-31'),(2,2,'Applicants must complete the online application and fulfill the prescribed academic eligibility requirements.','Class 10 certificate, Class 12 certificate, identity proof, photographs and required academic documents.','Admission through merit and applicable university admission criteria.','2026-05-01','2026-07-15'),(3,3,'Eligible graduates can apply through the university admission portal.','Graduation certificate, marksheets, identity proof and photographs.','Admission based on eligibility and university admission criteria.','2026-05-01','2026-07-31'),(4,4,'Students can apply online through the university admission portal after completing 10+2.','Class 10 certificate, Class 12 certificate, identity proof and photographs.','Admission based on merit and availability of seats.','2026-05-01','2026-07-31'),(5,5,'Applicants can submit an online application after fulfilling the graduation requirement.','Graduation certificate, marksheets, identity proof and photographs.','Admission based on university eligibility criteria and applicable selection process.','2026-05-01','2026-07-31'),(6,6,'Students can apply through the online university admission portal.','Class 10 certificate, Class 12 certificate, identity proof and photographs.','Admission based on merit and availability of seats.','2026-05-01','2026-07-31'),(7,7,'Eligible students can apply online after completing 10+2 with Mathematics.','Class 10 certificate, Class 12 certificate, identity proof and photographs.','Admission based on merit and eligibility.','2026-05-01','2026-07-31'),(8,8,'Eligible students can apply online after completing 10+2 with the required subjects.','Class 10 certificate, Class 12 certificate, identity proof and photographs.','Admission based on merit and eligibility.','2026-05-01','2026-07-31'),(9,9,'Students can apply through the university admission portal after completing 10+2.','Class 10 certificate, Class 12 certificate, identity proof and photographs.','Admission based on merit and availability of seats.','2026-05-01','2026-07-31');
/*!40000 ALTER TABLE `admissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_history`
--

DROP TABLE IF EXISTS `chat_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_history` (
  `chat_id` int NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_history`
--

LOCK TABLES `chat_history` WRITE;
/*!40000 ALTER TABLE `chat_history` DISABLE KEYS */;
INSERT INTO `chat_history` VALUES (1,'SESSION001','What is the eligibility for BCA?','Candidates who have completed 10+2 or an equivalent examination from a recognized board are eligible for BCA.','2026-08-30 11:15:18'),(2,'SESSION002','Does ACNJ University provide hostel facilities?','Yes, ACNJ University provides hostel facilities for eligible students, subject to availability.','2026-08-30 11:15:18'),(3,'SESSION003','What is the duration of BCA?','The Bachelor of Computer Applications (BCA) program has a duration of 3 years.','2026-08-30 11:15:18');
/*!40000 ALTER TABLE `chat_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `department_id` int NOT NULL,
  `course_name` varchar(150) NOT NULL,
  `course_level` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `eligibility` text,
  `description` text,
  PRIMARY KEY (`course_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,1,'Bachelor of Computer Applications (BCA)','Undergraduate','3 Years','10+2 or equivalent examination from a recognized board.','An undergraduate program focusing on computer applications, programming, databases and software development.'),(2,1,'Bachelor of Technology in Computer Science and Engineering (B.Tech CSE)','Undergraduate','4 Years','10+2 with Physics and Mathematics along with other required subjects.','A technical undergraduate program covering computer science, programming, algorithms, networking and software engineering.'),(3,1,'Master of Computer Applications (MCA)','Postgraduate','2 Years','Bachelor degree with Mathematics/Computer Applications or equivalent qualification as per university requirements.','A postgraduate program focusing on advanced computing, software development, databases and information technology.'),(4,2,'Bachelor of Business Administration (BBA)','Undergraduate','3 Years','10+2 or equivalent examination from a recognized board.','An undergraduate management program covering business administration, marketing, finance and organizational management.'),(5,2,'Master of Business Administration (MBA)','Postgraduate','2 Years','Bachelor degree from a recognized university.','A postgraduate management program designed to develop leadership, managerial and strategic business skills.'),(6,3,'Bachelor of Commerce (B.Com)','Undergraduate','3 Years','10+2 or equivalent examination from a recognized board.','An undergraduate commerce program covering accounting, finance, taxation and business studies.'),(7,4,'Bachelor of Science in Mathematics (B.Sc Mathematics)','Undergraduate','3 Years','10+2 with Mathematics from a recognized board.','An undergraduate program focused on mathematical concepts, analytical reasoning and problem solving.'),(8,4,'Bachelor of Science in Physics (B.Sc Physics)','Undergraduate','3 Years','10+2 with Physics and Mathematics from a recognized board.','An undergraduate program covering fundamental and applied concepts of physics.'),(9,5,'Bachelor of Arts (B.A.)','Undergraduate','3 Years','10+2 or equivalent examination from a recognized board.','An undergraduate humanities program covering languages, social sciences and related subjects.');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) NOT NULL,
  `description` text,
  `hod_name` varchar(100) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Computer Science and Information Technology','Department focused on computer science, software development, information technology and emerging technologies.','Dr. Anil Sharma','csit@acnjuniversity.edu'),(2,'Department of Management Studies','Department offering education in business management, entrepreneurship and organizational studies.','Dr. Priya Mehta','management@acnjuniversity.edu'),(3,'Department of Commerce','Department focused on accounting, finance, taxation, business and commerce education.','Dr. Rajesh Verma','commerce@acnjuniversity.edu'),(4,'Department of Science','Department offering undergraduate education in mathematics, physics, chemistry and related sciences.','Dr. Sunita Rao','science@acnjuniversity.edu'),(5,'Department of Arts and Humanities','Department focused on languages, humanities, communication and social sciences.','Dr. Neha Kapoor','arts@acnjuniversity.edu');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `facility_id` int NOT NULL AUTO_INCREMENT,
  `facility_name` varchar(100) NOT NULL,
  `description` text,
  `availability` varchar(50) DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`facility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` VALUES (1,'Central Library','A central library providing textbooks, reference materials, journals and digital learning resources.','Available','Academic Block'),(2,'Computer Laboratories','Modern computer laboratories equipped for programming, practical sessions and academic projects.','Available','Computer Science Block'),(3,'University Hostel','Separate residential facilities with basic amenities for eligible students.','Available','Residential Campus'),(4,'Sports Complex','Facilities for indoor and outdoor sports and recreational activities.','Available','Sports Campus'),(5,'Cafeteria','On-campus cafeteria providing food and refreshments to students and staff.','Available','Main Campus'),(6,'Transportation','University transportation service covering selected routes around the city.','Available','Main Campus'),(7,'Wi-Fi Campus','Internet connectivity available across major academic and administrative areas.','Available','University Campus'),(8,'Science Laboratories','Laboratories supporting practical education in physics, chemistry and other science subjects.','Available','Science Block');
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `faq_id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`faq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'What courses does ACNJ University offer?','ACNJ University offers undergraduate and postgraduate programs in Computer Science, Management, Commerce, Science and Arts and Humanities.','Courses','2026-08-30 11:12:59','2026-08-30 11:12:59'),(2,'What is the duration of BCA?','The Bachelor of Computer Applications (BCA) program has a duration of 3 years.','Courses','2026-08-30 11:12:59','2026-08-30 11:12:59'),(3,'What is the eligibility for BCA?','Candidates who have completed 10+2 or an equivalent examination from a recognized board are eligible to apply for BCA.','Admissions','2026-08-30 11:12:59','2026-08-30 11:12:59'),(4,'How can I apply for admission?','Students can apply through the ACNJ University admission portal by completing the online application form and submitting the required documents.','Admissions','2026-08-30 11:12:59','2026-08-30 11:12:59'),(5,'What documents are required for admission?','Generally, applicants need their Class 10 and Class 12 certificates, identity proof and passport-size photographs. Additional documents may be required depending on the program.','Admissions','2026-08-30 11:12:59','2026-08-30 11:12:59'),(6,'Does ACNJ University provide hostel facilities?','Yes, ACNJ University provides hostel facilities for eligible students, subject to availability.','Facilities','2026-08-30 11:12:59','2026-08-30 11:12:59'),(7,'Does the university have a library?','Yes, ACNJ University has a central library with textbooks, reference materials, journals and digital learning resources.','Facilities','2026-08-30 11:12:59','2026-08-30 11:12:59'),(8,'Does ACNJ University provide transportation?','Yes, university transportation is available on selected routes.','Facilities','2026-08-30 11:12:59','2026-08-30 11:12:59'),(9,'Is Wi-Fi available on campus?','Yes, Wi-Fi connectivity is available across major academic and administrative areas of the campus.','Facilities','2026-08-30 11:12:59','2026-08-30 11:12:59'),(10,'How can I contact ACNJ University?','Students can contact the university through the official contact channels provided on the university website.','General','2026-08-30 11:12:59','2026-08-30 11:12:59'),(11,'What is the duration of MBA?','The Master of Business Administration (MBA) program has a duration of 2 years.','Courses','2026-08-30 11:12:59','2026-08-30 11:12:59'),(12,'What is the duration of B.Com?','The Bachelor of Commerce (B.Com) program has a duration of 3 years.','Courses','2026-08-30 11:12:59','2026-08-30 11:12:59'),(13,'Does ACNJ University have computer laboratories?','Yes, the university has computer laboratories equipped for programming, practical sessions and academic projects.','Facilities','2026-08-30 11:12:59','2026-08-30 11:12:59'),(14,'When does the admission application period begin?','For the 2026-27 academic session, the admission application period begins in May 2026 for the listed programs.','Admissions','2026-08-30 11:12:59','2026-08-30 11:12:59'),(15,'Can I ask the chatbot questions about courses?','Yes, the chatbot can answer questions about courses, eligibility, fees, admissions, departments, facilities and other university-related information.','Chatbot','2026-08-30 11:12:59','2026-08-30 11:12:59');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `chat_id` int NOT NULL,
  `rating` varchar(20) DEFAULT NULL,
  `comment` text,
  `submitted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`feedback_id`),
  KEY `chat_id` (`chat_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`chat_id`) REFERENCES `chat_history` (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,1,'Helpful','The answer was clear and useful.','2026-08-30 11:16:30'),(2,2,'Helpful','I got the information I needed.','2026-08-30 11:16:30'),(3,3,'Very Helpful','The chatbot provided a quick answer.','2026-08-30 11:16:30');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees` (
  `fee_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `tuition_fee` decimal(10,2) DEFAULT NULL,
  `admission_fee` decimal(10,2) DEFAULT NULL,
  `examination_fee` decimal(10,2) DEFAULT NULL,
  `other_fee` decimal(10,2) DEFAULT NULL,
  `academic_year` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fee_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` VALUES (1,1,60000.00,5000.00,3000.00,2000.00,'2026-27'),(2,2,110000.00,7500.00,4000.00,3000.00,'2026-27'),(3,3,80000.00,6000.00,4000.00,2500.00,'2026-27'),(4,4,55000.00,5000.00,3000.00,2000.00,'2026-27'),(5,5,95000.00,7000.00,4000.00,3000.00,'2026-27'),(6,6,45000.00,4500.00,2500.00,1500.00,'2026-27'),(7,7,40000.00,4000.00,2500.00,1500.00,'2026-27'),(8,8,45000.00,4000.00,2500.00,1500.00,'2026-27'),(9,9,40000.00,4000.00,2500.00,1500.00,'2026-27');
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university_info`
--

DROP TABLE IF EXISTS `university_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `university_info` (
  `university_id` int NOT NULL AUTO_INCREMENT,
  `university_name` varchar(150) NOT NULL,
  `description` text,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `established_year` year DEFAULT NULL,
  PRIMARY KEY (`university_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university_info`
--

LOCK TABLES `university_info` WRITE;
/*!40000 ALTER TABLE `university_info` DISABLE KEYS */;
INSERT INTO `university_info` VALUES (1,'ACNJ University','ACNJ University is an institution for providing best education.','Raipur, Chhattisgarh, India','+91-8986531127','info@acnjuniversity.edu','www.acnjuniversity.edu',2010);
/*!40000 ALTER TABLE `university_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-31 21:19:53
