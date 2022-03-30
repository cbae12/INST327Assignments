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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `album_name` varchar(80) NOT NULL,
  `number_of_songs` decimal(3,0) NOT NULL,
  `average_song_length` decimal(5,3) DEFAULT NULL,
  `album_link` blob NOT NULL,
  `album_versions` decimal(4,0) DEFAULT NULL,
  `release_id` int NOT NULL,
  `artist_id` int NOT NULL,
  PRIMARY KEY (`album_id`),
  KEY `fk_albums_releases1_idx` (`release_id`),
  KEY `fk_albums_artists1_idx` (`artist_id`),
  CONSTRAINT `fk_albums_artists1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`),
  CONSTRAINT `fk_albums_releases1` FOREIGN KEY (`release_id`) REFERENCES `releases` (`release_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,'Year Of The Cat',9,4.183,_binary 'https://www.discogs.com/Al-Stewart-Year-Of-The-Cat/master/90235',148,1,1),(2,'Do They Know It\'s Christmas?',3,4.083,_binary 'https://www.discogs.com/Band-Aid-Do-They-Know-Its-Christmas/master/57277	Phonogram',97,2,2),(3,'Guilty',9,4.633,_binary 'https://www.discogs.com/Barbra-Streisand-Guilty/master/74227',148,3,3),(4,'Spirits Having Flown',10,4.417,_binary 'https://www.discogs.com/Bee-Gees-Spirits-Having-Flown/master/23833',198,4,4),(5,'Rainbow Rising',6,5.500,_binary 'https://www.discogs.com/Blackmores-Rainbow-Rainbow-Rising/master/40614',208,5,5),(6,'Blood, Sweat And Tears',10,4.800,_binary 'https://www.discogs.com/Blood-Sweat-And-Tears-Blood-Sweat-And-Tears/master/35401',129,6,6),(7,'Bon Iver, Bon Iver',10,3.900,_binary 'https://www.discogs.com/Bon-Iver-Bon-Iver-Bon-Iver/master/345153',16,7,7),(8,'Diamond Dogs',11,3.617,_binary 'https://www.discogs.com/Bowie-Diamond-Dogs/master/20141',218,8,8),(9,'Pinups',12,2.833,_binary 'https://www.discogs.com/Bowie-Pinups/master/22208',214,9,8),(10,'The Best Of Bread',15,2.750,_binary 'https://www.discogs.com/Bread-The-Best-Of-Bread/master/85508',150,10,9),(11,'Reckless',10,3.700,_binary 'https://www.discogs.com/Bryan-Adams-Reckless/release/1451593',213,11,10),(12,'Somethin\' Else	',5,6.917,_binary 'https://www.discogs.com/Cannonball-Adderley-Somethin-Else/master/118117',169,12,11),(13,'Tapestry',12,3.733,_binary 'https://www.discogs.com/Carole-King-Tapestry/master/104166',336,13,12),(14,'C\'est Chic',8,5.233,_binary 'https://www.discogs.com/Chic-Cest-Chic/master/53087',86,14,13),(15,'Random Access Memories',13,5.817,_binary 'https://www.discogs.com/Daft-Punk-Random-Access-Memories/master/556257',41,15,14),(16,'Discovery',14,4.233,_binary 'https://www.discogs.com/Daft-Punk-Discovery/master/26647',83,16,14),(17,'Homework',16,4.717,_binary 'https://www.discogs.com/Daft-Punk-Homework/master/26629',66,17,14),(18,'Elvis\' Christmas Album',10,2.317,_binary '	https://www.discogs.com/Elvis-Presley-Elvis-Christmas-Album/master/107538',104,18,15);
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-17 17:07:37
