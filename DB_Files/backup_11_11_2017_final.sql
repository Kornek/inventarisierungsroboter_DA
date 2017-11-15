-- MySQL dump 10.15  Distrib 10.0.31-MariaDB, for debian-linux-gnueabihf (armv7l)
--
-- Host: 0.0.0.0    Database: rfid_db
-- ------------------------------------------------------
-- Server version	10.0.31-MariaDB-0ubuntu0.16.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `rfid_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `rfid_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `rfid_db`;

--
-- Table structure for table `RunResults`
--

DROP TABLE IF EXISTS `RunResults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RunResults` (
  `R_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `R_LASTFOUND` date DEFAULT NULL,
  `R_FOUND_IN_LAST_RUN` tinyint(1) NOT NULL,
  `R_ROOMID` int(11) DEFAULT NULL,
  `R_TAGID` int(11) DEFAULT NULL,
  PRIMARY KEY (`R_ID`),
  KEY `FK_RUN_TAG_ID` (`R_TAGID`),
  CONSTRAINT `FK_RUN_TAG_ID` FOREIGN KEY (`R_TAGID`) REFERENCES `Tags` (`T_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RunResults`
--

LOCK TABLES `RunResults` WRITE;
/*!40000 ALTER TABLE `RunResults` DISABLE KEYS */;
INSERT INTO `RunResults` VALUES (1,NULL,0,2,NULL);
/*!40000 ALTER TABLE `RunResults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tags`
--

DROP TABLE IF EXISTS `Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tags` (
  `T_ID` int(11) NOT NULL AUTO_INCREMENT,
  `T_TYPE` int(11) DEFAULT NULL,
  `T_NAME` varchar(30) NOT NULL,
  `T_RFID` varchar(36) NOT NULL,
  PRIMARY KEY (`T_ID`),
  UNIQUE KEY `T_RFID` (`T_RFID`),
  KEY `FK_TAG_TYPE` (`T_TYPE`),
  CONSTRAINT `FK_TAG_TYPE` FOREIGN KEY (`T_TYPE`) REFERENCES `Types` (`TY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tags`
--

LOCK TABLES `Tags` WRITE;
/*!40000 ALTER TABLE `Tags` DISABLE KEYS */;
INSERT INTO `Tags` VALUES (1,2,'dog','do');
/*!40000 ALTER TABLE `Tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Types`
--

DROP TABLE IF EXISTS `Types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Types` (
  `TY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TY_NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`TY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Types`
--

LOCK TABLES `Types` WRITE;
/*!40000 ALTER TABLE `Types` DISABLE KEYS */;
INSERT INTO `Types` VALUES (1,'Room'),(2,'Laptop'),(3,'Dockingstation');
/*!40000 ALTER TABLE `Types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-15  6:20:30
