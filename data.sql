-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: engdb
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('U001'),('U002'),('U003'),('U004'),('U005'),('U01');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_date` datetime NOT NULL,
  `status` enum('UNPAID','PAID') NOT NULL,
  `enrollment_id` int NOT NULL,
  `cashier_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enrollment_id` (`enrollment_id`),
  KEY `cashier_id` (`cashier_id`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment` (`id`),
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`cashier_id`) REFERENCES `cashier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,'2023-10-27 08:30:00','PAID',1,'U03'),(2,'2023-10-28 09:00:00','UNPAID',2,'U03'),(3,'2025-05-27 16:25:02','PAID',2,'U021'),(4,'2025-08-01 04:55:11','UNPAID',4,'U029'),(5,'2025-07-28 10:03:43','UNPAID',11,'U023'),(6,'2025-07-17 18:18:38','PAID',12,'U030'),(7,'2025-09-27 22:14:58','UNPAID',13,'U021'),(8,'2024-12-06 20:22:24','PAID',14,'U028'),(9,'2025-04-10 20:50:37','PAID',19,'U022'),(10,'2025-04-08 18:20:44','PAID',23,'U022'),(11,'2025-09-20 05:30:59','PAID',26,'U027'),(12,'2025-09-27 19:41:13','PAID',28,'U026'),(13,'2025-02-13 14:25:19','PAID',29,'U024'),(14,'2025-08-25 06:51:18','PAID',30,'U022'),(15,'2025-08-02 22:20:42','PAID',33,'U028'),(16,'2024-12-09 02:19:20','PAID',39,'U023'),(17,'2025-02-10 08:57:46','PAID',42,'U022'),(18,'2025-05-15 17:21:31','PAID',43,'U029'),(19,'2025-02-17 05:25:49','PAID',48,'U027'),(20,'2025-06-14 18:50:32','PAID',49,'U024'),(21,'2025-08-17 12:55:12','PAID',53,'U027'),(22,'2025-02-15 23:34:52','PAID',61,'U026'),(23,'2025-10-12 07:03:34','PAID',65,'U023'),(24,'2024-11-28 08:37:29','PAID',68,'U029'),(25,'2025-01-20 07:19:47','PAID',70,'U030'),(26,'2025-02-25 12:30:22','PAID',71,'U024'),(27,'2025-05-20 20:23:56','PAID',72,'U021'),(28,'2025-05-27 21:05:28','PAID',77,'U026'),(29,'2024-12-31 03:12:51','PAID',79,'U022'),(30,'2025-07-18 07:26:28','PAID',85,'U030'),(31,'2025-03-12 20:20:10','PAID',87,'U029'),(32,'2025-10-16 06:39:03','PAID',90,'U021'),(33,'2025-08-04 15:56:16','PAID',91,'U026'),(34,'2025-03-18 06:23:43','PAID',95,'U024'),(35,'2025-04-26 22:37:59','PAID',99,'U029'),(36,'2025-04-02 10:08:25','PAID',100,'U022'),(37,'2025-09-08 06:00:53','PAID',103,'U029'),(38,'2025-09-01 12:09:21','UNPAID',104,'U021'),(39,'2025-11-24 13:00:12','UNPAID',105,'U027'),(40,'2025-08-10 14:46:26','PAID',109,'U023'),(41,'2025-11-09 02:24:34','PAID',115,'U021'),(42,'2025-08-30 03:03:22','UNPAID',118,'U029'),(43,'2025-03-21 03:44:59','PAID',119,'U027'),(44,'2025-11-01 08:06:37','PAID',125,'U022'),(45,'2025-08-13 04:03:01','PAID',127,'U029'),(46,'2024-12-30 01:47:36','PAID',129,'U022'),(47,'2025-07-22 04:45:12','PAID',130,'U030'),(48,'2025-01-12 23:31:15','PAID',132,'U028'),(49,'2025-10-12 15:56:53','PAID',134,'U027'),(50,'2025-06-06 09:28:17','PAID',135,'U021'),(51,'2025-04-18 13:10:35','PAID',137,'U021'),(52,'2025-07-21 13:06:45','PAID',138,'U023'),(53,'2025-07-24 22:43:54','PAID',139,'U025'),(54,'2025-08-06 15:36:44','PAID',142,'U027'),(55,'2024-12-29 22:46:31','UNPAID',143,'U029'),(56,'2025-02-22 23:53:16','PAID',148,'U024'),(57,'2025-10-26 02:18:26','UNPAID',151,'U025'),(58,'2025-01-17 11:43:49','PAID',153,'U026'),(59,'2025-05-03 14:42:51','PAID',154,'U030'),(60,'2025-11-18 11:37:42','UNPAID',162,'U021'),(61,'2025-11-02 05:00:03','PAID',169,'U026'),(62,'2025-02-26 20:50:47','PAID',170,'U029'),(63,'2025-10-24 09:50:46','PAID',171,'U027'),(64,'2024-12-02 13:23:42','PAID',180,'U027'),(65,'2025-06-01 23:00:29','UNPAID',182,'U024'),(66,'2025-03-15 12:09:35','PAID',183,'U023'),(67,'2025-01-20 13:11:11','PAID',184,'U030');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashier`
--

DROP TABLE IF EXISTS `cashier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashier` (
  `id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `cashier_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashier`
--

LOCK TABLES `cashier` WRITE;
/*!40000 ALTER TABLE `cashier` DISABLE KEYS */;
INSERT INTO `cashier` VALUES ('U021'),('U022'),('U023'),('U024'),('U025'),('U026'),('U027'),('U028'),('U029'),('U03'),('U030');
/*!40000 ALTER TABLE `cashier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classroom` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `max_student` int NOT NULL,
  `teacher_id` varchar(10) NOT NULL,
  `course_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `classroom_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `classroom_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` VALUES ('CL001','Lớp C008-1','2025-11-21','2026-02-19',15,'U014','C008'),('CL002','Lớp C004-2','2025-09-03','2025-12-02',21,'U007','C004'),('CL003','Lớp C011-3','2025-03-25','2025-06-23',24,'U012','C011'),('CL004','Lớp C018-4','2024-12-29','2025-03-29',17,'U006','C018'),('CL005','Lớp C006-5','2025-10-06','2026-01-04',12,'U016','C006'),('CL006','Lớp C007-6','2025-07-10','2025-10-08',20,'U010','C007'),('CL007','Lớp C001-7','2025-10-27','2026-01-25',27,'U018','C001'),('CL008','Lớp C015-8','2025-04-25','2025-07-24',12,'U018','C015'),('CL009','Lớp C002-9','2025-08-26','2025-11-24',24,'U012','C002'),('CL01','KIDS-K01','2023-11-01','2024-01-30',15,'U02','C01'),('CL010','Lớp C018-10','2025-01-12','2025-04-12',18,'U014','C018'),('CL011','Lớp C003-11','2025-09-19','2025-12-18',21,'U011','C003'),('CL012','Lớp C013-12','2025-11-05','2026-02-03',14,'U009','C013'),('CL013','Lớp C012-13','2025-07-05','2025-10-03',15,'U008','C012'),('CL014','Lớp C004-14','2025-11-24','2026-02-22',15,'U007','C004'),('CL015','Lớp C013-15','2025-11-19','2026-02-17',10,'U009','C013'),('CL016','Lớp C006-16','2025-11-17','2026-02-15',15,'U006','C006'),('CL017','Lớp C001-17','2025-07-19','2025-10-17',16,'U014','C001'),('CL018','Lớp C017-18','2025-06-18','2025-09-16',15,'U012','C017'),('CL019','Lớp C010-19','2025-10-25','2026-01-23',12,'U019','C010'),('CL02','IELTS-A01','2023-11-05','2024-02-05',20,'U02','C02'),('CL020','Lớp C006-20','2025-11-01','2026-01-30',25,'U012','C006'),('CL021','Lớp C014-21','2025-02-08','2025-05-09',23,'U016','C014'),('CL022','Lớp C006-22','2025-03-11','2025-06-09',26,'U011','C006'),('CL023','Lớp C020-23','2025-03-18','2025-06-16',29,'U017','C020'),('CL024','Lớp C012-24','2025-01-24','2025-04-24',20,'U016','C012'),('CL025','Lớp C010-25','2025-11-11','2026-02-09',26,'U017','C010'),('CL026','Lớp C012-26','2025-02-03','2025-05-04',24,'U015','C012'),('CL027','Lớp C017-27','2025-07-11','2025-10-09',20,'U017','C017'),('CL028','Lớp C006-28','2025-02-19','2025-05-20',24,'U006','C006'),('CL029','Lớp C019-29','2025-01-16','2025-04-16',30,'U019','C019'),('CL030','Lớp C016-30','2025-01-13','2025-04-13',14,'U011','C016'),('CL031','Lớp C019-31','2025-10-30','2026-01-28',11,'U013','C019'),('CL032','Lớp C016-32','2025-02-20','2025-05-21',30,'U008','C016'),('CL033','Lớp C013-33','2025-03-04','2025-06-02',27,'U013','C013'),('CL034','Lớp C004-34','2025-06-04','2025-09-02',30,'U016','C004'),('CL035','Lớp C020-35','2025-09-26','2025-12-25',28,'U008','C020'),('CL036','Lớp C004-36','2025-03-21','2025-06-19',20,'U020','C004'),('CL037','Lớp C017-37','2025-01-19','2025-04-19',10,'U006','C017'),('CL038','Lớp C013-38','2025-09-05','2025-12-04',24,'U018','C013'),('CL039','Lớp C017-39','2025-07-21','2025-10-19',21,'U016','C017'),('CL040','Lớp C018-40','2025-03-09','2025-06-07',15,'U020','C018'),('CL041','Lớp C016-41','2025-02-11','2025-05-12',14,'U018','C016'),('CL042','Lớp C019-42','2024-12-24','2025-03-24',27,'U009','C019'),('CL043','Lớp C016-43','2025-01-15','2025-04-15',18,'U009','C016'),('CL044','Lớp C015-44','2025-11-07','2026-02-05',24,'U015','C015'),('CL045','Lớp C017-45','2025-10-17','2026-01-15',13,'U017','C017'),('CL046','Lớp C009-46','2025-08-08','2025-11-06',30,'U017','C009'),('CL047','Lớp C011-47','2025-05-01','2025-07-30',16,'U008','C011'),('CL048','Lớp C001-48','2025-02-02','2025-05-03',20,'U009','C001'),('CL049','Lớp C005-49','2025-02-09','2025-05-10',25,'U011','C005'),('CL050','Lớp C005-50','2025-10-28','2026-01-26',23,'U018','C005');
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `age` enum('KIDS','TEEN','ADULT') NOT NULL,
  `level` enum('BEGINNER','INTERMEDIATE','ADVANCED') NOT NULL,
  `duration_hour` varchar(10) NOT NULL,
  `course_description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('C001','IELTS Intensive - Level 1',5000000.00,'KIDS','ADVANCED','48','Khóa học chất lượng cao'),('C002','IELTS Foundation - Level 2',5000000.00,'ADULT','INTERMEDIATE','24','Khóa học chất lượng cao'),('C003','IELTS Foundation - Level 3',3000000.00,'TEEN','BEGINNER','24','Khóa học chất lượng cao'),('C004','Tiếng Anh Trẻ Em - Level 4',1000000.00,'KIDS','BEGINNER','72','Khóa học chất lượng cao'),('C005','Tiếng Anh Trẻ Em - Level 5',1000000.00,'KIDS','INTERMEDIATE','36','Khóa học chất lượng cao'),('C006','IELTS Intensive - Level 6',1000000.00,'ADULT','ADVANCED','72','Khóa học chất lượng cao'),('C007','IELTS Foundation - Level 7',1000000.00,'ADULT','INTERMEDIATE','24','Khóa học chất lượng cao'),('C008','TOEIC Basic - Level 8',3000000.00,'TEEN','INTERMEDIATE','36','Khóa học chất lượng cao'),('C009','TOEIC Basic - Level 9',2500000.00,'TEEN','INTERMEDIATE','72','Khóa học chất lượng cao'),('C01','English for Kids',1500000.00,'KIDS','BEGINNER','24','Tiếng Anh vỡ lòng'),('C010','Tiếng Anh Trẻ Em - Level 10',2500000.00,'KIDS','ADVANCED','24','Khóa học chất lượng cao'),('C011','Business English - Level 11',2500000.00,'TEEN','ADVANCED','48','Khóa học chất lượng cao'),('C012','Tiếng Anh Giao Tiếp - Level 12',5000000.00,'KIDS','INTERMEDIATE','24','Khóa học chất lượng cao'),('C013','English for IT - Level 13',2500000.00,'KIDS','ADVANCED','72','Khóa học chất lượng cao'),('C014','Tiếng Anh Trẻ Em - Level 14',2500000.00,'TEEN','INTERMEDIATE','36','Khóa học chất lượng cao'),('C015','Business English - Level 15',2500000.00,'KIDS','ADVANCED','36','Khóa học chất lượng cao'),('C016','IELTS Intensive - Level 16',1000000.00,'KIDS','INTERMEDIATE','72','Khóa học chất lượng cao'),('C017','IELTS Intensive - Level 17',5000000.00,'TEEN','ADVANCED','72','Khóa học chất lượng cao'),('C018','Tiếng Anh Trẻ Em - Level 18',3000000.00,'ADULT','ADVANCED','72','Khóa học chất lượng cao'),('C019','IELTS Foundation - Level 19',3000000.00,'KIDS','BEGINNER','48','Khóa học chất lượng cao'),('C02','IELTS Intensive',5000000.00,'ADULT','ADVANCED','48','Luyện thi cấp tốc'),('C020','Tiếng Anh Giao Tiếp - Level 20',5000000.00,'TEEN','INTERMEDIATE','36','Khóa học chất lượng cao');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `register_date` date NOT NULL,
  `status` enum('PENDING','APPROVED','REJECTED') NOT NULL,
  `student_id` varchar(10) NOT NULL,
  `class_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classroom` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,'2023-10-25','APPROVED','U04','CL01'),(2,'2023-10-26','PENDING','U05','CL01'),(3,'2025-07-10','PENDING','U031','CL048'),(4,'2024-11-30','APPROVED','U031','CL003'),(5,'2025-04-09','REJECTED','U032','CL039'),(6,'2025-06-20','APPROVED','U033','CL042'),(7,'2025-08-06','REJECTED','U034','CL032'),(8,'2025-05-29','PENDING','U034','CL042'),(9,'2025-08-14','REJECTED','U035','CL042'),(10,'2025-01-12','PENDING','U036','CL049'),(11,'2025-09-13','PENDING','U036','CL046'),(12,'2025-10-06','REJECTED','U037','CL044'),(13,'2025-09-07','APPROVED','U037','CL032'),(14,'2025-03-09','APPROVED','U038','CL008'),(15,'2024-12-25','APPROVED','U038','CL021'),(16,'2025-11-07','APPROVED','U039','CL017'),(17,'2025-08-30','REJECTED','U039','CL023'),(18,'2025-08-22','REJECTED','U040','CL037'),(19,'2025-07-21','PENDING','U040','CL031'),(20,'2025-10-21','REJECTED','U041','CL011'),(21,'2025-08-19','APPROVED','U041','CL037'),(22,'2025-10-26','PENDING','U042','CL050'),(23,'2025-03-12','REJECTED','U042','CL031'),(24,'2025-09-27','PENDING','U043','CL013'),(25,'2025-07-14','APPROVED','U043','CL043'),(26,'2025-09-06','PENDING','U044','CL030'),(27,'2025-02-17','PENDING','U044','CL018'),(28,'2024-11-25','APPROVED','U045','CL027'),(29,'2025-11-06','PENDING','U046','CL050'),(30,'2025-01-18','APPROVED','U047','CL014'),(31,'2025-10-09','APPROVED','U047','CL045'),(32,'2025-02-12','APPROVED','U048','CL048'),(33,'2025-09-07','PENDING','U049','CL027'),(34,'2025-07-06','PENDING','U050','CL008'),(35,'2025-08-13','APPROVED','U051','CL028'),(36,'2024-11-25','REJECTED','U052','CL006'),(37,'2025-05-05','PENDING','U053','CL024'),(38,'2025-01-12','PENDING','U053','CL035'),(39,'2025-01-19','PENDING','U054','CL030'),(40,'2025-05-31','PENDING','U055','CL023'),(41,'2025-06-21','APPROVED','U055','CL050'),(42,'2024-12-09','REJECTED','U056','CL029'),(43,'2025-06-07','PENDING','U057','CL008'),(44,'2025-03-27','APPROVED','U058','CL007'),(45,'2025-02-17','APPROVED','U059','CL026'),(46,'2025-08-11','REJECTED','U060','CL005'),(47,'2025-01-30','PENDING','U060','CL013'),(48,'2025-05-20','PENDING','U061','CL037'),(49,'2025-03-26','PENDING','U061','CL032'),(50,'2025-08-08','APPROVED','U062','CL050'),(51,'2025-11-01','APPROVED','U063','CL006'),(52,'2025-05-14','REJECTED','U063','CL026'),(53,'2025-02-21','REJECTED','U064','CL015'),(54,'2025-11-24','PENDING','U064','CL017'),(55,'2025-08-03','APPROVED','U065','CL023'),(56,'2025-07-29','REJECTED','U066','CL042'),(57,'2025-09-05','PENDING','U067','CL005'),(58,'2025-03-10','PENDING','U067','CL038'),(59,'2025-08-13','REJECTED','U068','CL010'),(60,'2025-08-25','REJECTED','U068','CL049'),(61,'2025-02-05','PENDING','U069','CL033'),(62,'2025-01-01','PENDING','U069','CL023'),(63,'2025-04-08','APPROVED','U070','CL007'),(64,'2025-06-02','REJECTED','U071','CL025'),(65,'2025-03-09','REJECTED','U072','CL019'),(66,'2025-04-09','REJECTED','U073','CL020'),(67,'2025-06-21','APPROVED','U073','CL041'),(68,'2025-07-10','PENDING','U074','CL001'),(69,'2025-03-13','REJECTED','U075','CL045'),(70,'2025-02-16','APPROVED','U075','CL004'),(71,'2025-03-14','PENDING','U076','CL050'),(72,'2025-06-26','APPROVED','U077','CL025'),(73,'2025-04-25','APPROVED','U078','CL010'),(74,'2024-12-19','APPROVED','U078','CL013'),(75,'2025-01-31','PENDING','U079','CL047'),(76,'2025-04-18','PENDING','U080','CL005'),(77,'2025-01-07','REJECTED','U080','CL019'),(78,'2025-07-11','REJECTED','U081','CL005'),(79,'2025-11-11','APPROVED','U082','CL043'),(80,'2025-08-04','REJECTED','U083','CL003'),(81,'2024-12-30','APPROVED','U083','CL005'),(82,'2025-06-12','REJECTED','U084','CL009'),(83,'2025-10-21','REJECTED','U084','CL022'),(84,'2025-01-16','REJECTED','U085','CL018'),(85,'2025-08-28','PENDING','U085','CL043'),(86,'2025-10-27','PENDING','U086','CL050'),(87,'2025-11-15','APPROVED','U086','CL027'),(88,'2025-11-14','PENDING','U087','CL039'),(89,'2025-05-21','APPROVED','U088','CL018'),(90,'2025-01-18','REJECTED','U088','CL040'),(91,'2025-05-07','PENDING','U089','CL045'),(92,'2025-03-05','APPROVED','U090','CL033'),(93,'2025-11-07','APPROVED','U091','CL030'),(94,'2025-09-04','PENDING','U092','CL023'),(95,'2025-06-20','REJECTED','U092','CL012'),(96,'2025-02-07','PENDING','U093','CL039'),(97,'2025-09-15','APPROVED','U093','CL019'),(98,'2025-09-27','REJECTED','U094','CL025'),(99,'2025-01-31','PENDING','U095','CL019'),(100,'2025-09-07','REJECTED','U096','CL012'),(101,'2024-12-20','APPROVED','U096','CL007'),(102,'2025-03-06','APPROVED','U097','CL030'),(103,'2025-05-14','PENDING','U098','CL011'),(104,'2025-03-31','REJECTED','U099','CL015'),(105,'2025-04-19','APPROVED','U099','CL049'),(106,'2025-06-10','APPROVED','U100','CL005'),(107,'2024-12-13','APPROVED','U100','CL046'),(108,'2025-04-06','PENDING','U101','CL046'),(109,'2025-10-13','REJECTED','U101','CL026'),(110,'2025-10-24','PENDING','U102','CL033'),(111,'2025-04-24','APPROVED','U102','CL020'),(112,'2025-09-05','PENDING','U103','CL001'),(113,'2025-08-31','PENDING','U104','CL047'),(114,'2025-04-22','PENDING','U104','CL046'),(115,'2025-06-25','REJECTED','U105','CL010'),(116,'2025-01-11','PENDING','U105','CL011'),(117,'2025-09-19','APPROVED','U106','CL028'),(118,'2025-08-26','REJECTED','U106','CL029'),(119,'2025-08-27','PENDING','U107','CL033'),(120,'2025-06-22','APPROVED','U108','CL008'),(121,'2025-07-03','APPROVED','U109','CL028'),(122,'2025-01-22','PENDING','U109','CL008'),(123,'2025-08-05','PENDING','U110','CL014'),(124,'2024-12-07','REJECTED','U110','CL048'),(125,'2025-03-22','REJECTED','U111','CL015'),(126,'2025-07-21','PENDING','U111','CL032'),(127,'2025-05-15','APPROVED','U112','CL014'),(128,'2025-06-12','REJECTED','U112','CL033'),(129,'2025-09-15','APPROVED','U113','CL044'),(130,'2025-07-05','PENDING','U113','CL011'),(131,'2025-05-04','APPROVED','U114','CL010'),(132,'2025-02-13','APPROVED','U115','CL007'),(133,'2025-05-25','PENDING','U115','CL047'),(134,'2025-02-11','APPROVED','U116','CL030'),(135,'2025-04-25','PENDING','U116','CL048'),(136,'2024-12-28','APPROVED','U117','CL005'),(137,'2024-12-31','APPROVED','U118','CL004'),(138,'2025-06-19','PENDING','U118','CL025'),(139,'2025-04-29','APPROVED','U119','CL015'),(140,'2025-01-10','APPROVED','U120','CL041'),(141,'2025-06-08','APPROVED','U121','CL036'),(142,'2025-08-12','REJECTED','U121','CL024'),(143,'2025-05-24','REJECTED','U122','CL048'),(144,'2025-09-11','APPROVED','U122','CL016'),(145,'2025-08-04','APPROVED','U123','CL002'),(146,'2025-01-28','REJECTED','U123','CL045'),(147,'2024-12-06','PENDING','U124','CL028'),(148,'2025-02-10','PENDING','U124','CL027'),(149,'2025-02-22','PENDING','U125','CL036'),(150,'2025-02-25','APPROVED','U125','CL021'),(151,'2024-12-30','REJECTED','U126','CL017'),(152,'2025-07-14','REJECTED','U126','CL048'),(153,'2025-04-19','APPROVED','U127','CL012'),(154,'2025-04-30','PENDING','U128','CL034'),(155,'2024-12-21','APPROVED','U129','CL012'),(156,'2025-11-03','APPROVED','U130','CL013'),(157,'2025-10-11','REJECTED','U130','CL023'),(158,'2025-06-24','REJECTED','U131','CL005'),(159,'2025-02-14','PENDING','U131','CL043'),(160,'2025-06-16','REJECTED','U132','CL042'),(161,'2025-02-09','PENDING','U133','CL020'),(162,'2025-02-16','REJECTED','U134','CL022'),(163,'2025-06-02','PENDING','U134','CL047'),(164,'2024-12-29','APPROVED','U135','CL008'),(165,'2025-02-06','REJECTED','U136','CL019'),(166,'2025-11-18','PENDING','U137','CL015'),(167,'2025-10-23','PENDING','U137','CL027'),(168,'2025-01-01','REJECTED','U138','CL008'),(169,'2025-06-11','REJECTED','U139','CL003'),(170,'2025-01-13','REJECTED','U139','CL040'),(171,'2025-07-16','APPROVED','U140','CL023'),(172,'2025-02-07','APPROVED','U140','CL019'),(173,'2025-06-25','APPROVED','U141','CL049'),(174,'2025-07-06','REJECTED','U141','CL003'),(175,'2025-06-13','PENDING','U142','CL002'),(176,'2025-07-30','REJECTED','U143','CL004'),(177,'2025-07-23','PENDING','U144','CL027'),(178,'2025-05-10','PENDING','U145','CL034'),(179,'2025-07-15','REJECTED','U146','CL036'),(180,'2025-04-26','PENDING','U146','CL017'),(181,'2025-10-25','PENDING','U147','CL008'),(182,'2025-07-30','APPROVED','U147','CL046'),(183,'2025-11-13','REJECTED','U148','CL021'),(184,'2025-03-05','APPROVED','U149','CL048'),(185,'2025-08-12','APPROVED','U150','CL001'),(186,'2025-09-30','APPROVED','U150','CL047');
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade_component`
--

DROP TABLE IF EXISTS `grade_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade_component` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `weight` double NOT NULL,
  `course_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `grade_component_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade_component`
--

LOCK TABLES `grade_component` WRITE;
/*!40000 ALTER TABLE `grade_component` DISABLE KEYS */;
INSERT INTO `grade_component` VALUES (1,'Mid-term',0.4,'C01'),(2,'Final-term',0.6,'C01'),(3,'Speaking',0.5,'C02'),(4,'Writing',0.5,'C02'),(5,'Mid-term',0.4,'C001'),(6,'Final-term',0.6,'C001'),(7,'Mid-term',0.4,'C002'),(8,'Final-term',0.6,'C002'),(9,'Mid-term',0.4,'C003'),(10,'Final-term',0.6,'C003'),(11,'Mid-term',0.4,'C004'),(12,'Final-term',0.6,'C004'),(13,'Mid-term',0.4,'C005'),(14,'Final-term',0.6,'C005'),(15,'Mid-term',0.4,'C006'),(16,'Final-term',0.6,'C006'),(17,'Mid-term',0.4,'C007'),(18,'Final-term',0.6,'C007'),(19,'Mid-term',0.4,'C008'),(20,'Final-term',0.6,'C008'),(21,'Mid-term',0.4,'C009'),(22,'Final-term',0.6,'C009'),(23,'Mid-term',0.4,'C010'),(24,'Final-term',0.6,'C010'),(25,'Mid-term',0.4,'C011'),(26,'Final-term',0.6,'C011'),(27,'Mid-term',0.4,'C012'),(28,'Final-term',0.6,'C012'),(29,'Mid-term',0.4,'C013'),(30,'Final-term',0.6,'C013'),(31,'Mid-term',0.4,'C014'),(32,'Final-term',0.6,'C014'),(33,'Mid-term',0.4,'C015'),(34,'Final-term',0.6,'C015'),(35,'Mid-term',0.4,'C016'),(36,'Final-term',0.6,'C016'),(37,'Mid-term',0.4,'C017'),(38,'Final-term',0.6,'C017'),(39,'Mid-term',0.4,'C018'),(40,'Final-term',0.6,'C018'),(41,'Mid-term',0.4,'C019'),(42,'Final-term',0.6,'C019'),(43,'Mid-term',0.4,'C020'),(44,'Final-term',0.6,'C020');
/*!40000 ALTER TABLE `grade_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_detail`
--

DROP TABLE IF EXISTS `schedule_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `day` enum('MONDAY','TUESDAY','WEDNESDAY','THURSDAY','FRIDAY','SATURDAY','SUNDAY') NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `class_id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `schedule_detail_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classroom` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_detail`
--

LOCK TABLES `schedule_detail` WRITE;
/*!40000 ALTER TABLE `schedule_detail` DISABLE KEYS */;
INSERT INTO `schedule_detail` VALUES (1,'MONDAY','18:00:00','19:30:00','CL01'),(2,'WEDNESDAY','18:00:00','19:30:00','CL01'),(3,'FRIDAY','18:00:00','19:30:00','CL01'),(4,'THURSDAY','18:00:00','19:30:00','CL001'),(5,'TUESDAY','18:00:00','19:30:00','CL001'),(6,'MONDAY','18:00:00','19:30:00','CL002'),(7,'SATURDAY','18:00:00','19:30:00','CL002'),(8,'MONDAY','18:00:00','19:30:00','CL003'),(9,'THURSDAY','18:00:00','19:30:00','CL003'),(10,'SATURDAY','18:00:00','19:30:00','CL004'),(11,'THURSDAY','18:00:00','19:30:00','CL004'),(12,'THURSDAY','18:00:00','19:30:00','CL005'),(13,'SATURDAY','18:00:00','19:30:00','CL005'),(14,'FRIDAY','18:00:00','19:30:00','CL006'),(15,'MONDAY','18:00:00','19:30:00','CL006'),(16,'WEDNESDAY','18:00:00','19:30:00','CL007'),(17,'SUNDAY','18:00:00','19:30:00','CL007'),(18,'WEDNESDAY','18:00:00','19:30:00','CL008'),(19,'SATURDAY','18:00:00','19:30:00','CL008'),(20,'SUNDAY','18:00:00','19:30:00','CL009'),(21,'TUESDAY','18:00:00','19:30:00','CL009'),(22,'WEDNESDAY','18:00:00','19:30:00','CL010'),(23,'MONDAY','18:00:00','19:30:00','CL010'),(24,'FRIDAY','18:00:00','19:30:00','CL011'),(25,'THURSDAY','18:00:00','19:30:00','CL011'),(26,'SUNDAY','18:00:00','19:30:00','CL012'),(27,'SATURDAY','18:00:00','19:30:00','CL012'),(28,'SATURDAY','18:00:00','19:30:00','CL013'),(29,'MONDAY','18:00:00','19:30:00','CL013'),(30,'FRIDAY','18:00:00','19:30:00','CL014'),(31,'MONDAY','18:00:00','19:30:00','CL014'),(32,'MONDAY','18:00:00','19:30:00','CL015'),(33,'FRIDAY','18:00:00','19:30:00','CL015'),(34,'SATURDAY','18:00:00','19:30:00','CL016'),(35,'WEDNESDAY','18:00:00','19:30:00','CL016'),(36,'TUESDAY','18:00:00','19:30:00','CL017'),(37,'SUNDAY','18:00:00','19:30:00','CL017'),(38,'MONDAY','18:00:00','19:30:00','CL018'),(39,'TUESDAY','18:00:00','19:30:00','CL018'),(40,'SATURDAY','18:00:00','19:30:00','CL019'),(41,'SUNDAY','18:00:00','19:30:00','CL019'),(42,'WEDNESDAY','18:00:00','19:30:00','CL020'),(43,'TUESDAY','18:00:00','19:30:00','CL020'),(44,'WEDNESDAY','18:00:00','19:30:00','CL021'),(45,'THURSDAY','18:00:00','19:30:00','CL021'),(46,'FRIDAY','18:00:00','19:30:00','CL022'),(47,'WEDNESDAY','18:00:00','19:30:00','CL022'),(48,'SUNDAY','18:00:00','19:30:00','CL023'),(49,'WEDNESDAY','18:00:00','19:30:00','CL023'),(50,'WEDNESDAY','18:00:00','19:30:00','CL024'),(51,'TUESDAY','18:00:00','19:30:00','CL024'),(52,'MONDAY','18:00:00','19:30:00','CL025'),(53,'SUNDAY','18:00:00','19:30:00','CL025'),(54,'THURSDAY','18:00:00','19:30:00','CL026'),(55,'TUESDAY','18:00:00','19:30:00','CL026'),(56,'SUNDAY','18:00:00','19:30:00','CL027'),(57,'SATURDAY','18:00:00','19:30:00','CL027'),(58,'SATURDAY','18:00:00','19:30:00','CL028'),(59,'FRIDAY','18:00:00','19:30:00','CL028'),(60,'TUESDAY','18:00:00','19:30:00','CL029'),(61,'SATURDAY','18:00:00','19:30:00','CL029'),(62,'TUESDAY','18:00:00','19:30:00','CL030'),(63,'SATURDAY','18:00:00','19:30:00','CL030'),(64,'SUNDAY','18:00:00','19:30:00','CL031'),(65,'WEDNESDAY','18:00:00','19:30:00','CL031'),(66,'MONDAY','18:00:00','19:30:00','CL032'),(67,'TUESDAY','18:00:00','19:30:00','CL032'),(68,'MONDAY','18:00:00','19:30:00','CL033'),(69,'SUNDAY','18:00:00','19:30:00','CL033'),(70,'SUNDAY','18:00:00','19:30:00','CL034'),(71,'WEDNESDAY','18:00:00','19:30:00','CL034'),(72,'THURSDAY','18:00:00','19:30:00','CL035'),(73,'FRIDAY','18:00:00','19:30:00','CL035'),(74,'WEDNESDAY','18:00:00','19:30:00','CL036'),(75,'TUESDAY','18:00:00','19:30:00','CL036'),(76,'TUESDAY','18:00:00','19:30:00','CL037'),(77,'THURSDAY','18:00:00','19:30:00','CL037'),(78,'TUESDAY','18:00:00','19:30:00','CL038'),(79,'THURSDAY','18:00:00','19:30:00','CL038'),(80,'FRIDAY','18:00:00','19:30:00','CL039'),(81,'MONDAY','18:00:00','19:30:00','CL039'),(82,'THURSDAY','18:00:00','19:30:00','CL040'),(83,'SATURDAY','18:00:00','19:30:00','CL040'),(84,'WEDNESDAY','18:00:00','19:30:00','CL041'),(85,'THURSDAY','18:00:00','19:30:00','CL041'),(86,'SATURDAY','18:00:00','19:30:00','CL042'),(87,'THURSDAY','18:00:00','19:30:00','CL042'),(88,'FRIDAY','18:00:00','19:30:00','CL043'),(89,'MONDAY','18:00:00','19:30:00','CL043'),(90,'MONDAY','18:00:00','19:30:00','CL044'),(91,'TUESDAY','18:00:00','19:30:00','CL044'),(92,'THURSDAY','18:00:00','19:30:00','CL045'),(93,'SATURDAY','18:00:00','19:30:00','CL045'),(94,'THURSDAY','18:00:00','19:30:00','CL046'),(95,'WEDNESDAY','18:00:00','19:30:00','CL046'),(96,'THURSDAY','18:00:00','19:30:00','CL047'),(97,'WEDNESDAY','18:00:00','19:30:00','CL047'),(98,'TUESDAY','18:00:00','19:30:00','CL048'),(99,'MONDAY','18:00:00','19:30:00','CL048'),(100,'FRIDAY','18:00:00','19:30:00','CL049'),(101,'THURSDAY','18:00:00','19:30:00','CL049'),(102,'TUESDAY','18:00:00','19:30:00','CL050'),(103,'MONDAY','18:00:00','19:30:00','CL050');
/*!40000 ALTER TABLE `schedule_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `score` double NOT NULL,
  `enrollment_id` int NOT NULL,
  `grade_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enrollment_id` (`enrollment_id`),
  KEY `grade_id` (`grade_id`),
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollment` (`id`),
  CONSTRAINT `score_ibfk_2` FOREIGN KEY (`grade_id`) REFERENCES `grade_component` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES (1,8.5,1,1),(2,9,1,2),(3,5.9,2,21),(4,5,2,22),(5,7.8,4,37),(6,7.3,4,38),(7,5.6,11,31),(8,7.6,11,32),(9,5.5,12,29),(10,6.9,12,30),(11,9.6,13,27),(12,5.7,13,28),(13,6.5,14,1),(14,5.2,14,2),(15,8.8,19,33),(16,5.5,19,34),(17,9.4,23,31),(18,5.5,23,32),(19,6.4,26,33),(20,7,26,34),(21,6.1,28,7),(22,7.1,28,8),(23,6.9,29,33),(24,8,29,34),(25,6.2,30,1),(26,6.4,30,2),(27,7.5,33,11),(28,6.5,33,12),(29,10,39,9),(30,6.9,39,10),(31,7.5,42,1),(32,7.8,42,2),(33,5.9,43,23),(34,8,43,24),(35,7.7,48,9),(36,9,48,10),(37,7.2,49,13),(38,9.6,49,14),(39,8.1,53,39),(40,5.5,53,40),(41,5.8,61,1),(42,9.4,61,2),(43,5.5,65,31),(44,7.4,65,32),(45,5.2,68,35),(46,8.2,68,36),(47,7.4,70,19),(48,9.5,70,20),(49,9.4,71,35),(50,9.6,71,36),(51,5.8,72,23),(52,6.7,72,24),(53,6.6,77,31),(54,7.7,77,32),(55,6.8,79,11),(56,7.8,79,12),(57,6.2,85,33),(58,7.4,85,34),(59,8.7,87,33),(60,6,87,34),(61,6.1,90,25),(62,7.5,90,26),(63,6.5,91,31),(64,7.7,91,32),(65,6.6,95,19),(66,10,95,20),(67,8.1,99,1),(68,9.5,99,2),(69,7.6,100,31),(70,6.1,100,32),(71,6.7,103,9),(72,9.5,103,10),(73,8.3,104,11),(74,8.4,104,12),(75,7.4,105,17),(76,6.5,105,18),(77,7.1,109,11),(78,6.3,109,12),(79,7.8,115,11),(80,8.6,115,12),(81,8.4,118,29),(82,8.8,118,30),(83,6.4,119,11),(84,6.5,119,12),(85,5.2,125,7),(86,8.7,125,8),(87,7.6,127,29),(88,7.9,127,30),(89,5.9,129,35),(90,9.8,129,36),(91,9.8,130,1),(92,8.4,130,2),(93,7.6,132,31),(94,7.9,132,32),(95,7.7,134,11),(96,7.7,134,12),(97,6.7,135,35),(98,8.1,135,36),(99,6,137,25),(100,9.4,137,26),(101,6.4,138,31),(102,9.9,138,32),(103,9.9,139,7),(104,9.6,139,8),(105,7.3,142,11),(106,6.9,142,12),(107,7,143,7),(108,5.7,143,8),(109,6.5,148,27),(110,5.6,148,28),(111,6.7,151,25),(112,7.9,151,26),(113,6.1,153,25),(114,9.2,153,26),(115,9.8,154,23),(116,5.5,154,24),(117,9.6,162,29),(118,7.4,162,30),(119,8.9,169,39),(120,5.8,169,40),(121,9.3,170,19),(122,6.2,170,20),(123,9.6,171,9),(124,8.4,171,10),(125,9.3,180,17),(126,9.8,180,18),(127,9.1,182,1),(128,5.8,182,2),(129,7,183,15),(130,6.4,183,16),(131,6.7,184,21),(132,8.8,184,22);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('U031'),('U032'),('U033'),('U034'),('U035'),('U036'),('U037'),('U038'),('U039'),('U04'),('U040'),('U041'),('U042'),('U043'),('U044'),('U045'),('U046'),('U047'),('U048'),('U049'),('U05'),('U050'),('U051'),('U052'),('U053'),('U054'),('U055'),('U056'),('U057'),('U058'),('U059'),('U060'),('U061'),('U062'),('U063'),('U064'),('U065'),('U066'),('U067'),('U068'),('U069'),('U070'),('U071'),('U072'),('U073'),('U074'),('U075'),('U076'),('U077'),('U078'),('U079'),('U080'),('U081'),('U082'),('U083'),('U084'),('U085'),('U086'),('U087'),('U088'),('U089'),('U090'),('U091'),('U092'),('U093'),('U094'),('U095'),('U096'),('U097'),('U098'),('U099'),('U100'),('U101'),('U102'),('U103'),('U104'),('U105'),('U106'),('U107'),('U108'),('U109'),('U110'),('U111'),('U112'),('U113'),('U114'),('U115'),('U116'),('U117'),('U118'),('U119'),('U120'),('U121'),('U122'),('U123'),('U124'),('U125'),('U126'),('U127'),('U128'),('U129'),('U130'),('U131'),('U132'),('U133'),('U134'),('U135'),('U136'),('U137'),('U138'),('U139'),('U140'),('U141'),('U142'),('U143'),('U144'),('U145'),('U146'),('U147'),('U148'),('U149'),('U150');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `id` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('U006'),('U007'),('U008'),('U009'),('U010'),('U011'),('U012'),('U013'),('U014'),('U015'),('U016'),('U017'),('U018'),('U019'),('U02'),('U020');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(10) NOT NULL,
  `fullname` varchar(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` int NOT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `dob` date NOT NULL,
  `address` varchar(250) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('U001','Kim Thị Vũ','U001.admin@center.com',1,'0962173370','2007-10-01','75 John Khu, Thành phố JaneXã, 839426','admin_U001','123',1),('U002','Bà Hà Trần','U002.admin@center.com',0,'0927377585','2005-06-25','81 Bùi Tổ, Thị xã JaneXã, 373145','admin_U002','123',1),('U003','Vi Mai','U003.admin@center.com',1,'0935012576','2006-01-24','0 Đặng Làng, JohnQuận, 695078','admin_U003','123',1),('U004','Chị Vi Lê','U004.admin@center.com',1,'0923076924','2002-03-24','587 Jane Khu, Huyện JohnXã, 673812','admin_U004','123',1),('U005','Bảo Trần','U005.admin@center.com',1,'0964553797','1995-03-10','3 Lê Làng, Thành phố JaneThị xã, 172441','admin_U005','123',1),('U006','Hải Lê','U006.teacher@center.com',1,'0920845859','2004-09-24','868 Mai Làng, Thị xã JaneThị xã, 616586','teacher_U006','123',1),('U007','Vũ Tấn Hoàng','U007.teacher@center.com',1,'0928245386','1978-10-28','304 John Tổ, Huyện JaneThành phố, 205494','teacher_U007','123',1),('U008','Chị An Hoàng','U008.teacher@center.com',1,'0951567200','1996-06-23','139 Jane Ngõ, JohnThành phố, 734917','teacher_U008','123',1),('U009','Mai Lê','U009.teacher@center.com',1,'0915459374','1999-05-02','0 Jane Ngõ, JohnQuận, 175467','teacher_U009','123',1),('U01','Nguyễn Quản Trị','admin@sys.com',1,'0901000111','1990-01-01','Hà Nội','admin','pass123',1),('U010','Quang Bùi','U010.teacher@center.com',0,'0976788850','1981-01-12','916 Jane Tổ, JohnPhường, 805314','teacher_U010','123',1),('U011','Cô Vi Lê','U011.teacher@center.com',0,'0983309300','2003-08-31','972 Jane Số, JaneThị xã, 978351','teacher_U011','123',1),('U012','Hoàng Mai','U012.teacher@center.com',0,'0997844911','1998-05-28','08 Lê Làng, JaneXã, 401861','teacher_U012','123',1),('U013','Nhiên Trí Vũ','U013.teacher@center.com',1,'0945490192','1988-02-07','935 John Làng, JanePhường, 806504','teacher_U013','123',1),('U014','An Hữu Hoàng','U014.teacher@center.com',1,'0961495816','1989-02-16','714 Jane Dãy, Thành phố JaneHuyện, 427216','teacher_U014','123',1),('U015','Ông Huy Phạm','U015.teacher@center.com',0,'0966144901','1993-07-25','Quận JohnThị xã, 03 John Ngõ, 299711','teacher_U015','123',1),('U016','Khoa Phạm','U016.teacher@center.com',1,'0979340862','2004-08-16','761 Jane Dãy, Huyện JohnPhường, 646167','teacher_U016','123',1),('U017','Tú Trí Vũ','U017.teacher@center.com',0,'0968661029','2003-11-11','485 Hoàng Đường, JanePhường, 556592','teacher_U017','123',1),('U018','Tùng Xuân Phạm','U018.teacher@center.com',0,'0968191437','1987-09-05','245 Đặng Ngõ, JohnThành phố, 382719','teacher_U018','123',1),('U019','Chị Khoa Vũ','U019.teacher@center.com',1,'0939518691','1987-03-07','17 John Khu, Thành phố JaneThị xã, 976147','teacher_U019','123',1),('U02','Trần Giáo Viên','teacher@sys.com',1,'0902000222','1992-05-15','Đà Nẵng','teacher1','pass123',1),('U020','Khoa Bảo Trần','U020.teacher@center.com',0,'0988620040','1978-04-13','55 Jane Ngõ, JaneThành phố, 416568','teacher_U020','123',1),('U021','Hoàng Xuân Hoàng','U021.cashier@center.com',0,'0938438567','1987-09-05','133 Jane Đường, Thị xã JaneThị xã, 612353','cashier_U021','123',1),('U022','Quý cô Hương Đặng','U022.cashier@center.com',0,'0945456077','1982-05-22','JohnThị xã, 11 Jane Làng, 224686','cashier_U022','123',1),('U023','Quý ông Anh Phạm','U023.cashier@center.com',0,'0908629024','1996-09-16','2 John Dãy, JaneXã, 967158','cashier_U023','123',1),('U024','Cô Khoa Dương','U024.cashier@center.com',1,'0953758631','1979-12-13','7 Dương Dãy, Quận JohnHuyện, 839868','cashier_U024','123',1),('U025','Dũng Thị Mai','U025.cashier@center.com',1,'0988875638','1979-12-12','94 Trần Ngõ, Thành phố JohnQuận, 142605','cashier_U025','123',1),('U026','Nam Dương','U026.cashier@center.com',1,'0969907508','1986-02-23','7 Mai Số, Thành phố JohnPhường, 547077','cashier_U026','123',1),('U027','Bà Vân Hoàng','U027.cashier@center.com',1,'0907373645','1989-02-11','99 John Đường, Huyện JaneHuyện, 168808','cashier_U027','123',1),('U028','Bác Khoa Bùi','U028.cashier@center.com',0,'0913297331','1987-12-21','234 Nguyễn Đường, JaneQuận, 615722','cashier_U028','123',1),('U029','Hải Lê','U029.cashier@center.com',0,'0909143789','2002-06-20','JohnXã, 70 Jane Hẻm, 121210','cashier_U029','123',1),('U03','Lê Thu Ngân','cashier@sys.com',0,'0903000333','1995-08-20','HCM','cashier1','pass123',1),('U030','Duyên Hoàng','U030.cashier@center.com',0,'0971113134','1979-06-01','8 Phạm Số, JohnThành phố, 739756','cashier_U030','123',1),('U031','Bác Tú Hoàng','U031.student@center.com',0,'0948038919','2004-03-22','18 John Số, JaneQuận, 577595','student_U031','123',1),('U032','Vũ Thị Nguyễn','U032.student@center.com',0,'0942621310','2008-08-02','188 Mai Khu, Quận JaneXã, 542558','student_U032','123',1),('U033','Hà Bùi','U033.student@center.com',0,'0996707366','2003-04-10','0 Bùi Số, Thị xã JanePhường, 364855','student_U033','123',1),('U034','Thành Trần','U034.student@center.com',1,'0954051774','2012-02-14','20 Jane Ngõ, Quận JohnQuận, 791030','student_U034','123',1),('U035','Nhật Nguyễn','U035.student@center.com',0,'0940564981','2012-06-16','271 Đặng Khu, Thành phố JohnHuyện, 451286','student_U035','123',1),('U036','Bác Khoa Mai','U036.student@center.com',0,'0944308472','2011-01-09','894 Jane Hẻm, Quận JaneXã, 354634','student_U036','123',1),('U037','Chị Thảo Đặng','U037.student@center.com',1,'0980429877','2001-06-21','11 Jane Khu, JohnXã, 542696','student_U037','123',1),('U038','Quang Trần','U038.student@center.com',0,'0936033713','2015-01-12','60 Đặng Dãy, Huyện JaneThị xã, 195479','student_U038','123',1),('U039','Cô Hạnh Trần','U039.student@center.com',0,'0928731631','2005-02-18','26 Lê Làng, JaneXã, 249492','student_U039','123',1),('U04','Phạm Học Viên A','student1@sys.com',1,'0904000444','2010-03-10','HCM','student1','pass123',1),('U040','Bảo Quang Dương','U040.student@center.com',1,'0938946062','2006-10-29','7 John Khu, Huyện JohnThị xã, 840602','student_U040','123',1),('U041','Ông Châu Phạm','U041.student@center.com',0,'0950305934','2013-09-08','400 Bùi Số, JohnPhường, 364878','student_U041','123',1),('U042','Khoa Hoàng Hoàng','U042.student@center.com',1,'0981952863','2001-02-07','85 John Hẻm, Thị xã JaneHuyện, 645085','student_U042','123',1),('U043','Chị Phương Trần','U043.student@center.com',0,'0961962134','2018-05-24','75 John Ngõ, Thị xã JaneXã, 590673','student_U043','123',1),('U044','Bà Thành Dương','U044.student@center.com',1,'0938819525','2014-01-08','8 Dương Đường, JaneQuận, 881408','student_U044','123',1),('U045','Ông Trọng Phạm','U045.student@center.com',1,'0987464718','2011-12-28','1 Jane Đường, JohnThành phố, 751036','student_U045','123',1),('U046','Thảo Vũ','U046.student@center.com',1,'0969337930','2007-08-12','167 Bùi Hẻm, JanePhường, 820866','student_U046','123',1),('U047','Bảo Mai Lê','U047.student@center.com',1,'0989093684','2010-08-27','56 Dương Số, Quận JaneQuận, 715021','student_U047','123',1),('U048','Xuân Bùi','U048.student@center.com',1,'0948463700','2007-11-11','02 Jane Ngõ, JaneThị xã, 580556','student_U048','123',1),('U049','Dương Mai','U049.student@center.com',0,'0965401212','2018-07-08','7 Vũ Dãy, Huyện JaneThành phố, 145935','student_U049','123',1),('U05','Hoàng Học Viên B','student2@sys.com',0,'0905000555','2012-12-12','HCM','student2','pass123',1),('U050','Lan Đặng','U050.student@center.com',0,'0909316199','2009-10-04','639 Mai Làng, JohnHuyện, 737868','student_U050','123',1),('U051','Khoa Trần','U051.student@center.com',1,'0989337250','2010-10-02','40 John Tổ, Quận JaneQuận, 977963','student_U051','123',1),('U052','Bà Dương Vũ','U052.student@center.com',1,'0975044362','2017-06-26','53 Jane Ngõ, Thị xã JanePhường, 559484','student_U052','123',1),('U053','Xuân Bùi','U053.student@center.com',0,'0950549176','2015-07-27','312 Phạm Dãy, Thị xã JaneThành phố, 289151','student_U053','123',1),('U054','Quý cô Mai Lê','U054.student@center.com',1,'0978856666','2009-05-23','18 Hoàng Làng, JaneXã, 734042','student_U054','123',1),('U055','Bác Anh Phạm','U055.student@center.com',0,'0965741549','2003-12-09','633 Nguyễn Số, Thành phố JanePhường, 385721','student_U055','123',1),('U056','Nhật Hoàng','U056.student@center.com',1,'0935540504','2007-09-16','318 Đặng Làng, JaneHuyện, 710334','student_U056','123',1),('U057','Chị An Mai','U057.student@center.com',0,'0969024534','2011-01-20','622 John Làng, JohnQuận, 868145','student_U057','123',1),('U058','Chị Kim Đặng','U058.student@center.com',1,'0948967791','2004-05-29','0 Dương Dãy, JohnQuận, 682507','student_U058','123',1),('U059','Quý cô Nhật Dương','U059.student@center.com',1,'0949469823','2010-07-31','29 Phạm Tổ, JaneThành phố, 318799','student_U059','123',1),('U060','Linh Phạm','U060.student@center.com',1,'0978428725','2014-11-28','52 Nguyễn Tổ, Quận JaneThành phố, 614963','student_U060','123',1),('U061','Ngọc Phạm','U061.student@center.com',0,'0943459791','2000-04-27','056 John Dãy, JohnHuyện, 427105','student_U061','123',1),('U062','Bà Nhật Bùi','U062.student@center.com',0,'0974808838','2000-03-23','8 Nguyễn Ngõ, JaneQuận, 103261','student_U062','123',1),('U063','Chị Hà Đặng','U063.student@center.com',1,'0984987360','2005-11-23','821 Hoàng Ngõ, JohnXã, 731211','student_U063','123',1),('U064','Thảo Đặng','U064.student@center.com',0,'0976170712','2012-09-16','15 Lê Dãy, Huyện JohnPhường, 889554','student_U064','123',1),('U065','Thành Đức Dương','U065.student@center.com',0,'0912728255','2013-04-03','7 Jane Đường, JanePhường, 225845','student_U065','123',1),('U066','Thành Mai Bảo Nguyễn','U066.student@center.com',0,'0998185030','2009-03-10','94 Jane Số, JohnThành phố, 693534','student_U066','123',1),('U067','Quang Phú Lê','U067.student@center.com',0,'0917420360','2005-02-08','0 Jane Tổ, JaneHuyện, 618897','student_U067','123',1),('U068','Khoa Bảo Lê','U068.student@center.com',0,'0932941881','2004-09-08','507 Hoàng Làng, Thị xã JaneQuận, 655252','student_U068','123',1),('U069','Cô Hải Lê','U069.student@center.com',1,'0910380745','2003-08-23','44 Nguyễn Số, JaneXã, 652877','student_U069','123',1),('U070','Dũng Hoàng Bùi','U070.student@center.com',1,'0939839655','2004-09-20','9 Đặng Dãy, Thị xã JohnThành phố, 479817','student_U070','123',1),('U071','Chị Hải Đặng','U071.student@center.com',0,'0997668196','2016-10-22','3 Lê Số, Thị xã JohnPhường, 848490','student_U071','123',1),('U072','Ông Trung Lê','U072.student@center.com',0,'0962189813','2002-02-12','46 Hoàng Tổ, Huyện JohnThị xã, 111502','student_U072','123',1),('U073','Trung Bùi','U073.student@center.com',1,'0987609289','2014-09-20','0 Đặng Hẻm, JaneThành phố, 517430','student_U073','123',1),('U074','Anh Hưng Trần','U074.student@center.com',0,'0906498922','2011-09-20','187 Jane Đường, JaneQuận, 901879','student_U074','123',1),('U075','Huy Lê','U075.student@center.com',1,'0953637804','2004-11-30','0 John Hẻm, JohnPhường, 963774','student_U075','123',1),('U076','Ánh Mai','U076.student@center.com',1,'0918016291','2013-01-27','1 John Khu, Huyện JanePhường, 843097','student_U076','123',1),('U077','Anh Mai','U077.student@center.com',1,'0980466202','2015-06-06','Thị xã JohnThành phố, 8 Jane Ngõ, 302256','student_U077','123',1),('U078','Anh Bảo Mai','U078.student@center.com',0,'0978564079','2011-04-02','80 Jane Đường, Thành phố JaneXã, 469434','student_U078','123',1),('U079','Bác Thành Mai','U079.student@center.com',1,'0952074445','2003-12-10','205 John Số, Huyện JaneThành phố, 729616','student_U079','123',1),('U080','Bà Hà Bùi','U080.student@center.com',1,'0922215572','2014-11-22','4 Bùi Hẻm, Thị xã JaneQuận, 506489','student_U080','123',1),('U081','Thành Trần','U081.student@center.com',0,'0936242080','2000-10-15','90 Dương Dãy, JohnThành phố, 661631','student_U081','123',1),('U082','Hạnh Văn Mai','U082.student@center.com',1,'0990399518','2002-08-16','02 Nguyễn Đường, JaneQuận, 674913','student_U082','123',1),('U083','Chị Bảo Lê','U083.student@center.com',0,'0940906203','2008-02-25','760 John Khu, JohnQuận, 469184','student_U083','123',1),('U084','Chị Xuân Bùi','U084.student@center.com',0,'0969618888','2012-04-04','90 John Số, Quận JohnThành phố, 964116','student_U084','123',1),('U085','Minh Văn Nguyễn','U085.student@center.com',1,'0993169703','2003-09-15','606 Hoàng Tổ, Quận JaneXã, 327187','student_U085','123',1),('U086','Hà Trí Bùi','U086.student@center.com',1,'0965244204','2011-10-30','JaneQuận, 36 Jane Số, 709616','student_U086','123',1),('U087','Hạnh Vũ','U087.student@center.com',1,'0918035978','2017-10-25','9 Phạm Khu, Huyện JanePhường, 211841','student_U087','123',1),('U088','Lan Bùi','U088.student@center.com',1,'0970402346','2014-03-23','17 Lê Hẻm, JaneThị xã, 266733','student_U088','123',1),('U089','Minh Trần','U089.student@center.com',1,'0905932573','2012-06-05','80 Jane Hẻm, JaneThị xã, 765240','student_U089','123',1),('U090','Thảo Mai','U090.student@center.com',0,'0900519343','2001-01-31','35 John Ngõ, JohnThành phố, 551493','student_U090','123',1),('U091','Nhật Quang Trần','U091.student@center.com',0,'0965402589','2014-05-17','232 John Hẻm, JaneXã, 871624','student_U091','123',1),('U092','Dũng Trần','U092.student@center.com',0,'0922085174','2013-10-23','585 Jane Khu, Thị xã JaneThị xã, 594165','student_U092','123',1),('U093','Huy Bùi','U093.student@center.com',1,'0934510982','2003-03-23','099 John Ngõ, JohnThị xã, 189524','student_U093','123',1),('U094','Ngọc Trần','U094.student@center.com',1,'0927051031','2012-03-21','17 Hoàng Khu, JohnQuận, 688927','student_U094','123',1),('U095','Phương Lê','U095.student@center.com',1,'0966750345','2005-07-29','3 Bùi Khu, Quận JaneQuận, 562382','student_U095','123',1),('U096','Xuân Bùi','U096.student@center.com',1,'0997475718','2002-11-07','38 Nguyễn Dãy, Huyện JaneXã, 776318','student_U096','123',1),('U097','Nhật Đức Lê','U097.student@center.com',0,'0920759424','2018-04-22','2 Trần Ngõ, JaneXã, 529897','student_U097','123',1),('U098','Hạnh Dương','U098.student@center.com',0,'0943711765','2003-09-02','202 John Đường, JanePhường, 823959','student_U098','123',1),('U099','Nhật Mai','U099.student@center.com',1,'0966362318','2011-07-28','374 Phạm Đường, JaneXã, 457429','student_U099','123',1),('U100','Hà Vũ','U100.student@center.com',1,'0909467152','2014-04-08','23 Phạm Dãy, JaneThị xã, 742165','student_U100','123',1),('U101','Cô Kim Đặng','U101.student@center.com',1,'0950199599','2015-12-03','5 Vũ Tổ, JaneThành phố, 603030','student_U101','123',1),('U102','Tú Dương','U102.student@center.com',0,'0923122731','2011-08-09','73 Jane Số, JaneXã, 968744','student_U102','123',1),('U103','Quý cô Vân Vũ','U103.student@center.com',0,'0990174697','2007-10-25','756 Jane Đường, Thị xã JohnHuyện, 310031','student_U103','123',1),('U104','Phúc Đức Lê','U104.student@center.com',1,'0993902561','2012-04-15','680 John Làng, Thị xã JohnThành phố, 645490','student_U104','123',1),('U105','Hà Xuân Phạm','U105.student@center.com',0,'0921994541','2014-01-12','36 Jane Đường, JaneHuyện, 810073','student_U105','123',1),('U106','Anh Trọng Mai','U106.student@center.com',0,'0937627190','2008-06-18','02 Jane Làng, JohnThị xã, 632689','student_U106','123',1),('U107','Phương Trần','U107.student@center.com',0,'0978725353','2016-01-18','27 Lê Số, JaneThành phố, 692427','student_U107','123',1),('U108','Quang Mai Phạm','U108.student@center.com',1,'0902383430','2016-04-01','708 Dương Làng, JohnHuyện, 600414','student_U108','123',1),('U109','Anh Quang Dương','U109.student@center.com',0,'0966836442','2012-02-23','1 Jane Ngõ, Quận JaneThành phố, 450686','student_U109','123',1),('U110','Quý cô Kim Phạm','U110.student@center.com',1,'0970050923','2016-10-11','583 Lê Số, Thị xã JohnXã, 562819','student_U110','123',1),('U111','Mai Dương','U111.student@center.com',1,'0940854843','2010-09-16','002 Jane Làng, Thị xã JanePhường, 454575','student_U111','123',1),('U112','Anh Phúc Đặng','U112.student@center.com',1,'0999361253','2012-01-11','57 John Làng, Quận JaneThị xã, 842134','student_U112','123',1),('U113','Bà Yến Nguyễn','U113.student@center.com',0,'0983916725','2013-09-19','9 Mai Làng, Quận JaneHuyện, 498615','student_U113','123',1),('U114','Hà Hoàng','U114.student@center.com',0,'0918917667','2016-08-30','95 Trần Đường, Thành phố JaneQuận, 588376','student_U114','123',1),('U115','Tú Hoàng','U115.student@center.com',1,'0990060474','2009-05-16','68 Phạm Khu, Thành phố JohnHuyện, 757399','student_U115','123',1),('U116','Ông Minh Dương','U116.student@center.com',0,'0960295121','2010-10-07','692 John Ngõ, JohnThành phố, 759890','student_U116','123',1),('U117','Anh Bùi','U117.student@center.com',1,'0982044015','2011-08-06','8 Jane Đường, Thị xã JohnPhường, 370383','student_U117','123',1),('U118','Hoàng Phú Trần','U118.student@center.com',1,'0911586995','2018-12-29','91 John Dãy, Quận JaneThành phố, 684884','student_U118','123',1),('U119','Chị Yến Phạm','U119.student@center.com',1,'0933272313','2006-10-01','24 Mai Làng, Thị xã JaneQuận, 390267','student_U119','123',1),('U120','Hương Đặng','U120.student@center.com',0,'0933984931','2010-11-24','12 Phạm Tổ, JohnThị xã, 627149','student_U120','123',1),('U121','Hà Quang Hoàng','U121.student@center.com',1,'0916740435','2010-12-05','6 Nguyễn Đường, Huyện JohnPhường, 428323','student_U121','123',1),('U122','Tùng Thế Nguyễn','U122.student@center.com',0,'0984830493','2008-05-13','90 Bùi Khu, Huyện JaneXã, 613275','student_U122','123',1),('U123','Ông Huy Đặng','U123.student@center.com',1,'0967668376','2017-08-13','03 Jane Ngõ, Quận JaneThành phố, 890515','student_U123','123',1),('U124','Minh Bảo Trần','U124.student@center.com',1,'0921791059','2008-04-14','67 John Tổ, Quận JohnQuận, 937737','student_U124','123',1),('U125','Hoàng Lê','U125.student@center.com',0,'0941242863','2008-06-01','623 John Làng, JohnPhường, 583265','student_U125','123',1),('U126','Cô Hồng Lê','U126.student@center.com',0,'0961378918','2017-02-05','8 Trần Hẻm, Thành phố JohnThành phố, 883157','student_U126','123',1),('U127','Quý cô Chi Vũ','U127.student@center.com',1,'0999388890','2011-08-25','1 John Làng, Thành phố JohnPhường, 567932','student_U127','123',1),('U128','Quý cô Yến Lê','U128.student@center.com',0,'0959076055','2017-03-29','55 Mai Khu, Thành phố JanePhường, 973968','student_U128','123',1),('U129','Quý cô Linh Dương','U129.student@center.com',1,'0972951925','2014-11-18','5 Hoàng Số, JanePhường, 625877','student_U129','123',1),('U130','Nhiên Phạm','U130.student@center.com',1,'0977678714','2014-07-29','2 Đặng Khu, JaneThị xã, 782132','student_U130','123',1),('U131','Vi Phạm','U131.student@center.com',1,'0965762036','2008-08-22','391 Nguyễn Làng, Quận JaneXã, 951209','student_U131','123',1),('U132','Nam Nguyễn','U132.student@center.com',0,'0930701749','2005-08-06','675 Trần Số, Thành phố JohnThành phố, 722722','student_U132','123',1),('U133','Quang Phạm','U133.student@center.com',1,'0901570500','2012-12-17','729 Hoàng Làng, Thành phố JaneXã, 132873','student_U133','123',1),('U134','Cô Kim Vũ','U134.student@center.com',0,'0997862964','2006-05-01','547 Hoàng Tổ, JohnThị xã, 943216','student_U134','123',1),('U135','Cô Phương Vũ','U135.student@center.com',0,'0937060624','2013-08-30','2 Lê Ngõ, Quận JaneHuyện, 819790','student_U135','123',1),('U136','Hải Bùi','U136.student@center.com',1,'0986776520','2009-04-17','8 John Đường, Quận JohnThị xã, 503767','student_U136','123',1),('U137','Ông Dũng Lê','U137.student@center.com',0,'0923431796','2013-03-28','360 Jane Hẻm, JaneThị xã, 973826','student_U137','123',1),('U138','Yến Dương','U138.student@center.com',1,'0990763274','2018-05-09','3 John Dãy, JaneHuyện, 321914','student_U138','123',1),('U139','Hải Văn Nguyễn','U139.student@center.com',0,'0992269027','2002-04-14','282 Jane Đường, JohnHuyện, 706455','student_U139','123',1),('U140','Hà Đặng','U140.student@center.com',1,'0902272920','2008-07-14','88 John Tổ, JaneThị xã, 668547','student_U140','123',1),('U141','Quý ông Minh Trần','U141.student@center.com',1,'0936738520','2007-05-12','5 John Hẻm, Thành phố JanePhường, 692661','student_U141','123',1),('U142','Hải Trần','U142.student@center.com',1,'0903797812','2009-01-01','7 Hoàng Tổ, JaneQuận, 914957','student_U142','123',1),('U143','Yến Bùi','U143.student@center.com',0,'0987033984','2012-05-08','917 Jane Số, Thành phố JohnThành phố, 697588','student_U143','123',1),('U144','Hưng Phú Lê','U144.student@center.com',0,'0946551646','2009-01-22','375 John Dãy, Thị xã JanePhường, 708453','student_U144','123',1),('U145','Anh Nam Dương','U145.student@center.com',1,'0993331804','2005-10-19','5 Hoàng Hẻm, JaneQuận, 486540','student_U145','123',1),('U146','Hạnh Hải Phạm','U146.student@center.com',0,'0995799235','2008-02-15','39 Hoàng Hẻm, JohnQuận, 985080','student_U146','123',1),('U147','Tùng Lê','U147.student@center.com',0,'0939410857','2003-10-20','32 Hoàng Làng, Thị xã JohnHuyện, 508613','student_U147','123',1),('U148','Minh Phạm','U148.student@center.com',1,'0996693299','2013-09-26','339 Jane Ngõ, JanePhường, 610070','student_U148','123',1),('U149','Thành Hữu Nguyễn','U149.student@center.com',1,'0901391417','2003-10-24','498 Vũ Số, JaneQuận, 809251','student_U149','123',1),('U150','Nhật Trần','U150.student@center.com',1,'0944034434','2003-01-01','9 Hoàng Ngõ, Thành phố JohnThành phố, 963592','student_U150','123',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-25 21:38:13
