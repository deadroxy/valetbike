-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: valetbike_development
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2021-09-12 17:58:18.706074','2021-09-12 17:58:18.706074');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bikes`
--

DROP TABLE IF EXISTS `bikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bikes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `identifier` int DEFAULT NULL,
  `current_station_id` int DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bikes`
--

LOCK TABLES `bikes` WRITE;
/*!40000 ALTER TABLE `bikes` DISABLE KEYS */;
INSERT INTO `bikes` VALUES (1,1234,2,'2021-09-12 20:50:51.740289','2021-09-12 20:50:51.740289'),(2,12345,3,'2021-09-12 21:54:23.235159','2021-09-12 21:54:23.235159');
/*!40000 ALTER TABLE `bikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20210830174339'),('20210830180952'),('20210921031600');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `identifier` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1,45,'Neu Station','123 Novel Lane','2021-09-12 20:42:53.678532','2021-09-12 20:42:53.678532'),(2,46,'Neu2 Station','1234 Novel Lane','2021-09-12 20:48:33.579423','2021-09-12 20:48:33.579423'),(3,47,'Neu3 Station','12345 Novel Lane','2021-09-12 21:51:29.458630','2021-09-12 21:51:29.458630'),(4,21,'Florence Bank Station','19 Meadow Street Florence MA @ Lilly Library','2021-09-13 03:23:05.827565','2021-09-13 03:23:05.827565'),(5,24,'Florence Center','31 Main Street Florence MA','2021-09-13 20:52:45.018427','2021-09-13 20:52:45.018427'),(6,30,'Jackson Street','7A-7D Jackson Street Northampton MA','2021-09-13 20:52:45.089711','2021-09-13 20:52:45.089711'),(7,25,'Cooley Dickinson Health Care','51 Locust Street Northampton MA','2021-09-13 20:52:45.102209','2021-09-13 20:52:45.102209'),(8,29,'State St/Mass Central Rail Trail','State Street/Mass Central Rail Trail','2021-09-13 20:52:45.118571','2021-09-13 20:52:45.118571'),(9,33,'Northampton High School','380 Elm Street Northampton MA','2021-09-13 20:52:45.132598','2021-09-13 20:52:45.132598'),(10,20,'Village Hill/State Hospital','Village Hill/State Hospital','2021-09-13 20:52:45.161787','2021-09-13 20:52:45.161787'),(11,26,'John M Greene Hall/Smith College','1 Chapin Way Northampton MA @ John M. Greene Hall','2021-09-13 20:52:45.188585','2021-09-13 20:52:45.188585'),(12,23,'Forbes Library','20 West Street Northampton MA','2021-09-13 20:52:45.214047','2021-09-13 20:52:45.214047'),(13,27,'Pulaski Park/Downtown','274 Main Street Northampton MA at Pulaski Park','2021-09-13 20:52:45.232057','2021-09-13 20:52:45.232057'),(14,31,'Main Street/Court House','99 Main Street Northampton MA','2021-09-13 20:52:45.246529','2021-09-13 20:52:45.246529'),(15,28,'Northampton Train Station','Northampton Train Station','2021-09-13 20:52:45.274994','2021-09-13 20:52:45.274994'),(16,32,'Main Street/Bridge Street','1 Bridge Street Northampton MA','2021-09-13 20:52:45.296961','2021-09-13 20:52:45.296961'),(17,22,'YMCA/Childs Park','YMCA/Childs Park','2021-09-13 20:52:45.315213','2021-09-13 20:52:45.315213');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-09 23:49:38
