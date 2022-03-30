-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `releases`
--

DROP TABLE IF EXISTS `releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `releases` (
  `release_id` int NOT NULL AUTO_INCREMENT,
  `release_country` varchar(45) NOT NULL,
  `release_year` int DEFAULT NULL,
  `release_link` blob NOT NULL,
  PRIMARY KEY (`release_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releases`
--

LOCK TABLES `releases` WRITE;
/*!40000 ALTER TABLE `releases` DISABLE KEYS */;
INSERT INTO `releases` VALUES (1,'UK',1976,_binary 'https://www.discogs.com/Al-Stewart-Year-Of-The-Cat/release/8747181'),(2,'UK',1984,_binary 'https://www.discogs.com/Band-Aid-Do-They-Know-Its-Christmas/release/179411'),(3,'US',1980,_binary 'https://www.discogs.com/Barbra-Streisand-Guilty/release/1078681'),(4,'US',1979,_binary 'https://www.discogs.com/Bee-Gees-Spirits-Having-Flown/release/2699002'),(5,'UK',1976,_binary 'https://www.discogs.com/Blackmores-Rainbow-Rainbow-Rising/release/4483749'),(6,'US',1968,_binary 'https://www.discogs.com/Blood-Sweat-And-Tears-Blood-Sweat-And-Tears/release/1456515'),(7,'US',2011,_binary 'https://www.discogs.com/Bon-Iver-Bon-Iver-Bon-Iver/release/2940876'),(8,'UK',1974,_binary 'https://www.discogs.com/Bowie-Diamond-Dogs/release/3877179'),(9,'UK',1973,_binary 'https://www.discogs.com/Bowie-Pinups/release/440664'),(10,'US',1973,_binary 'https://www.discogs.com/Bread-The-Best-Of-Bread/release/7193851'),(11,'Europe',1984,_binary 'https://www.discogs.com/Bryan-Adams-Reckless/release/1451593'),(12,'US',1958,_binary 'https://www.discogs.com/Cannonball-Adderley-Somethin-Else/release/982633'),(13,'US',1971,_binary 'https://www.discogs.com/Carole-King-Tapestry/release/1395530'),(14,'US',1978,_binary 'https://www.discogs.com/Chic-Cest-Chic/release/952009'),(15,'UK',2013,_binary 'https://www.discogs.com/Daft-Punk-Random-Access-Memories/release/4570366'),(16,'UK',2001,_binary 'https://www.discogs.com/Daft-Punk-Discovery/release/2879'),(17,'UK',1997,_binary 'https://www.discogs.com/Daft-Punk-Homework/release/3676112'),(18,'US',1970,_binary 'https://www.discogs.com/Elvis-Presley-Elvis-Christmas-Album/release/1421937');
/*!40000 ALTER TABLE `releases` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-17 17:07:39
