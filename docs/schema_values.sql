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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (4,'Magic the Gathering - Commander','A game of commander. No banlist, proxies okay',6),(5,'Go First Dice Roll','Highest roll goes 1st!',5),(6,'Go First Dice Re-Roll','Ties are broken here',5),(7,'Mulligan','Count of mulligans taken',7);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_object`
--

DROP TABLE IF EXISTS `activity_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_object_type_id` int(11) DEFAULT NULL,
  `name` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_object_type_id_idx` (`activity_object_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_object`
--

LOCK TABLES `activity_object` WRITE;
/*!40000 ALTER TABLE `activity_object` DISABLE KEYS */;
INSERT INTO `activity_object` VALUES (1,1,'Tergrid, God of Fright'),(2,1,'Oloro, Ageless Ascetic'),(3,1,'Anowon, the Ruin Thief'),(4,1,'Korvold, Fae-Cursed King'),(5,1,'Zhulodok, Void Gorger'),(6,1,'Xenagos, God of Revels'),(7,1,'Edgar Markov'),(8,1,'Hylda of the Icy Crown');
/*!40000 ALTER TABLE `activity_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_object_property`
--

DROP TABLE IF EXISTS `activity_object_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_object_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_object_id` int(11) DEFAULT NULL,
  `name` varchar(90) DEFAULT NULL,
  `value` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_object_id_idx` (`activity_object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_object_property`
--

LOCK TABLES `activity_object_property` WRITE;
/*!40000 ALTER TABLE `activity_object_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_object_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_object_type`
--

DROP TABLE IF EXISTS `activity_object_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_object_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) DEFAULT NULL,
  `name` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_id_idx` (`activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_object_type`
--

LOCK TABLES `activity_object_type` WRITE;
/*!40000 ALTER TABLE `activity_object_type` DISABLE KEYS */;
INSERT INTO `activity_object_type` VALUES (1,4,'Commander Deck');
/*!40000 ALTER TABLE `activity_object_type` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_result`
--

LOCK TABLES `activity_result` WRITE;
/*!40000 ALTER TABLE `activity_result` DISABLE KEYS */;
INSERT INTO `activity_result` VALUES (5,'D20 Result',1),(6,'Placement',0),(7,'Mulligan Count',0);
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (6,3,'2024-08-11 00:00:00','3 player commander');
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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_activities`
--

LOCK TABLES `event_activities` WRITE;
/*!40000 ALTER TABLE `event_activities` DISABLE KEYS */;
INSERT INTO `event_activities` VALUES (8,'Game 1',6,5),(9,'Game 1',6,7),(10,'Game 1',6,4),(11,'Game 2',6,5),(12,'Game 2',6,7),(13,'Game 2',6,4),(14,'Game 3',6,5),(15,'Game 3',6,7),(16,'Game 3',6,4);
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
  `result_value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_activities_id_idx` (`event_activities_id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_activities_results`
--

LOCK TABLES `event_activities_results` WRITE;
/*!40000 ALTER TABLE `event_activities_results` DISABLE KEYS */;
INSERT INTO `event_activities_results` VALUES (31,8,9,'17'),(32,8,10,'20'),(33,8,11,'5'),(34,9,9,'1'),(35,10,9,'1'),(36,10,10,'2'),(37,10,11,'3'),(38,11,9,'10'),(39,11,10,'7'),(40,11,11,'14'),(41,12,10,'1'),(42,13,9,'2'),(43,13,10,'1'),(44,13,11,'2'),(45,14,9,'5'),(46,14,10,'15'),(47,14,11,'16'),(48,16,9,'3'),(49,16,10,'1'),(50,16,11,'2');
/*!40000 ALTER TABLE `event_activities_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_activities_results_objects`
--

DROP TABLE IF EXISTS `event_activities_results_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_activities_results_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_activities_results_id` int(11) DEFAULT NULL,
  `activity_object_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_activities_results_id_idx` (`event_activities_results_id`),
  KEY `activity_object_id_idx` (`activity_object_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_activities_results_objects`
--

LOCK TABLES `event_activities_results_objects` WRITE;
/*!40000 ALTER TABLE `event_activities_results_objects` DISABLE KEYS */;
INSERT INTO `event_activities_results_objects` VALUES (1,35,1),(2,36,2),(3,37,3),(4,42,4),(5,43,2),(6,44,3),(7,48,5),(8,49,6),(9,50,3);
/*!40000 ALTER TABLE `event_activities_results_objects` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_users`
--

LOCK TABLES `event_users` WRITE;
/*!40000 ALTER TABLE `event_users` DISABLE KEYS */;
INSERT INTO `event_users` VALUES (11,6,9),(12,6,10),(13,6,11);
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (3,'Andrew\'s place','Maple Valley'),(4,'Kenyon\'s place','Renton');
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
  `object_type` varchar(90) DEFAULT NULL,
  `object_identifier` int(11) DEFAULT NULL,
  `note_text` mediumtext,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_type`
--

LOCK TABLES `object_type` WRITE;
/*!40000 ALTER TABLE `object_type` DISABLE KEYS */;
INSERT INTO `object_type` VALUES (10,'Activity','activity'),(11,'Activity Result','activity_result'),(12,'Event','event'),(13,'Event Activities','event_activities'),(14,'Event Activities Results','event_activities_results'),(15,'Event Users','event_users'),(16,'Location','location'),(17,'Notes','notes'),(18,'Object Type','object_type'),(19,'User','user'),(20,'Activity Object Type','activity_object_type'),(21,'Activity Object','activity_object'),(22,'Activity Object Property','activity_object_property'),(23,'Event Activities Results Objects','event_activities_results_objects');
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (9,'Aaron'),(10,'Andrew'),(11,'Evan'),(12,'Kenyon');
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

-- Dump completed on 2024-10-08 17:09:46
