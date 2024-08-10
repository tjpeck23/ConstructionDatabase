CREATE DATABASE  IF NOT EXISTS `fodb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fodb`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: fodb
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `Builder`
--

DROP TABLE IF EXISTS `Builder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Builder` (
  `LicenseNo` int NOT NULL,
  `BuilderName` varchar(30) DEFAULT NULL,
  `BuilderAddress` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`LicenseNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Builder`
--

LOCK TABLES `Builder` WRITE;
/*!40000 ALTER TABLE `Builder` DISABLE KEYS */;
INSERT INTO `Builder` VALUES (12321,'Builder-5','2444 SMU Blvd, Dallas, TX'),(12345,'Builder-1','5596 E Bayshore Walk, Long Beach, CA'),(23456,'Builder-2','3208 Daniel Ave, Dallas, TX'),(34567,'Builder-3','3955 Buena Vista St., Dallas, TX'),(45678,'Builder-4','4111 Newton Ave, Dallas, TX');
/*!40000 ALTER TABLE `Builder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inspection`
--

DROP TABLE IF EXISTS `Inspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inspection` (
  `InspectionID` int NOT NULL,
  `InspectorID` smallint DEFAULT NULL,
  `LocationAddress` varchar(40) DEFAULT NULL,
  `RequestedBy` int DEFAULT NULL,
  `InspectionType` enum('FRM','PLU','POL','ELE','SAF','HAC','FNL','FN2','FN3','HIS') DEFAULT NULL,
  `Notes` varchar(50) DEFAULT NULL,
  `Cost` int DEFAULT NULL,
  `Score` int DEFAULT NULL,
  `DateInspected` date DEFAULT NULL,
  `Pass` enum('Pass','Fail') DEFAULT NULL,
  PRIMARY KEY (`InspectionID`),
  KEY `LocationAddress` (`LocationAddress`),
  KEY `RequestedBy` (`RequestedBy`),
  KEY `inspection_ibfk_1` (`InspectorID`),
  CONSTRAINT `inspection_ibfk_1` FOREIGN KEY (`InspectorID`) REFERENCES `Inspector` (`EID`),
  CONSTRAINT `inspection_ibfk_2` FOREIGN KEY (`LocationAddress`) REFERENCES `Location` (`LocationAddress`),
  CONSTRAINT `inspection_ibfk_3` FOREIGN KEY (`RequestedBy`) REFERENCES `Builder` (`LicenseNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inspection`
--

LOCK TABLES `Inspection` WRITE;
/*!40000 ALTER TABLE `Inspection` DISABLE KEYS */;
INSERT INTO `Inspection` VALUES (301,101,'300 Oak St., Dallas, TX',12345,'FRM','no problems noted',100,100,'2021-10-01','Pass'),(302,102,'302 Oak St., Dallas, TX',12345,'FRM','no problems noted',100,100,'2021-10-01','Pass'),(303,103,'100 Winding Wood, Carrolton, TX',45678,'FRM','no problems noted',100,100,'2021-10-01','Pass'),(304,101,'300 Oak St., Dallas, TX',12345,'PLU','minor leak, corrected',100,90,'2021-10-02','Pass'),(305,102,'302 Oak St., Dallas, TX',12345,'PLU','massive leaks',100,25,'2021-10-02','Fail'),(306,101,'300 Oak St., Dallas, TX',12345,'ELE','exposed junction box',100,80,'2021-10-03','Pass'),(307,101,'300 Oak St., Dallas, TX',12345,'HAC','duct needs taping',100,80,'2021-10-04','Pass'),(308,101,'300 Oak St., Dallas, TX',12345,'FNL','ready for owner',200,90,'2021-10-05','Pass'),(309,102,'302 Oak St., Dallas, TX',12345,'PLU','still leaking',100,50,'2021-10-08','Fail'),(310,102,'302 Oak St., Dallas, TX',12345,'PLU','no leaks, but messy',100,80,'2021-10-12','Pass'),(311,103,'210 Cherry Bark Lane, Plano, TX',12321,'FRM','no issues, but messy',100,85,'2021-10-12','Pass'),(312,102,'302 Oak St., Dallas, TX',12345,'ELE','no problems noted',100,100,'2021-10-14','Pass'),(313,104,'210 Cherry Bark Lane, Plano, TX',12321,'SAF','no problems noted',50,100,'2021-10-14','Pass'),(314,103,'100 Winding Wood, Carrolton, TX',45678,'PLU','everything working',100,100,'2021-10-20','Pass'),(315,103,'100 Winding Wood, Carrolton, TX',45678,'ELE','no problems noted',100,100,'2021-10-25','Pass'),(316,102,'302 Oak St., Dallas, TX',12345,'HAC','duct needs taping',100,80,'2021-11-01','Pass'),(317,103,'102 Winding Wood, Carrolton, TX',45678,'FRM','no problems noted',100,100,'2021-11-01','Pass'),(318,102,'302 Oak St., Dallas, TX',12345,'FNL','ready for owner',200,90,'2021-11-02','Pass'),(319,103,'100 Winding Wood, Carrolton, TX',45678,'HAC','no problems noted',100,100,'2021-11-02','Pass'),(320,103,'102 Winding Wood, Carrolton, TX',45678,'PLU','minor leak, corrected',100,90,'2021-11-02','Pass'),(321,105,'105 Industrial Ave., Fort Worth, TX',23456,'FRM','all work completed per checklist',100,100,'2021-11-02','Pass'),(322,103,'102 Winding Wood, Carrolton, TX',45678,'ELE','exposed junction box',100,80,'2021-11-03','Pass'),(323,103,'210 Cherry Bark Lane, Plano, TX',12321,'PLU','duct needs sealing',100,80,'2021-11-04','Pass'),(324,105,'210 Cherry Bark Lane, Plano, TX',12321,'POL','ready for owner',50,90,'2021-11-05','Pass'),(325,105,'100 Industrial Ave., Fort Worth, TX',23456,'FRM','okay',100,100,'2021-11-06','Pass'),(326,102,'100 Industrial Ave., Fort Worth, TX',23456,'PLU','no leaks',100,100,'2021-11-08','Pass'),(327,102,'100 Industrial Ave., Fort Worth, TX',23456,'POL','pool equipment okay',50,80,'2021-11-12','Pass'),(328,102,'100 Industrial Ave., Fort Worth, TX',23456,'FN3','no problems noted',150,100,'2021-11-14','Pass'),(330,104,'1420 Main St., Lewisville, TX',34567,'FRM','work not finished',100,50,'2023-11-21','Fail'),(331,104,'1420 Main St., Lewisville, TX',34567,'ELE','lights not completed',150,60,'2023-11-22','Fail'),(332,103,'100 Winding Wood, Carrolton, TX',45678,'POL','notes',50,90,'2023-11-28','Pass');
/*!40000 ALTER TABLE `Inspection` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pass_fail` BEFORE INSERT ON `inspection` FOR EACH ROW IF(NEW.Score < 75) THEN
	SET NEW.Pass = 'Fail';
ELSE
	SET NEW.Pass = 'Pass';
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `FRM` BEFORE INSERT ON `inspection` FOR EACH ROW BEGIN
	IF (NEW.InspectionType='FRM') THEN
    SET NEW.Cost=100;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validdate` BEFORE INSERT ON `inspection` FOR EACH ROW BEGIN
	IF (New.DateInspected < (SELECT DateFirstActivity FROM Location WHERE New.LocationAddress=Location.LocationAddress))
		THEN 
        SIGNAL SQLSTATE '45000';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `PLU` BEFORE INSERT ON `inspection` FOR EACH ROW BEGIN
	IF (NEW.InspectionType='PLU' AND 
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='FRM' AND LocationAddress=NEW.LocationAddress)>=1)
    THEN
    SET NEW.Cost=100;
    ELSEIF (NEW.InspectionType='PLU' AND 
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='FRM' AND LocationAddress=NEW.LocationAddress)<1)
    THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT='PLU Error';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `HAC` BEFORE INSERT ON `inspection` FOR EACH ROW BEGIN
	IF (NEW.InspectionType='HAC' AND 
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='ELE' AND LocationAddress=NEW.LocationAddress)>=1)
    THEN
		SET NEW.Cost=100;
	ELSEIF (NEW.InspectionType='HAC' AND 
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='ELE' AND LocationAddress=NEW.LocationAddress)<1)
    THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='HAC Error';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `POL` BEFORE INSERT ON `inspection` FOR EACH ROW BEGIN
	IF (NEW.InspectionType='POL' AND 
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='PLU' AND LocationAddress=NEW.LocationAddress)>=1)
    THEN
		SET NEW.Cost=50;
	ELSEIF (NEW.InspectionType='POL' AND 
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='PLU' AND LocationAddress=NEW.LocationAddress)<1)
    THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='POL Error';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `FNL` BEFORE INSERT ON `inspection` FOR EACH ROW BEGIN
	IF (NEW.InspectionType='FNL' AND 
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='HAC' AND LocationAddress=NEW.LocationAddress)>=1 AND
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='PLU' AND LocationAddress=NEW.LocationAddress)>=1)
    THEN
		SET NEW.Cost=200;
	ELSEIF ((NEW.InspectionType='FNL') AND (
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='HAC' AND LocationAddress=NEW.LocationAddress)<1 OR
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='PLU' AND LocationAddress=NEW.LocationAddress)<1) )
    THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='FNL Error';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `FN2` BEFORE INSERT ON `inspection` FOR EACH ROW BEGIN
	IF (NEW.InspectionType='FN2' AND 
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='ELE' AND LocationAddress=NEW.LocationAddress)>=1 AND
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='PLU' AND LocationAddress=NEW.LocationAddress)>=1)
    THEN
		SET NEW.Cost=150;
	ELSEIF ((NEW.InspectionType='FN2') AND (
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='ELE' AND LocationAddress=NEW.LocationAddress)<1 OR
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='PLU' AND LocationAddress=NEW.LocationAddress)<1) )
    THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='FN2 Error';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `FN3` BEFORE INSERT ON `inspection` FOR EACH ROW BEGIN
	IF (NEW.InspectionType='FN3' AND 
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='PLU' AND LocationAddress=NEW.LocationAddress)>=1)
    THEN
		SET NEW.Cost=150;
	ELSEIF ((NEW.InspectionType='FN3') AND (
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='PLU' AND LocationAddress=NEW.LocationAddress)<1) )
    THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='FN3 Error';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SAF` BEFORE INSERT ON `inspection` FOR EACH ROW BEGIN
	IF (NEW.InspectionType='SAF')
    THEN
		SET NEW.Cost=50;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ELE` BEFORE INSERT ON `inspection` FOR EACH ROW BEGIN
	IF (NEW.InspectionType='ELE' AND 
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='FRM' AND LocationAddress=NEW.LocationAddress)>=1)
    THEN
		SET NEW.Cost=150;
	ELSEIF (NEW.InspectionType='ELE' AND 
    (SELECT COUNT(*) FROM Inspection WHERE InspectionType='FRM' AND LocationAddress=NEW.LocationAddress)<1)
    THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='ELE Error';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `monthmax` BEFORE INSERT ON `inspection` FOR EACH ROW BEGIN
	IF( (SELECT COUNT(*) FROM Inspection WHERE MONTH(DateInspected)=MONTH(NEW.DateInspected) 
    AND YEAR(DateInspected)=YEAR(NEW.DateInspected)
    AND InspectorID=NEW.InspectorID) >= 5 )
    THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT='Maximum Inspections per month exceeded';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pass_fail_update` BEFORE UPDATE ON `inspection` FOR EACH ROW IF(NEW.Score < 75) THEN
	SET NEW.Pass = 'Fail';
ELSE
	SET NEW.Pass = 'Pass';
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validdateupdate` BEFORE UPDATE ON `inspection` FOR EACH ROW BEGIN
	IF (New.DateInspected < (SELECT DateFirstActivity FROM Location WHERE New.LocationAddress=Location.LocationAddress))
		THEN 
        SIGNAL SQLSTATE '45000';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `HIS` BEFORE UPDATE ON `inspection` FOR EACH ROW BEGIN
	IF (NEW.InspectionType='HIS')
		THEN 
        SET NEW.Cost=100;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `scoreupdate` BEFORE UPDATE ON `inspection` FOR EACH ROW BEGIN
	IF (NEW.Score!=OLD.Score) 
		THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT='Cannot update score';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Inspector`
--

DROP TABLE IF EXISTS `Inspector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inspector` (
  `EID` smallint NOT NULL,
  `InspectorName` varchar(30) DEFAULT NULL,
  `DateHired` date DEFAULT NULL,
  PRIMARY KEY (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inspector`
--

LOCK TABLES `Inspector` WRITE;
/*!40000 ALTER TABLE `Inspector` DISABLE KEYS */;
INSERT INTO `Inspector` VALUES (101,'Inspector-1','1984-11-08'),(102,'Inspector-2','1994-11-08'),(103,'Inspector-3','2004-11-08'),(104,'Inspector-4','2014-11-01'),(105,'Inspector-5','2018-11-01');
/*!40000 ALTER TABLE `Inspector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Location` (
  `LocationAddress` varchar(40) NOT NULL,
  `BuiltBy` int DEFAULT NULL,
  `LocationType` enum('commercial','residential') DEFAULT NULL,
  `DateFirstActivity` date DEFAULT NULL,
  `Size` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`LocationAddress`),
  KEY `BuiltBy` (`BuiltBy`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`BuiltBy`) REFERENCES `Builder` (`LicenseNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES ('100 Industrial Ave., Fort Worth, TX',23456,'commercial','2005-06-01',100000),('100 Main St., Dallas, TX',12345,'commercial','1999-12-31',250000),('100 Winding Wood, Carrolton, TX',45678,'residential',NULL,2500),('101 Industrial Ave., Fort Worth, TX',23456,'commercial','2005-06-01',80000),('102 Industrial Ave., Fort Worth, TX',23456,'commercial','2005-06-01',75000),('102 Winding Wood, Carrolton, TX',45678,'residential',NULL,2800),('103 Industrial Ave., Fort Worth, TX',23456,'commercial','2005-06-01',50000),('104 Industrial Ave., Fort Worth, TX',23456,'commercial','2005-06-01',80000),('105 Industrial Ave., Fort Worth, TX',23456,'commercial','2005-06-01',90000),('1420 Main St., Lewisville, TX',34567,'residential',NULL,1600),('210 Cherry Bark Lane, Plano, TX',12321,'residential','2016-10-01',3200),('212 Cherry Bark Lane, Plano, TX',12321,'residential',NULL,NULL),('214 Cherry Bark Lane, Plano, TX',12321,'residential',NULL,NULL),('216 Cherry Bark Lane, Plano, TX',12321,'residential',NULL,NULL),('300 Oak St., Dallas, TX',12345,'residential','2000-01-01',3000),('302 Oak St., Dallas, TX',12345,'residential','2001-02-01',4000),('304 Oak St., Dallas, TX',12345,'residential','2002-03-01',1500),('306 Oak St., Dallas, TX',12345,'residential','2003-04-01',1500),('308 Oak St., Dallas, TX',12345,'residential','2003-04-01',2000);
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'fodb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-05 22:26:48
