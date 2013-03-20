-- MySQL dump 10.13  Distrib 5.5.20, for osx10.7 (i386)
--
-- Host: localhost    Database: agent_metrics
-- ------------------------------------------------------
-- Server version	5.5.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP DATABASE IF EXISTS `agent_metrics`;
CREATE DATABASE agent_metrics;
use `agent_metrics`;

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `permission` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `modify_time` varchar(100) DEFAULT NULL,
  `delete_time` varchar(100) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_account` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'chriss','12345678','李宗翰','title','chriss1008@msn.com',NULL,1,1,NULL,NULL,NULL,NULL,NULL),(2,'atenza','701008','李宗翰','title','atenza.lee@gmail.com',NULL,1,1,'1359358622',NULL,NULL,NULL,NULL),(6,'atenza','701008','李宗翰','<script>alert(\'hello','atenza.lee@gmail.comaa',NULL,1,1,'1359630330',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `cellphone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `company_title` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `birthday` varchar(100) DEFAULT NULL,
  `marriage` tinyint(1) DEFAULT NULL,
  `child_boy` int(11) DEFAULT NULL,
  `child_girl` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `company_address` varchar(400) DEFAULT NULL,
  `company_phone` varchar(20) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `modify_time` varchar(100) DEFAULT NULL,
  `delete_time` varchar(100) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  `fb_id` varchar(50) DEFAULT NULL,
  `identify_no` varchar(10) DEFAULT NULL,
  `thumbnail` varchar(200) DEFAULT NULL,
  `company_category` int(11) DEFAULT NULL,
  `personality` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_customer` (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES 
(70,'李宗翰','0911222333','新北市新店區中興路三段88號','0227787778','主任工程師','ct_huang@htc.com','1872739475',0,1,1,'','宏達國際股份有限公司','新北市新店區中興路三段88號4樓','0227761234','m',0,'1359045643','1359102345',NULL,NULL,NULL,NULL,'A123456789',NULL,0, 'D'),
(71,'黃鈞塘','0911222333','新北市新店區中興路三段88號','0227787778','主任工程師','ct_huang@htc.com','1872739475',0,1,1,'','宏達國際股份有限公司','新北市新店區中興路三段88號4樓','0227761234','m',1,'1359107343',NULL,NULL,NULL,NULL,NULL,'A123456789',NULL,1, 'I'),
(72,'CT Huang','0911222333','新北市新店區中興路三段88號','0227787778','主任工程師','ct_huang@htc.com','1872739475',0,1,1,'','宏達國際股份有限公司','新北市新店區中興路三段88號4樓','0227761234','m',0,'1359107344',NULL,NULL,NULL,NULL,NULL,'A123456789',NULL,2, 'S'),
(73,'王教昌','0911222333','新北市新店區中興路三段88號','0227787778','主任工程師','ct_huang@htc.com','1872739475',0,1,1,'','宏達國際股份有限公司','新北市新店區中興路三段88號4樓','0227761234','m',1,'1359107345',NULL,NULL,NULL,NULL,NULL,'A123456789',NULL,3, 'D'),
(74,'史黛西','0911222333','新北市新店區中興路三段88號','0227787778','主任工程師','ct_huang@htc.com','1872739475',0,1,1,'','宏達國際股份有限公司','新北市新店區中興路三段88號4樓','0227761234','f',1,'1359107346',NULL,NULL,NULL,NULL,NULL,'A123456789',NULL,4, 'C'),
(75,'Ted','0911222333','新北市新店區中興路三段88號','0227787778','主任工程師','ct_huang@htc.com','1872739475',0,1,1,NULL,'宏達國際股份有限公司','新北市新店區中興路三段88號4樓','0227761234','m',1,'1359887631',NULL,NULL,NULL,NULL,NULL,'A123456789',NULL,5, 'D'),
(76,'機八芹','0911222333','新北市新店區中興路三段88號','0227787778','主任工程師','ct_huang@htc.com','1872739475',0,1,1,NULL,'宏達國際股份有限公司','新北市新店區中興路三段88號4樓','0227761234','f',0,'1359888207',NULL,NULL,NULL,NULL,NULL,'A123456789',NULL,6, 'I'),
(77,'杜孟芹','0911222333','新北市新店區中興路三段88號','0227787778','主任工程師','ct_huang@htc.com','1872739475',0,1,1,NULL,'宏達國際股份有限公司','新北市新店區中興路三段88號4樓','0227761234','f',1,'1359888209',NULL,NULL,NULL,NULL,NULL,'A123456789',NULL,7, 'S');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_evaluation`
--

DROP TABLE IF EXISTS `customer_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `income_monthly` double DEFAULT NULL,
  `age` double DEFAULT NULL,
  `marriage` double DEFAULT NULL,
  `dependent_count` double DEFAULT NULL,
  `known_time` double DEFAULT NULL,
  `contact_frequency` double DEFAULT NULL,
  `contact_difficulty` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_customer_eval` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_evaluation`
--

LOCK TABLES `customer_evaluation` WRITE;
/*!40000 ALTER TABLE `customer_evaluation` DISABLE KEYS */;
INSERT INTO `customer_evaluation` VALUES (16,70,4,1,3,2,4,2,1,0.8,'1359102345'),(17,71,4,1,3,2,4,2,1,0.3,'1359107344'),(18,72,4,1,3,2,4,2,1,0.5,'1359107344'),(19,73,4,1,3,2,4,2,1,0.9,'1359107345'),(20,74,4,1,3,2,4,2,1,0.65,'1359107346'),(21,75,4,1,3,2,4,2,1,0.8,'1359887632'),(22,76,4,1,3,2,4,2,1,0.8,'1359888207'),(23,77,4,1,3,2,4,2,1,0.8,'1359888209');
/*!40000 ALTER TABLE `customer_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_relationship`
--

DROP TABLE IF EXISTS `customer_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_relationship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `relationship_id` int(11) NOT NULL,
  `related` int(11) NOT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `modify_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_customer_relationship` (`relationship_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_relationship`
--

LOCK TABLES `customer_relationship` WRITE;
/*!40000 ALTER TABLE `customer_relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_relationship` ENABLE KEYS */;
INSERT INTO `customer_relationship` VALUES (1, 70, 71, 1, NULL, NULL), (2, 71, 70, 1, NULL, NULL), (3, 71, 72, 2, NULL, NULL), (4, 72, 71, 2, NULL, NULL), (5, 70, 73, 3, NULL, NULL), (6, 73, 70, 3, NULL, NULL);

UNLOCK TABLES;

--
-- Table structure for table `customer_tags`
--

DROP TABLE IF EXISTS `customer_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `tag` varchar(15) DEFAULT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_customer_tags` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_tags`
--

LOCK TABLES `customer_tags` WRITE;
/*!40000 ALTER TABLE `customer_tags` DISABLE KEYS */;
INSERT INTO `customer_tags` VALUES (32,70,'可愛可愛','1359102345',NULL),(33,70,'大方大方','1359102345',NULL),(34,70,'健談','1359102345',NULL),(35,70,'辣妹','1359102345',NULL),(36,71,'可愛可愛','1359107344',NULL),(37,71,'大方大方','1359107344',NULL),(38,71,'健談','1359107344',NULL),(39,71,'辣妹','1359107344',NULL),(40,72,'可愛可愛','1359107345',NULL),(41,72,'大方大方','1359107345',NULL),(42,72,'健談','1359107345',NULL),(43,72,'辣妹','1359107345',NULL),(44,73,'可愛可愛','1359107345',NULL),(45,73,'大方大方','1359107345',NULL),(46,73,'健談','1359107345',NULL),(47,73,'辣妹','1359107345',NULL),(48,74,'可愛可愛','1359107346',NULL),(49,74,'大方大方','1359107346',NULL),(50,74,'健談','1359107346',NULL),(51,74,'辣妹','1359107346',NULL),(52,75,'可愛可愛','1359887632',NULL),(53,75,'大方大方','1359887632',NULL),(54,75,'健談','1359887632',NULL),(55,75,'辣妹','1359887632',NULL),(56,76,'可愛可愛','1359888207',NULL),(57,76,'大方大方','1359888207',NULL),(58,76,'健談','1359888207',NULL),(59,76,'辣妹','1359888207',NULL),(60,77,'可愛可愛','1359888209',NULL),(61,77,'大方大方','1359888209',NULL),(62,77,'健談','1359888209',NULL),(63,77,'辣妹','1359888209',NULL);
/*!40000 ALTER TABLE `customer_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_visit_history`
--

DROP TABLE IF EXISTS `customer_visit_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_visit_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(100) NOT NULL,
  `place` varchar(100) DEFAULT NULL,
  `detail` text,
  `customer_id` int(11) DEFAULT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `modify_time` varchar(100) DEFAULT NULL,
  `delete_time` varchar(100) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_visit_history`
--

LOCK TABLES `customer_visit_history` WRITE;
/*!40000 ALTER TABLE `customer_visit_history` DISABLE KEYS */;
INSERT INTO `customer_visit_history` VALUES (1,'19473013497549','中興路星巴克','向鈞塘說明大四喜10年期壽險,並且約定下次要介紹醫療險。',70,'1838759373',NULL,NULL,NULL,NULL);
INSERT INTO `customer_visit_history` VALUES (2,'19473013480149','中興路星巴克','只是閒聊',70,'1838759373',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `customer_visit_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_type` varchar(20) DEFAULT NULL,
  `group_name` varchar(100) DEFAULT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `modify_time` varchar(100) DEFAULT NULL,
  `delete_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship`
--

DROP TABLE IF EXISTS `relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(30) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship`
--

LOCK TABLES `relationship` WRITE;
/*!40000 ALTER TABLE `relationship` DISABLE KEYS */;
INSERT INTO `relationship` VALUES (1,'朋友',NULL),(2,'同學',NULL),(3,'兄弟',NULL),(4,'姊妹',NULL);
/*!40000 ALTER TABLE `relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` varchar(100) NOT NULL,
  `end_time` varchar(100) NOT NULL,
  `detail` text,
  -- `customer_visit_history_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `start_day` int(11) NOT NULL,
  `end_day` int(11) NOT NULL,
  `start_month` int(11) NOT NULL,
  `end_month` int(11) NOT NULL,
  `start_year` int(11) NOT NULL,
  `end_year` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `account_id` int(11) NOT NULL,
  `schedule_type` tinyint(1) NOT NULL,
  `create_time` varchar(100) DEFAULT NULL,
  `modify_time` varchar(100) DEFAULT NULL,
  `delete_time` varchar(100) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  `complete` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  -- UNIQUE KEY `pk_schedule_0` (`customer_visit_history_id`),
  KEY `idx_schedule` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'19473013497549','19473013497549','約鈞塘吃飯。',1,3,3,2,2,2013,2013,'約鈞塘吃飯。',1,1,'19473013497549','19473013497549','19473013497549',1,1,0);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(50) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_team` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `detail` text,
  `create_time` varchar(100) DEFAULT NULL,
  `modify_time` varchar(100) DEFAULT NULL,
  `delete_time` varchar(100) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk_transaction_0` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-03 18:52:07
