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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_object`
--

LOCK TABLES `activity_object` WRITE;
/*!40000 ALTER TABLE `activity_object` DISABLE KEYS */;
INSERT INTO `activity_object` VALUES (1,1,'Tergrid, God of Fright'),(2,1,'Oloro, Ageless Ascetic'),(3,1,'Anowon, the Ruin Thief'),(4,1,'Korvold, Fae-Cursed King'),(5,1,'Zhulodok, Void Gorger'),(6,1,'Xenagos, God of Revels'),(7,1,'Edgar Markov'),(8,1,'Hylda of the Icy Crown'),(9,1,'Elenda, the Dusk Rose'),(10,1,'Kaalia of the Vast'),(11,1,'Eriette of the Charmed Apple'),(12,1,'Shaleeli, The Gifted'),(13,1,'Prosper, Tomb Bound'),(14,1,'Mondrak, Glory Dominus');
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (6,3,'2024-08-11 00:00:00','3 player commander'),(14,4,'2024-09-29 00:00:00','3 player commander'),(13,3,'2024-09-15 00:00:00','3 player commander'),(12,3,'2024-09-01 00:00:00','3 player commander'),(11,3,'2024-08-18 00:00:00','3 player commander'),(15,3,'2024-10-13 00:00:00','3 player commander');
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
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_activities`
--

LOCK TABLES `event_activities` WRITE;
/*!40000 ALTER TABLE `event_activities` DISABLE KEYS */;
INSERT INTO `event_activities` VALUES (8,'Game 1',6,5),(9,'Game 1',6,7),(10,'Game 1',6,4),(11,'Game 2',6,5),(12,'Game 2',6,7),(13,'Game 2',6,4),(14,'Game 3',6,5),(15,'Game 3',6,7),(16,'Game 3',6,4),(17,'Game 1',11,5),(18,'Game 1',11,7),(19,'Game 1',11,4),(20,'Game 2',11,5),(21,'Game 2',11,7),(22,'Game 2',11,4),(23,'Game 3',11,5),(24,'Game 3',11,6),(25,'Game 3',11,7),(26,'Game 3',11,4),(27,'Game 4',11,5),(28,'Game 4',11,7),(29,'Game 4',11,4),(30,'Game 1',12,5),(31,'Game 1',12,7),(32,'Game 1',12,4),(33,'Game 2',12,5),(34,'Game 2',12,7),(35,'Game 2',12,4),(36,'Game 3',12,5),(37,'Game 3',12,7),(38,'Game 3',12,4),(39,'Game 1',13,5),(40,'Game 1',13,7),(41,'Game 1',13,4),(42,'Game 2',13,5),(43,'Game 2',13,7),(44,'Game 2',13,4),(45,'Game 3',13,5),(46,'Game 3',13,6),(47,'Game 3',13,7),(48,'Game 3',13,4),(49,'Game 4',13,5),(50,'Game 4',13,7),(51,'Game 4',13,4),(52,'Game 1',14,5),(53,'Game 1',14,7),(54,'Game 1',14,4),(55,'Game 2',14,5),(56,'Game 2',14,7),(57,'Game 2',14,4),(58,'Game 3',14,5),(59,'Game 3',14,7),(60,'Game 3',14,4),(61,'Game 1',15,5),(62,'Game 1',15,7),(63,'Game 1',15,4),(64,'Game 2',15,5),(65,'Game 2',15,7),(66,'Game 2',15,4),(67,'Game 3',15,5),(68,'Game 3',15,7),(69,'Game 3',15,4);
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
) ENGINE=MyISAM AUTO_INCREMENT=184 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_activities_results`
--

LOCK TABLES `event_activities_results` WRITE;
/*!40000 ALTER TABLE `event_activities_results` DISABLE KEYS */;
INSERT INTO `event_activities_results` VALUES (31,8,9,'17'),(32,8,10,'20'),(33,8,11,'5'),(34,9,9,'1'),(35,10,9,'1'),(36,10,10,'2'),(37,10,11,'3'),(38,11,9,'10'),(39,11,10,'7'),(40,11,11,'14'),(41,12,10,'1'),(42,13,9,'2'),(43,13,10,'1'),(44,13,11,'2'),(45,14,9,'5'),(46,14,10,'15'),(47,14,11,'16'),(48,16,9,'3'),(49,16,10,'1'),(50,16,11,'2'),(51,17,9,'6'),(52,17,10,'16'),(53,17,11,'4'),(54,18,9,'1'),(55,18,10,'2'),(56,18,11,'2'),(57,19,9,'1'),(58,19,10,'3'),(59,19,11,'2'),(60,20,9,'20'),(61,20,10,'9'),(62,20,11,'14'),(63,21,9,'1'),(64,22,9,'1'),(65,22,10,'3'),(66,22,11,'2'),(67,23,9,'10'),(68,23,10,'10'),(69,23,11,'3'),(70,24,9,'4'),(71,24,10,'19'),(72,25,9,'1'),(73,26,9,'3'),(74,26,10,'2'),(75,26,11,'1'),(76,27,9,'8'),(77,27,10,'2'),(78,27,11,'7'),(79,28,9,'1'),(80,29,9,'1'),(81,29,10,'2'),(82,29,11,'3'),(83,30,9,'11'),(84,30,10,'19'),(85,30,11,'9'),(86,31,11,'1'),(87,32,9,'1'),(88,32,10,'3'),(89,32,11,'2'),(90,33,9,'19'),(91,33,10,'14'),(92,33,11,'17'),(93,34,9,'1'),(94,34,10,'1'),(95,35,9,'1'),(96,35,10,'2'),(97,35,11,'3'),(98,36,9,'14'),(99,36,10,'3'),(100,36,11,'18'),(101,37,11,'1'),(102,38,9,'3'),(103,38,10,'2'),(104,38,11,'1'),(105,39,9,'16'),(106,39,10,'17'),(107,39,11,'5'),(108,40,9,'2'),(109,41,9,'1'),(110,41,10,'2'),(111,41,11,'3'),(112,42,9,'7'),(113,42,10,'1'),(114,42,11,'6'),(115,43,11,'2'),(116,44,9,'1'),(117,44,10,'2'),(118,44,11,'3'),(119,45,9,'6'),(120,45,10,'12'),(121,45,11,'12'),(122,46,10,'12'),(123,46,11,'7'),(124,47,9,'1'),(125,47,11,'1'),(126,48,9,'3'),(127,48,10,'1'),(128,48,11,'2'),(129,49,9,'1'),(130,49,10,'6'),(131,49,11,'20'),(132,50,9,'1'),(133,50,11,'1'),(134,51,9,'3'),(135,51,10,'2'),(136,51,11,'1'),(137,52,12,'3'),(138,52,10,'19'),(139,52,11,'4'),(140,53,12,'1'),(141,54,12,'3'),(142,54,10,'1'),(143,54,11,'2'),(144,55,12,'10'),(145,55,10,'12'),(146,55,11,'11'),(147,56,12,'1'),(148,56,10,'1'),(149,56,11,'1'),(150,57,12,'2'),(151,57,10,'1'),(152,57,11,'3'),(153,58,12,'19'),(154,58,10,'13'),(155,58,11,'4'),(156,59,12,'2'),(157,59,11,'1'),(158,60,12,'2'),(159,60,10,'3'),(160,60,11,'1'),(161,61,9,'20'),(162,61,10,'7'),(163,61,11,'8'),(164,62,9,'1'),(165,62,11,'1'),(166,63,9,'3'),(167,63,10,'1'),(168,63,11,'2'),(169,64,9,'14'),(170,64,10,'17'),(171,64,11,'10'),(172,65,9,'1'),(173,65,11,'3'),(174,66,9,'2'),(175,66,10,'1'),(176,66,11,'3'),(177,67,9,'15'),(178,67,10,'1'),(179,67,11,'13'),(180,68,10,'1'),(181,69,9,'3'),(182,69,10,'1'),(183,69,11,'2');
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
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_activities_results_objects`
--

LOCK TABLES `event_activities_results_objects` WRITE;
/*!40000 ALTER TABLE `event_activities_results_objects` DISABLE KEYS */;
INSERT INTO `event_activities_results_objects` VALUES (1,35,1),(2,36,2),(3,37,3),(4,42,4),(5,43,2),(6,44,3),(7,48,5),(8,49,6),(9,50,3),(10,57,7),(11,58,6),(12,59,8),(13,64,1),(14,65,2),(15,66,8),(16,73,4),(17,74,2),(18,75,9),(19,80,5),(20,81,2),(21,82,9),(22,88,10),(23,89,3),(24,87,1),(25,95,4),(26,96,10),(27,97,11),(28,102,5),(29,103,10),(30,104,11),(31,109,1),(32,110,10),(33,111,9),(34,116,4),(35,117,10),(36,118,8),(37,126,7),(38,127,10),(39,128,11),(40,134,5),(41,135,10),(42,136,11),(43,141,12),(44,142,10),(45,143,11),(46,150,13),(47,151,10),(48,152,11),(49,158,14),(50,159,10),(51,160,11),(52,166,1),(53,167,10),(54,168,9),(55,174,4),(56,175,10),(57,176,9),(58,181,5),(59,182,2),(60,183,11);
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
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_users`
--

LOCK TABLES `event_users` WRITE;
/*!40000 ALTER TABLE `event_users` DISABLE KEYS */;
INSERT INTO `event_users` VALUES (11,6,9),(12,6,10),(13,6,11),(14,11,9),(15,11,10),(16,11,11),(20,12,9),(21,12,10),(22,12,11),(23,13,9),(24,13,10),(25,13,11),(26,14,12),(27,14,10),(28,14,11),(29,15,9),(30,15,10),(31,15,11);
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

-- Dump completed on 2024-10-16 15:44:35
