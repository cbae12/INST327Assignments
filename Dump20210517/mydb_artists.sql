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
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artists` (
  `artist_id` int NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(45) NOT NULL,
  `total_artist_albums` decimal(5,1) DEFAULT NULL,
  `artist_link` blob NOT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Al Stewart',54.0,_binary 'https://www.discogs.com/artist/148394-Al-Stewart'),(2,'Band Aid',2.0,_binary 'https://www.discogs.com/artist/136704-Band-Aid'),(3,'Barbra Streisand',58.0,_binary 'https://www.discogs.com/artist/53248-Barbra-Streisand'),(4,'Bee Gees',32.0,_binary 'https://www.discogs.com/artist/97664-Bee-Gees'),(5,'Blackmore\'s Rainbow',34.0,_binary 'https://www.discogs.com/artist/245648-Rainbow'),(6,'Blood, Sweat And Tears',21.0,_binary 'https://www.discogs.com/artist/168907-Blood-Sweat-And-Tears'),(7,'Bon Iver',4.0,_binary 'https://www.discogs.com/artist/1042739-Bon-Iver'),(8,'Bowie',87.0,_binary 'https://www.discogs.com/artist/10263-David-Bowie'),(9,'Bread',12.0,_binary 'https://www.discogs.com/artist/303471-Bread'),(10,'Bryan Adams',48.0,_binary 'https://www.discogs.com/artist/10933-Bryan-Adams'),(11,'Cannonball Adderley',70.0,_binary 'https://www.discogs.com/artist/61585-Cannonball-Adderley'),(12,'Carole King',31.0,_binary 'https://www.discogs.com/artist/266352-Carole-King'),(13,'Chic',16.0,_binary 'https://www.discogs.com/artist/9081-Chic'),(14,'Daft Punk',8.0,_binary 'https://www.discogs.com/artist/1289-Daft-Punk'),(15,'Elvis Presley',396.0,_binary 'https://www.discogs.com/artist/27518-Elvis-Presley');
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-17 17:06:18
