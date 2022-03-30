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
-- Temporary view structure for view `single_album_rock_genre`
--

DROP TABLE IF EXISTS `single_album_rock_genre`;
/*!50001 DROP VIEW IF EXISTS `single_album_rock_genre`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `single_album_rock_genre` AS SELECT 
 1 AS `album_name`,
 1 AS `total_duration`,
 1 AS `genre_name`,
 1 AS `number_of_genres`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `single_album_rock_genre`
--

/*!50001 DROP VIEW IF EXISTS `single_album_rock_genre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `single_album_rock_genre` AS with `album_has_info` as (select `albums`.`album_id` AS `album_id`,`albums`.`album_name` AS `album_name`,`albums`.`number_of_songs` AS `number_of_songs`,`albums`.`average_song_length` AS `average_song_length`,`albums`.`album_link` AS `album_link`,`albums`.`album_versions` AS `album_versions`,`albums`.`release_id` AS `release_id`,`albums`.`artist_id` AS `artist_id`,`album_genre_info`.`genre_id` AS `genre_id` from (`albums` join `album_genre_info` on((`albums`.`album_id` = `album_genre_info`.`album_id`)))) select `album_has_info`.`album_name` AS `album_name`,sum((`album_has_info`.`number_of_songs` * `album_has_info`.`average_song_length`)) AS `total_duration`,`genres`.`genre_name` AS `genre_name`,count(`album_has_info`.`genre_id`) AS `number_of_genres` from (`album_has_info` join `genres` on((`album_has_info`.`genre_id` = `genres`.`genre_id`))) where `genres`.`genre_name` in (select `genres`.`genre_name` from (`album_genre_info` join `genres` on((`album_genre_info`.`genre_id` = `genres`.`genre_id`))) where (`genres`.`genre_name` = 'Rock')) group by `album_has_info`.`album_id` having (`number_of_genres` = 1) order by `total_duration` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-17 17:06:19
