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
-- Table structure for table `t_books`
--

DROP TABLE IF EXISTS `t_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_books` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `author` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `genre_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKiu7oshie529bxad1tc3d0h4l7` (`genre_id`),
  CONSTRAINT `FKiu7oshie529bxad1tc3d0h4l7` FOREIGN KEY (`genre_id`) REFERENCES `t_genre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_books`
--

LOCK TABLES `t_books` WRITE;
/*!40000 ALTER TABLE `t_books` DISABLE KEYS */;
INSERT INTO `t_books` VALUES (1,'Cho Hang Rok','https://cdn0.fahasa.com/media/catalog/product/i/m/image_195509_1_16479.jpg','Tiếng Hàn Tổng Hợp Dành Cho Người Việt Nam',175000.00,'NXB Đại học Quốc Gia Hà Nội',1),(2,'Trang Anh','https://cdn0.fahasa.com/media/catalog/product/9/7/9786043519112_1_1.jpg','Tổng Ôn Ngữ Pháp Tiếng Anh',150000.00,'NXB Hồng Đức',1),(3,'Nguyễn Hồng Quân','https://cdn0.fahasa.com/media/catalog/product/i/m/image_195509_1_34774.jpg','Bài Tập Bổ Trợ Và Phát Triển Năng Lực Môn Tiếng Anh Lớp 12',45000.00,'NXB Đại học Quốc gia Hà Nội',1),(4,'Trang Anh','https://cdn0.fahasa.com/media/catalog/product/9/7/9786049938535.jpg','500 Bài Luyện Đọc Hiểu',170000.00,'NXB Hồng Đức',1),(5,'Mai Lan Hương','https://cdn0.fahasa.com/media/catalog/product/9/7/9786048438296.jpg','Bài Tập Tiếng Anh Lớp 12',50000.00,'NXB Đà Nẵng',1),(6,'José Mauro de Vasconcelos','https://cdn0.fahasa.com/media/catalog/product/i/m/image_217480.jpg','Cây Cam Ngọt Của Tôi',90000.00,'NXB Hội Nhà Văn',2),(7,'Paulo Coelho','https://cdn0.fahasa.com/media/catalog/product/i/m/image_195509_1_36793.jpg','Nhà Giả Kim',80000.00,'NXB Hội Nhà Văn',2),(8,'Dale Carnegie','https://cdn0.fahasa.com/media/catalog/product/d/n/dntttttuntitled.jpg','Đắc Nhân Tâm',100000.00,'NXB Tổng Hợp TPHCM',2),(9,'TS David J Lieberman','https://cdn0.fahasa.com/media/catalog/product/b/i/bia_doc-vi-bat-ky-ai-de-khong-bi-lua-doi-va-loi-dung_bia-1.jpg','Đọc Vị Bất Kỳ Ai',100000.00,'NXB Lao Động',2),(10,'Nguyễn Nhật Ánh','https://cdn0.fahasa.com/media/catalog/product/8/9/8934974158448.jpg','Tôi Thấy Hoa Vàng Trên Cỏ Xanh',100000.00,'NXB Trẻ',2),(11,'Antoine De Saint-Exupéry','https://cdn0.fahasa.com/media/catalog/product/i/m/image_187010.jpg','Hoàng Tử Bé',60000.00,'NXB Hội Nhà Văn',3),(12,'Jacob Grimm','https://cdn0.fahasa.com/media/catalog/product/8/9/8935244878974.jpg','Truyện Cổ Grimm',70000.00,'NXB Kim Đồng',3),(13,'Phùng Quán','https://cdn0.fahasa.com/media/catalog/product/i/m/image_187162.jpg','Tuổi Thơ Dữ Dội - Tập 1',80000.00,'NXB Kim Đồng',3),(14,'Phùng Quán','https://cdn0.fahasa.com/media/catalog/product/i/m/image_187163.jpg','Tuổi Thơ Dữ Dội - Tập 2',70000.00,'NXB Kim Đồng',3),(15,'Rachel Firth','https://cdn0.fahasa.com/media/catalog/product/i/m/image_195509_1_13548.jpg','Bách Khoa Tri Thức Về Khám Phá Thế Giới Cho Trẻ Em',31000.00,'NXB Thế Giới',3),(16,'Yosbook, Xiao Li','https://cdn0.fahasa.com/media/catalog/product/i/m/image_182813.jpg','Mẹ Hỏi Bé Trả Lời 1-2 Tuổi',30000.00,'NXB Kim Đồng',3),(17,'Shinkai Makoto','https://cdn0.fahasa.com/media/catalog/product/8/9/8935250706582.jpg','5 Centimet Trên Giây',60000.00,'NXB Hồng Đức',4),(18,'Yozora Fuyuno','https://cdn0.fahasa.com/media/catalog/product/b/i/bia1_5_2.jpg','Mình Sẽ Tìm Cậu Vào Đêm Trăng Rằm',109000.00,'NXB Thế Giới',4),(19,'Shinkai Makoto','https://cdn0.fahasa.com/media/catalog/product/8/9/8936048123468_1_1.jpg','Khu Vườn Ngôn Từ',120000.00,'NXB Hồng Đức',4),(20,'Otono Yomoji','https://cdn0.fahasa.com/media/catalog/product/n/h/nhan-gui-mot-toi---front_2.jpg','Nhắn Gửi Một Tôi, Người Đã Yêu Em',128000.00,'NXB Hà Nội',4),(21,'Inujun','https://cdn0.fahasa.com/media/catalog/product/8/9/8935325005145.jpg','Gửi Tới Người Mùa Đông Này Sẽ Không Còn Nữa',123000.00,'NXB Dân Trí',4),(22,'Dale Carnegie','https://cdn0.fahasa.com/media/catalog/product/d/n/dntttttuntitled.jpg','Đắc Nhân Tâm',86000.00,'NXB Tổng Hợp TPHCM',6),(23,'Trác Nhã','https://cdn0.fahasa.com/media/catalog/product/8/9/8936067605693.jpg','Khéo Ăn Nói Sẽ Có Được Thiên Hạ',130000.00,'NXB Văn Học',6),(24,'Diệp Hồng Vũ','https://cdn0.fahasa.com/media/catalog/product/p/h/ph_c-h_a-ch_n-dung-k_-ph_m-t_i.jpg','Tâm Lý Học Tội Phạm - Phác Họa Chân Dung Kẻ Phạm Tội',145000.00,'NXB Thanh Niên',6),(25,'Albert Rutherford','https://cdn0.fahasa.com/media/catalog/product/i/m/image_195509_1_18448.jpg','Rèn Luyện Tư Duy Phản Biện',99000.00,'NXB Phụ Nữ Việt Nam',6),(26,'Shannon Thomas, LCSW','https://cdn0.fahasa.com/media/catalog/product/8/9/8936066692298.jpg','Thao Túng Tâm Lý',169000.00,'NXB Dân Trí',6),(27,'Đổng Tâm Khiết','https://cdn0.fahasa.com/media/catalog/product/6/0/600-t_m-l_-h_c-v_-s_-lo-_u_nh-b_a-s_ch.jpg','Tâm Lý Học Về Sự Lo Âu',129000.00,'NXB Văn Học',6),(28,'Song Hong Bing','https://cdn0.fahasa.com/media/catalog/product/b/i/bia-truoc-chien-tranh-tien-te-phan-1-1.jpg','Chiến Tranh Tiền Tệ - Phần 1 - Ai Thực Sự Là Người Giàu Nhất Thế Giới?',165000.00,'NXB Lao Động',8),(29,'Song Hong Bing','https://cdn0.fahasa.com/media/catalog/product/b/i/bia-truoc-chientrangtiente-2-tb-jpg.jpg','Chiến Tranh Tiền Tệ - Phần 2 - Sự Thống Trị Của Quyền Lực Tài Chính',170000.00,'NXB Lao Động',8),(30,'Song Hong Bing','https://cdn0.fahasa.com/media/catalog/product/i/m/image_200687.jpg','Chiến Tranh Tiền Tệ - Phần 3 - Biên Giới Tiền Tệ - Nhân Tố Bí Ẩn Trong Các Cuộc Chiến Kinh Tế',175000.00,'NXB Lao Động',8),(31,'Song Hong Bing','https://cdn0.fahasa.com/media/catalog/product/9/7/9786043603590.jpg','Chiến Tranh Tiền Tệ - Phần 4: Siêu Cường Về Tài Chính - Tham Vọng Về Đồng Tiền Chung Châu Á',185000.00,'NXB Lao Động',8),(32,'Song Hong Bing','https://cdn0.fahasa.com/media/catalog/product/9/7/9786043606492.jpg','Chiến Tranh Tiền Tệ - Phần 5',195000.00,'NXB Lao Động',8),(33,'Tim Clark, Bruce Hazen','https://cdn0.fahasa.com/media/catalog/product/8/9/8936066685252_1.jpg','Mô Hình Kinh Doanh Nhóm',299000.00,'NXB Lao Động',8),(34,'Duncan Bannatyne','https://cdn0.fahasa.com/media/catalog/product/t/i/tien-de-ra-tien-1.jpg','Tiền Đẻ Ra Tiền - Đầu Tư Tài Chính Thông Minh',139000.00,'NXB Hồng Đức',8),(35,'Nguyễn Phi Vân','https://cdn0.fahasa.com/media/catalog/product/i/m/image_186119.jpg','Nhượng Quyền Khởi Nghiệp - Con Đường Ngắn Để Bước Ra Thế Giới',160000.00,'NXB Trẻ',8);
/*!40000 ALTER TABLE `t_books` ENABLE KEYS */;
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
