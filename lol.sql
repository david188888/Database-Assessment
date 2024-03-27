-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: lol
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `champion`
--

DROP TABLE IF EXISTS `champion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `champion` (
  `ChampionID` int NOT NULL AUTO_INCREMENT,
  `ChampionName` varchar(255) NOT NULL,
  `Ability` varchar(255) DEFAULT NULL,
  `PlayStyle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ChampionID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `champion`
--

LOCK TABLES `champion` WRITE;
/*!40000 ALTER TABLE `champion` DISABLE KEYS */;
INSERT INTO `champion` VALUES (1,'Aatrox','The Darkin Blade','Fighter'),(2,'Ahri','The Nine-Tailed Fox','Mage'),(3,'Akali','The Rogue Assassin','Assassin'),(4,'Aphelios','The Weapon of the Faithful','Marksman'),(5,'Annie','The Dark Child','Mage'),(6,'Camille','The Steel Shadow','Fighter'),(7,'Darius','The Hand of Noxus','Fighter'),(8,'Draven','The Glorious Executioner','Marksman');
/*!40000 ALTER TABLE `champion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `championitem`
--

DROP TABLE IF EXISTS `championitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `championitem` (
  `ChampionItemID` int NOT NULL AUTO_INCREMENT,
  `ItemID` int DEFAULT NULL,
  `ChampionID` int DEFAULT NULL,
  PRIMARY KEY (`ChampionItemID`),
  KEY `ChampionID` (`ChampionID`),
  KEY `fk_correct_constraint_name` (`ItemID`),
  CONSTRAINT `championitem_ibfk_2` FOREIGN KEY (`ChampionID`) REFERENCES `champion` (`ChampionID`),
  CONSTRAINT `fk_correct_constraint_name` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `championitem`
--

LOCK TABLES `championitem` WRITE;
/*!40000 ALTER TABLE `championitem` DISABLE KEYS */;
INSERT INTO `championitem` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,1,5),(6,2,6),(7,3,7),(8,4,8),(9,1,3),(10,2,4),(11,3,1),(12,4,2),(13,3,5),(14,4,6),(15,1,7),(16,3,2),(17,2,5);
/*!40000 ALTER TABLE `championitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `championrune`
--

DROP TABLE IF EXISTS `championrune`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `championrune` (
  `ChampionRuneID` int NOT NULL AUTO_INCREMENT,
  `RuneID` int DEFAULT NULL,
  `ChampionID` int DEFAULT NULL,
  PRIMARY KEY (`ChampionRuneID`),
  KEY `RuneID` (`RuneID`),
  KEY `ChampionID` (`ChampionID`),
  CONSTRAINT `championrune_ibfk_1` FOREIGN KEY (`RuneID`) REFERENCES `rune` (`RuneID`),
  CONSTRAINT `championrune_ibfk_2` FOREIGN KEY (`ChampionID`) REFERENCES `champion` (`ChampionID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `championrune`
--

LOCK TABLES `championrune` WRITE;
/*!40000 ALTER TABLE `championrune` DISABLE KEYS */;
INSERT INTO `championrune` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,1,5),(6,2,6),(7,3,7),(8,4,8),(9,1,4),(10,5,6),(11,6,7),(12,2,1);
/*!40000 ALTER TABLE `championrune` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interaction`
--

DROP TABLE IF EXISTS `interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interaction` (
  `InteractionID` int NOT NULL AUTO_INCREMENT,
  `ObjectiveName` varchar(255) NOT NULL,
  `TeamID` int DEFAULT NULL,
  `Impact` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`InteractionID`),
  KEY `TeamID` (`TeamID`),
  CONSTRAINT `interaction_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `team` (`TeamID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interaction`
--

LOCK TABLES `interaction` WRITE;
/*!40000 ALTER TABLE `interaction` DISABLE KEYS */;
INSERT INTO `interaction` VALUES (1,'Baron',1,'Break the build'),(2,'Dragon',1,'gain the advantage'),(3,'Baron',2,'Break the build'),(4,'Trrets',2,'Win the game'),(5,'Dragon',3,'gain the advantage'),(6,'Baron',4,'Break the build'),(7,'Dragon',5,'gain the advantage'),(8,'Turrets',6,'Win the game'),(9,'Baron',7,'Break the build'),(10,'Dragon',8,'gain the advantage'),(11,'Baron',9,'Break the build'),(12,'Turrets',10,'Win the game'),(13,'Dragon',11,'gain the advantage'),(14,'Baron',12,'Break the build'),(15,'Dragon',13,'gain the advantage'),(16,'Turrets',14,'Win the game'),(17,'Baron',15,'Break the build'),(18,'Dragon',16,'gain the advantage'),(19,'Baron',17,'Break the build'),(20,'Turrets',18,'Win the game'),(21,'Dragon',19,'gain the advantage'),(22,'Baron',20,'Break the build'),(23,'Dragon',21,'gain the advantage'),(24,'Turrets',22,'Win the game');
/*!40000 ALTER TABLE `interaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `ItemID` int NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(255) NOT NULL,
  `Cost` int DEFAULT NULL,
  `Effect` varchar(255) DEFAULT NULL,
  `Stats` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Control Ward',175,'Vision','Vision'),(2,'Sweeping Lens',55,'Vision','Vision'),(3,'Health Potion',89,'Health Regen','Health'),(4,'Mana Potion',65,'Mana Regen','Mana'),(5,'Doran Blade',450,'Attack Damage','Attack Damage');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match`
--

DROP TABLE IF EXISTS `match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match` (
  `MatchID` int NOT NULL AUTO_INCREMENT,
  `MatchDuration` int DEFAULT NULL,
  `MatchType` varchar(255) DEFAULT NULL,
  `Map` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MatchID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match`
--

LOCK TABLES `match` WRITE;
/*!40000 ALTER TABLE `match` DISABLE KEYS */;
INSERT INTO `match` VALUES (1,30,'Ranked','Howling Abyss'),(2,25,'Normal','Summoner\'s Rift'),(3,40,'Ranked','Twisted Treeline'),(4,35,'Ranked','Twisted Treeline'),(5,20,'Normal','Howling Abyss'),(6,45,'Ranked','Summoner\'s Rift'),(7,30,'Ranked','Twisted Treeline'),(8,25,'Normal','Howling Abyss'),(9,35,'Ranked','Summoner\'s Rift'),(10,40,'Ranked','Twisted Treeline'),(11,45,'Ranked','Summoner\'s Rift');
/*!40000 ALTER TABLE `match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchitem`
--

DROP TABLE IF EXISTS `matchitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matchitem` (
  `MatchItemID` int NOT NULL AUTO_INCREMENT,
  `MatchID` int DEFAULT NULL,
  `ChampionItemId` int DEFAULT NULL,
  `Role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MatchItemID`),
  KEY `MatchID` (`MatchID`),
  KEY `ChampionItemId` (`ChampionItemId`),
  CONSTRAINT `matchitem_ibfk_1` FOREIGN KEY (`MatchID`) REFERENCES `match` (`MatchID`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchitem`
--

LOCK TABLES `matchitem` WRITE;
/*!40000 ALTER TABLE `matchitem` DISABLE KEYS */;
INSERT INTO `matchitem` VALUES (1,1,1,'Top'),(2,1,5,'Mid'),(3,1,8,'Jungle'),(4,1,2,'ADC'),(5,1,7,'Support'),(6,1,5,'Top'),(7,1,6,'Mid'),(8,1,2,'Jungle'),(9,1,3,'ADC'),(10,1,7,'Support'),(11,2,1,'Top'),(12,2,5,'Mid'),(13,2,8,'Jungle'),(14,2,2,'ADC'),(15,2,7,'Support'),(16,2,5,'Top'),(17,2,6,'Mid'),(18,2,2,'Jungle'),(19,2,3,'ADC'),(20,2,7,'Support'),(21,3,1,'Top'),(22,3,5,'Mid'),(23,3,8,'Jungle'),(24,3,2,'ADC'),(25,3,7,'Support'),(26,3,2,'Top'),(27,3,6,'Mid'),(28,3,5,'Jungle'),(29,3,3,'ADC'),(30,3,7,'Support'),(31,4,1,'Top'),(32,4,5,'Mid'),(33,4,8,'Jungle'),(34,4,2,'ADC'),(35,4,7,'Support'),(36,4,2,'Top'),(37,4,6,'Mid'),(38,4,8,'Jungle'),(39,4,5,'ADC'),(40,4,7,'Support'),(41,5,1,'Top'),(42,5,5,'Mid'),(43,5,8,'Jungle'),(44,5,2,'ADC'),(45,5,6,'Support'),(46,5,5,'Top'),(47,5,6,'Mid'),(48,5,2,'Jungle'),(49,5,3,'ADC'),(50,5,7,'Support'),(51,5,1,'Top'),(52,5,5,'Mid'),(53,5,8,'Jungle'),(54,5,2,'ADC'),(55,5,7,'Support'),(56,6,1,'Top'),(57,6,5,'Mid'),(58,6,8,'Jungle'),(59,6,2,'ADC'),(60,6,6,'Support'),(61,6,2,'Top'),(62,6,6,'Mid'),(63,6,8,'Jungle'),(64,6,5,'ADC'),(65,6,7,'Support'),(66,7,1,'Top'),(67,7,5,'Mid'),(68,7,8,'Jungle'),(69,7,2,'ADC'),(70,7,6,'Support'),(71,7,5,'Top'),(72,7,6,'Mid'),(73,7,2,'Jungle'),(74,7,3,'ADC'),(75,7,7,'Support'),(76,8,1,'Top'),(77,8,5,'Mid'),(78,8,8,'Jungle'),(79,8,2,'ADC'),(80,8,7,'Support'),(81,8,2,'Top'),(82,8,5,'Mid'),(83,8,1,'Jungle'),(84,8,3,'ADC'),(85,8,7,'Support'),(86,9,1,'Top'),(87,9,5,'Mid'),(88,9,8,'Jungle'),(89,9,2,'ADC'),(90,9,3,'Support'),(91,9,2,'Top'),(92,9,6,'Mid'),(93,9,8,'Jungle'),(94,9,3,'ADC'),(95,9,7,'Support'),(96,10,1,'Top'),(97,10,5,'Mid'),(98,10,8,'Jungle'),(99,10,2,'ADC'),(100,10,4,'Support'),(101,10,2,'Top'),(102,10,6,'Mid'),(103,10,1,'Jungle'),(104,10,3,'ADC'),(105,10,7,'Support'),(106,11,1,'Top'),(107,11,5,'Mid'),(108,11,8,'Jungle'),(109,11,2,'ADC'),(110,11,3,'Support'),(111,11,1,'Top'),(112,11,6,'Mid'),(113,11,2,'Jungle'),(114,11,3,'ADC'),(115,11,7,'Support');
/*!40000 ALTER TABLE `matchitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchranking`
--

DROP TABLE IF EXISTS `matchranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matchranking` (
  `MatchRankingID` int NOT NULL AUTO_INCREMENT,
  `PlayerID` int DEFAULT NULL,
  `MatchID` int DEFAULT NULL,
  `Outcome` varchar(255) DEFAULT NULL,
  `Rank` int DEFAULT NULL,
  PRIMARY KEY (`MatchRankingID`),
  KEY `PlayerID` (`PlayerID`),
  KEY `MatchID` (`MatchID`),
  CONSTRAINT `matchranking_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`),
  CONSTRAINT `matchranking_ibfk_2` FOREIGN KEY (`MatchID`) REFERENCES `match` (`MatchID`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchranking`
--

LOCK TABLES `matchranking` WRITE;
/*!40000 ALTER TABLE `matchranking` DISABLE KEYS */;
INSERT INTO `matchranking` VALUES (1,1,1,'Win',1),(2,3,1,'Win',2),(3,6,1,'Win',3),(4,9,1,'Win',4),(5,5,1,'Win',5),(6,2,1,'Lose',6),(7,4,1,'Lose',7),(8,7,1,'Lose',8),(9,10,1,'Lose',9),(10,8,1,'Lose',10),(11,1,2,'Win',1),(12,3,2,'Win',2),(13,6,2,'Win',3),(14,9,2,'Win',4),(15,5,2,'Win',5),(16,2,2,'Lose',6),(17,4,2,'Lose',7),(18,7,2,'Lose',8),(19,10,2,'Lose',9),(20,8,2,'Lose',10),(21,1,3,'Win',1),(22,3,3,'Win',2),(23,6,3,'Win',3),(24,9,3,'Win',4),(25,5,3,'Win',5),(26,2,3,'Lose',6),(27,4,3,'Lose',7),(28,7,3,'Lose',8),(29,10,3,'Lose',9),(30,8,3,'Lose',10),(31,1,4,'Win',1),(32,3,4,'Win',2),(33,6,4,'Win',3),(34,9,4,'Win',4),(35,5,4,'Win',5),(36,2,4,'Lose',6),(37,4,4,'Lose',7),(38,7,4,'Lose',8),(39,10,4,'Lose',9),(40,8,4,'Lose',10),(41,1,5,'Win',1),(42,3,5,'Win',2),(43,6,5,'Win',3),(44,9,5,'Win',4),(45,5,5,'Win',5),(46,2,5,'Lose',6),(47,4,5,'Lose',7),(48,7,5,'Lose',8),(49,10,5,'Lose',9),(50,8,5,'Lose',10),(51,1,6,'Win',1),(52,3,6,'Win',2),(53,6,6,'Win',3),(54,9,6,'Win',4),(55,5,6,'Win',5),(56,2,6,'Lose',6),(57,4,6,'Lose',7),(58,7,6,'Lose',8),(59,10,6,'Lose',9),(60,8,6,'Lose',10),(61,1,7,'Win',1),(62,3,7,'Win',2),(63,6,7,'Win',3),(64,9,7,'Win',4),(65,5,7,'Win',5),(66,2,7,'Lose',6),(67,4,7,'Lose',7),(68,7,7,'Lose',8),(69,10,7,'Lose',9),(70,8,7,'Lose',10),(71,1,8,'Win',1),(72,3,8,'Win',2),(73,6,8,'Win',3),(74,9,8,'Win',4),(75,5,8,'Win',5),(76,2,8,'Lose',6),(77,4,8,'Lose',7),(78,7,8,'Lose',8),(79,10,8,'Lose',9),(80,8,8,'Lose',10),(81,1,9,'Win',1),(82,3,9,'Win',2),(83,6,9,'Win',3),(84,9,9,'Win',4),(85,5,9,'Win',5),(86,2,9,'Lose',6),(87,4,9,'Lose',7),(88,7,9,'Lose',8),(89,10,9,'Lose',9),(90,8,9,'Lose',10),(91,1,10,'Win',1),(92,3,10,'Win',2),(93,6,10,'Win',3),(94,9,10,'Win',4),(95,5,10,'Win',5),(96,2,10,'Lose',6),(97,4,10,'Lose',7),(98,7,10,'Lose',8),(99,10,10,'Lose',9),(100,8,10,'Lose',10),(101,1,11,'Win',1),(102,3,11,'Win',2),(103,6,11,'Win',3),(104,9,11,'Win',4),(105,5,11,'Win',5),(106,2,11,'Lose',6),(107,4,11,'Lose',7),(108,7,11,'Lose',8),(109,10,11,'Lose',9),(110,8,11,'Lose',10);
/*!40000 ALTER TABLE `matchranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `PlayerID` int NOT NULL AUTO_INCREMENT,
  `PlayerName` varchar(255) NOT NULL,
  PRIMARY KEY (`PlayerID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'David'),(2,'John'),(3,'Tom'),(4,'Jerry'),(5,'Mike'),(6,'Alice'),(7,'Bob'),(8,'Charlie'),(9,'Eve'),(10,'Grace');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerchampion`
--

DROP TABLE IF EXISTS `playerchampion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerchampion` (
  `PlayerChampionID` int NOT NULL AUTO_INCREMENT,
  `PlayerID` int DEFAULT NULL,
  `ChampionID` int DEFAULT NULL,
  `ChampionMasterLevel` int DEFAULT NULL,
  `Achievement` int DEFAULT NULL,
  PRIMARY KEY (`PlayerChampionID`),
  KEY `PlayerID` (`PlayerID`),
  KEY `ChampionID` (`ChampionID`),
  CONSTRAINT `playerchampion_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`),
  CONSTRAINT `playerchampion_ibfk_2` FOREIGN KEY (`ChampionID`) REFERENCES `champion` (`ChampionID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerchampion`
--

LOCK TABLES `playerchampion` WRITE;
/*!40000 ALTER TABLE `playerchampion` DISABLE KEYS */;
INSERT INTO `playerchampion` VALUES (1,1,1,70,3),(2,1,2,80,4),(3,2,1,90,5),(4,2,2,100,6),(5,3,5,70,3),(6,3,6,80,4),(7,4,5,90,5),(8,4,6,100,6),(9,5,4,70,3),(10,5,3,80,4),(11,5,6,90,5),(12,5,7,100,6),(13,6,8,90,5),(14,6,2,100,6),(15,7,1,70,3),(16,7,2,80,4),(17,7,8,90,5),(18,8,5,90,5),(19,8,7,100,6),(20,9,2,70,3),(21,9,8,80,4),(22,10,3,90,5),(23,10,5,100,6);
/*!40000 ALTER TABLE `playerchampion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerskin`
--

DROP TABLE IF EXISTS `playerskin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerskin` (
  `PlayerSkinID` int NOT NULL AUTO_INCREMENT,
  `PlayerID` int DEFAULT NULL,
  `SkinID` int DEFAULT NULL,
  PRIMARY KEY (`PlayerSkinID`),
  KEY `PlayerID` (`PlayerID`),
  KEY `SkinID` (`SkinID`),
  CONSTRAINT `playerskin_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`),
  CONSTRAINT `playerskin_ibfk_2` FOREIGN KEY (`SkinID`) REFERENCES `skin` (`SkinID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerskin`
--

LOCK TABLES `playerskin` WRITE;
/*!40000 ALTER TABLE `playerskin` DISABLE KEYS */;
INSERT INTO `playerskin` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,6),(5,3,5),(6,3,5),(7,4,2),(8,4,8),(9,5,1),(10,5,5);
/*!40000 ALTER TABLE `playerskin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rune`
--

DROP TABLE IF EXISTS `rune`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rune` (
  `RuneID` int NOT NULL AUTO_INCREMENT,
  `RuneName` varchar(255) NOT NULL,
  `Effect` varchar(255) DEFAULT NULL,
  `Cost` int DEFAULT NULL,
  `Stats` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RuneID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rune`
--

LOCK TABLES `rune` WRITE;
/*!40000 ALTER TABLE `rune` DISABLE KEYS */;
INSERT INTO `rune` VALUES (1,'Kleptomancy','Gold for hitting champions',504,'Gold'),(2,'Lethal Tempo','Increased attack speed',550,'Attack Speed'),(3,'Phase Rush','Burst of speed',840,'Movement Speed'),(4,'Press the Attack','Bonus damage on hits',400,'Adaptive Damage'),(5,'Fleet Footwork','Energized attacks build',1002,'Attack Speed'),(6,'Guardian','Shield and haste allies',860,'Shield'),(7,'Hail of Blades','Fast attack speed boost',798,'Attack Speed');
/*!40000 ALTER TABLE `rune` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skin`
--

DROP TABLE IF EXISTS `skin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skin` (
  `SkinID` int NOT NULL AUTO_INCREMENT,
  `ChampionID` int DEFAULT NULL,
  `SkinName` varchar(255) NOT NULL,
  PRIMARY KEY (`SkinID`),
  KEY `ChampionID` (`ChampionID`),
  CONSTRAINT `skin_ibfk_1` FOREIGN KEY (`ChampionID`) REFERENCES `champion` (`ChampionID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skin`
--

LOCK TABLES `skin` WRITE;
/*!40000 ALTER TABLE `skin` DISABLE KEYS */;
INSERT INTO `skin` VALUES (1,1,'Blood Moon'),(2,2,'High Noon'),(3,3,'Project'),(4,4,'Star Guardian'),(5,5,'Pulsefire'),(6,6,'Blood Moon'),(7,7,'High Noon'),(8,8,'Project'),(9,1,'Blood Moon'),(10,2,'High Noon'),(11,3,'Project'),(12,4,'Star Guardian'),(13,5,'Pulsefire'),(14,6,'Blood Moon'),(15,7,'High Noon'),(16,8,'Project');
/*!40000 ALTER TABLE `skin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `TeamID` int NOT NULL AUTO_INCREMENT,
  `MatchID` int DEFAULT NULL,
  PRIMARY KEY (`TeamID`),
  KEY `MatchID` (`MatchID`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`MatchID`) REFERENCES `match` (`MatchID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3),(7,4),(8,4),(9,5),(10,5),(11,6),(12,6),(13,7),(14,7),(15,8),(16,8),(17,9),(18,9),(19,10),(20,10),(21,11),(22,11);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teamplayer`
--

DROP TABLE IF EXISTS `teamplayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teamplayer` (
  `TeamPlayerID` int NOT NULL AUTO_INCREMENT,
  `TeamID` int DEFAULT NULL,
  `PlayerID` int DEFAULT NULL,
  `ChampionID` int DEFAULT NULL,
  `Role` varchar(255) DEFAULT NULL,
  `Kill` int DEFAULT NULL,
  `Death` int DEFAULT NULL,
  `Assist` int DEFAULT NULL,
  `GoldEarned` int DEFAULT NULL,
  `MinionKilled` int DEFAULT NULL,
  `Contribution` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TeamPlayerID`),
  KEY `TeamID` (`TeamID`),
  KEY `PlayerID` (`PlayerID`),
  KEY `ChampionID` (`ChampionID`),
  CONSTRAINT `teamplayer_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `team` (`TeamID`),
  CONSTRAINT `teamplayer_ibfk_2` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`),
  CONSTRAINT `teamplayer_ibfk_3` FOREIGN KEY (`ChampionID`) REFERENCES `champion` (`ChampionID`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teamplayer`
--

LOCK TABLES `teamplayer` WRITE;
/*!40000 ALTER TABLE `teamplayer` DISABLE KEYS */;
INSERT INTO `teamplayer` VALUES (1,1,1,1,'Top',10,2,5,15000,200,'Damage'),(2,1,3,5,'Mid',12,3,6,16000,250,'Damage'),(3,1,6,8,'Jungle',8,7,7,14000,150,'Damage'),(4,1,9,2,'ADC',15,1,8,17000,300,'Damage'),(5,1,5,7,'Support',2,2,15,12000,100,'Damage'),(6,2,2,5,'Top',10,2,5,15000,200,'Damage'),(7,2,4,6,'Mid',12,3,6,16000,250,'Damage'),(8,2,7,2,'Jungle',8,4,7,14000,150,'Damage'),(9,2,10,3,'ADC',15,7,8,17000,300,'Damage'),(10,2,8,7,'Support',2,2,15,12000,100,'Damage'),(11,3,1,1,'Top',10,2,5,15000,200,'Damage'),(12,3,3,5,'Mid',18,9,3,16000,250,'Damage'),(13,3,6,8,'Jungle',8,7,7,14000,150,'Damage'),(14,3,9,2,'ADC',15,1,8,17000,300,'Damage'),(15,3,5,7,'Support',2,2,15,12000,100,'Damage'),(16,4,2,5,'Top',10,2,5,15000,200,'Damage'),(17,4,4,6,'Mid',12,3,7,16000,250,'Damage'),(18,4,7,2,'Jungle',8,4,7,14000,150,'Damage'),(19,4,10,3,'ADC',15,1,8,17000,300,'Damage'),(20,4,8,7,'Support',2,2,15,12000,100,'Damage'),(21,5,1,1,'Top',10,2,5,15000,200,'Damage'),(22,5,3,5,'Mid',17,4,8,16000,250,'Damage'),(23,5,6,8,'Jungle',8,4,7,14000,150,'Damage'),(24,5,9,2,'ADC',15,1,8,17000,300,'Damage'),(25,5,5,7,'Support',2,2,15,12000,100,'Damage'),(26,6,7,2,'Top',10,2,5,15000,200,'Damage'),(27,6,4,6,'Mid',12,3,6,16000,250,'Damage'),(28,6,2,5,'Jungle',8,4,7,14000,150,'Damage'),(29,6,10,3,'ADC',15,1,8,17000,300,'Damage'),(30,6,8,7,'Support',2,2,15,12000,100,'Damage'),(31,7,1,1,'Top',10,2,5,15000,200,'Damage'),(32,7,3,5,'Mid',10,2,3,16000,250,'Damage'),(33,7,6,8,'Jungle',8,4,7,14000,150,'Damage'),(34,7,9,2,'ADC',15,1,8,17000,300,'Damage'),(35,7,5,7,'Support',2,2,15,12000,100,'Damage'),(36,8,2,2,'Top',10,2,5,15000,200,'Damage'),(37,8,4,6,'Mid',12,3,6,16000,250,'Damage'),(38,8,7,8,'Jungle',8,4,7,14000,150,'Damage'),(39,8,10,5,'ADC',15,1,8,17000,300,'Damage'),(40,8,8,7,'Support',2,2,15,12000,100,'Damage'),(41,9,1,1,'Top',10,2,5,15000,200,'Damage'),(42,9,3,5,'Mid',18,9,2,16000,250,'Damage'),(43,9,6,8,'Jungle',8,4,7,14000,150,'Damage'),(44,9,9,2,'ADC',15,1,7,17000,300,'Damage'),(45,9,5,6,'Support',2,2,15,12000,100,'Damage'),(46,10,2,5,'Top',10,2,5,15000,200,'Damage'),(47,10,4,6,'Mid',12,3,6,16000,250,'Damage'),(48,10,7,2,'Jungle',8,7,7,14000,150,'Damage'),(49,10,10,3,'ADC',15,1,8,17000,300,'Damage'),(50,10,8,7,'Support',7,2,15,12000,100,'Damage'),(51,11,1,1,'Top',10,2,5,15000,200,'Damage'),(52,11,3,5,'Mid',4,1,4,16000,250,'Damage'),(53,11,6,8,'Jungle',8,4,7,14000,150,'Damage'),(54,11,9,2,'ADC',15,1,7,17000,300,'Damage'),(55,11,5,6,'Support',2,7,15,12000,100,'Damage'),(56,12,2,2,'Top',10,2,5,15000,200,'Damage'),(57,12,4,6,'Mid',12,7,6,16000,250,'Damage'),(58,12,7,8,'Jungle',8,4,7,14000,150,'Damage'),(59,12,10,5,'ADC',15,1,8,17000,300,'Damage'),(60,12,8,7,'Support',7,2,15,12000,100,'Damage'),(61,13,1,1,'Top',10,2,5,15000,200,'Damage'),(62,13,3,5,'Mid',15,7,2,16000,250,'Damage'),(63,13,6,8,'Jungle',8,4,7,14000,150,'Damage'),(64,13,9,2,'ADC',15,1,7,17000,300,'Damage'),(65,13,5,6,'Support',2,7,15,12000,100,'Damage'),(66,14,2,5,'Top',10,2,5,15000,200,'Damage'),(67,14,4,6,'Mid',12,3,6,16000,250,'Damage'),(68,14,7,2,'Jungle',8,4,7,14000,150,'Damage'),(69,14,10,3,'ADC',15,1,8,17000,300,'Damage'),(70,14,8,7,'Support',2,2,15,12000,100,'Damage'),(71,15,1,1,'Top',7,2,7,15000,200,'Damage'),(72,15,3,5,'Mid',13,2,2,16000,250,'Damage'),(73,15,6,8,'Jungle',8,7,4,14000,150,'Damage'),(74,15,9,2,'ADC',15,1,8,17000,300,'Damage'),(75,15,5,7,'Support',2,2,15,12000,100,'Damage'),(76,16,2,2,'Top',7,2,5,15000,200,'Damage'),(77,16,4,5,'Mid',7,3,6,16000,250,'Damage'),(78,16,7,1,'Jungle',8,4,7,14000,150,'Damage'),(79,16,10,3,'ADC',15,1,8,17000,300,'Damage'),(80,16,8,7,'Support',2,2,15,12000,100,'Damage'),(81,17,1,1,'Top',10,7,5,15000,200,'Damage'),(82,17,3,5,'Mid',12,10,11,16000,250,'Damage'),(83,17,6,8,'Jungle',8,5,7,14000,150,'Damage'),(84,17,9,2,'ADC',15,1,8,17000,300,'Damage'),(85,17,5,3,'Support',2,2,15,12000,100,'Damage'),(86,18,2,2,'Top',10,2,7,15000,200,'Damage'),(87,18,4,6,'Mid',12,3,6,16000,250,'Damage'),(88,18,7,8,'Jungle',8,7,7,14000,150,'Damage'),(89,18,10,3,'ADC',7,1,8,17000,300,'Damage'),(90,18,8,7,'Support',2,2,15,12000,100,'Damage'),(91,19,1,1,'Top',10,2,5,15000,200,'Damage'),(92,19,3,5,'Mid',7,3,6,16000,250,'Damage'),(93,19,6,8,'Jungle',8,4,7,14000,150,'Damage'),(94,19,9,2,'ADC',15,1,8,17000,300,'Damage'),(95,19,5,4,'Support',7,2,15,12000,100,'Damage'),(96,20,7,2,'Top',10,7,5,15000,200,'Damage'),(97,20,4,6,'Mid',12,3,6,16000,250,'Damage'),(98,20,2,1,'Jungle',8,4,7,14000,150,'Damage'),(99,20,10,3,'ADC',15,7,8,17000,300,'Damage'),(100,20,8,7,'Support',2,2,15,12000,100,'Damage'),(101,21,1,1,'Top',10,2,5,15000,200,'Damage'),(102,21,3,5,'Mid',12,3,7,16000,250,'Damage'),(103,21,6,8,'Jungle',8,4,7,14000,150,'Damage'),(104,21,9,2,'ADC',15,1,8,17000,300,'Damage'),(105,21,5,3,'Support',2,7,15,12000,100,'Damage'),(106,22,2,1,'Top',10,2,5,15000,200,'Damage'),(107,22,4,6,'Mid',12,3,6,16000,250,'Damage'),(108,22,7,2,'Jungle',8,5,7,14000,150,'Damage'),(109,22,10,3,'ADC',15,1,8,17000,300,'Damage'),(110,22,8,7,'Support',7,2,15,12000,100,'Damage');
/*!40000 ALTER TABLE `teamplayer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-25 15:54:52
