CREATE DATABASE  IF NOT EXISTS `transaction` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `transaction`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: transaction
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `AccountId` int NOT NULL AUTO_INCREMENT,
  `OwnerName` varchar(45) NOT NULL,
  `Balance` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`AccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'Alice',5994),(2,'Bob',500),(3,'Carol',450),(4,'Adam',1306),(5,'Sam',700),(6,'Sally',1500);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_log`
--

DROP TABLE IF EXISTS `transfer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_log` (
  `LogId` int NOT NULL AUTO_INCREMENT,
  `FromId` int NOT NULL,
  `ToId` int NOT NULL,
  `Amount` int NOT NULL,
  `LogDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LogId`),
  KEY `FromId` (`FromId`),
  KEY `ToId` (`ToId`),
  CONSTRAINT `transfer_log_ibfk_1` FOREIGN KEY (`FromId`) REFERENCES `accounts` (`AccountId`),
  CONSTRAINT `transfer_log_ibfk_2` FOREIGN KEY (`ToId`) REFERENCES `accounts` (`AccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_log`
--

LOCK TABLES `transfer_log` WRITE;
/*!40000 ALTER TABLE `transfer_log` DISABLE KEYS */;
INSERT INTO `transfer_log` VALUES (1,2,5,200,'2026-04-25 14:44:22'),(2,2,3,200,'2026-04-25 14:44:32'),(3,2,3,200,'2026-04-25 14:44:42'),(4,2,3,200,'2026-04-25 14:44:52'),(5,2,3,200,'2026-04-25 14:45:02'),(6,2,3,200,'2026-04-25 14:45:12'),(7,4,1,1400,'2026-04-25 18:04:12'),(8,3,4,3000,'2026-04-26 13:31:24'),(9,3,1,800,'2026-04-26 13:31:29'),(10,4,1,400,'2026-04-26 14:25:30'),(11,4,2,500,'2026-04-26 14:25:36'),(12,4,2,3000,'2026-04-26 14:26:42'),(13,3,1,3000,'2026-04-26 20:42:35'),(14,1,4,6,'2026-04-26 20:43:48');
/*!40000 ALTER TABLE `transfer_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-26 21:01:02
