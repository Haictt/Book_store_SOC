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
-- Table structure for table `bill_paypal`
--

DROP TABLE IF EXISTS `bill_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_paypal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `paypal_order_id` varchar(255) DEFAULT NULL,
  `paypal_order_status` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `total` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7fbxibgkxiw3708w8n4cu72tk` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_paypal`
--

LOCK TABLES `bill_paypal` WRITE;
/*!40000 ALTER TABLE `bill_paypal` DISABLE KEYS */;
INSERT INTO `bill_paypal` VALUES (3,'PAYID-MRNRV7Y9R295534F11331922','approved','test@gmail.com',3,'2023-05-10 11:18:07',20),(4,'PAYID-MRNRV7Y9R295534F11331922','approved','test@gmail.com',4,'2023-05-10 11:18:07',20),(5,'PAYID-MROLQ2Y1AJ99957B3725325S','approved','test@gmail.com',5,'2023-05-11 16:42:04',20),(6,'PAYID-MROLSWQ551876317B310221H','created','test@gmail.com',6,'2023-05-11 16:46:03',20),(7,'PAYID-MRSFCDQ6FC38289LW723983P','created','test@gmail.com',12,'2023-05-17 10:59:10',20),(8,'PAYID-MRSFEFQ14L16446UP937482V','created','test@gmail.com',13,'2023-05-17 11:03:34',3.87),(9,'PAYID-MRSFETY8LX071416G994622E','created','test@gmail.com',14,'2023-05-17 11:04:31',21.93),(10,'PAYID-MRSFFPY89438397T4225680P','created','test@gmail.com',16,'2023-05-17 11:06:22',2.58),(11,'PAYID-MRSFF2Y8VM45445985043309','created','test@gmail.com',16,'2023-05-17 11:07:07',2.58),(12,'PAYID-MRSFIHI8TP50051L96843047','created','test@gmail.com',17,'2023-05-17 11:12:13',4.69),(13,'PAYID-MRSFJ3I2T551461YJ889622N','approved','test@gmail.com',65,'2023-05-17 11:15:41',2.58),(14,'PAYID-MRSFMZI6VD848103K966952W','approved','test@gmail.com',66,'2023-05-17 11:21:56',7.31),(15,'PAYID-MRSFN4I99C48907M5109212Y','created','test@gmail.com',68,'2023-05-17 11:24:17',52.03),(16,'PAYID-MRSFN4I99C48907M5109212Y','created','test@gmail.com',67,'2023-05-17 11:24:17',52.03),(17,'PAYID-MRSFOEQ02D77692AN878015L','approved','test@gmail.com',68,'2023-05-17 11:24:50',52.03),(18,'PAYID-MRSFOEQ02D77692AN878015L','approved','test@gmail.com',67,'2023-05-17 11:24:50',52.03),(19,'PAYID-MRSFOWI96D14140V8849643T','approved','test@gmail.com',69,'2023-05-17 11:26:01',2.58),(20,'PAYID-MRSFXPI7K117676TK8686401','approved','test@gmail.com',70,'2023-05-17 11:44:45',12.47),(21,'PAYID-MRSFXPI7K117676TK8686401','approved','test@gmail.com',71,'2023-05-17 11:44:45',12.47),(22,'PAYID-MRSFZOY6AC08645PL579992N','approved','test@gmail.com',72,'2023-05-17 11:48:59',7.31),(23,'PAYID-MRSIH4Q5LN49473F45927150','approved','test@gmail.com',73,'2023-05-17 14:36:18',32.25),(24,'PAYID-MRSIH4Q5LN49473F45927150','approved','test@gmail.com',74,'2023-05-17 14:36:18',32.25),(25,'PAYID-MRSIKDA6GT76029T66757933','created','test@gmail.com',75,'2023-05-17 14:41:00',1.94),(26,'PAYID-MRSITIQ9WX6282388046440S','approved','mck@gmail.com',76,'2023-05-17 15:00:34',7302.69),(27,'PAYID-MRSITUI2G6653018V8045711','approved','mck@gmail.com',77,'2023-05-17 15:01:21',1.94),(28,'PAYID-MRSIURA1BK11411KK243580A','approved','mck@gmail.com',78,'2023-05-17 15:03:16',12844.14),(29,'PAYID-MRSJ76I1NC42039AH171474G','created','mck@gmail.com',79,'2023-05-17 16:35:53',15.05),(30,'PAYID-MRSJ76I1NC42039AH171474G','created','mck@gmail.com',80,'2023-05-17 16:35:53',15.05),(31,'PAYID-MRSJ76Q8FU87350J6338131H','created','mck@gmail.com',79,'2023-05-17 16:35:54',15.05),(32,'PAYID-MRSJ76Q8FU87350J6338131H','created','mck@gmail.com',80,'2023-05-17 16:35:54',15.05),(33,'PAYID-MRSKAFI2BY18037017713510','approved','mck@gmail.com',79,'2023-05-17 16:36:21',15.05),(34,'PAYID-MRSKAFI2BY18037017713510','approved','mck@gmail.com',80,'2023-05-17 16:36:21',15.05);
/*!40000 ALTER TABLE `bill_paypal` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-21 21:55:45
