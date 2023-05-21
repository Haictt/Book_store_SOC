-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `t_order`
--

DROP TABLE IF EXISTS `t_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `book_id` bigint DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKb6p934nxk4nbp8g93bkrcbtyv` (`book_id`),
  CONSTRAINT `FKb6p934nxk4nbp8g93bkrcbtyv` FOREIGN KEY (`book_id`) REFERENCES `t_books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_order`
--

LOCK TABLES `t_order` WRITE;
/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
INSERT INTO `t_order` VALUES (1,NULL,1,'test@gmail.com',1),(2,1,3,'test@gmail.com',1),(3,2,20,'test@gmail.com',1),(4,1,21,'test@gmail.com',1),(5,2,25,'test@gmail.com',1),(6,2,25,'test@gmail.com',1),(12,2,1,'test@gmail.com',1),(13,2,3,'test@gmail.com',1),(14,3,4,'test@gmail.com',1),(16,1,17,'test@gmail.com',1),(17,1,18,'test@gmail.com',1),(63,3,4,'hai13112001@gmail.com',0),(65,1,17,'test@gmail.com',1),(66,1,4,'test@gmail.com',1),(67,6,17,'test@gmail.com',1),(68,5,4,'test@gmail.com',1),(69,1,17,'test@gmail.com',1),(70,2,17,'test@gmail.com',1),(71,1,4,'test@gmail.com',1),(72,1,4,'test@gmail.com',1),(73,4,17,'test@gmail.com',1),(74,3,4,'test@gmail.com',1),(75,1,3,'test@gmail.com',0),(76,999,4,'mck@gmail.com',1),(77,1,3,'mck@gmail.com',1),(78,999,33,'mck@gmail.com',1),(79,3,17,'mck@gmail.com',1),(80,1,4,'mck@gmail.com',1);
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-21 21:55:44
