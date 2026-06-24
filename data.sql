-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: mine_safety
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

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
-- Table structure for table `camera`
--

DROP TABLE IF EXISTS `camera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camera` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rtsp_url` varchar(512) NOT NULL,
  `proxy_url` varchar(512) DEFAULT NULL,
  `channel_no` int DEFAULT NULL,
  `codec` varchar(16) DEFAULT NULL,
  `rtsp_username` varchar(64) DEFAULT NULL,
  `rtsp_password` varchar(512) DEFAULT NULL,
  `device_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_camera_device` (`device_id`),
  CONSTRAINT `fk_camera_device` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camera`
--

LOCK TABLES `camera` WRITE;
/*!40000 ALTER TABLE `camera` DISABLE KEYS */;
INSERT INTO `camera` VALUES (1,'rtmp://localhost:1935/live/test_output','http://218.199.69.79:80/live/test_output.live.flv',1,'H264','admin','admin123',1),(2,'rtsp://192.168.1.102:554/stream','http://218.199.69.79:80/live/test_output.live.flv',1,'H264','admin','admin123',2),(3,'rtsp://192.168.1.103:554/stream','http://218.199.69.79:80/live/test_output.live.flv',1,'H264','admin','admin123',7),(4,'rtsp://192.168.1.104:554/stream','http://218.199.69.79:80/live/cart_output.live.flv',1,'H264','admin','admin123',8),(5,'rtsp://192.168.1.105:554/stream','http://218.199.69.79:80/live/cart_output.live.flv',1,'H264','admin','admin123',9),(6,'rtsp://192.168.1.106:554/stream','http://218.199.69.79:80/live/cart_output.live.flv',1,'H264','admin','admin123',10),(7,'rtsp://192.168.1.107:554/stream','http://218.199.69.79:80/live/cart_output.live.flv',1,'H264','admin','admin123',11),(8,'rtsp://192.168.1.108:554/stream','http://218.199.69.79:80/live/cart_output.live.flv',1,'H264','admin','admin123',12),(9,'rtsp://192.168.1.109:554/stream','http://218.199.69.79:80/live/cart_output.live.flv',1,'H264','admin','admin123',13),(10,'rtsp://192.168.1.110:554/stream','http://218.199.69.79:80/live/cart_output.live.flv',1,'H264','admin','admin123',14),(11,'rtsp://192.168.1.111:554/stream','http://218.199.69.79:80/live/cart_output.live.flv',1,'H264','admin','admin123',15);
/*!40000 ALTER TABLE `camera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sn` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `device_type` varchar(32) NOT NULL,
  `area_id` int NOT NULL,
  `install_location` varchar(255) DEFAULT NULL,
  `online_status` tinyint NOT NULL DEFAULT '0',
  `last_heartbeat` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_device_code` (`sn`),
  KEY `idx_device_area` (`area_id`),
  CONSTRAINT `fk_device_area` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1,'SN001','主井口监控主机','摄像头',1,'主井口东侧',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(2,'SN002','副井口监控主机','摄像头',2,'副井口西侧',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(3,'SN003','采煤工作面A传感器','传感器',3,'采煤工作面A',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(4,'SN004','采煤工作面B传感器','传感器',4,'采煤工作面B',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(5,'SN005','掘进工作面A传感器','传感器',5,'掘进工作面A',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(6,'SN006','掘进工作面B传感器','传感器',6,'掘进工作面B',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(7,'SN007','运输大巷监控主机','摄像头',7,'运输大巷中段',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(8,'SN008','机电硐室监控主机','摄像头',8,'机电硐室',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(9,'SN009','变电所监控主机','摄像头',9,'变电所',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(10,'SN010','通风机房监控主机','摄像头',10,'通风机房',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(11,'SN011','主井绞车房监控主机','摄像头',11,'主井绞车房',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(12,'SN012','副井绞车房监控主机','摄像头',12,'副井绞车房',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(13,'SN013','井下炸药库监控主机','摄像头',13,'井下炸药库入口',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(14,'SN014','水泵房监控主机','摄像头',14,'水泵房',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(15,'SN015','压风机房监控主机','摄像头',15,'压风机房',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(16,'SN016','主井提升机','提升设备',11,'主井绞车房',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(17,'SN017','副井提升机','提升设备',12,'副井绞车房',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(18,'SN018','主通风机','通风设备',10,'通风机房',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(19,'SN019','局部通风机A','通风设备',5,'掘进工作面A',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(20,'SN020','局部通风机B','通风设备',6,'掘进工作面B',1,NULL,'2026-05-08 15:19:23','2026-05-08 15:19:23');
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `parent_id` int DEFAULT NULL,
  `area_type` varchar(32) NOT NULL,
  `risk_level` tinyint DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_area_code` (`code`),
  KEY `idx_area_parent` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'主井口','AREA_MAIN_WELL',NULL,'生产区',3,1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(2,'副井口','AREA_AUX_WELL',NULL,'生产区',3,1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(3,'采煤工作面A','AREA_COAL_A',NULL,'生产区',2,1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(4,'采煤工作面B','AREA_COAL_B',NULL,'生产区',2,1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(5,'掘进工作面A','AREA_TUNNEL_A',NULL,'生产区',2,1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(6,'掘进工作面B','AREA_TUNNEL_B',NULL,'生产区',2,1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(7,'运输大巷','AREA_TRANSPORT',NULL,'运输区',2,1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(8,'机电硐室','AREA_MECHANICAL',NULL,'机电区',1,1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(9,'变电所','AREA_POWER',NULL,'机电区',2,1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(10,'通风机房','AREA_VENTILATION',NULL,'通风区',1,1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(11,'主井绞车房','AREA_MAIN_WINCH',NULL,'提升区',2,1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(12,'副井绞车房','AREA_AUX_WINCH',NULL,'提升区',2,1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(13,'井下炸药库','AREA_EXPLOSIVE',NULL,'危险区',3,1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(14,'水泵房','AREA_PUMP',NULL,'机电区',1,1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(15,'压风机房','AREA_COMPRESSOR',NULL,'机电区',1,1,'2026-05-08 15:19:23','2026-05-08 15:19:23');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_code` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `department_id` int DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `employment_status` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_employee_code` (`employee_code`),
  UNIQUE KEY `uk_employee_username` (`username`),
  UNIQUE KEY `uk_employee_phone` (`phone`),
  KEY `idx_employee_dept` (`department_id`),
  CONSTRAINT `fk_employee_dept` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'EMP001','张伟','zhangwei','$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi',1,'13800138001',1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(2,'EMP002','李强','liqiang','$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi',2,'13800138002',1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(3,'EMP003','王芳','wangfang','$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi',3,'13800138003',1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(4,'EMP004','刘洋','liuyang','$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi',4,'13800138004',1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(5,'EMP005','陈明','chenming','$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi',5,'13800138005',1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(6,'EMP006','赵丽','zhaoli','$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi',6,'13800138006',1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(7,'EMP007','孙勇','sunyong','$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi',7,'13800138007',1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(8,'EMP008','周敏','zhoumin','$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi',8,'13800138008',1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(9,'EMP009','吴刚','wugang','$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi',9,'13800138009',1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(10,'EMP010','郑华','zhenghua','$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi',10,'13800138010',1,'2026-05-08 15:19:23','2026-05-08 15:19:23'),(11,'EMP100','wjkong','wjkong','$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi',1,'13800138100',1,'2026-05-08 15:20:44','2026-05-08 15:58:45'),(13,'13800138110','小陈','xiaochen','123456',1,NULL,1,'2026-05-12 20:56:54','2026-05-12 20:56:54');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-24 11:54:26
