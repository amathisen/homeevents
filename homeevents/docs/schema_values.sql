-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: homeevents
-- ------------------------------------------------------
-- Server version	5.7.36

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) DEFAULT NULL,
  `description` mediumtext,
  `activity_result_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_result_id_idx` (`activity_result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'Magic - Commander','A game of Magic the Gathering Commander',2),(2,'Cornhole','A game of cornhole',3),(3,'Go First D20 Dice Roll','A roll of the dice',1);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_result`
--

DROP TABLE IF EXISTS `activity_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `highest_wins` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_result`
--

LOCK TABLES `activity_result` WRITE;
/*!40000 ALTER TABLE `activity_result` DISABLE KEYS */;
INSERT INTO `activity_result` VALUES (1,'D20 Result',1),(2,'Placement',0),(3,'Points',1);
/*!40000 ALTER TABLE `activity_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `title` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id_idx` (`location_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,1,'2024-01-01 00:00:00','test magic1 andrews'),(2,1,'2024-01-01 00:00:00','test magic2 andrews'),(3,1,'2024-01-01 00:00:00','test multiple andrews'),(4,2,'2024-01-01 00:00:00','test magic1 kenyon'),(5,2,'2024-01-01 00:00:00','test magic2 kenyon');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_activities`
--

DROP TABLE IF EXISTS `event_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id_idx` (`event_id`),
  KEY `activity_id_idx` (`activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_activities`
--

LOCK TABLES `event_activities` WRITE;
/*!40000 ALTER TABLE `event_activities` DISABLE KEYS */;
INSERT INTO `event_activities` VALUES (1,'Game 1',1,3),(2,'Game 1',1,1),(3,'Game 2',1,3),(4,'Game 2',1,1),(5,'Game 1',3,3),(6,'Game 1',3,1),(7,'Exercise',3,2);
/*!40000 ALTER TABLE `event_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_activities_results`
--

DROP TABLE IF EXISTS `event_activities_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_activities_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_activities_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `activity_result_id` int(11) DEFAULT NULL,
  `result_value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_activities_id_idx` (`event_activities_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `activity_result_id_idx` (`activity_result_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_activities_results`
--

LOCK TABLES `event_activities_results` WRITE;
/*!40000 ALTER TABLE `event_activities_results` DISABLE KEYS */;
INSERT INTO `event_activities_results` VALUES (1,1,1,1,'5'),(2,1,2,1,'10'),(3,1,3,1,'15'),(4,1,4,1,'20'),(5,1,5,1,'1'),(6,2,1,2,'1'),(7,2,2,2,'2'),(8,2,3,2,'3'),(9,2,4,2,'4'),(10,2,5,2,'5'),(11,1,5,1,'5'),(12,1,4,1,'10'),(13,1,3,1,'15'),(14,1,2,1,'20'),(15,1,1,1,'1'),(16,2,5,2,'1'),(17,2,4,2,'2'),(18,2,3,2,'3'),(19,2,2,2,'4'),(20,2,1,2,'5'),(21,3,1,1,'3'),(22,3,2,1,'8'),(23,3,3,1,'13'),(24,3,4,1,'18'),(25,3,5,1,'1'),(26,4,1,2,'2'),(27,4,2,2,'3'),(28,4,3,2,'4'),(29,4,4,2,'5'),(30,4,5,2,'1');
/*!40000 ALTER TABLE `event_activities_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_users`
--

DROP TABLE IF EXISTS `event_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id_idx` (`event_id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_users`
--

LOCK TABLES `event_users` WRITE;
/*!40000 ALTER TABLE `event_users` DISABLE KEYS */;
INSERT INTO `event_users` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,3,1),(7,3,2),(8,3,3),(9,3,4),(10,3,5);
/*!40000 ALTER TABLE `event_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'test andrews','maple valley'),(2,'test kenyons','renton');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `object_type_id` int(11) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `note_text` mediumtext,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `object_type_id_idx` (`object_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,1,'2024-08-06 21:03:41',1,1,'andrews house');
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_type`
--

DROP TABLE IF EXISTS `object_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) DEFAULT NULL,
  `base_table_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_type`
--

LOCK TABLES `object_type` WRITE;
/*!40000 ALTER TABLE `object_type` DISABLE KEYS */;
INSERT INTO `object_type` VALUES (1,'Location','location'),(2,'Event','event'),(3,'Object Type','object_type'),(4,'Event Activities','event_activities'),(5,'Event Users','event_users'),(6,'Event Activities Results','event_activities_results'),(7,'Activity','activity'),(8,'Activity Result','activity_result'),(9,'User','user');
/*!40000 ALTER TABLE `object_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Aaron'),(2,'Andrew'),(3,'Evan'),(4,'James'),(5,'Kenyon');
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

-- Dump completed on 2024-08-07 14:36:03
