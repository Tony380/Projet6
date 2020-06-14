-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: oc_pizza
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `command`
--

DROP TABLE IF EXISTS `command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `command` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `local_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `adress` varchar(250) NOT NULL,
  `zip_code` varchar(5) NOT NULL,
  `date` date NOT NULL,
  `payment_mode` varchar(15) NOT NULL,
  `card_number` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `pizzaiolo_id` int unsigned DEFAULT NULL,
  `deliveryman_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_command_local` (`local_id`),
  KEY `fk_command_user` (`user_id`,`pizzaiolo_id`,`deliveryman_id`),
  CONSTRAINT `fk_command_local` FOREIGN KEY (`local_id`) REFERENCES `local` (`id`),
  CONSTRAINT `fk_command_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `command`
--

LOCK TABLES `command` WRITE;
/*!40000 ALTER TABLE `command` DISABLE KEYS */;
INSERT INTO `command` VALUES
(1,1,1,'11 rue des moines','75001','2020-01-23','carte','2345267398763549','en livraison',4,7),
(2,3,2,'10 rue des peupliers','75003','2020-02-12','cash',NULL,'commande prête',8,NULL),
(3,2,3,'30 avenue des lombards','75002','2020-02-14','carte','2369236235707575','en preparation',10,NULL),
(4,2,6,'44, boulevard schumann','75002','2020-02-15','cash',NULL,'livrée',10,11),
(5,1,6,'21, rue paul doumer','75002','2020-02-17','carte','2345876598463647','en attente',NULL,NULL);
/*!40000 ALTER TABLE `command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `command_detail`
--

DROP TABLE IF EXISTS `command_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `command_detail` (
  `command_id` int unsigned NOT NULL,
  `pizza_id` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  KEY `fk_detail_command` (`command_id`) /*!80000 INVISIBLE */,
  KEY `fk_detail_pizza` (`pizza_id`),
  CONSTRAINT `fk_detail_command` FOREIGN KEY (`command_id`) REFERENCES `command` (`id`),
  CONSTRAINT `fk_detail_pizza` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `command_detail`
--

LOCK TABLES `command_detail` WRITE;
/*!40000 ALTER TABLE `command_detail` DISABLE KEYS */;
INSERT INTO `command_detail` VALUES (1,1,1),(1,2,1),(2,3,1),(3,4,2),(3,5,1),(4,2,1);
/*!40000 ALTER TABLE `command_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'gruyere','fromage gruyere'),
(2,'tomate','tomate fruit'),(3,'viande','viande de boeuf'),
(4,'crevette','fruit de mer'),(5,'gorgonzolla','fromage italien'),
(6,'jambon','tranche de jambon');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local`
--

DROP TABLE IF EXISTS `local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `adress` varchar(250) NOT NULL,
  `zip_code` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local`
--

LOCK TABLES `local` WRITE;
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
INSERT INTO `local` VALUES (1,'25 avenue du general de gaulle','75001'),
(2,'33 rue du chat botte','75002'),(3,'77 rue du moulin','75003'),
(4,'12 rue de la faisanderie','75004'),(5,'23 boulevard schumann','75005');
/*!40000 ALTER TABLE `local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` mediumtext NOT NULL,
  `price` decimal(4,2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES (1,'napolitaine','jambon, gruyere',11.00),
(2,'margarita','tomate, gruyere',10.00),(3,'4 fromages','brie, gorgonzolla, roquefort, camembert',12.00),
(4,'florence','viande, gruyere, tomate, oignon',15.00),(5,'venise','crevette, tomate, gruyere',14.00);
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `pizza_id` int unsigned NOT NULL,
  `ingredient_id` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  `comments` mediumtext NOT NULL,
  KEY `fk_recipe_pizza` (`pizza_id`),
  KEY `fk_recipe_ingredient` (`ingredient_id`),
  CONSTRAINT `fk_recipe_ingredient` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
  CONSTRAINT `fk_recipe_pizza` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,1,20,'emincer gruyere'),(1,6,20,'emincer jambon'),(2,1,20,'emincer gruyere'),
(2,2,20,'couper les tomates en rondelles');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `local_id` int unsigned NOT NULL,
  `ingredient_id` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  KEY `fk_stock_local` (`local_id`),
  KEY `fk_stock_ingredient` (`ingredient_id`),
  CONSTRAINT `fk_stock_ingredient` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
  CONSTRAINT `fk_stock_local` FOREIGN KEY (`local_id`) REFERENCES `local` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,1000),(1,2,1000),(1,3,1500),(2,1,1000),(2,2,1000),(2,3,1500);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `job` varchar(15) DEFAULT NULL,
  `local_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_local` (`local_id`),
  CONSTRAINT `fk_user_local` FOREIGN KEY (`local_id`) REFERENCES `local` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'jean','dupuis','jdupuis@gmail.com','dupuisjean',NULL,NULL),
(2,'elodie','marchais','emarchais@gmail.com','marchaise',NULL,NULL),
(3,'marc','dupont','mdupont@gmail.com','dupontmarc',NULL,NULL),
(4,'henri','falaise','hfalaise@gmail.com','henrif','pizzaiolo',1),
(5,'nicolas','vernier','nicovernier@gmail.com','nicov','livreur',4),
(6,'fabrice','leconte','leconte@gmail.com','fableconte','manager',2),
(7,'robert','lancien','rlancien@gmail.com','rlancien','livreur',1),
(8,'max','durand','mdurand@gmail.com','mdurand','pizzaiolo',3),
(9,'heloise','dupont','edupont@gmail.com','edupont','livreur',3),
(10,'marie','lecointre','lecointre@gmail.com','mlec','pizzaiolo',2),
(11,'virginie','sapire','msapire@gmail.com','msap','livreur',2);
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

-- Dump completed on 2020-06-14 13:15:57
