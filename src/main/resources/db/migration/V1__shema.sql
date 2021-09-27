-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: qsample
-- ------------------------------------------------------
-- Server version	8.0.21

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
  `application_constraint_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5h6cfohdp8p2tj8k13qau90nj` (`application_constraint_id`),
  CONSTRAINT `FK5h6cfohdp8p2tj8k13qau90nj` FOREIGN KEY (`application_constraint_id`) REFERENCES `application_constraint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1,'Identification of a protein in a gel band',1),(2,'Identification of an overexpressed protein',1),(3,'Characterization of protein-protein interactions (AP-MS) - A. Pilot experiment',1),(4,'Characterization of protein-protein interactions (AP-MS) - B. Measurement',1),(5,'Chromatin-bound proteome',1),(6,'Phosphoproteome label-free quantification',2),(7,'Proteome label-free quantification',1),(8,'Proteome label-free quantification in exosomes',1),(9,'Proteome label-free quantification in mycoplasma',1),(10,'Proteome label-free quantification in secretome',1),(11,'PTM (acetyl, methyl, phospho, ubiquitin) quantification of a purified protein - A. Pilot experiment',2),(12,'PTM (acetyl, methyl, phospho, ubiquitin) quantification of a purified protein - B. Measurement',2),(13,'PTM quantification of histones - A. Pilot experiment',2),(14,'PTM quantification of histones - B. Measurement',2),(15,'Quantification using data independent acquisition (DIA)',1),(16,'SILAC: Checking incorporation',2),(17,'SILAC: Phosphoproteome quantification',2),(18,'SILAC: Proteome quantification',2),(19,'SILAC: Ultra deep proteome quantification (fractionation)',2),(20,'Structural elucidation of crosslinked protein complexes',1),(21,'Targeted protein quantification (SRM/PRM) - A. Method development',1),(22,'Targeted protein quantification (SRM/PRM) - B. Measurement',1),(23,'TMT: Proteome quantification',2),(24,'TMT: Ultra deep proteome quantification (fractionation)',2),(25,'User tailored request (Proteomics)',1);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_constraint`
--

DROP TABLE IF EXISTS `application_constraint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_constraint` (
  `id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `show_file_info_plot` bit(1) NOT NULL,
  `show_identified_peptides_plot` bit(1) NOT NULL,
  `show_identified_proteins_plot` bit(1) NOT NULL,
  `show_modifications_plot` bit(1) NOT NULL,
  `show_quantification_and_contaminant_list` bit(1) NOT NULL,
  `show_quantification_heat_map` bit(1) NOT NULL,
  `show_dendogram` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_constraint`
--

LOCK TABLES `application_constraint` WRITE;
/*!40000 ALTER TABLE `application_constraint` DISABLE KEYS */;
INSERT INTO `application_constraint` VALUES (1,'Default',_binary '\0',_binary '',_binary '',_binary '\0',_binary '',_binary '',_binary ''),(2,'Phospho',_binary '',_binary '\0',_binary '\0',_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `application_constraint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_constraint_seq`
--

DROP TABLE IF EXISTS `application_constraint_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_constraint_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_constraint_seq`
--

LOCK TABLES `application_constraint_seq` WRITE;
/*!40000 ALTER TABLE `application_constraint_seq` DISABLE KEYS */;
INSERT INTO `application_constraint_seq` VALUES (1);
/*!40000 ALTER TABLE `application_constraint_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_seq`
--

DROP TABLE IF EXISTS `application_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_seq`
--

LOCK TABLES `application_seq` WRITE;
/*!40000 ALTER TABLE `application_seq` DISABLE KEYS */;
INSERT INTO `application_seq` VALUES (26);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `context_source`
--

LOCK TABLES `context_source` WRITE;
/*!40000 ALTER TABLE `context_source` DISABLE KEYS */;
INSERT INTO `context_source` VALUES (1,'# proteins',_binary 'apiKey1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,'Total number of identified grouped proteins',1),(2,'# peptides',_binary 'apiKey2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,NULL,'Total number of identified peptides',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_seq`
--

DROP TABLE IF EXISTS `data_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_seq`
--

LOCK TABLES `data_seq` WRITE;
/*!40000 ALTER TABLE `data_seq` DISABLE KEYS */;
INSERT INTO `data_seq` VALUES (1);
/*!40000 ALTER TABLE `data_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_request`
--

DROP TABLE IF EXISTS `favorite_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_request` (
  `id` bigint NOT NULL,
  `agendo_id` bigint DEFAULT NULL,
  `request_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favorite_request_seq`
--

DROP TABLE IF EXISTS `favorite_request_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_request_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_request_seq`
--

LOCK TABLES `favorite_request_seq` WRITE;
/*!40000 ALTER TABLE `favorite_request_seq` DISABLE KEYS */;
INSERT INTO `favorite_request_seq` VALUES (1);
/*!40000 ALTER TABLE `favorite_request_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_request_users`
--

DROP TABLE IF EXISTS `favorite_request_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_request_users` (
  `id` bigint NOT NULL,
  `notify` bit(1) DEFAULT NULL,
  `favorite_request_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKss42oap5dsfcmaseto0hf317e` (`favorite_request_id`),
  KEY `FKk0wpl0unphxnfdgccoco1g0us` (`user_id`),
  CONSTRAINT `FKk0wpl0unphxnfdgccoco1g0us` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKss42oap5dsfcmaseto0hf317e` FOREIGN KEY (`favorite_request_id`) REFERENCES `favorite_request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `filename` varchar(200) DEFAULT NULL,
  `wet_lab_type` bigint DEFAULT NULL,
  `request_code` varchar(255) DEFAULT NULL,
  `file_info_id` bigint DEFAULT NULL,
  `replicate` int DEFAULT NULL,
  `week` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKngem4y76s84dei8nvtw44r1fl` (`wet_lab_type`),
  KEY `FKrmh3d76ins4ukfmi4e154cvvw` (`file_info_id`),
  CONSTRAINT `FKngem4y76s84dei8nvtw44r1fl` FOREIGN KEY (`wet_lab_type`) REFERENCES `wetlab` (`id`),
  CONSTRAINT `FKrmh3d76ins4ukfmi4e154cvvw` FOREIGN KEY (`file_info_id`) REFERENCES `file_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_info`
--

DROP TABLE IF EXISTS `file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_info` (
  `id` bigint NOT NULL,
  `peptide_hits` bigint DEFAULT NULL,
  `peptide_modified` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_info_seq`
--

DROP TABLE IF EXISTS `file_info_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_info_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_info_seq`
--

LOCK TABLES `file_info_seq` WRITE;
/*!40000 ALTER TABLE `file_info_seq` DISABLE KEYS */;
INSERT INTO `file_info_seq` VALUES (1);
/*!40000 ALTER TABLE `file_info_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_seq`
--

DROP TABLE IF EXISTS `file_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_seq`
--

LOCK TABLES `file_seq` WRITE;
/*!40000 ALTER TABLE `file_seq` DISABLE KEYS */;
INSERT INTO `file_seq` VALUES (1);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guide_set_seq`
--

DROP TABLE IF EXISTS `guide_set_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guide_set_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide_set_seq`
--

LOCK TABLES `guide_set_seq` WRITE;
/*!40000 ALTER TABLE `guide_set_seq` DISABLE KEYS */;
INSERT INTO `guide_set_seq` VALUES (1);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (125);
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
  `volume` float DEFAULT NULL,
  `application_id` bigint DEFAULT NULL,
  `instrument_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt6u95asoldj1myeloay3s2xvr` (`application_id`),
  KEY `FKdjycswuqkp2d2u5xdmev5druu` (`instrument_id`),
  CONSTRAINT `FKdjycswuqkp2d2u5xdmev5druu` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`),
  CONSTRAINT `FKt6u95asoldj1myeloay3s2xvr` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injection_conditions`
--

LOCK TABLES `injection_conditions` WRITE;
/*!40000 ALTER TABLE `injection_conditions` DISABLE KEYS */;
INSERT INTO `injection_conditions` VALUES (40,1,3,1),(41,4.5,4,1),(42,1,5,1),(43,4.5,1,1),(44,1,2,1),(45,1,9,1),(46,1,10,1),(47,1,11,1),(48,1,12,1),(49,1,13,1),(50,1,14,1),(51,2,16,1),(52,4.5,4,2),(53,4.5,5,2),(54,4.5,6,2),(55,2,7,2),(56,2,8,2),(57,2,10,2),(58,4.5,11,2),(59,4.5,12,2),(60,4.5,13,2),(61,4.5,14,2),(62,4.5,17,2),(63,2,18,2),(64,2,19,2),(65,3,20,2),(66,4.5,4,3),(67,4.5,5,3),(68,4.5,6,3),(69,2,7,3),(70,2,8,3),(71,2,10,3),(72,4.5,12,3),(73,4.5,13,3),(74,4.5,14,3),(75,4.5,17,3),(76,2,18,3),(77,2,19,3),(78,3,20,3),(79,4.5,3,2),(80,4.5,3,3),(81,4.5,1,2),(82,4.5,1,3),(83,1,7,1),(84,1,8,1),(85,4.5,11,3),(86,2,15,2),(87,2,15,3),(88,1,18,1),(89,2,23,3),(90,2,24,3),(91,1,23,1),(93,4.5,1,4),(94,4.5,3,4),(95,4.5,4,4),(96,4.5,5,4),(97,2,23,4),(98,4.5,6,4),(99,2,7,4),(100,2,8,4),(101,2,10,4),(102,4.5,11,4),(103,4.5,12,4),(104,4.5,13,4),(105,4.5,14,4),(106,2,15,4),(107,4.5,17,4),(108,2,18,4),(109,2,19,4),(110,3,20,4),(111,2,24,4),(112,0,25,1);
/*!40000 ALTER TABLE `injection_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injection_conditions_methods`
--

DROP TABLE IF EXISTS `injection_conditions_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injection_conditions_methods` (
  `injection_conditions_id` bigint NOT NULL,
  `methods_id` bigint NOT NULL,
  KEY `FKa1d5d4l47f56xcv95swwygj2` (`methods_id`),
  KEY `FKo6oxj02cd0inf575gem10g2vt` (`injection_conditions_id`),
  CONSTRAINT `FKa1d5d4l47f56xcv95swwygj2` FOREIGN KEY (`methods_id`) REFERENCES `method` (`id`),
  CONSTRAINT `FKo6oxj02cd0inf575gem10g2vt` FOREIGN KEY (`injection_conditions_id`) REFERENCES `injection_conditions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injection_conditions_methods`
--

LOCK TABLES `injection_conditions_methods` WRITE;
/*!40000 ALTER TABLE `injection_conditions_methods` DISABLE KEYS */;
INSERT INTO `injection_conditions_methods` VALUES (40,1),(41,1),(42,1),(43,1),(44,1),(46,1),(49,1),(50,1),(51,4),(55,2),(57,2),(60,8),(61,8),(63,2),(64,2),(71,3),(77,3),(79,2),(79,9),(80,3),(80,10),(52,2),(52,9),(66,3),(66,10),(53,2),(53,9),(67,3),(67,10),(81,2),(81,9),(82,3),(82,10),(54,15),(54,16),(68,13),(68,14),(83,1),(69,3),(84,1),(45,4),(47,1),(47,17),(58,19),(58,21),(85,18),(85,20),(48,1),(48,17),(59,19),(59,21),(72,18),(72,20),(86,23),(87,22),(62,16),(75,14),(88,1),(76,3),(89,24),(89,25),(89,26),(89,27),(89,28),(89,29),(90,24),(90,25),(90,26),(90,27),(90,28),(90,29),(91,1),(73,30),(74,30),(78,6),(65,5),(56,2),(56,9),(70,3),(70,10),(93,31),(93,33),(94,31),(94,33),(95,31),(95,33),(96,31),(96,33),(97,40),(97,41),(97,42),(97,44),(97,43),(97,45),(98,34),(98,35),(99,31),(100,31),(100,33),(101,31),(102,36),(102,37),(103,37),(103,36),(104,46),(105,46),(106,39),(107,35),(108,31),(109,31),(110,32),(111,40),(111,41),(111,42),(111,44),(111,43),(111,45);
/*!40000 ALTER TABLE `injection_conditions_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injection_conditions_qc`
--

DROP TABLE IF EXISTS `injection_conditions_qc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injection_conditions_qc` (
  `id` bigint NOT NULL,
  `method` varchar(255) DEFAULT NULL,
  `qctype` varchar(255) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `instrument_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnu8rjv35u3r9cbh16vel91tx0` (`instrument_id`),
  CONSTRAINT `FKnu8rjv35u3r9cbh16vel91tx0` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injection_conditions_qc`
--

LOCK TABLES `injection_conditions_qc` WRITE;
/*!40000 ALTER TABLE `injection_conditions_qc` DISABLE KEYS */;
INSERT INTO `injection_conditions_qc` VALUES (1,'STD-E1-BSA-8min-T3-HCD-IT','QBSA',0.5,3),(2,'STD-E1-BSA-8min-T3-HCD-IT','QC01',0.5,3),(3,'STD-VL-BSA-8min-T3-CID-IT','QBSA',0.5,1),(4,'STD-VL-BSA-8min-T3-CID-IT','QC01',0.5,1),(5,'STD-VL-QC02-60min-T20-CID-IT','QC02',1,1),(6,'STD-VL-QC02-60min-T20-CID-IT','QHELA',1,1),(7,'STD-VL-DDA-60min-T4-CID-IT-HCD-FT-QC4L','QC03',1,1),(8,'STD-L1-BSA-8min-T3-HCD-IT','QBSA',0.5,2),(12,'STD-L1-QC02-60min-TSP-HCD-IT_max2ul','QC02',1,2),(13,'STD-L1-QC02-60min-TSP-HCD-IT_max2ul','QHELA',1,2),(14,'QC4L-Fusion-Lumos','QC03',1,2),(15,'STD-L1-BSA-8min-T3-HCD-IT','QC01',0.5,2),(16,'STD-E1-QC02-60min-TSP-HCD-IT_max2ul','QC02',1,3),(17,'STD-E1-QC02-60min-TSP-HCD-IT_max2ul','QHELA',1,3),(18,'QC4L-Eclipse','QC03',1,3),(19,'STD-E2-BSA-8min-T3-HCD-IT','QBSA',0.5,4),(20,'STD-E2-BSA-8min-T3-HCD-IT','QC01',0.5,4),(21,'STD-E2-QC02-60min-TSP-HCD-IT_max2ul','QC02',1,4),(22,'STD-E2-QC02-60min-TSP-HCD-IT_max2ul','QHELA',1,4),(23,'QC4L-Eclipse2','QC03',1,4);
/*!40000 ALTER TABLE `injection_conditions_qc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injection_conditions_qc_seq`
--

DROP TABLE IF EXISTS `injection_conditions_qc_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injection_conditions_qc_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injection_conditions_qc_seq`
--

LOCK TABLES `injection_conditions_qc_seq` WRITE;
/*!40000 ALTER TABLE `injection_conditions_qc_seq` DISABLE KEYS */;
INSERT INTO `injection_conditions_qc_seq` VALUES (24);
/*!40000 ALTER TABLE `injection_conditions_qc_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injection_conditions_seq`
--

DROP TABLE IF EXISTS `injection_conditions_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injection_conditions_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injection_conditions_seq`
--

LOCK TABLES `injection_conditions_seq` WRITE;
/*!40000 ALTER TABLE `injection_conditions_seq` DISABLE KEYS */;
INSERT INTO `injection_conditions_seq` VALUES (113);
/*!40000 ALTER TABLE `injection_conditions_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injection_conditionsqc`
--

DROP TABLE IF EXISTS `injection_conditionsqc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injection_conditionsqc` (
  `id` bigint NOT NULL,
  `qctype` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `instrument_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK33yldjedmrun94xrhrb62ldlg` (`instrument_id`),
  CONSTRAINT `FK33yldjedmrun94xrhrb62ldlg` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injection_conditionsqc`
--

LOCK TABLES `injection_conditionsqc` WRITE;
/*!40000 ALTER TABLE `injection_conditionsqc` DISABLE KEYS */;
/*!40000 ALTER TABLE `injection_conditionsqc` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrument`
--

LOCK TABLES `instrument` WRITE;
/*!40000 ALTER TABLE `instrument` DISABLE KEYS */;
INSERT INTO `instrument` VALUES (1,'Velos'),(2,'Lumos1'),(3,'Eclipse1'),(4,'Eclipse2');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrument_seq`
--

LOCK TABLES `instrument_seq` WRITE;
/*!40000 ALTER TABLE `instrument_seq` DISABLE KEYS */;
INSERT INTO `instrument_seq` VALUES (5);
/*!40000 ALTER TABLE `instrument_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `method`
--

DROP TABLE IF EXISTS `method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `method` (
  `id` bigint NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `method`
--

LOCK TABLES `method` WRITE;
/*!40000 ALTER TABLE `method` DISABLE KEYS */;
INSERT INTO `method` VALUES (1,'STD-VL-DDA-60min-T20-CID-IT'),(2,'STD-L1-DDA-90min-TSP-HCD-IT_H_max2ul'),(3,'STD-E1-DDA-90min-TSP-HCD-IT_H_max2ul'),(4,'STD-VL-DDA-120min-T20-CID-IT'),(5,'STD-L1-DDA-60min-TSP-CID-OT-MS2-MS3-crosslink_max5ul'),(6,'STD-E1-DDA-60min-TSP-CID-OT-MS2-MS3-crosslink_max5ul'),(8,'STD-L1-DDA-60min-TSP-HCD-IT_max2ul'),(9,'STD-L1-DDA-90min-TSP-HCD-IT_H_max5ul'),(10,'STD-E1-DDA-90min-TSP-HCD-IT_H_max5ul'),(13,'STD-E1-DDA-90min-TSP-HCD-IT_L_max2ul'),(14,'STD-E1-DDA-90min-TSP-HCD-IT_L_max5ul'),(15,'STD-L1-DDA-90min-TSP-HCD-IT_L_max2ul'),(16,'STD-L1-DDA-90min-TSP-HCD-IT_L_max5ul'),(17,'EXP-VL-DDA-60min-T20-CID-MSA'),(18,'STD-E1-DDA-60min-TSP-HCD-IT_L_max5ul'),(19,'STD-L1-DDA-60min-TSP-HCD-IT_L_max5ul'),(20,'STD-E1-DDA-60min-TSP-HCD-ETD-OT_max5ul'),(21,'STD-L1-DDA-60min-TSP-HCD-ETD-OT_max5ul'),(22,'STD-E1-DIA-120min-40X10'),(23,'STD-L1-DIA-120min-40X10'),(24,'STD-E1-DDA-90min-TMT-RTS-MS3_max2ul_humanDB'),(25,'STD-E1-DDA-90min-TMT-RTS-MS3_max5ul_humanDB'),(26,'STD-E1-DDA-90min-TMT-RTS-MS3_max2ul_mouseDB'),(27,'STD-E1-DDA-90min-TMT-RTS-MS3_max2ul_phrogDB'),(28,'STD-E1-DDA-90min-TMT-RTS-MS3_max5ul_phrogDB'),(29,'STD-E1-DDA-90min-TMT-RTS-MS3_max2ul_capsaspora'),(30,'STD-E1-DDA-60min-TSP-HCD-CID-OT_histones_max5ul'),(31,'STD-E2-DDA-90min-TSP-HCD-IT_H_max2ul'),(32,'STD-E2-DDA-60min-TSP-CID-OT-MS2-MS3-crosslink_max5ul'),(33,'STD-E2-DDA-90min-TSP-HCD-IT_H_max5ul'),(34,'STD-E2-DDA-90min-TSP-HCD-IT_L_max2ul'),(35,'STD-E2-DDA-90min-TSP-HCD-IT_L_max5ul'),(36,'STD-E2-DDA-60min-TSP-HCD-IT_L_max5ul'),(37,'STD-E2-DDA-60min-TSP-HCD-ETD-OT_max5ul'),(38,'STD-E2-DIA-120min-40X10'),(39,'STD-E2-DIA-120min-40X10'),(40,'STD-E2-DDA-90min-TMT-RTS-MS3_max2ul_humanDB'),(41,'STD-E2-DDA-90min-TMT-RTS-MS3_max5ul_humanDB'),(42,'STD-E2-DDA-90min-TMT-RTS-MS3_max2ul_mouseDB'),(43,'STD-E2-DDA-90min-TMT-RTS-MS3_max2ul_phrogDB'),(44,'STD-E2-DDA-90min-TMT-RTS-MS3_max5ul_phrogDB'),(45,'STD-E2-DDA-90min-TMT-RTS-MS3_max2ul_capsaspora'),(46,'STD-E2-DDA-60min-TSP-HCD-CID-OT_histones_max5ul');
/*!40000 ALTER TABLE `method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `method_seq`
--

DROP TABLE IF EXISTS `method_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `method_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `method_seq`
--

LOCK TABLES `method_seq` WRITE;
/*!40000 ALTER TABLE `method_seq` DISABLE KEYS */;
INSERT INTO `method_seq` VALUES (47);
/*!40000 ALTER TABLE `method_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modification`
--

DROP TABLE IF EXISTS `modification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modification` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_587oqjwrju6fatikdb9w8xd53` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modification`
--

LOCK TABLES `modification` WRITE;
/*!40000 ALTER TABLE `modification` DISABLE KEYS */;
INSERT INTO `modification` VALUES (7,'Label:13C(6)15N(2) (K)'),(8,'Label:13C(6)15N(4) (R)'),(4,'Phenylisocyanate (N-term)'),(1,'PHOSPHO (S)'),(2,'PHOSPHO (T)'),(3,'PHOSPHO (Y)'),(5,'Propionyl (K)'),(6,'Propionyl (Protein N-term)'),(9,'TMT6plex (K)'),(10,'TMT6plex (N-term)');
/*!40000 ALTER TABLE `modification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modification_file`
--

DROP TABLE IF EXISTS `modification_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modification_file` (
  `id` bigint NOT NULL,
  `value` bigint DEFAULT NULL,
  `file_id` bigint DEFAULT NULL,
  `modification_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnvy5xth7b00tf5k4k61j9c7th` (`file_id`),
  KEY `FKsv7aipa6b5my7optbhv05ufwn` (`modification_id`),
  CONSTRAINT `FKnvy5xth7b00tf5k4k61j9c7th` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`),
  CONSTRAINT `FKsv7aipa6b5my7optbhv05ufwn` FOREIGN KEY (`modification_id`) REFERENCES `modification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `modification_seq`
--

DROP TABLE IF EXISTS `modification_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modification_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modification_seq`
--

LOCK TABLES `modification_seq` WRITE;
/*!40000 ALTER TABLE `modification_seq` DISABLE KEYS */;
INSERT INTO `modification_seq` VALUES (1);
/*!40000 ALTER TABLE `modification_seq` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `param_seq`
--

LOCK TABLES `param_seq` WRITE;
/*!40000 ALTER TABLE `param_seq` DISABLE KEYS */;
INSERT INTO `param_seq` VALUES (2);
/*!40000 ALTER TABLE `param_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_token`
--

DROP TABLE IF EXISTS `password_reset_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_token` (
  `id` bigint NOT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5lwtbncug84d4ero33v3cfxvl` (`user_id`),
  CONSTRAINT `FK5lwtbncug84d4ero33v3cfxvl` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_token`
--

LOCK TABLES `password_reset_token` WRITE;
/*!40000 ALTER TABLE `password_reset_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_token` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plot`
--

LOCK TABLES `plot` WRITE;
/*!40000 ALTER TABLE `plot` DISABLE KEYS */;
INSERT INTO `plot` VALUES (1,_binary 'apiKey1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,'Total numbers of proteins'),(3,_binary 'plot3\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1,'Total number of peptides');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plot_context_source`
--

LOCK TABLES `plot_context_source` WRITE;
/*!40000 ALTER TABLE `plot_context_source` DISABLE KEYS */;
INSERT INTO `plot_context_source` VALUES (1,1),(3,2);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plot_seq`
--

LOCK TABLES `plot_seq` WRITE;
/*!40000 ALTER TABLE `plot_seq` DISABLE KEYS */;
INSERT INTO `plot_seq` VALUES (5);
/*!40000 ALTER TABLE `plot_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quantification`
--

DROP TABLE IF EXISTS `quantification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quantification` (
  `id` bigint NOT NULL,
  `abundance` float DEFAULT NULL,
  `accession` varchar(255) DEFAULT NULL,
  `contaminant` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `file_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqdhhym2283lgqv665ymm68e1q` (`file_id`),
  CONSTRAINT `FKqdhhym2283lgqv665ymm68e1q` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quantification_seq`
--

DROP TABLE IF EXISTS `quantification_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quantification_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantification_seq`
--

LOCK TABLES `quantification_seq` WRITE;
/*!40000 ALTER TABLE `quantification_seq` DISABLE KEYS */;
INSERT INTO `quantification_seq` VALUES (1);
/*!40000 ALTER TABLE `quantification_seq` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `is_enabled` bit(1) DEFAULT b'1',
  `step_value` float DEFAULT NULL,
  PRIMARY KEY (`context_source_id`,`threshold_id`),
  KEY `FK8g1pxjaqjdhdc96r5ok5eyd9k` (`threshold_id`),
  CONSTRAINT `FK8g1pxjaqjdhdc96r5ok5eyd9k` FOREIGN KEY (`threshold_id`) REFERENCES `threshold` (`id`),
  CONSTRAINT `FKs85ab4k83uteyqmd8xf4ucb0n` FOREIGN KEY (`context_source_id`) REFERENCES `context_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `threshold_seq`
--

DROP TABLE IF EXISTS `threshold_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threshold_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threshold_seq`
--

LOCK TABLES `threshold_seq` WRITE;
/*!40000 ALTER TABLE `threshold_seq` DISABLE KEYS */;
INSERT INTO `threshold_seq` VALUES (1);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trace_color_seq`
--

LOCK TABLES `trace_color_seq` WRITE;
/*!40000 ALTER TABLE `trace_color_seq` DISABLE KEYS */;
INSERT INTO `trace_color_seq` VALUES (2);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_seq`
--

DROP TABLE IF EXISTS `user_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_seq`
--

LOCK TABLES `user_seq` WRITE;
/*!40000 ALTER TABLE `user_seq` DISABLE KEYS */;
INSERT INTO `user_seq` VALUES (1);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wet_lab_seq`
--

DROP TABLE IF EXISTS `wet_lab_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wet_lab_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wetlab`
--

LOCK TABLES `wetlab` WRITE;
/*!40000 ALTER TABLE `wetlab` DISABLE KEYS */;
INSERT INTO `wetlab` VALUES (1,_binary 'apiKey1\0\0\0\0\0\0\0\0\0','InSolutionQC',NULL),(2,_binary 'wetlab2\0\0\0\0\0\0\0\0\0','AgilentQC',45),(3,_binary 'wetlab3\0\0\0\0\0\0\0\0\0','InGelQC',NULL),(4,_binary 'wetlab4\0\0\0\0\0\0\0\0\0','PhosphoQC',NULL),(5,_binary 'wetlab5\0\0\0\0\0\0\0\0\0','FASPQC',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wetlab_plot`
--

LOCK TABLES `wetlab_plot` WRITE;
/*!40000 ALTER TABLE `wetlab_plot` DISABLE KEYS */;
INSERT INTO `wetlab_plot` VALUES (1,1),(2,3),(5,1),(3,1),(1,3),(3,3),(4,1),(5,3),(4,3),(2,1);
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

-- Dump completed on 2021-09-27  9:41:55
