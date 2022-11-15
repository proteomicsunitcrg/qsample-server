-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: qsample
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
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `id` bigint NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1,'Identification of a protein in a gel band'),(2,'Identification of an overexpressed protein'),(3,'Characterization of protein-protein interactions (AP-MS) - A. Pilot experiment'),(4,'Characterization of protein-protein interactions (AP-MS) - B. Measurement'),(5,'Chromatin-bound proteome'),(6,'Phosphoproteome label-free quantification'),(7,'Proteome label-free quantification'),(8,'Proteome label-free quantification in exosomes'),(9,'Proteome label-free quantification in mycoplasma'),(10,'Proteome label-free quantification in secretome'),(11,'PTM (acetyl, methyl, phospho, ubiquitin) quantification of a purified protein - A. Pilot experiment'),(12,'PTM (acetyl, methyl, phospho, ubiquitin) quantification of a purified protein - B. Measurement'),(13,'PTM quantification of histones - A. Pilot experiment'),(14,'PTM quantification of histones - B. Measurement'),(15,'Quantification using data independent acquisition (DIA)'),(16,'SILAC: Checking incorporation'),(17,'SILAC: Phosphoproteome quantification'),(18,'SILAC: Proteome quantification'),(19,'SILAC: Ultra deep proteome quantification (fractionation)'),(20,'Structural elucidation of crosslinked protein complexes'),(21,'Targeted protein quantification (SRM/PRM) - A. Method development'),(22,'Targeted protein quantification (SRM/PRM) - B. Measurement'),(23,'TMT: Proteome quantification'),(24,'TMT: Ultra deep proteome quantification (fractionation)');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_seq`
--

DROP TABLE IF EXISTS `application_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_seq`
--

LOCK TABLES `application_seq` WRITE;
/*!40000 ALTER TABLE `application_seq` DISABLE KEYS */;
INSERT INTO `application_seq` VALUES (1);
/*!40000 ALTER TABLE `application_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `context_source`
--

DROP TABLE IF EXISTS `context_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `context_source` (
  `id` bigint NOT NULL,
  `abbreviated` varchar(50) NOT NULL,
  `api_key` binary(50) NOT NULL,
  `charge` bigint DEFAULT NULL,
  `mz` float DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `trace_color_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk6d0ww18rgc22m9s351or4hqu` (`trace_color_id`),
  CONSTRAINT `FKk6d0ww18rgc22m9s351or4hqu` FOREIGN KEY (`trace_color_id`) REFERENCES `trace_color` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `context_source`
--

LOCK TABLES `context_source` WRITE;
/*!40000 ALTER TABLE `context_source` DISABLE KEYS */;
INSERT INTO `context_source` VALUES (1,'# proteins',_binary 'apiKey1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,'Total number of uniquely identified proteins',1),(2,'# peptides',_binary 'apiKey2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,'Total number of uniquely identified peptides',1);
/*!40000 ALTER TABLE `context_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `context_source_seq`
--

DROP TABLE IF EXISTS `context_source_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `context_source_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `context_source_seq`
--

LOCK TABLES `context_source_seq` WRITE;
/*!40000 ALTER TABLE `context_source_seq` DISABLE KEYS */;
INSERT INTO `context_source_seq` VALUES (1);
/*!40000 ALTER TABLE `context_source_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data` (
  `context_source_id` bigint NOT NULL,
  `file_id` bigint NOT NULL,
  `param_id` bigint NOT NULL,
  `calculated_value` float DEFAULT NULL,
  `non_conformity_status` varchar(255) DEFAULT 'OK',
  `value` float DEFAULT NULL,
  `id` bigint NOT NULL,
  `std` float DEFAULT NULL,
  PRIMARY KEY (`context_source_id`,`file_id`,`param_id`),
  KEY `FKg3e02o0b669arg7nkyrs60lh7` (`file_id`),
  KEY `FKoq9uqfyub8f4dw5o7lff9qla1` (`param_id`),
  CONSTRAINT `FK8xdxnnj4xh98i813oys7xdurh` FOREIGN KEY (`context_source_id`) REFERENCES `context_source` (`id`),
  CONSTRAINT `FKg3e02o0b669arg7nkyrs60lh7` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`),
  CONSTRAINT `FKoq9uqfyub8f4dw5o7lff9qla1` FOREIGN KEY (`param_id`) REFERENCES `param` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES (1,14,1,51,'OK',51,9,5),(1,15,1,7,'OK',7,11,1),(1,17,1,23,'OK',23,15,NULL),(1,19,1,12,'OK',12,16,4),(1,20,1,9,'OK',9,17,1),(1,31,1,23,'OK',23,21,23),(1,33,1,43,'OK',43,23,20),(2,13,1,23,'OK',51,8,16),(2,14,1,6,'OK',6,10,3),(2,19,1,23,'OK',23,19,4),(2,20,1,45,'OK',45,18,12),(2,21,1,23,'OK',23,20,4),(2,31,1,10,'OK',10,22,3),(2,33,1,15,'OK',10,24,12);
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_seq`
--

DROP TABLE IF EXISTS `data_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_seq`
--

LOCK TABLES `data_seq` WRITE;
/*!40000 ALTER TABLE `data_seq` DISABLE KEYS */;
INSERT INTO `data_seq` VALUES (25);
/*!40000 ALTER TABLE `data_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `dtype` varchar(31) NOT NULL,
  `id` bigint NOT NULL,
  `checksum` varchar(50) NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `filename` varchar(50) NOT NULL,
  `wet_lab_type` bigint DEFAULT NULL,
  `request_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKngem4y76s84dei8nvtw44r1fl` (`wet_lab_type`),
  CONSTRAINT `FKngem4y76s84dei8nvtw44r1fl` FOREIGN KEY (`wet_lab_type`) REFERENCES `wetlab` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES ('WetLabFile',13,'check1','2020-05-26 14:55:25','ISOlution_W23',1,NULL),('WetLabFile',14,'check2','2020-05-27 14:55:25','ISOlution_W24',1,NULL),('WetLabFile',15,'check3','2020-06-10 05:55:25','ISOlution_W25',1,NULL),('WetLabFile',16,'pedete1','2020-06-11 03:55:25','try1',NULL,NULL),('WetLabFile',17,'pedete2','2020-06-11 03:55:25','ISOlution_W26',1,NULL),('WetLabFile',18,'pedete3','2020-06-11 03:55:25','ISOlution_W27',1,NULL),('WetLabFile',19,'pedete4','2020-06-11 03:55:25','AgilentQC_W23',2,NULL),('WetLabFile',20,'pedete5','2020-06-11 03:55:25','AgilentQC_W25',2,NULL),('WetLabFile',21,'check1232','2020-06-11 03:55:25','AgilentQC_W26',2,NULL),('RequestFile',31,'request3','2020-06-11 03:55:25','2020MR003_GARU_001',NULL,'2020MG003'),('RequestFile',32,'request4','2020-06-11 03:55:25','2020MR003_GARU_002',NULL,'2020MG003'),('RequestFile',33,'request5','2020-06-11 03:55:25','2020MR003_GARU_003',NULL,'2020MG003'),('RequestFile',34,'request7','2020-06-11 03:55:25','try4',NULL,'2020MG003'),('RequestFile',35,'request7','2020-06-11 03:55:25','try4',NULL,'2020MG003'),('RequestFile',36,'request8','2020-06-11 03:55:25','try2',NULL,'2020MG003'),('RequestFile',37,'9e421e5318d4cbd70fe4bf59ffb76cff','2020-07-23 19:50:55','marcCUrl',NULL,'caca');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_seq`
--

DROP TABLE IF EXISTS `file_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_seq`
--

LOCK TABLES `file_seq` WRITE;
/*!40000 ALTER TABLE `file_seq` DISABLE KEYS */;
INSERT INTO `file_seq` VALUES (38);
/*!40000 ALTER TABLE `file_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guide_set`
--

DROP TABLE IF EXISTS `guide_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guide_set` (
  `id` bigint NOT NULL,
  `api_key` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ea8e5icv3469cmimqepyfx3cx` (`api_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide_set`
--

LOCK TABLES `guide_set` WRITE;
/*!40000 ALTER TABLE `guide_set` DISABLE KEYS */;
INSERT INTO `guide_set` VALUES (46,_binary '�sK\�`\�H�P�8Z|\�'),(45,_binary '�4�-x@ �g�N\�c');
/*!40000 ALTER TABLE `guide_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guide_set_files`
--

DROP TABLE IF EXISTS `guide_set_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guide_set_files` (
  `guide_set_id` bigint NOT NULL,
  `files_id` bigint NOT NULL,
  UNIQUE KEY `UK_hynquehs4vq14dfc83838jbnf` (`files_id`),
  KEY `FKdh668kmoo1ma7132mvg8gb872` (`guide_set_id`),
  CONSTRAINT `FK7uep4tvhecv44gufxf1f51trd` FOREIGN KEY (`files_id`) REFERENCES `file` (`id`),
  CONSTRAINT `FKdh668kmoo1ma7132mvg8gb872` FOREIGN KEY (`guide_set_id`) REFERENCES `guide_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide_set_files`
--

LOCK TABLES `guide_set_files` WRITE;
/*!40000 ALTER TABLE `guide_set_files` DISABLE KEYS */;
INSERT INTO `guide_set_files` VALUES (45,19),(45,20),(45,21),(46,14),(46,15),(46,17);
/*!40000 ALTER TABLE `guide_set_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guide_set_seq`
--

DROP TABLE IF EXISTS `guide_set_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guide_set_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide_set_seq`
--

LOCK TABLES `guide_set_seq` WRITE;
/*!40000 ALTER TABLE `guide_set_seq` DISABLE KEYS */;
INSERT INTO `guide_set_seq` VALUES (47);
/*!40000 ALTER TABLE `guide_set_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injection_conditions`
--

DROP TABLE IF EXISTS `injection_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injection_conditions` (
  `id` bigint NOT NULL,
  `method` varchar(255) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `application_id` bigint DEFAULT NULL,
  `instrument_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt6u95asoldj1myeloay3s2xvr` (`application_id`),
  KEY `FKdjycswuqkp2d2u5xdmev5druu` (`instrument_id`),
  CONSTRAINT `FKdjycswuqkp2d2u5xdmev5druu` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`),
  CONSTRAINT `FKt6u95asoldj1myeloay3s2xvr` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injection_conditions`
--

LOCK TABLES `injection_conditions` WRITE;
/*!40000 ALTER TABLE `injection_conditions` DISABLE KEYS */;
INSERT INTO `injection_conditions` VALUES (1,'STD-VL-DDA-60min-T20-CID-IT',4.5,1,1),(2,'STD-VL-DDA-60min-T20-CID-IT',1,2,1),(3,'STD-VL-DDA-60min-T20-CID-IT',1,3,1),(4,'STD-VL-DDA-60min-T20-CID-IT',4.5,4,1),(5,'STD-XX-DDA-90min-TSP-HCD-IT (XX=L1/E1)',4.5,4,2),(6,'STD-XX-DDA-90min-TSP-HCD-IT (XX=L1/E1)',4.5,4,3),(7,'STD-VL-DDA-60min-T20-CID-IT',1,5,1),(8,'STD-XX-DDA-90min-TSP-HCD-IT (XX=L1/E1)',4.5,5,2),(9,'STD-XX-DDA-90min-TSP-HCD-IT (XX=L1/E1)',4.5,5,3),(10,'STD-XX-DDA-90min-TSP-HCD-IT (XX=L1/E1)',2,7,2),(11,'STD-XX-DDA-90min-TSP-HCD-IT (XX=L1/E1)',2,7,3),(13,'STD-XX-DDA-60min-TSP-HCD-IT (XX=L1/E1)',4.5,13,2),(14,'STD-XX-DDA-60min-TSP-HCD-IT (XX=L1/E1)',4.5,13,3);
/*!40000 ALTER TABLE `injection_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injection_conditions_seq`
--

DROP TABLE IF EXISTS `injection_conditions_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injection_conditions_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injection_conditions_seq`
--

LOCK TABLES `injection_conditions_seq` WRITE;
/*!40000 ALTER TABLE `injection_conditions_seq` DISABLE KEYS */;
INSERT INTO `injection_conditions_seq` VALUES (1);
/*!40000 ALTER TABLE `injection_conditions_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrument`
--

DROP TABLE IF EXISTS `instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instrument` (
  `id` bigint NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrument`
--

LOCK TABLES `instrument` WRITE;
/*!40000 ALTER TABLE `instrument` DISABLE KEYS */;
INSERT INTO `instrument` VALUES (1,'Velos'),(2,'Lumos'),(3,'Eclipse');
/*!40000 ALTER TABLE `instrument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrument_seq`
--

DROP TABLE IF EXISTS `instrument_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instrument_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrument_seq`
--

LOCK TABLES `instrument_seq` WRITE;
/*!40000 ALTER TABLE `instrument_seq` DISABLE KEYS */;
INSERT INTO `instrument_seq` VALUES (1);
/*!40000 ALTER TABLE `instrument_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `param`
--

DROP TABLE IF EXISTS `param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `param` (
  `id` bigint NOT NULL,
  `api_key` binary(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `param`
--

LOCK TABLES `param` WRITE;
/*!40000 ALTER TABLE `param` DISABLE KEYS */;
INSERT INTO `param` VALUES (1,_binary 'apiKey1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0','Total Numbers');
/*!40000 ALTER TABLE `param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `param_seq`
--

DROP TABLE IF EXISTS `param_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `param_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `param_seq`
--

LOCK TABLES `param_seq` WRITE;
/*!40000 ALTER TABLE `param_seq` DISABLE KEYS */;
INSERT INTO `param_seq` VALUES (1);
/*!40000 ALTER TABLE `param_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plot`
--

DROP TABLE IF EXISTS `plot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plot` (
  `id` bigint NOT NULL,
  `api_key` binary(50) NOT NULL,
  `param_id` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd61s4kadcsyyck19p3gmxeuwa` (`param_id`),
  CONSTRAINT `FKd61s4kadcsyyck19p3gmxeuwa` FOREIGN KEY (`param_id`) REFERENCES `param` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plot`
--

LOCK TABLES `plot` WRITE;
/*!40000 ALTER TABLE `plot` DISABLE KEYS */;
INSERT INTO `plot` VALUES (1,_binary 'apiKey1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,'Total numbers'),(2,_binary 'plot2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,'Total numbers'),(3,_binary 'plot3\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,'Plot 2 Example');
/*!40000 ALTER TABLE `plot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plot_context_source`
--

DROP TABLE IF EXISTS `plot_context_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plot_context_source` (
  `plot_id` bigint NOT NULL,
  `context_source_id` bigint NOT NULL,
  KEY `FKhilmbckmk1jl1pygas5pfxm59` (`context_source_id`),
  KEY `FKt78bum1vtgpmulboxxhg446d1` (`plot_id`),
  CONSTRAINT `FKhilmbckmk1jl1pygas5pfxm59` FOREIGN KEY (`context_source_id`) REFERENCES `context_source` (`id`),
  CONSTRAINT `FKt78bum1vtgpmulboxxhg446d1` FOREIGN KEY (`plot_id`) REFERENCES `plot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plot_context_source`
--

LOCK TABLES `plot_context_source` WRITE;
/*!40000 ALTER TABLE `plot_context_source` DISABLE KEYS */;
INSERT INTO `plot_context_source` VALUES (1,1),(2,1),(3,2);
/*!40000 ALTER TABLE `plot_context_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plot_seq`
--

DROP TABLE IF EXISTS `plot_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plot_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plot_seq`
--

LOCK TABLES `plot_seq` WRITE;
/*!40000 ALTER TABLE `plot_seq` DISABLE KEYS */;
INSERT INTO `plot_seq` VALUES (1);
/*!40000 ALTER TABLE `plot_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_INTERNAL'),(2,'ROLE_EXTERNAL'),(3,'ROLE_MANAGER'),(4,'ROLE_ADMIN'),(5,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threshold`
--

DROP TABLE IF EXISTS `threshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threshold` (
  `id` bigint NOT NULL,
  `api_key` binary(16) NOT NULL,
  `non_conformity_direction` varchar(255) DEFAULT NULL,
  `steps` int DEFAULT NULL,
  `wetlab_id` bigint DEFAULT NULL,
  `param_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9hxspk3fg6bhh4y1yyuu36ov9` (`api_key`),
  KEY `FKl5qysigvx0wpmif73wfo9iya2` (`wetlab_id`),
  KEY `FKmp0khk9w2rhtce4qh73xvu1rc` (`param_id`),
  CONSTRAINT `FKl5qysigvx0wpmif73wfo9iya2` FOREIGN KEY (`wetlab_id`) REFERENCES `wetlab` (`id`),
  CONSTRAINT `FKmp0khk9w2rhtce4qh73xvu1rc` FOREIGN KEY (`param_id`) REFERENCES `param` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threshold`
--

LOCK TABLES `threshold` WRITE;
/*!40000 ALTER TABLE `threshold` DISABLE KEYS */;
INSERT INTO `threshold` VALUES (18,_binary '(ӞT�\�DJ�\"�Ą\�\�B','UPDOWN',1,2,1),(19,_binary 'Z|�\�B���0\�N\�\�','UPDOWN',1,1,1);
/*!40000 ALTER TABLE `threshold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threshold_params`
--

DROP TABLE IF EXISTS `threshold_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threshold_params` (
  `context_source_id` bigint NOT NULL,
  `threshold_id` bigint NOT NULL,
  `initial_value` float DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `step_value` float DEFAULT NULL,
  PRIMARY KEY (`context_source_id`,`threshold_id`),
  KEY `FK8g1pxjaqjdhdc96r5ok5eyd9k` (`threshold_id`),
  CONSTRAINT `FK8g1pxjaqjdhdc96r5ok5eyd9k` FOREIGN KEY (`threshold_id`) REFERENCES `threshold` (`id`),
  CONSTRAINT `FKs85ab4k83uteyqmd8xf4ucb0n` FOREIGN KEY (`context_source_id`) REFERENCES `context_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threshold_params`
--

LOCK TABLES `threshold_params` WRITE;
/*!40000 ALTER TABLE `threshold_params` DISABLE KEYS */;
INSERT INTO `threshold_params` VALUES (1,18,10.5,_binary '',1.5),(1,19,27,_binary '',18.1842),(2,18,30.3333,_binary '',10.3709),(2,19,6,_binary '',0);
/*!40000 ALTER TABLE `threshold_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threshold_seq`
--

DROP TABLE IF EXISTS `threshold_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threshold_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threshold_seq`
--

LOCK TABLES `threshold_seq` WRITE;
/*!40000 ALTER TABLE `threshold_seq` DISABLE KEYS */;
INSERT INTO `threshold_seq` VALUES (20);
/*!40000 ALTER TABLE `threshold_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trace_color`
--

DROP TABLE IF EXISTS `trace_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trace_color` (
  `id` bigint NOT NULL,
  `a` bigint NOT NULL,
  `api_key` binary(50) NOT NULL,
  `b` bigint NOT NULL,
  `g` bigint NOT NULL,
  `r` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trace_color`
--

LOCK TABLES `trace_color` WRITE;
/*!40000 ALTER TABLE `trace_color` DISABLE KEYS */;
INSERT INTO `trace_color` VALUES (1,0,_binary 'apiKey1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',100,100,100);
/*!40000 ALTER TABLE `trace_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trace_color_seq`
--

DROP TABLE IF EXISTS `trace_color_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trace_color_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trace_color_seq`
--

LOCK TABLES `trace_color_seq` WRITE;
/*!40000 ALTER TABLE `trace_color_seq` DISABLE KEYS */;
INSERT INTO `trace_color_seq` VALUES (1);
/*!40000 ALTER TABLE `trace_color_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL,
  `agendo_id` bigint DEFAULT NULL,
  `api_key` binary(16) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2lxq4yoyabuji9s2a1i0c8938` (`api_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,24,_binary ',u\�J\�0\r�\�CB','EXTERNAL','EXTERNAL','$2a$10$1pBoTH3EgP10mo5xwPHqcuPyTyoECVWJPnGYQ7rhXXw67TSXyG/Ci','external@external.es'),(10,942,_binary '�4���E�\���2$�','Marc Serret','Marc Serret','$2a$10$fahmUZSeyBQPYbeJvt7YB.280hO2gJZAkpkhAXd504C5MeSHQVGvW','marc.serret@crg.eu'),(11,942,_binary '�\�\�g�KG�����ץ4','ADMINDUMMY','UNIT','$2a$10$.eeVFoaUm8WdZZSMQMGlDOnVU/1U3a3BUt5V/FgV/hwSSio5ahbsS','admin@unittest.cat');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_seq`
--

DROP TABLE IF EXISTS `user_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_seq`
--

LOCK TABLES `user_seq` WRITE;
/*!40000 ALTER TABLE `user_seq` DISABLE KEYS */;
INSERT INTO `user_seq` VALUES (11);
/*!40000 ALTER TABLE `user_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  KEY `FKt4v0rrweyk393bdgt107vdx0x` (`role_id`),
  KEY `FKgd3iendaoyh04b95ykqise6qh` (`user_id`),
  CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (3,2),(3,5),(10,5),(10,1),(10,4),(11,1),(11,3),(11,4),(11,5);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wet_lab_seq`
--

DROP TABLE IF EXISTS `wet_lab_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wet_lab_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wet_lab_seq`
--

LOCK TABLES `wet_lab_seq` WRITE;
/*!40000 ALTER TABLE `wet_lab_seq` DISABLE KEYS */;
INSERT INTO `wet_lab_seq` VALUES (1);
/*!40000 ALTER TABLE `wet_lab_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wetlab`
--

DROP TABLE IF EXISTS `wetlab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wetlab` (
  `id` bigint NOT NULL,
  `api_key` binary(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `guide_set_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ejfiihgmd6k24h2rg119qycaw` (`api_key`),
  KEY `FKdmtiufjb02q61tejl5ki4bo5u` (`guide_set_id`),
  CONSTRAINT `FKdmtiufjb02q61tejl5ki4bo5u` FOREIGN KEY (`guide_set_id`) REFERENCES `guide_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wetlab`
--

LOCK TABLES `wetlab` WRITE;
/*!40000 ALTER TABLE `wetlab` DISABLE KEYS */;
INSERT INTO `wetlab` VALUES (1,_binary 'apiKey1\0\0\0\0\0\0\0\0\0','ISolutionQC',46),(2,_binary 'wetlab2\0\0\0\0\0\0\0\0\0','AgilentQC',45);
/*!40000 ALTER TABLE `wetlab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wetlab_plot`
--

DROP TABLE IF EXISTS `wetlab_plot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wetlab_plot` (
  `wet_lab_id` bigint NOT NULL,
  `plot_id` bigint NOT NULL,
  KEY `FKg61sv5eqdbpsytd5lravvkf0j` (`plot_id`),
  KEY `FK79plxrl3k35xg5hme4xu0hidx` (`wet_lab_id`),
  CONSTRAINT `FK79plxrl3k35xg5hme4xu0hidx` FOREIGN KEY (`wet_lab_id`) REFERENCES `wetlab` (`id`),
  CONSTRAINT `FKg61sv5eqdbpsytd5lravvkf0j` FOREIGN KEY (`plot_id`) REFERENCES `plot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wetlab_plot`
--

LOCK TABLES `wetlab_plot` WRITE;
/*!40000 ALTER TABLE `wetlab_plot` DISABLE KEYS */;
INSERT INTO `wetlab_plot` VALUES (1,1),(2,2),(2,3);
/*!40000 ALTER TABLE `wetlab_plot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-28 13:40:45
