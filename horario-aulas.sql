mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: horario-aulas
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'Fort Jayson');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` bigint unsigned NOT NULL,
  `year` varchar(4) DEFAULT NULL,
  `semester` varchar(8) DEFAULT NULL,
  `code` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_FK` (`subject_id`),
  CONSTRAINT `class_FK` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,6,'2020','2020.2','I'),(2,5,'2024','2024.1','L'),(3,1,'2020','2020.1','y'),(4,1,'2022','2022.2','v'),(5,9,'2025','2025.2','z'),(6,10,'2021','2021.1','R'),(7,9,'2020','2020.2','b'),(8,8,'2020','2020.1','d'),(9,5,'2024','2024.1','i'),(10,7,'2025','2025.1','S'),(11,1,'2025','2025.2','r'),(12,1,'2023','2023.1','w'),(13,8,'2020','2020.1','W'),(14,1,'2022','2022.2','H'),(15,10,'2024','2024.2','W'),(16,3,'2021','2021.2','u'),(17,10,'2021','2021.1','l'),(18,10,'2023','2023.2','a'),(19,1,'2020','2020.2','r'),(20,4,'2025','2025.2','M');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_schedule`
--

DROP TABLE IF EXISTS `class_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_schedule` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `day_of_week` smallint NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `class_schedule_FK_1` (`room_id`),
  KEY `class_schedule_FK_2` (`class_id`),
  CONSTRAINT `class_schedule_FK` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `class_schedule_FK_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_schedule`
--

LOCK TABLES `class_schedule` WRITE;
/*!40000 ALTER TABLE `class_schedule` DISABLE KEYS */;
INSERT INTO `class_schedule` VALUES (1,5,8,3,'16:00:00','18:00:00'),(2,16,8,3,'12:00:00','14:00:00'),(3,2,9,3,'15:00:00','17:00:00'),(4,10,7,1,'09:00:00','11:00:00'),(5,11,8,3,'09:00:00','11:00:00'),(6,17,6,2,'15:00:00','16:00:00'),(7,17,6,4,'10:00:00','11:00:00'),(8,13,1,1,'16:00:00','18:00:00'),(9,14,6,4,'12:00:00','13:00:00'),(10,10,7,3,'13:00:00','14:00:00'),(11,2,2,2,'12:00:00','13:00:00'),(12,14,4,4,'10:00:00','12:00:00'),(13,20,4,0,'15:00:00','17:00:00'),(14,12,2,4,'10:00:00','11:00:00'),(15,2,9,4,'14:00:00','15:00:00'),(16,18,10,0,'09:00:00','11:00:00'),(17,1,8,1,'16:00:00','17:00:00'),(18,5,4,4,'12:00:00','14:00:00'),(19,10,8,4,'12:00:00','14:00:00'),(20,8,9,3,'13:00:00','15:00:00'),(21,8,4,2,'12:00:00','14:00:00'),(22,17,5,1,'10:00:00','12:00:00'),(23,14,2,4,'15:00:00','16:00:00'),(24,3,3,2,'11:00:00','13:00:00'),(25,12,1,0,'10:00:00','12:00:00'),(26,11,2,0,'11:00:00','13:00:00'),(27,1,7,1,'11:00:00','13:00:00'),(28,9,7,4,'13:00:00','15:00:00'),(29,12,9,1,'15:00:00','17:00:00'),(30,11,5,0,'13:00:00','14:00:00');
/*!40000 ALTER TABLE `class_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Departamento de exatas'),(2,'Departamento de linguas'),(3,'Departamento de exatas'),(4,'Departamento de exatas'),(5,'Departamento de artes');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `department_id` bigint unsigned NOT NULL,
  `title_id` bigint unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `professor_FK` (`title_id`),
  KEY `professor_FK_1` (`department_id`),
  CONSTRAINT `professor_FK` FOREIGN KEY (`title_id`) REFERENCES `title` (`id`),
  CONSTRAINT `professor_FK_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,3,5,'Jennie Hodkiewicz IV'),(2,2,5,'Mr. Alan Bernier'),(3,1,2,'Jeannette Sporer'),(4,3,2,'Melissa Feeney'),(5,5,3,'Curtis Bayer'),(6,5,2,'Rita Labadie-Lesch'),(7,5,2,'Randal Mayer-Dickens'),(8,5,2,'Meghan Ward DVM');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `building_id` bigint unsigned NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `room_FK` (`building_id`),
  CONSTRAINT `room_FK` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,1,'Sala 1'),(2,1,'Sala 2'),(3,1,'Sala 3'),(4,1,'Sala 4'),(5,1,'Sala 5'),(6,1,'Sala 6'),(7,1,'Sala 7'),(8,1,'Sala 8'),(9,1,'Sala 9'),(10,1,'Sala 10');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `professor_id` bigint unsigned NOT NULL,
  `code` varchar(16) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_FK` (`professor_id`),
  CONSTRAINT `subject_FK` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,8,'wLijqd','declaration'),(2,7,'VClaHK','wallaby'),(3,7,'oERfPq','hyphenation'),(4,8,'FVEsTH','charlatan'),(5,7,'qeABiC','ostrich'),(6,6,'LEtMHj','orchid'),(7,8,'YVoDcn','secrecy'),(8,4,'THQpxF','barge'),(9,2,'EnbsWb','slipper'),(10,2,'WrGGnF','accompanist');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_prerequisite`
--

DROP TABLE IF EXISTS `subject_prerequisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_prerequisite` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subject_id` bigint unsigned NOT NULL,
  `title_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_prerequisite_FK` (`title_id`),
  KEY `subject_prerequisite_FK_1` (`subject_id`),
  CONSTRAINT `subject_prerequisite_FK` FOREIGN KEY (`title_id`) REFERENCES `title` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subject_prerequisite_FK_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_prerequisite`
--

LOCK TABLES `subject_prerequisite` WRITE;
/*!40000 ALTER TABLE `subject_prerequisite` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject_prerequisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `title`
--

DROP TABLE IF EXISTS `title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `title` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `title`
--

LOCK TABLES `title` WRITE;
/*!40000 ALTER TABLE `title` DISABLE KEYS */;
INSERT INTO `title` VALUES (1,'Sociologia'),(2,'Ciências'),(3,'Filosofia'),(4,'História'),(5,'Sociologia');
/*!40000 ALTER TABLE `title` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-22 16:36:11
