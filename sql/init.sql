-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: 0.0.0.0    Database: qsample
-- ------------------------------------------------------
-- Server version	5.5.5-10.7.5-MariaDB-1:10.7.5+maria~ubu2004

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
  `id` bigint(20) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `application_constraint_id` bigint(20) DEFAULT NULL,
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
INSERT INTO `application` VALUES (1,'Identification of a protein in a gel band',1),(2,'Identification of an overexpressed protein',1),(3,'Characterization of protein-protein interactions (AP-MS) - A. Pilot experiment',1),(4,'Characterization of protein-protein interactions (AP-MS) - B. Measurement',1),(5,'Chromatin-bound proteome',1),(6,'Phosphoproteome label-free quantification',2),(7,'Proteome label-free quantification',1),(8,'Proteome label-free quantification in exosomes',1),(9,'Proteome label-free quantification in mycoplasma',1),(10,'Proteome label-free quantification in secretome',1),(11,'PTM (acetyl, methyl, phospho, ubiquitin) quantification of a purified protein - A. Pilot experiment',2),(12,'PTM (acetyl, methyl, phospho, ubiquitin) quantification of a purified protein - B. Measurement',2),(13,'PTM quantification of histones - A. Pilot experiment',3),(14,'PTM quantification of histones - B. Measurement',3),(15,'Quantification using data independent acquisition (DIA)',1),(16,'SILAC: Checking incorporation',2),(17,'SILAC: Phosphoproteome quantification',2),(18,'SILAC: Proteome quantification',2),(19,'SILAC: Ultra deep proteome quantification (fractionation)',2),(20,'Structural elucidation of crosslinked protein complexes',1),(21,'Targeted protein quantification (PRM) - A. Method development',1),(22,'Targeted protein quantification (PRM) - B. Measurement',1),(23,'TMT: Proteome quantification',2),(24,'TMT: Ultra deep proteome quantification (fractionation)',2),(25,'User tailored request (Proteomics)',1);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_constraint`
--

DROP TABLE IF EXISTS `application_constraint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_constraint` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `show_file_info_plot` tinyint(1) NOT NULL,
  `show_identified_peptides_plot` tinyint(1) NOT NULL,
  `show_identified_proteins_plot` tinyint(1) NOT NULL,
  `show_modifications_plot` tinyint(1) NOT NULL,
  `show_quantification_and_contaminant_list` tinyint(1) NOT NULL,
  `show_quantification_heat_map` tinyint(1) NOT NULL,
  `show_dendogram` tinyint(1) NOT NULL DEFAULT 0,
  `show_charges_plot` tinyint(1) NOT NULL DEFAULT 0,
  `show_histones_biological` tinyint(1) NOT NULL DEFAULT 0,
  `show_histones_tailored` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_constraint`
--

LOCK TABLES `application_constraint` WRITE;
/*!40000 ALTER TABLE `application_constraint` DISABLE KEYS */;
INSERT INTO `application_constraint` VALUES (1,'Default',0,1,1,0,1,1,0,1,0,0),(2,'Phospho',1,1,1,1,0,1,0,1,0,0),(3,'PTM',1,1,1,0,0,1,0,1,1,1);
/*!40000 ALTER TABLE `application_constraint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_constraint_seq`
--

DROP TABLE IF EXISTS `application_constraint_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_constraint_seq` (
  `next_val` bigint(20) DEFAULT NULL
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
  `next_val` bigint(20) DEFAULT NULL
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
  `id` bigint(20) NOT NULL,
  `abbreviated` varchar(50) NOT NULL,
  `api_key` char(50) NOT NULL,
  `charge` bigint(20) DEFAULT NULL,
  `mz` float DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `trace_color_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk6d0ww18rgc22m9s351or4hqu` (`trace_color_id`),
  UNIQUE KEY `UK_name` (`name`),
  CONSTRAINT `FKk6d0ww18rgc22m9s351or4hqu` FOREIGN KEY (`trace_color_id`) REFERENCES `trace_color` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `context_source`
--

LOCK TABLES `context_source` WRITE;
/*!40000 ALTER TABLE `context_source` DISABLE KEYS */;
INSERT INTO `context_source` VALUES (1,'# proteins','5008da3a-dbcd-49c3-a008-db34c4b0bb39',NULL,NULL,'Total number of identified grouped proteins',1),(2,'# peptides','958ce553-ad1a-493f-9af0-ffac364a7075',NULL,NULL,'Total number of identified peptides',1),(3,'+2','2fc40f2d-ccce-4bc9-bfb6-92e4c29e405c',NULL,NULL,'Charge +2',1),(4,'+3','8b17a1e5-5240-4bc5-85f3-47216f82093d',NULL,NULL,'Charge +3',1),(5,'+4','4ee9389c-aaad-4478-a4d4-dd6fb9fdea98',NULL,NULL,'Charge +4',1),(6,'Missed cleavages','e5ee7fa8-8731-4b8e-b5d0-a3d148c524fb',NULL,NULL,'Missed cleavages',1),(7,'Base peak intensity (removed log 04/04/22)','f9e4aaa0-c22f-445f-89b9-823469d43a73',NULL,NULL,'Base peak intensity (removed log 04/04/22)',1),(8,'Percentage Propionyl','520fbca9-b4bb-480b-87c7-ef914a26c208',NULL,NULL,'Percentage Propionyl',1),(9,'Percentage PIC','f28e5aca-c4bb-4ca0-a90a-94d36a2f7e64',NULL,NULL,'Percentage PIC',1),(10,'K(Carbamyl)','f5d89e95-2318-4b83-95f2-1f5b6491712a',NULL,NULL,'Percentage K(Carbamyl)',1),(11,'N-terminal (Carbamyl)','0075a453-9c3f-4b6b-8d93-3cb3e12e5e71',NULL,NULL,'Percentage .(Carbamyl))',1),(12,'R(Carbamyl)','87138f68-7b72-42f9-9ae2-c0d1a8229fd1',NULL,NULL,'Percentage R(Carbamyl))',1),(13,'N(Deamidated)','aa5ef26c-77dd-48a4-9eff-8c1046326635',NULL,NULL,'Percentage N(Deamidated))',1),(14,'K(Formyl)','ba8ad35b-1613-4881-903d-b6392efcf516',NULL,NULL,'Percentage K(Formyl))',1),(15,'N-terminal (Formyl)','e87e83dd-2db3-42ba-b09b-1cf6f7e2889b',NULL,NULL,'Percentage .(Formyl))',1),(16,'S(Formyl)','a82b23ab-bd4f-498e-8bec-68f1b743d1a9',NULL,NULL,'Percentage S(Formyl))',1),(17,'T(Formyl)','7722872a-c5ad-4590-9253-7a532a8c99fd',NULL,NULL,'Percentage T(Formyl))',1),(18,'pyro-Glu','89230c47-5d32-47df-83b4-c80956a8efaf',NULL,NULL,'Percentage pyro-Glu)',1),(19,'TIC (removed log 04/04/22)','ce09aa9a-f314-4bfa-b485-5d083b4ca24e',NULL,NULL,'TIC (removed log 04/04/22)',1),(20,'0','4ceda959-a107-4272-8896-d1f3d4826b99',NULL,NULL,'# missed cleavages = 0',1),(21,'1','7b8d2a03-9f6f-473e-8362-c450df636714',NULL,NULL,'# missed cleavages = 1',1),(22,'2','d9486250-e8b7-4205-a5cb-7b7e6e6d2043',NULL,NULL,'# missed cleavages = 2',1),(23,'3','ee25bc58-87a9-4bb1-894b-ba4b1f417998',NULL,NULL,'# missed cleavages = 3',1),(24,'Total number of phospho sites','7dafa69c-22d0-4464-9583-c9e143292f8a',NULL,NULL,'Total number of phospho sites',1),(25,'Total number of phospho peptides','e01c53fd-7f11-4513-8e0b-2be6bcee11be',NULL,NULL,'Total number of phospho peptides',1);
insert into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (26,"Formylation","c02a6343-7f67-4624-bfb4-46bbf42841cb",NULL,NULL,"Formylation",1);
insert into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (27,"Carbamyl","84dfec61-02b1-4e02-bab0-b70d7bc61d5c",NULL,NULL,"Carbamyl",1);
insert into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (28,"Oxidation","1efc7682-3065-43c7-820e-2f72062308b8",NULL,NULL,"Oxidation",1);
insert into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (29,"Ammonia loss","e567294f-89ca-44e8-82f2-7f3efccfc0a5",NULL,NULL,"Ammonia loss",1);
insert into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (30,"Acetyl","23edd582-90b0-40cf-ac18-2e82e2e69020",NULL,NULL,"Acetyl",1);
insert into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (31,"Deamidation","c60eda81-fa2d-4fb8-8e64-ed6a35b9c8b1",NULL,NULL,"Deamidation",1);
insert into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (32,"Amidation","4c65ea89-0572-4d2f-b942-d9e39ee89f44",NULL,NULL,"Amidation",1);
insert into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (33,"Isotopic peak error","f5162bac-eeb7-40b8-90cd-d99e39850bf2",NULL,NULL,"Isotopic peak error",1);
insert into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (34,"Didehydrobutyrine/Water loss","7060666b-a06d-44dd-9d6c-47d11c0758df",NULL,NULL,"Didehydrobutyrine/Water loss",1);
insert into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (35,"Methyl","3f25cf4f-0306-4897-a839-2b8fd15f7365",NULL,NULL,"Methyl",1);
insert into context_source (id,abbreviated,api_key,charge,mz,name,trace_color_id) values (36,"Carbamidomethyl/Addition of G","2ad85cf9-debb-4ffb-b99d-ab22536b6053",NULL,NULL,"Carbamidomethyl/Addition of G",1);
/*!40000 ALTER TABLE `context_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `context_source_seq`
--

DROP TABLE IF EXISTS `context_source_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `context_source_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `context_source_seq`
--

LOCK TABLES `context_source_seq` WRITE;
/*!40000 ALTER TABLE `context_source_seq` DISABLE KEYS */;
INSERT INTO `context_source_seq` VALUES (37);
/*!40000 ALTER TABLE `context_source_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data` (
  `context_source_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `param_id` bigint(20) NOT NULL,
  `calculated_value` float DEFAULT NULL,
  `non_conformity_status` varchar(255) DEFAULT 'OK',
  `value` float DEFAULT NULL,
  `id` bigint(20) NOT NULL,
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
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES (1,3308,1,1673,'OK',1673,24736,NULL),(1,3309,1,1651,'OK',1651,24738,NULL),(1,3311,1,1618,'OK',1618,24742,NULL),(1,3312,1,1622,'OK',1622,24744,NULL),(1,3313,1,1593,'OK',1593,24746,NULL),(1,3314,1,1723,'OK',1723,24748,NULL),(1,3315,1,1677,'OK',1677,24750,NULL),(1,3316,1,1678,'OK',1678,24753,NULL),(1,3317,1,1688,'OK',1688,24755,NULL),(1,3318,1,1756,'OK',1756,24757,NULL),(1,3319,1,1719,'OK',1719,24759,NULL),(1,3320,1,1684,'OK',1684,24761,NULL),(1,3321,1,1734,'OK',1734,24763,NULL),(1,3322,1,1712,'OK',1712,24765,NULL),(1,3323,1,1763,'OK',1763,24767,NULL),(1,3324,1,1649,'OK',1649,24769,NULL),(1,3325,1,1626,'OK',1626,24771,NULL),(1,3326,1,1646,'OK',1646,24773,NULL),(1,3327,1,2936,'OK',2936,24775,NULL),(1,3328,1,1407,'OK',1407,24777,NULL),(1,3329,1,1319,'OK',1319,24780,NULL),(1,3330,1,1510,'OK',1510,24805,NULL),(1,3331,1,1296,'OK',1296,24808,NULL),(1,3332,1,1250,'OK',1250,24811,NULL),(1,3333,1,1251,'OK',1251,24814,NULL),(1,3334,1,1416,'OK',1416,24817,NULL),(1,3335,1,1088,'OK',1088,24820,NULL),(1,3336,1,1096,'OK',1096,24823,NULL),(1,3337,1,83,'OK',83,24783,NULL),(1,3338,1,68,'OK',68,24785,NULL),(1,3339,1,111,'OK',111,24787,NULL),(1,3340,1,75,'OK',75,24789,NULL),(1,3341,1,55,'OK',55,24791,NULL),(1,3342,1,66,'OK',66,24793,NULL),(1,3343,1,60,'OK',60,24795,NULL),(1,3344,1,88,'OK',88,24797,NULL),(1,3345,1,76,'OK',76,24799,NULL),(1,3346,1,2554,'OK',2554,24801,NULL),(1,3347,1,2563,'OK',2563,24803,NULL),(1,4836,1,4363,'OK',4363,50864,NULL),(1,4837,1,4402,'OK',4402,50878,NULL),(1,4838,1,4854,'OK',4854,50893,NULL),(1,4870,1,313,'OK',313,51423,NULL),(1,4871,1,311,'OK',311,51445,NULL),(1,4872,1,283,'OK',283,51434,NULL),(2,3308,1,8473,'OK',8473,24737,NULL),(2,3309,1,8356,'OK',8356,24739,NULL),(2,3311,1,8652,'OK',8652,24743,NULL),(2,3312,1,8523,'OK',8523,24745,NULL),(2,3313,1,8249,'OK',8249,24747,NULL),(2,3314,1,9036,'OK',9036,24749,NULL),(2,3315,1,8484,'OK',8484,24751,NULL),(2,3316,1,8762,'OK',8762,24754,NULL),(2,3317,1,8820,'OK',8820,24756,NULL),(2,3318,1,8801,'OK',8801,24758,NULL),(2,3319,1,8713,'OK',8713,24760,NULL),(2,3320,1,8554,'OK',8554,24762,NULL),(2,3321,1,9094,'OK',9094,24764,NULL),(2,3322,1,8864,'OK',8864,24766,NULL),(2,3323,1,9075,'OK',9075,24768,NULL),(2,3324,1,8045,'OK',8045,24770,NULL),(2,3325,1,7918,'OK',7918,24772,NULL),(2,3326,1,8058,'OK',8058,24774,NULL),(2,3327,1,4630,'OK',4630,24776,NULL),(2,3328,1,2623,'OK',2623,24778,NULL),(2,3329,1,2400,'OK',2400,24781,NULL),(2,3330,1,3030,'OK',3030,24806,NULL),(2,3331,1,2415,'OK',2415,24809,NULL),(2,3332,1,2281,'OK',2281,24812,NULL),(2,3333,1,2380,'OK',2380,24815,NULL),(2,3334,1,2714,'OK',2714,24818,NULL),(2,3335,1,1947,'OK',1947,24821,NULL),(2,3336,1,1865,'OK',1865,24824,NULL),(2,3337,1,149,'OK',149,24784,NULL),(2,3338,1,112,'OK',112,24786,NULL),(2,3339,1,224,'OK',224,24788,NULL),(2,3340,1,154,'OK',154,24790,NULL),(2,3341,1,108,'OK',108,24792,NULL),(2,3342,1,127,'OK',127,24794,NULL),(2,3343,1,136,'OK',136,24796,NULL),(2,3344,1,166,'OK',166,24798,NULL),(2,3345,1,159,'OK',159,24800,NULL),(2,3346,1,4099,'OK',4099,24802,NULL),(2,3347,1,3985,'OK',3985,24804,NULL),(2,4836,1,18295,'OK',18295,50865,NULL),(2,4837,1,19009,'OK',19009,50879,NULL),(2,4838,1,21756,'OK',21756,50894,NULL),(2,4870,1,1559,'OK',1559,51424,NULL),(2,4871,1,1548,'OK',1548,51446,NULL),(2,4872,1,1534,'OK',1534,51435,NULL),(3,4836,1,14906,'OK',14906,50866,NULL),(3,4837,1,15140,'OK',15140,50880,NULL),(3,4838,1,17718,'OK',17718,50895,NULL),(3,4870,1,852,'OK',852,51425,NULL),(3,4871,1,850,'OK',850,51447,NULL),(3,4872,1,871,'OK',871,51436,NULL),(4,4836,1,4038,'OK',4038,50867,NULL),(4,4837,1,4508,'OK',4508,50881,NULL),(4,4838,1,5085,'OK',5085,50896,NULL),(4,4870,1,625,'OK',625,51426,NULL),(4,4871,1,606,'OK',606,51448,NULL),(4,4872,1,599,'OK',599,51437,NULL),(5,4836,1,364,'OK',364,50868,NULL),(5,4837,1,417,'OK',417,50882,NULL),(5,4838,1,473,'OK',473,50897,NULL),(5,4870,1,223,'OK',223,51427,NULL),(5,4871,1,214,'OK',214,51449,NULL),(5,4872,1,215,'OK',215,51438,NULL),(7,4836,1,154797000000,'OK',154797000000,50869,NULL),(7,4837,1,124281000000,'OK',124281000000,50883,NULL),(7,4838,1,332508000000,'OK',332508000000,50898,NULL),(7,4870,1,865163000000,'OK',865163000000,51428,NULL),(7,4871,1,1550760000000,'OK',1550760000000,51450,NULL),(7,4872,1,874465000000,'OK',874465000000,51439,NULL),(10,4836,1,0.0370881,'OK',0.0370881,50860,NULL),(10,4837,1,0.0362903,'OK',0.0362903,50877,NULL),(10,4838,1,0.0385609,'OK',0.0385609,50915,NULL),(11,4836,1,0.0675507,'OK',0.0675507,50905,NULL),(11,4837,1,0.0692033,'OK',0.0692033,50875,NULL),(11,4838,1,0.069406,'OK',0.069406,50910,NULL),(12,4836,1,0.0367874,'OK',0.0367874,50861,NULL),(12,4837,1,0.0385249,'OK',0.0385249,50891,NULL),(12,4838,1,0.0394472,'OK',0.0394472,50936,NULL),(13,4836,1,0.0418495,'OK',0.0418495,50863,NULL),(13,4837,1,0.0484286,'OK',0.0484286,50889,NULL),(13,4838,1,0.0491673,'OK',0.0491673,50911,NULL),(14,4836,1,0.048818,'OK',0.048818,50876,NULL),(14,4837,1,0.0508388,'OK',0.0508388,50892,NULL),(14,4838,1,0.0519884,'OK',0.0519884,50949,NULL),(15,4836,1,0.0237015,'OK',0.0237015,50859,NULL),(15,4837,1,0.022834,'OK',0.022834,50858,NULL),(15,4838,1,0.024019,'OK',0.024019,50906,NULL),(16,4836,1,0.0821967,'OK',0.0821967,50907,NULL),(16,4837,1,0.0766425,'OK',0.0766425,50908,NULL),(16,4838,1,0.0726089,'OK',0.0726089,50914,NULL),(17,4836,1,0.0486275,'OK',0.0486275,50862,NULL),(17,4837,1,0.0492113,'OK',0.0492113,50904,NULL),(17,4838,1,0.0484857,'OK',0.0484857,50932,NULL),(18,4836,1,0.0108543,'OK',0.0108543,50909,NULL),(18,4837,1,0.0138376,'OK',0.0138376,50890,NULL),(18,4838,1,0.0131627,'OK',0.0131627,50916,NULL),(19,4836,1,1503210000000,'OK',1503210000000,50870,NULL),(19,4837,1,1342160000000,'OK',1342160000000,50884,NULL),(19,4838,1,3423760000000,'OK',3423760000000,50899,NULL),(19,4870,1,6102480000000,'OK',6102480000000,51429,NULL),(19,4871,1,10647300000000,'OK',10647300000000,51451,NULL),(19,4872,1,6341240000000,'OK',6341240000000,51440,NULL),(20,4836,1,16783,'OK',16783,50871,NULL),(20,4837,1,17447,'OK',17447,50885,NULL),(20,4838,1,19808,'OK',19808,50900,NULL),(20,4870,1,1092,'OK',1092,51430,NULL),(20,4871,1,1063,'OK',1063,51452,NULL),(20,4872,1,1078,'OK',1078,51441,NULL),(21,4836,1,1262,'OK',1262,50872,NULL),(21,4837,1,1290,'OK',1290,50886,NULL),(21,4838,1,1636,'OK',1636,50901,NULL),(21,4870,1,467,'OK',467,51431,NULL),(21,4871,1,485,'OK',485,51453,NULL),(21,4872,1,456,'OK',456,51442,NULL),(22,4836,1,194,'OK',194,50873,NULL),(22,4837,1,198,'OK',198,50887,NULL),(22,4838,1,256,'OK',256,50902,NULL),(22,4870,1,0,'OK',0,51432,NULL),(22,4871,1,0,'OK',0,51454,NULL),(22,4872,1,0,'OK',0,51443,NULL),(23,4836,1,56,'OK',56,50874,NULL),(23,4837,1,74,'OK',74,50888,NULL),(23,4838,1,56,'OK',56,50903,NULL),(23,4870,1,0,'OK',0,51433,NULL),(23,4871,1,0,'OK',0,51455,NULL),(23,4872,1,0,'OK',0,51444,NULL),(24,3328,1,2999,'OK',2999,24779,NULL),(24,3329,1,2678,'OK',2678,24782,NULL),(24,3330,1,3368,'OK',3368,24807,NULL),(24,3331,1,2689,'OK',2689,24810,NULL),(24,3332,1,2501,'OK',2501,24813,NULL),(24,3333,1,2560,'OK',2560,24816,NULL),(24,3334,1,3160,'OK',3160,24819,NULL),(24,3335,1,2130,'OK',2130,24822,NULL),(24,3336,1,2044,'OK',2044,24825,NULL);
INSERT INTO `data` VALUES (25,3328,1,2406,'OK',2406,24833,NULL);
INSERT INTO `data` VALUES (25,3329,1,2204,'OK',2204,24837,NULL);
INSERT INTO `data` VALUES (25,3332,1,1991,'OK',1991,24841,NULL);
INSERT INTO `data` VALUES (25,3333,1,2059,'OK',2059,24845,NULL);
INSERT INTO `data` VALUES (25,3334,1,2508,'OK',2508,24849,NULL);
INSERT INTO `data` VALUES (25,3335,1,1809,'OK',1809,24853,NULL);
INSERT INTO `data` VALUES (25,3336,1,1665,'OK',1665,24857,NULL);
INSERT INTO `data` VALUES (25,3331,1,2161,'OK',2161,24861,NULL);

insert into data (context_source_id, file_id, param_id, calculated_value, non_conformity_status, value, id, std) values
(26, 3359, 1, 0.656, 'OK', 0.656, 25059, NULL),
(26, 4836, 1, 0.167, 'OK', 0.167, 25113, NULL),
(26, 4837, 1, 0.049, 'OK', 0.049, 25131, NULL),
(26, 4838, 1, 0.108, 'OK', 0.108, 25149, NULL),
(27, 4836, 1, 1.133, 'OK', 1.133, 25114, NULL),
(27, 4837, 1, 1.063, 'OK', 1.063, 25132, NULL),
(27, 4838, 1, 1.54, 'OK', 1.54, 25150, NULL),
(28, 3359, 1, 8.882, 'OK', 8.882, 25060, NULL),
(28, 4836, 1, 0.04, 'OK', 0.04, 25115, NULL),
(28, 4837, 1, 0.039, 'OK', 0.039, 25133, NULL),
(28, 4838, 1, 0.065, 'OK', 0.065, 25151, NULL),
(29, 3359, 1, 1.18, 'OK', 1.18, 25061, NULL),
(29, 4836, 1, 0.18, 'OK', 0.18, 25116, NULL),
(29, 4837, 1, 0.219, 'OK', 0.219, 25134, NULL),
(29, 4838, 1, 0.371, 'OK', 0.371, 25152, NULL),
(30, 4836, 1, 0.047, 'OK', 0.047, 25117, NULL),
(30, 4837, 1, 0.036, 'OK', 0.036, 25135, NULL),
(30, 4838, 1, 0.051, 'OK', 0.051, 25153, NULL),
(31, 3359, 1, 3.114, 'OK', 3.114, 25062, NULL),
(31, 4836, 1, 0.167, 'OK', 0.167, 25118, NULL),
(31, 4837, 1, 0.111, 'OK', 0.111, 25136, NULL),
(31, 4838, 1, 0.239, 'OK', 0.239, 25154, NULL),
(32, 3359, 1, 1.508, 'OK', 1.508, 25063, NULL),
(32, 4836, 1, 0.593, 'OK', 0.593, 25119, NULL),
(32, 4837, 1, 0.71, 'OK', 0.71, 25137, NULL),
(32, 4838, 1, 0.796, 'OK', 0.796, 25155, NULL),
(33, 3359, 1, 3.835, 'OK', 3.835, 25064, NULL),
(33, 4836, 1, 2.422, 'OK', 2.422, 25120, NULL),
(33, 4837, 1, 1.993, 'OK', 1.993, 25138, NULL),
(33, 4838, 1, 2.223, 'OK', 2.223, 25156, NULL),
(34, 3359, 1, 0.393, 'OK', 0.393, 25065, NULL),
(34, 4836, 1, 0.043, 'OK', 0.043, 25121, NULL),
(34, 4837, 1, 0.036, 'OK', 0.036, 25139, NULL),
(34, 4838, 1, 0.075, 'OK', 0.075, 25157, NULL),
(35, 3359, 1, 0.524, 'OK', 0.524, 25066, NULL),
(35, 4838, 1, 0.032, 'OK', 0.032, 25158, NULL),
(36, 3359, 1, 0.688, 'OK', 0.688, 25067, NULL),
(36, 4836, 1, 0.08, 'OK', 0.08, 25122, NULL),
(36, 4837, 1, 0.075, 'OK', 0.075, 25140, NULL),
(36, 4838, 1, 0.137, 'OK', 0.137, 25159, NULL);
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_seq`
--

DROP TABLE IF EXISTS `data_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_seq`
--

LOCK TABLES `data_seq` WRITE;
/*!40000 ALTER TABLE `data_seq` DISABLE KEYS */;
INSERT INTO `data_seq` VALUES (51456);
/*!40000 ALTER TABLE `data_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_request`
--

DROP TABLE IF EXISTS `favorite_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_request` (
  `id` bigint(20) NOT NULL,
  `agendo_id` bigint(20) DEFAULT NULL,
  `request_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_request_code` (`request_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_request`
--

LOCK TABLES `favorite_request` WRITE;
/*!40000 ALTER TABLE `favorite_request` DISABLE KEYS */;
INSERT INTO `favorite_request` VALUES (59,NULL,'2022MQ777');
/*!40000 ALTER TABLE `favorite_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_request_seq`
--

DROP TABLE IF EXISTS `favorite_request_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_request_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_request_seq`
--

LOCK TABLES `favorite_request_seq` WRITE;
/*!40000 ALTER TABLE `favorite_request_seq` DISABLE KEYS */;
INSERT INTO `favorite_request_seq` VALUES (60);
/*!40000 ALTER TABLE `favorite_request_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_request_users`
--

DROP TABLE IF EXISTS `favorite_request_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_request_users` (
  `id` bigint(20) NOT NULL,
  `notify` tinyint(1) DEFAULT NULL,
  `favorite_request_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `notes` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKss42oap5dsfcmaseto0hf317e` (`favorite_request_id`),
  KEY `FKk0wpl0unphxnfdgccoco1g0us` (`user_id`),
  UNIQUE KEY `UK_fav_user` (`favorite_request_id`, `user_id`),
  CONSTRAINT `FKk0wpl0unphxnfdgccoco1g0us` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKss42oap5dsfcmaseto0hf317e` FOREIGN KEY (`favorite_request_id`) REFERENCES `favorite_request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_request_users`
--

LOCK TABLES `favorite_request_users` WRITE;
/*!40000 ALTER TABLE `favorite_request_users` DISABLE KEYS */;
INSERT INTO `favorite_request_users` VALUES (8026,0,59,26,NULL);
/*!40000 ALTER TABLE `favorite_request_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `dtype` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL,
  `checksum` varchar(50) NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `wet_lab_type` bigint(20) DEFAULT NULL,
  `request_code` varchar(255) DEFAULT NULL,
  `file_info_id` bigint(20) DEFAULT NULL,
  `replicate` int(11) DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_s6qjegp2eohyfcc8nehhrrk17` (`checksum`),
  UNIQUE KEY `unique_checksum` (`checksum`),
  KEY `FKngem4y76s84dei8nvtw44r1fl` (`wet_lab_type`),
  KEY `FKrmh3d76ins4ukfmi4e154cvvw` (`file_info_id`),
  CONSTRAINT `FKngem4y76s84dei8nvtw44r1fl` FOREIGN KEY (`wet_lab_type`) REFERENCES `wetlab` (`id`),
  CONSTRAINT `FKrmh3d76ins4ukfmi4e154cvvw` FOREIGN KEY (`file_info_id`) REFERENCES `file_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES ('WetLabFile',3308,'5d95c3149c0cd94284047b33df46944e',DATE_SUB(CURRENT_DATE, INTERVAL 10 DAY),'20220704_QCDL_W27_R2_01_InSol_LysC_Tryp.raw',1,NULL,NULL,2,27,2022),('WetLabFile',3309,'70cf0379d303c4be1695363e4d402749',DATE_SUB(CURRENT_DATE, INTERVAL 11 DAY),'20220704_QCDL_W27_R1_01_InSol_LysC_Tryp.raw',1,NULL,NULL,1,27,2022),('WetLabFile',3311,'6e5fbea0415d05a3cf5a9dd6aea85e89',DATE_SUB(CURRENT_DATE, INTERVAL 12 DAY),'20220803_QCDL_W31_R3_01_InSol_LysC_Tryp.raw',1,NULL,NULL,3,31,2022),('WetLabFile',3312,'b012fb77cf51be2e0bbe79b216803546',DATE_SUB(CURRENT_DATE, INTERVAL 13 DAY),'20220803_QCDL_W31_R2_01_InSol_LysC_Tryp.raw',1,NULL,NULL,2,31,2022),('WetLabFile',3313,'816d9f3919e1de355a629a8b9cd21a09',DATE_SUB(CURRENT_DATE, INTERVAL 15 DAY),'20220803_QCDL_W31_R1_01_InSol_LysC_Tryp.raw',1,NULL,NULL,1,31,2022),('WetLabFile',3314,'c343dfbd4f880e7cd6215d3d93a8d7dc',DATE_SUB(CURRENT_DATE, INTERVAL 17 DAY),'20220714_QCDL_W28_R3_01_InSol_LysC_Tryp.raw',1,NULL,NULL,3,28,2022),('WetLabFile',3315,'d48aa0003f85a27ee516bad9b08411c4',DATE_SUB(CURRENT_DATE, INTERVAL 18 DAY),'20220704_QCDL_W27_R3_01_InSol_LysC_Tryp.raw',1,NULL,NULL,3,27,2022),('WetLabFile',3316,'a3d9c27b451b10a4ad98cd40a35b65b2',DATE_SUB(CURRENT_DATE, INTERVAL 20 DAY),'20220714_QCDL_W28_R2_01_InSol_LysC_Tryp.raw',1,NULL,NULL,2,28,2022),('WetLabFile',3317,'d6b5cf19b7e0c33e39778816c0951685',DATE_SUB(CURRENT_DATE, INTERVAL 22 DAY),'20220714_QCDL_W28_R1_01_InSol_LysC_Tryp.raw',1,NULL,NULL,1,28,2022),('WetLabFile',3318,'48424087182fd4a9d95119206d8fe185',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20221228_QCFL_W52_R3_01_FASP_LysC_Tryp.raw',5,NULL,NULL,3,52,2022),('WetLabFile',3319,'c4af462649b91e7df8e27bcd6c130397',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20221228_QCFL_W52_R2_01_FASP_LysC_Tryp.raw',5,NULL,NULL,2,52,2022),('WetLabFile',3320,'dbe9ad83c5511e9990ea4514c4f5a0c0',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20221228_QCFL_W52_R1_01_FASP_LysC_Tryp.raw',5,NULL,NULL,1,52,2022),('WetLabFile',3321,'e94300fac62427dc937c2fa66304c197',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20221017_QCFL_W42_R3_01_FASP_LysC_Tryp.raw',5,NULL,NULL,3,42,2022),('WetLabFile',3322,'dad40e27c9d906fe2c613e25e6b5dc21',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20221017_QCFL_W42_R2_01_FASP_LysC_Tryp.raw',5,NULL,NULL,2,42,2022),('WetLabFile',3323,'3366ff142dc77a07bbd5b4ba8daab271',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20221017_QCFL_W42_R1_01_FASP_LysC_Tryp.raw',5,NULL,NULL,1,42,2022),('WetLabFile',3324,'6215b453cb2d0a0c6e72b3cb6841b985',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220823_QCFL_W34_R3_01_FASP_LysC_Tryp.raw',5,NULL,NULL,3,34,2022),('WetLabFile',3325,'198d24dfe38ed08e84ff56855f5746d0',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220823_QCFL_W34_R2_01_FASP_LysC_Tryp.raw',5,NULL,NULL,2,34,2022),('WetLabFile',3326,'2feedf30fe7d33b374213a96c48d7616',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220823_QCFL_W34_R1_01_FASP_LysC_Tryp.raw',5,NULL,NULL,1,34,2022),('WetLabFile',3327,'360360dca0ccd9460d1408d7bc53cfb0',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220809_QCRL_W32_R1_FR12_01.raw',2,NULL,NULL,1,32,2022),('WetLabFile',3328,'bb94f5e414825d38b575746b28982290',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220505_QCPL_W17_R3_01_Phospho.raw',4,NULL,NULL,3,17,2022),('WetLabFile',3329,'dbc27e485ef91a0c9fc4a443172f0233',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220505_QCPL_W17_R2_01_Phospho.raw',4,NULL,NULL,2,17,2022),('WetLabFile',3330,'71b515a231e357639ac9d61ca81642a2',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220505_QCPL_W17_R1_01_Phospho.raw',4,NULL,NULL,1,17,2022),('WetLabFile',3331,'626f6865b11588aabadb9bbda2f311c5',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220420_QCPL_W16_R3_01_Phospho.raw',4,NULL,NULL,3,16,2022),('WetLabFile',3332,'411ee835e3122c1c10c85eafc5502c9d',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220420_QCPL_W16_R2_01_Phospho.raw',4,NULL,NULL,2,16,2022),('WetLabFile',3333,'0c496a391c644bc98a4ca785f4bf6b61',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220420_QCPL_W16_R1_01_Phospho.raw',4,NULL,NULL,1,16,2022),('WetLabFile',3334,'ed111dc62bf83e21bc2e4ab4450b3f89',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220420_QCPL_W15_R6_01_Phospho.raw',4,NULL,NULL,6,15,2022),('WetLabFile',3335,'5da30a3eb8ade6144fbaa6559c04bbaf',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220420_QCPL_W15_R5_01_Phospho.raw',4,NULL,NULL,5,15,2022),('WetLabFile',3336,'090601d458a4f6a719c2d8b74334fd18',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220420_QCPL_W15_R4_01_Phospho.raw',4,NULL,NULL,4,15,2022),('WetLabFile',3337,'6ba738cc6f06e65675dbe03ac436e0f9',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220221_QCGL_W08_R3_01_InGel_Tryp.raw',3,NULL,NULL,3,8,2022),('WetLabFile',3338,'c39695f9bcb84b764fe8dbe560c1995c',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220221_QCGL_W08_R2_01_InGel_Tryp.raw',3,NULL,NULL,2,8,2022),('WetLabFile',3339,'2c6f9ec5f76962e59131ca3fd271f4c5',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220221_QCGL_W08_R1_01_InGel_Tryp.raw',3,NULL,NULL,1,8,2022),('WetLabFile',3340,'7747df123104b1f32845aff1ee0b1065',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220125_QCGL_W04_R3_01_InGel_Tryp.raw',3,NULL,NULL,3,4,2022),('WetLabFile',3341,'22b9e9a099ae9cbd609f4a1c1cd017af',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220125_QCGL_W04_R2_01_InGel_Tryp.raw',3,NULL,NULL,2,4,2022),('WetLabFile',3342,'65460a6fdb1160230f6b6ebfe7c56595',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220125_QCGL_W04_R1_01_InGel_Tryp.raw',3,NULL,NULL,1,4,2022),('WetLabFile',3343,'614511be8e3f0d5b442775858562532e',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220119_QCGL_W03_R3_01_InGel_Tryp.raw',3,NULL,NULL,3,3,2022),('WetLabFile',3344,'d220f7c2d6ef227eac2d1b444e459052',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220119_QCGL_W03_R2_01_InGel_Tryp.raw',3,NULL,NULL,2,3,2022),('WetLabFile',3345,'3970b2e0cbabbda730827203e67f9cd1',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20220119_QCGL_W03_R1_01_InGel_Tryp.raw',3,NULL,NULL,1,3,2022),('WetLabFile',3346,'4f9b20c552e54057ac9d8e611c3eebd4',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20211014_QCRL_W41_R1_FR12_01.raw',2,NULL,NULL,1,41,2021),('WetLabFile',3347,'46440a916ccf5478d236d2c8fad1ebe6',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'20210929_QCRL_W39_R1_FR12_10pto.raw',2,NULL,NULL,1,39,2021),('RequestFile',4836,'579ccee1a5d3bbd50b38309c5cbd6429',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'2022MQ777_DDA_TEST_03.raw',NULL,'2022MQ777',NULL,NULL,NULL,NULL),('RequestFile',4837,'acaf2df886b221f7e7c5ffdcfb51bb4e',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'2022MQ777_DDA_TEST_02.raw',NULL,'2022MQ777',NULL,NULL,NULL,NULL),('RequestFile',4838,'539f4462ca29c57d26c3e1c7bbbff155',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'2022MQ777_DDA_TEST_01.raw',NULL,'2022MQ777',NULL,NULL,NULL,NULL),('RequestFile',4870,'3fb1b4309c94b70079175c307443f914',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'2022MK777_DIA_TEST_03.raw',NULL,'2022MK777',NULL,NULL,NULL,NULL),('RequestFile',4871,'43a1bb8037c1f1cf211c444cb478cfa3',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'2022MK777_DIA_TEST_02.raw',NULL,'2022MK777',NULL,NULL,NULL,NULL),('RequestFile',4872,'b6f7c75ebea36677efd6f9ebb80d42f0',DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'2022MK777_DIA_TEST_01.raw',NULL,'2022MK777',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_info`
--

DROP TABLE IF EXISTS `file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_info` (
  `id` bigint(20) NOT NULL,
  `peptide_hits` bigint(20) DEFAULT NULL,
  `peptide_modified` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_info`
--

LOCK TABLES `file_info` WRITE;
/*!40000 ALTER TABLE `file_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_info_seq`
--

DROP TABLE IF EXISTS `file_info_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_info_seq` (
  `next_val` bigint(20) DEFAULT NULL
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
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_seq`
--

LOCK TABLES `file_seq` WRITE;
/*!40000 ALTER TABLE `file_seq` DISABLE KEYS */;
INSERT INTO `file_seq` VALUES (4873);
/*!40000 ALTER TABLE `file_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guide_set`
--

DROP TABLE IF EXISTS `guide_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guide_set` (
  `id` bigint(20) NOT NULL,
  `api_key` char(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ea8e5icv3469cmimqepyfx3cx` (`api_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide_set`
--

LOCK TABLES `guide_set` WRITE;
/*!40000 ALTER TABLE `guide_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `guide_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guide_set_files`
--

DROP TABLE IF EXISTS `guide_set_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guide_set_files` (
  `guide_set_id` bigint(20) NOT NULL,
  `files_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_hynquehs4vq14dfc83838jbnf` (`files_id`),
  KEY `FKdh668kmoo1ma7132mvg8gb872` (`guide_set_id`),
  CONSTRAINT `FK7uep4tvhecv44gufxf1f51trd` FOREIGN KEY (`files_id`) REFERENCES `file` (`id`),
  CONSTRAINT `FKdh668kmoo1ma7132mvg8gb872` FOREIGN KEY (`guide_set_id`) REFERENCES `guide_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guide_set_files`
--

LOCK TABLES `guide_set_files` WRITE;
/*!40000 ALTER TABLE `guide_set_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `guide_set_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guide_set_seq`
--

DROP TABLE IF EXISTS `guide_set_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guide_set_seq` (
  `next_val` bigint(20) DEFAULT NULL
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
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (8027);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injection_conditions`
--

DROP TABLE IF EXISTS `injection_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injection_conditions` (
  `id` bigint(20) NOT NULL,
  `volume` float DEFAULT NULL,
  `application_id` bigint(20) DEFAULT NULL,
  `instrument_id` bigint(20) DEFAULT NULL,
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
INSERT INTO `injection_conditions` VALUES (52,4.5,4,2),(53,4.5,5,2),(54,4.5,6,2),(55,2,7,2),(56,1,8,2),(57,1,10,2),(58,1,11,2),(59,4.5,12,2),(60,1,13,2),(61,4.5,14,2),(62,4.5,17,2),(63,1,18,2),(64,2,19,2),(65,3,20,2),(67,4.5,5,3),(68,4.5,6,3),(69,2,7,3),(70,1,8,3),(71,1,10,3),(72,4.5,12,3),(73,1,13,3),(74,4.5,14,3),(75,4.5,17,3),(76,1,18,3),(77,2,19,3),(78,3,20,3),(79,1,3,2),(81,4.5,1,2),(85,1,11,3),(86,1,15,2),(87,1,15,3),(89,2,23,3),(90,2,24,3),(93,4.5,1,4),(96,4.5,5,4),(97,2,23,4),(98,4.5,6,4),(99,2,7,4),(100,1,8,4),(101,1,10,4),(102,1,11,4),(103,4.5,12,4),(104,1,13,4),(105,4.5,14,4),(106,1,15,4),(107,4.5,17,4),(108,1,18,4),(109,2,19,4),(110,3,20,4),(111,2,24,4),(114,NULL,3,1),(115,NULL,5,1),(116,NULL,6,1),(117,NULL,24,1),(118,NULL,1,3),(119,1,2,2),(120,1,9,2),(121,1,9,3),(122,1,9,4),(123,1,16,2),(124,1,16,3),(125,1,16,4),(126,1,3,3);
/*!40000 ALTER TABLE `injection_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injection_conditions_methods`
--

DROP TABLE IF EXISTS `injection_conditions_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injection_conditions_methods` (
  `injection_conditions_id` bigint(20) NOT NULL,
  `methods_id` bigint(20) NOT NULL,
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
INSERT INTO `injection_conditions_methods` VALUES (55,2),(68,13),(68,14),(69,3),(59,19),(59,21),(72,18),(72,20),(89,24),(89,25),(89,26),(89,27),(89,28),(89,29),(90,24),(90,25),(90,26),(90,27),(90,28),(90,29),(74,30),(78,6),(65,5),(93,31),(93,33),(97,40),(97,41),(97,42),(97,44),(97,43),(97,45),(98,34),(98,35),(99,31),(105,46),(110,32),(111,40),(111,41),(111,42),(111,44),(111,43),(111,45),(79,47),(79,48),(52,47),(52,48),(53,2),(53,16),(67,13),(67,16),(96,34),(96,35),(81,19),(81,48),(119,47),(54,15),(54,16),(100,34),(70,13),(56,15),(120,15),(122,34),(121,13),(57,15),(71,13),(101,34),(58,19),(58,21),(58,47),(85,18),(85,20),(85,49),(102,36),(102,37),(102,51),(103,37),(103,36),(73,30),(104,46),(61,52),(60,52),(86,56),(87,55),(106,53),(123,2),(124,3),(125,31),(107,35),(75,14),(62,16),(63,2),(76,3),(108,31),(109,31),(64,2),(77,3),(126,49),(126,18);
/*!40000 ALTER TABLE `injection_conditions_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injection_conditions_qc`
--

DROP TABLE IF EXISTS `injection_conditions_qc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injection_conditions_qc` (
  `id` bigint(20) NOT NULL,
  `method` varchar(255) DEFAULT NULL,
  `qctype` varchar(255) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `instrument_id` bigint(20) DEFAULT NULL,
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
  `next_val` bigint(20) DEFAULT NULL
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
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injection_conditions_seq`
--

LOCK TABLES `injection_conditions_seq` WRITE;
/*!40000 ALTER TABLE `injection_conditions_seq` DISABLE KEYS */;
INSERT INTO `injection_conditions_seq` VALUES (127);
/*!40000 ALTER TABLE `injection_conditions_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injection_conditionsqc`
--

DROP TABLE IF EXISTS `injection_conditionsqc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injection_conditionsqc` (
  `id` bigint(20) NOT NULL,
  `qctype` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `instrument_id` bigint(20) DEFAULT NULL,
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
  `id` bigint(20) NOT NULL,
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
  `next_val` bigint(20) DEFAULT NULL
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
  `id` bigint(20) NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `method`
--

LOCK TABLES `method` WRITE;
/*!40000 ALTER TABLE `method` DISABLE KEYS */;
INSERT INTO `method` VALUES (2,'STD-L1-DDA-90min-TSP-HCD-IT_H_max2ul'),(3,'STD-E1-DDA-90min-TSP-HCD-IT_H_max2ul'),(5,'STD-L1-DDA-60min-TSP-CID-OT-MS2-MS3-crosslink_max5ul'),(6,'STD-E1-DDA-60min-TSP-CID-OT-MS2-MS3-crosslink_max5ul'),(8,'STD-L1-DDA-60min-TSP-HCD-IT_max2ul'),(9,'STD-L1-DDA-90min-TSP-HCD-IT_H_max5ul'),(10,'STD-E1-DDA-90min-TSP-HCD-IT_H_max5ul'),(13,'STD-E1-DDA-90min-TSP-HCD-IT_L_max2ul'),(14,'STD-E1-DDA-90min-TSP-HCD-IT_L_max5ul'),(15,'STD-L1-DDA-90min-TSP-HCD-IT_L_max2ul'),(16,'STD-L1-DDA-90min-TSP-HCD-IT_L_max5ul'),(18,'STD-E1-DDA-60min-TSP-HCD-IT_L_max5ul'),(19,'STD-L1-DDA-60min-TSP-HCD-IT_L_max5ul'),(20,'STD-E1-DDA-60min-TSP-HCD-ETD-OT_max5ul'),(21,'STD-L1-DDA-60min-TSP-HCD-ETD-OT_max5ul'),(24,'STD-E1-DDA-90min-TMT-RTS-MS3_max2ul_humanDB'),(25,'STD-E1-DDA-90min-TMT-RTS-MS3_max5ul_humanDB'),(26,'STD-E1-DDA-90min-TMT-RTS-MS3_max2ul_mouseDB'),(27,'STD-E1-DDA-90min-TMT-RTS-MS3_max2ul_phrogDB'),(28,'STD-E1-DDA-90min-TMT-RTS-MS3_max5ul_phrogDB'),(29,'STD-E1-DDA-90min-TMT-RTS-MS3_max2ul_capsaspora'),(30,'STD-E1-DDA-60min-TSP-HCD-CID-OT_histones_max5ul'),(31,'STD-E2-DDA-90min-TSP-HCD-IT_H_max2ul'),(32,'STD-E2-DDA-60min-TSP-CID-OT-MS2-MS3-crosslink_max5ul'),(33,'STD-E2-DDA-90min-TSP-HCD-IT_H_max5ul'),(34,'STD-E2-DDA-90min-TSP-HCD-IT_L_max2ul'),(35,'STD-E2-DDA-90min-TSP-HCD-IT_L_max5ul'),(36,'STD-E2-DDA-60min-TSP-HCD-IT_L_max5ul'),(37,'STD-E2-DDA-60min-TSP-HCD-ETD-OT_max5ul'),(40,'STD-E2-DDA-90min-TMT-RTS-MS3_max2ul_humanDB'),(41,'STD-E2-DDA-90min-TMT-RTS-MS3_max5ul_humanDB'),(42,'STD-E2-DDA-90min-TMT-RTS-MS3_max2ul_mouseDB'),(43,'STD-E2-DDA-90min-TMT-RTS-MS3_max2ul_phrogDB'),(44,'STD-E2-DDA-90min-TMT-RTS-MS3_max5ul_phrogDB'),(45,'STD-E2-DDA-90min-TMT-RTS-MS3_max2ul_capsaspora'),(46,'STD-E2-DDA-60min-TSP-HCD-CID-OT_histones_max5ul'),(47,'STD-L1-DDA-60min-TSP-HCD-IT_L_max2ul'),(48,'STD-L1-DDA-60min-TSP-HCD-IT_L_max5ul'),(49,'STD-E1-DDA-60min-TSP-HCD-IT_L_max2ul'),(50,'STD-E2-DDA-60min-TSP-HCD-IT_L_max2ul'),(51,'STD-E2-DDA-60min-TSP-HCD-IT_L_max2ul'),(52,'STD-L1-DDA-60min-TSP-HCD-CID-OT_histones_max5ul'),(53,'STD-E2-DIA-120min-40X10_max2ul'),(55,'STD-E1-DIA-120min-40X10_max2ul'),(56,'STD-L1-DIA-120min-40X10_max2ul');
/*!40000 ALTER TABLE `method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `method_seq`
--

DROP TABLE IF EXISTS `method_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `method_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `method_seq`
--

LOCK TABLES `method_seq` WRITE;
/*!40000 ALTER TABLE `method_seq` DISABLE KEYS */;
INSERT INTO `method_seq` VALUES (69);
/*!40000 ALTER TABLE `method_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modification`
--

DROP TABLE IF EXISTS `modification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modification` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_587oqjwrju6fatikdb9w8xd53` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modification`
--

LOCK TABLES `modification` WRITE;
/*!40000 ALTER TABLE `modification` DISABLE KEYS */;
INSERT INTO `modification` VALUES (1,'PHOSPHO (S)','total-numbers'),(2,'PHOSPHO (T)','total-numbers'),(3,'PHOSPHO (Y)','total-numbers'),(4,'Phenylisocyanate (N-term)','total-numbers'),(5,'Propionyl (K)','total-numbers'),(6,'Propionyl (Protein N-term)','total-numbers'),(7,'Label:13C(6)15N(2) (K)','total-numbers'),(8,'Label:13C(6)15N(4) (R)','total-numbers'),(9,'TMT6plex (K)','total-numbers'),(10,'TMT6plex (N-term)','total-numbers'),(12,'Dimethyl (K)','total-numbers'),(13,'Trimethyl (K)','total-numbers'),(14,'Acetyl (K)','total-numbers'),(16,'Propionyl+Methyl','total-numbers'),(25,'Sum. area Propionyl N-term','histones-biological'),(26,'Sum. area not Propionyl N-term','histones-biological'),(27,'Sum. area PIC precursors N-term','histones-tailored'),(28,'Sum. area not PIC precursors N-term','histones-tailored'),(29,'N-term Propionyl','total-numbers'),(30,'N-term no Propionyl','total-numbers'),(31,'N-term PIC','total-numbers'),(32,'N-term no PIC','total-numbers'),(33,'K(Carbamyl)','sec-react'),(34,'.(Carbamyl)','sec-react'),(35,'R(Carbamyl)','sec-react'),(36,'N(Deamidated)','sec-react'),(37,'K(Formyl)','sec-react'),(38,'.(Formyl)','sec-react'),(39,'S(Formyl)','sec-react'),(40,'T(Formyl)','sec-react'),(41,'pyro-Glu','sec-react'),(42,'PEG+1H','polymer-contaminants'),(43,'PEG+2H','polymer-contaminants'),(44,'PEG+3H','polymer-contaminants'),(45,'PPG','polymer-contaminants'),(46,'Triton X-100','polymer-contaminants'),(47,'Triton X-100 (Reduced)','polymer-contaminants'),(48,'Triton X-100 (Na)','polymer-contaminants'),(49,'Triton X-100 (Reduced, Na)','polymer-contaminants'),(50,'Triton X-101','polymer-contaminants'),(51,'Triton X-101 (Reduced)','polymer-contaminants'),(52,'Polysiloxane','polymer-contaminants'),(53,'Tween-20','polymer-contaminants'),(54,'Tween-40','polymer-contaminants'),(55,'Tween-60','polymer-contaminants'),(56,'Tween-80','polymer-contaminants'),(57,'IGEPAL CA-630 (NP-40)','polymer-contaminants');
insert into modification (id, name, type) values (58, "Formylation", "sec_react");
insert into modification (id, name, type) values (59, "Carbamyl", "sec_react");
insert into modification (id, name, type) values (60, "Oxidation", "sec_react");
insert into modification (id, name, type) values (61, "Ammonia loss", "sec_react");
insert into modification (id, name, type) values (62, "Acetyl", "sec_react");
insert into modification (id, name, type) values (63, "Deamidation", "sec_react");
insert into modification (id, name, type) values (64, "Amidation", "sec_react");
insert into modification (id, name, type) values (65, "Isotopic peak error", "sec_react");
insert into modification (id, name, type) values (66, "Didehydrobutyrine/Water loss", "sec_react");
insert into modification (id, name, type) values (67, "Methyl", "sec_react");
insert into modification (id, name, type) values (68, "Carbamidomethyl/Addition of G", "sec_react");
/*!40000 ALTER TABLE `modification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modification_file`
--

DROP TABLE IF EXISTS `modification_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modification_file` (
  `id` bigint(20) NOT NULL,
  `value` double DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `modification_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnvy5xth7b00tf5k4k61j9c7th` (`file_id`),
  KEY `FKsv7aipa6b5my7optbhv05ufwn` (`modification_id`),
  CONSTRAINT `FKnvy5xth7b00tf5k4k61j9c7th` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`),
  CONSTRAINT `FKsv7aipa6b5my7optbhv05ufwn` FOREIGN KEY (`modification_id`) REFERENCES `modification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modification_file`
--

LOCK TABLES `modification_file` WRITE;
/*!40000 ALTER TABLE `modification_file` DISABLE KEYS */;
INSERT INTO `modification_file` VALUES (8027,0.0605,4836,42),(8028,0.1188,4836,43),(8029,0.0313,4836,44),(8030,0.004,4836,45),(8031,0.022,4836,46),(8032,0.0035,4836,47),(8033,0.0176,4836,48),(8034,0.0094,4836,49),(8035,0.0272,4836,50),(8036,0.0062,4836,51),(8037,12.5793,4836,52),(8038,0.0755,4836,53),(8039,0.0075,4836,54),(8040,0.0029,4836,55),(8041,0.0029,4836,56),(8042,0.0272,4836,57),(8043,0.0635,4837,42),(8044,0.1007,4837,43),(8045,0.0364,4837,44),(8046,0.0027,4837,45),(8047,0.02,4837,46),(8048,0.0027,4837,47),(8049,0.0092,4837,48),(8050,0.0117,4837,49),(8051,0.115,4837,50),(8052,0.0067,4837,51),(8053,10.8906,4837,52),(8054,0.0688,4837,53),(8055,0.0228,4837,54),(8056,0.0028,4837,55),(8057,0.0034,4837,56),(8058,0.115,4837,57),(8059,0.0603,4838,42),(8060,0.0975,4838,43),(8061,0.0491,4838,44),(8062,0.002,4838,45),(8063,0.0118,4838,46),(8064,0.0015,4838,47),(8065,0.0072,4838,48),(8066,0.0064,4838,49),(8067,0.0074,4838,50),(8068,0.0031,4838,51),(8069,3.5491,4838,52),(8070,0.0598,4838,53),(8071,0.01,4838,54),(8072,0.002,4838,55),(8073,0.0026,4838,56),(8074,0.0074,4838,57),(8075,0.0024,4872,42),(8076,0.0148,4872,43),(8077,0.0214,4872,44),(8078,0.002,4872,45),(8079,0.0011,4872,46),(8080,0.0034,4872,47),(8081,0.0018,4872,48),(8082,0.001,4872,49),(8083,0.0013,4872,50),(8084,0.0142,4872,51),(8085,0.1011,4872,52),(8086,0.0203,4872,53),(8087,0.0024,4872,54),(8088,0.0008,4872,55),(8089,0.0034,4872,56),(8090,0.0013,4872,57),(8091,0.0028,4870,42),(8092,0.0143,4870,43),(8093,0.0191,4870,44),(8094,0.0028,4870,45),(8095,0.0013,4870,46),(8096,0.0052,4870,47),(8097,0.0018,4870,48),(8098,0.0023,4870,49),(8099,0.0014,4870,50),(8100,0.0164,4870,51),(8101,0.1125,4870,52),(8102,0.0237,4870,53),(8103,0.0025,4870,54),(8104,0.001,4870,55),(8105,0.0038,4870,56),(8106,0.0014,4870,57),(8107,0.0032,4871,42),(8108,0.015,4871,43),(8109,0.0208,4871,44),(8110,0.0021,4871,45),(8111,0.0015,4871,46),(8112,0.0045,4871,47),(8113,0.0021,4871,48),(8114,0.0014,4871,49),(8115,0.0013,4871,50),(8116,0.0121,4871,51),(8117,0.0751,4871,52),(8118,0.027,4871,53),(8119,0.0032,4871,54),(8120,0.0008,4871,55),(8121,0.004,4871,56),(8122,0.0013,4871,57),(17997,418,4837,38),(17998,418,4836,38),(17999,645,4836,33),(18000,644,4836,35),(18001,845,4836,40),(18002,744,4836,36),(18003,1375,4837,34),(18004,826,4836,37),(18005,657,4837,33),(18006,903,4837,36),(18007,266,4837,41),(18008,702,4837,35),(18009,900,4837,37),(18010,886,4837,40),(18011,1299,4836,34),(18012,505,4838,38),(18013,1386,4836,39),(18014,1345,4837,39),(18015,201,4836,41),(18016,1581,4838,34),(18017,1051,4838,36),(18020,1450,4838,39),(18021,806,4838,33),(18022,290,4838,41),(18027,999,4838,40),(18031,822,4838,35),(18033,1055,4838,37);
insert into modification_file (id, value, file_id, modification_id) values (8278, 0.656, 3359, 58);
insert into modification_file (id, value, file_id, modification_id) values (8287, 0.167, 4836, 58);
insert into modification_file (id, value, file_id, modification_id) values (8297, 0.049, 4837, 58);
insert into modification_file (id, value, file_id, modification_id) values (8307, 0.108, 4838, 58);
insert into modification_file (id, value, file_id, modification_id) values (8288, 1.133, 4836, 59);
insert into modification_file (id, value, file_id, modification_id) values (8298, 1.063, 4837, 59);
insert into modification_file (id, value, file_id, modification_id) values (8308, 1.54, 4838, 59);
insert into modification_file (id, value, file_id, modification_id) values (8279, 8.882, 3359, 60);
insert into modification_file (id, value, file_id, modification_id) values (8289, 0.04, 4836, 60);
insert into modification_file (id, value, file_id, modification_id) values (8299, 0.039, 4837, 60);
insert into modification_file (id, value, file_id, modification_id) values (8309, 0.065, 4838, 60);
insert into modification_file (id, value, file_id, modification_id) values (8280, 1.18, 3359, 61);
insert into modification_file (id, value, file_id, modification_id) values (8290, 0.18, 4836, 61);
insert into modification_file (id, value, file_id, modification_id) values (8300, 0.219, 4837, 61);
insert into modification_file (id, value, file_id, modification_id) values (8310, 0.371, 4838, 61);
insert into modification_file (id, value, file_id, modification_id) values (8291, 0.047, 4836, 62);
insert into modification_file (id, value, file_id, modification_id) values (8301, 0.036, 4837, 62);
insert into modification_file (id, value, file_id, modification_id) values (8311, 0.051, 4838, 62);
insert into modification_file (id, value, file_id, modification_id) values (8281, 3.147, 3359, 63);
insert into modification_file (id, value, file_id, modification_id) values (8292, 0.167, 4836, 63);
insert into modification_file (id, value, file_id, modification_id) values (8302, 0.111, 4837, 63);
insert into modification_file (id, value, file_id, modification_id) values (8312, 0.239, 4838, 63);
insert into modification_file (id, value, file_id, modification_id) values (8282, 1.508, 3359, 64);
insert into modification_file (id, value, file_id, modification_id) values (8293, 0.593, 4836, 64);
insert into modification_file (id, value, file_id, modification_id) values (8303, 0.71, 4837, 64);
insert into modification_file (id, value, file_id, modification_id) values (8313, 0.796, 4838, 64);
insert into modification_file (id, value, file_id, modification_id) values (8283, 3.835, 3359, 65);
insert into modification_file (id, value, file_id, modification_id) values (8294, 2.422, 4836, 65);
insert into modification_file (id, value, file_id, modification_id) values (8304, 1.993, 4837, 65);
insert into modification_file (id, value, file_id, modification_id) values (8314, 2.223, 4838, 65);
insert into modification_file (id, value, file_id, modification_id) values (8284, 0.623, 3359, 66);
insert into modification_file (id, value, file_id, modification_id) values (8295, 0.043, 4836, 66);
insert into modification_file (id, value, file_id, modification_id) values (8305, 0.036, 4837, 66);
insert into modification_file (id, value, file_id, modification_id) values (8315, 0.075, 4838, 66);
insert into modification_file (id, value, file_id, modification_id) values (8285, 0.524, 3359, 67);
insert into modification_file (id, value, file_id, modification_id) values (8316, 0.032, 4838, 67);
insert into modification_file (id, value, file_id, modification_id) values (8286, 0.688, 3359, 68);
insert into modification_file (id, value, file_id, modification_id) values (8296, 0.08, 4836, 68);
insert into modification_file (id, value, file_id, modification_id) values (8306, 0.075, 4837, 68);
insert into modification_file (id, value, file_id, modification_id) values (8317, 0.137, 4838, 68);
/*!40000 ALTER TABLE `modification_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modification_file_seq`
--

DROP TABLE IF EXISTS `modification_file_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modification_file_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modification_file_seq`
--

LOCK TABLES `modification_file_seq` WRITE;
/*!40000 ALTER TABLE `modification_file_seq` DISABLE KEYS */;
INSERT INTO `modification_file_seq` VALUES (8318);
/*!40000 ALTER TABLE `modification_file_seq` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `modification_seq`
--

DROP TABLE IF EXISTS `modification_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modification_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modification_seq`
--

LOCK TABLES `modification_seq` WRITE;
/*!40000 ALTER TABLE `modification_seq` DISABLE KEYS */;
INSERT INTO `modification_seq` VALUES (69);
/*!40000 ALTER TABLE `modification_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `param`
--

DROP TABLE IF EXISTS `param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `param` (
  `id` bigint(20) NOT NULL,
  `api_key` char(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `param`
--

LOCK TABLES `param` WRITE;
/*!40000 ALTER TABLE `param` DISABLE KEYS */;
INSERT INTO `param` VALUES (1,'5008da3a-dbcd-49c3-a008-db34c4b0bb39','Total Numbers');
/*!40000 ALTER TABLE `param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `param_seq`
--

DROP TABLE IF EXISTS `param_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `param_seq` (
  `next_val` bigint(20) DEFAULT NULL
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
  `id` bigint(20) NOT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
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
  `id` bigint(20) NOT NULL,
  `api_key` char(50) NOT NULL,
  `param_id` bigint(20) DEFAULT NULL,
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
INSERT INTO `plot` VALUES (1,'5008da3a-dbcd-49c3-a008-db34c4b0bb39',1,'Number of protein groups'),(3,'aa7c6f75-0442-4e66-a8fd-1e564831c6da',1,'Number of peptides'),(4,'e10d8581-326b-4eae-8f9b-b21486bf5a9e',1,'Percentage Propionyl'),(5,'66bdbd2e-ab13-4585-b940-463f33a5e344',1,'Percentage PIC'),(6,'e4eb3ae0-a309-43b3-8108-543b16e863c1',1,'Number of modification sites STY'),( 7,'66bdbd2e-cd14-4895-b960-468f33a6e379', 1, "Number of modified peptides");
/*!40000 ALTER TABLE `plot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plot_context_source`
--

DROP TABLE IF EXISTS `plot_context_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plot_context_source` (
  `plot_id` bigint(20) NOT NULL,
  `context_source_id` bigint(20) NOT NULL,
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
INSERT INTO `plot_context_source` VALUES (1,1),(3,2),(4,8),(5,9),(6,24),(7,25);
/*!40000 ALTER TABLE `plot_context_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plot_seq`
--

DROP TABLE IF EXISTS `plot_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plot_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plot_seq`
--

LOCK TABLES `plot_seq` WRITE;
/*!40000 ALTER TABLE `plot_seq` DISABLE KEYS */;
INSERT INTO `plot_seq` VALUES (8);
/*!40000 ALTER TABLE `plot_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quantification`
--

DROP TABLE IF EXISTS `quantification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quantification` (
  `id` bigint(20) NOT NULL,
  `abundance` float DEFAULT NULL,
  `accession` varchar(255) DEFAULT NULL,
  `contaminant` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqdhhym2283lgqv665ymm68e1q` (`file_id`),
  CONSTRAINT `FKqdhhym2283lgqv665ymm68e1q` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantification`
--

LOCK TABLES `quantification` WRITE;
/*!40000 ALTER TABLE `quantification` DISABLE KEYS */;
INSERT INTO `quantification` VALUES (1009530,92197100,'Q9Y618','','NCOR2_HUMAN',4838),(1009531,90757500,'Q9Y5J1','','UTP18_HUMAN',4838),(1009532,99648700,'Q9Y4D8','','HECD4_HUMAN',4838),(1009533,92259400,'Q9Y3B8','','ORN_HUMAN',4838),(1009534,90986400,'Q9Y2S6','','TMA7_HUMAN',4838),(1009535,9944950,'Q9Y2R4','','DDX52_HUMAN',4838),(1009536,96387500,'Q9Y2Q3','','GSTK1_HUMAN',4838),(1009537,96061300,'Q9Y237','','PIN4_HUMAN',4838),(1009538,9984950,'Q9UPT8','','ZC3H4_HUMAN',4838),(1009539,91166700,'Q9UPQ0','','LIMC1_HUMAN',4838),(1009540,9572720,'Q9UPN6','','SCAF8_HUMAN',4838),(1009541,9744070,'Q9UKW6','','ELF5_HUMAN',4838),(1009542,96961400,'Q9UKK9','','NUDT5_HUMAN',4838),(1009543,91775500,'Q9UK76','','JUPI1_HUMAN',4838),(1009544,9099410,'Q9UK59','','DBR1_HUMAN',4838),(1009545,9428480,'Q9UK58','','CCNL1_HUMAN',4838),(1009546,92650000,'Q9UJS0','','S2513_HUMAN',4838),(1009547,9623180,'Q9UI26','','IPO11_HUMAN',4838),(1009548,98043900,'Q9UHQ9','','NB5R1_HUMAN',4838),(1009549,91928400,'Q9UGI8','','TES_HUMAN',4838),(1009550,9228200,'Q9UBB5','','MBD2_HUMAN',4838),(1009551,9520440,'Q9P016','','THYN1_HUMAN',4838),(1009552,92237300,'Q9NYF8','','BCLF1_HUMAN',4838),(1009553,9885300,'Q9NPD3','','EXOS4_HUMAN',4838),(1009554,94409800,'Q9NP77','','SSU72_HUMAN',4838),(1009555,9397170,'Q9HCS7','','SYF1_HUMAN',4838),(1009556,9108840,'Q9HBH5','','RDH14_HUMAN',4838),(1009557,9447500,'Q9H1K1','','ISCU_HUMAN',4838),(1009558,95677800,'Q9H1E3','','NUCKS_HUMAN',4838),(1009559,91818500,'Q9H0E9','','BRD8_HUMAN',4838),(1009560,99429800,'Q9C0I9','','LRC27_HUMAN',4838),(1009561,99811900,'Q9C0B1','','FTO_HUMAN',4838),(1009562,9922840,'Q9BY43','','CHM4A_HUMAN',4838),(1009563,9334500,'Q9BUP3','','HTAI2_HUMAN',4838),(1009564,92267300,'Q9BTW9','','TBCD_HUMAN',4838),(1009565,94093200,'Q9BSH4','','TACO1_HUMAN',4838),(1009566,9561760,'Q96T58','','MINT_HUMAN',4838),(1009567,91653000,'Q96LA5','','FCRL2_HUMAN',4838),(1009568,95059400,'Q96JJ6','','JPH4_HUMAN',4838),(1009569,95728300,'Q96HS1','','PGAM5_HUMAN',4838),(1009570,9428060,'Q96EP0','','RNF31_HUMAN',4838),(1009571,9021080,'Q96EE3','','SEH1_HUMAN',4838),(1009572,9012490,'Q96D46','','NMD3_HUMAN',4838),(1009573,94688100,'Q96A19','','C102A_HUMAN',4838),(1009574,96246600,'Q92900','','RENT1_HUMAN',4838),(1009575,9928730,'Q92734','','TFG_HUMAN',4838),(1009576,9572220,'Q8WXF1','','PSPC1_HUMAN',4838),(1009577,98669200,'Q8TER5','','ARH40_HUMAN',4838),(1009578,9969190,'Q8TDJ6','','DMXL2_HUMAN',4838),(1009579,98654500,'Q8NBS9','','TXND5_HUMAN',4838),(1009580,9806390,'Q8NAT2','','TDRD5_HUMAN',4838),(1009581,98795100,'Q8N8N7','','PTGR2_HUMAN',4838),(1009582,9031660,'Q8N6H7','','ARFG2_HUMAN',4838),(1009583,98560200,'Q8N4H5','','TOM5_HUMAN',4838),(1009584,94685500,'Q8N3U4','','STAG2_HUMAN',4838),(1009585,91921500,'Q8N129','','CNPY4_HUMAN',4838),(1009586,96468500,'Q8IZP0','','ABI1_HUMAN',4838),(1009587,94841200,'Q8IYB7','','DI3L2_HUMAN',4838),(1009588,96424700,'Q8IXQ3','','CI040_HUMAN',4838),(1009589,9415820,'Q86V59','','PNM8A_HUMAN',4838),(1009590,92975500,'Q86UE4','','LYRIC_HUMAN',4838),(1009591,9543100,'Q7Z3E2','','CC186_HUMAN',4838),(1009592,94757600,'Q6YP21','','KAT3_HUMAN',4838),(1009593,90143800,'Q6UVK1','','CSPG4_HUMAN',4838),(1009594,9510340,'Q6PJW8','','CNST_HUMAN',4838),(1009595,9452600,'Q6I9Y2','','THOC7_HUMAN',4838),(1009596,90938800,'Q6FI81','','CPIN1_HUMAN',4838),(1009597,95237700,'Q6DT37','','MRCKG_HUMAN',4838),(1009598,9666980,'Q68EM7','','RHG17_HUMAN',4838),(1009599,97638400,'Q3LXA3','','TKFC_HUMAN',4838),(1009600,92471800,'Q16666','','IF16_HUMAN',4838),(1009601,9904690,'Q15836','','VAMP3_HUMAN',4838),(1009602,9407020,'Q15696','','U2AFM_HUMAN',4838),(1009603,9148290,'Q15652','','JHD2C_HUMAN',4838),(1009604,9104180,'Q15418','','KS6A1_HUMAN',4838),(1009605,9633210,'Q15075','','EEA1_HUMAN',4838),(1009606,9711380,'Q14C87','','T132D_HUMAN',4838),(1009607,95524800,'Q14674','','ESPL1_HUMAN',4838),(1009608,9957330,'Q13951','','PEBB_HUMAN',4838),(1009609,90969700,'Q13596','','SNX1_HUMAN',4838),(1009610,94385800,'Q13177','','PAK2_HUMAN',4838),(1009611,90290200,'Q13011','','ECH1_HUMAN',4838),(1009612,9945810,'Q12962','','TAF10_HUMAN',4838),(1009613,90281200,'Q06203','','PUR1_HUMAN',4838),(1009614,90481800,'Q06124','','PTN11_HUMAN',4838),(1009615,92358800,'Q01844','','EWS_HUMAN',4838),(1009616,94592100,'Q01813','','PFKAP_HUMAN',4838),(1009617,9188790,'P78346','','RPP30_HUMAN',4838),(1009618,90121400,'P62995','','TRA2B_HUMAN',4838),(1009619,9957950,'P62942','','FKB1A_HUMAN',4838),(1009620,97633200,'P61916','','NPC2_HUMAN',4838),(1009621,95952500,'P61513','','RL37A_HUMAN',4838),(1009622,9912960,'P57678','','GEMI4_HUMAN',4838),(1009623,90048000,'P55795','','HNRH2_HUMAN',4838),(1009624,9720430,'P55081','','MFAP1_HUMAN',4838),(1009625,98163000,'P53992','','SC24C_HUMAN',4838),(1009626,9749820,'P53611','','PGTB2_HUMAN',4838),(1009627,9681920,'P53041','','PPP5_HUMAN',4838),(1009628,93958100,'P52788','','SPSY_HUMAN',4838),(1009629,90510300,'P52701','','MSH6_HUMAN',4838),(1009630,90642500,'P50552','','VASP_HUMAN',4838),(1009631,94802100,'P50213','','IDH3A_HUMAN',4838),(1009632,9749180,'P50135','','HNMT_HUMAN',4838),(1009633,9676880,'P49914','','MTHFS_HUMAN',4838),(1009634,9043120,'P49770','','EI2BB_HUMAN',4838),(1009635,98784000,'P49756','','RBM25_HUMAN',4838),(1009636,94338400,'P46108','','CRK_HUMAN',4838),(1009637,9108280,'P36404','','ARL2_HUMAN',4838),(1009638,96912600,'P32320','','CDD_HUMAN',4838),(1009639,97845100,'P31937','','3HIDH_HUMAN',4838),(1009640,9686350,'P30519','','HMOX2_HUMAN',4838),(1009641,99952400,'P30419','','NMT1_HUMAN',4838),(1009642,90525000,'P30085','','KCY_HUMAN',4838),(1009643,99655800,'P26640','','SYVC_HUMAN',4838),(1009644,9687750,'P23229','','ITA6_HUMAN',4838),(1009645,96286100,'P16989','','YBOX3_HUMAN',4838),(1009646,93812500,'P15927','','RFA2_HUMAN',4838),(1009647,95930600,'P15559','','NQO1_HUMAN',4838),(1009648,99728700,'P14927','','QCR7_HUMAN',4838),(1009649,93267600,'P13995','','MTDC_HUMAN',4838),(1009650,916024,'P13671','','CO6_HUMAN',4838),(1009651,99320000,'P11310','','ACADM_HUMAN',4838),(1009652,98831600,'P11279','','LAMP1_HUMAN',4838),(1009653,9990260,'P11117','','PPAL_HUMAN',4838),(1009654,9946380,'P10253','','LYAG_HUMAN',4838),(1009655,94884900,'P09622','','DLDH_HUMAN',4838),(1009656,99253900,'P09497','','CLCB_HUMAN',4838),(1009657,94885200,'P07099','','HYEP_HUMAN',4838),(1009658,93439000,'P01116','','RASK_HUMAN',4838),(1009659,90942500,'O94905','','ERLN2_HUMAN',4838),(1009660,9963430,'O94888','','UBXN7_HUMAN',4838),(1009661,97711400,'O75175','','CNOT3_HUMAN',4838),(1009662,92762700,'O60869','','EDF1_HUMAN',4838),(1009663,96036200,'O60313','','OPA1_HUMAN',4838),(1009664,95131200,'O60303','','KATIP_HUMAN',4838),(1009665,9228380,'O43929','','ORC4_HUMAN',4838),(1009666,90520800,'O43847','','NRDC_HUMAN',4838),(1009667,90555900,'O43526','','KCNQ2_HUMAN',4838),(1009668,9492550,'O43264','','ZW10_HUMAN',4838),(1009669,9248060,'O43159','','RRP8_HUMAN',4838),(1009670,9266320,'O15397','','IPO8_HUMAN',4838),(1009671,9563070,'O15294','','OGT1_HUMAN',4838),(1009672,9343730,'O15126','','SCAM1_HUMAN',4838),(1009673,91928600,'O14974','','MYPT1_HUMAN',4838),(1009674,9830930,'O14562','','UBFD1_HUMAN',4838),(1009675,94180100,'O00555','','CAC1A_HUMAN',4838),(1009676,90097300,'O00483','','NDUA4_HUMAN',4838),(1009677,94163400,'O00425','','IF2B3_HUMAN',4838),(1009678,99318900,'B0I1T2','','MYO1G_HUMAN',4838),(1009679,98638600,'A0A1B0GVH7','','IQCM_HUMAN',4838),(1009680,8443960,'Q9Y613','','FHOD1_HUMAN',4838),(1009681,8874420,'Q9Y606','','PUS1_HUMAN',4838),(1009682,8062320,'Q9Y316','','MEMO1_HUMAN',4838),(1009683,84375700,'Q9Y2R0','','COA3_HUMAN',4838),(1009684,86574000,'Q9Y295','','DRG1_HUMAN',4838),(1009685,85243000,'Q9UMY4','','SNX12_HUMAN',4838),(1009686,86104500,'Q9UM00','','TMCO1_HUMAN',4838),(1009687,84391900,'Q9UJU6','','DBNL_HUMAN',4838),(1009688,89038300,'Q9UIA0','','CYH4_HUMAN',4838),(1009689,8256370,'Q9UI12','','VATH_HUMAN',4838),(1009690,81729900,'Q9UI09','','NDUAC_HUMAN',4838),(1009691,82408100,'Q9UBQ0','','VPS29_HUMAN',4838),(1009692,86098300,'Q9P2J5','','SYLC_HUMAN',4838),(1009693,80865600,'Q9P0L2','','MARK1_HUMAN',4838),(1009694,8517460,'Q9P0I2','','EMC3_HUMAN',4838),(1009695,8086690,'Q9NZT2','','OGFR_HUMAN',4838),(1009696,8935330,'Q9NYH9','','UTP6_HUMAN',4838),(1009697,8333950,'Q9NXH9','','TRM1_HUMAN',4838),(1009698,81128800,'Q9NX14','','NDUBB_HUMAN',4838),(1009699,8748160,'Q9NUQ7','','UFSP2_HUMAN',4838),(1009700,88076800,'Q9NTJ3','','SMC4_HUMAN',4838),(1009701,88434600,'Q9NR45','','SIAS_HUMAN',4838),(1009702,84926600,'Q9NPF5','','DMAP1_HUMAN',4838),(1009703,8139510,'Q9HAB8','','PPCS_HUMAN',4838),(1009704,8372930,'Q9HA64','','KT3K_HUMAN',4838),(1009705,8688670,'Q9H967','','WDR76_HUMAN',4838),(1009706,85125700,'Q9H3N1','','TMX1_HUMAN',4838),(1009707,87861200,'Q9H0D6','','XRN2_HUMAN',4838),(1009708,8401800,'Q9H089','','LSG1_HUMAN',4838),(1009709,80886700,'Q9H074','','PAIP1_HUMAN',4838),(1009710,8579200,'Q9GZS1','','RPA49_HUMAN',4838),(1009711,8245660,'Q9BY42','','RTF2_HUMAN',4838),(1009712,88474800,'Q9BXA5','','SUCR1_HUMAN',4838),(1009713,82720000,'Q9BWJ5','','SF3B5_HUMAN',4838),(1009714,84234100,'Q9BVA6','','FICD_HUMAN',4838),(1009715,85195400,'Q9BV20','','MTNA_HUMAN',4838),(1009716,85558100,'Q9BUJ2','','HNRL1_HUMAN',4838),(1009717,82830200,'Q9BTD3','','TM121_HUMAN',4838),(1009718,83495500,'Q9BS26','','ERP44_HUMAN',4838),(1009719,84906100,'Q9BQ67','','GRWD1_HUMAN',4838),(1009720,8985310,'Q9BQ48','','RM34_HUMAN',4838),(1009721,8624310,'Q99986','','VRK1_HUMAN',4838),(1009722,88716700,'Q99798','','ACON_HUMAN',4838),(1009723,81119200,'Q96SN8','','CK5P2_HUMAN',4838),(1009724,8270820,'Q96PF1','','TGM7_HUMAN',4838),(1009725,80023700,'Q96PC5','','MIA2_HUMAN',4838),(1009726,89403600,'Q96JC4','','ZN479_HUMAN',4838),(1009727,8799560,'Q96GC5','','RM48_HUMAN',4838),(1009728,83302300,'Q96EK6','','GNA1_HUMAN',4838),(1009729,86293200,'Q96E11','','RRFM_HUMAN',4838),(1009730,82178000,'Q96DI7','','SNR40_HUMAN',4838),(1009731,84109100,'Q96DG6','','CMBL_HUMAN',4838),(1009732,8739510,'Q96CG3','','TIFA_HUMAN',4838),(1009733,8450900,'Q96BR5','','COA7_HUMAN',4838),(1009734,84655000,'Q96BP2','','CHCH1_HUMAN',4838),(1009735,8024060,'Q96AX9','','MIB2_HUMAN',4838),(1009736,8222630,'Q96AA3','','RFT1_HUMAN',4838),(1009737,8995230,'Q96A49','','SYAP1_HUMAN',4838),(1009738,8336450,'Q969X6','','UTP4_HUMAN',4838),(1009739,8547660,'Q92974','','ARHG2_HUMAN',4838),(1009740,89150400,'Q92888','','ARHG1_HUMAN',4838),(1009741,8470710,'Q92599','','SEPT8_HUMAN',4838),(1009742,81095300,'Q92530','','PSMF1_HUMAN',4838),(1009743,85563800,'Q8WXX5','','DNJC9_HUMAN',4838),(1009744,8421620,'Q8WXA9','','SREK1_HUMAN',4838),(1009745,84235300,'Q8WWM7','','ATX2L_HUMAN',4838),(1009746,8829520,'Q8WVC0','','LEO1_HUMAN',4838),(1009747,86027200,'Q8TDW4','','ST7L_HUMAN',4838),(1009748,8396950,'Q8NGZ2','','O14K1_HUMAN',4838),(1009749,8382360,'Q8NFH5','','NUP35_HUMAN',4838),(1009750,80854600,'Q8NEF9','','SRFB1_HUMAN',4838),(1009751,8007090,'Q8NBN3','','TM87A_HUMAN',4838),(1009752,8995580,'Q8N9T8','','KRI1_HUMAN',4838),(1009753,8114560,'Q8N8A6','','DDX51_HUMAN',4838),(1009754,84264800,'Q8IXS6','','PALM2_HUMAN',4838),(1009755,8050570,'Q8IXM2','','BAP18_HUMAN',4838),(1009756,80464400,'Q8IUD2','','RB6I2_HUMAN',4838),(1009757,89700900,'Q86WX3','','AROS_HUMAN',4838),(1009758,8438980,'Q86VM9','','ZCH18_HUMAN',4838),(1009759,8608490,'Q86UW7','','CAPS2_HUMAN',4838),(1009760,8923860,'Q7Z434','','MAVS_HUMAN',4838),(1009761,8908200,'Q76N32','','CEP68_HUMAN',4838),(1009762,89570400,'Q709C8','','VP13C_HUMAN',4838),(1009763,8911410,'Q6UXV4','','MIC27_HUMAN',4838),(1009764,8768880,'Q6UN15','','FIP1_HUMAN',4838),(1009765,88557700,'Q6IPM2','','IQCE_HUMAN',4838),(1009766,86262600,'Q6IA86','','ELP2_HUMAN',4838),(1009767,8007700,'Q5VT52','','RPRD2_HUMAN',4838),(1009768,8769490,'Q53H82','','LACB2_HUMAN',4838),(1009769,82137700,'Q16630','','CPSF6_HUMAN',4838),(1009770,81026600,'Q16563','','SYPL1_HUMAN',4838),(1009771,84341100,'Q16204','','CCDC6_HUMAN',4838),(1009772,87638200,'Q15942','','ZYX_HUMAN',4838),(1009773,82415700,'Q15637','','SF01_HUMAN',4838),(1009774,84322900,'Q15631','','TSN_HUMAN',4838),(1009775,89846700,'Q15459','','SF3A1_HUMAN',4838),(1009776,8141300,'Q15042','','RB3GP_HUMAN',4838),(1009777,87111800,'Q149N8','','SHPRH_HUMAN',4838),(1009778,88707500,'Q14739','','LBR_HUMAN',4838),(1009779,8231840,'Q14643','','ITPR1_HUMAN',4838),(1009780,8296150,'Q14241','','ELOA1_HUMAN',4838),(1009781,8760610,'Q14185','','DOCK1_HUMAN',4838),(1009782,85357800,'Q14165','','MLEC_HUMAN',4838),(1009783,87688900,'Q14157','','UBP2L_HUMAN',4838),(1009784,8552160,'Q14151','','SAFB2_HUMAN',4838),(1009785,80386700,'Q14137','','BOP1_HUMAN',4838),(1009786,8958430,'Q13868','','EXOS2_HUMAN',4838),(1009787,8980600,'Q13573','','SNW1_HUMAN',4838),(1009788,89037700,'Q12982','','BNIP2_HUMAN',4838),(1009789,82617400,'Q10713','','MPPA_HUMAN',4838),(1009790,87952900,'Q07866','','KLC1_HUMAN',4838),(1009791,82192500,'Q06136','','KDSR_HUMAN',4838),(1009792,86744200,'Q04917','','1433F_HUMAN',4838),(1009793,8358860,'Q03518','','TAP1_HUMAN',4838),(1009794,84718000,'Q02218','','ODO1_HUMAN',4838),(1009795,8235740,'Q00577','','PURA_HUMAN',4838),(1009796,8544760,'Q00534','','CDK6_HUMAN',4838),(1009797,83764400,'Q00341','','VIGLN_HUMAN',4838),(1009798,86667600,'P82675','','RT05_HUMAN',4838),(1009799,85651400,'P63208','','SKP1_HUMAN',4838),(1009800,89267000,'P62820','','RAB1A_HUMAN',4838),(1009801,87964200,'P60981','','DEST_HUMAN',4838),(1009802,89522700,'P59998','','ARPC4_HUMAN',4838),(1009803,8018860,'P58107','','EPIPL_HUMAN',4838),(1009804,8458010,'P57105','','SYJ2B_HUMAN',4838),(1009805,86329200,'P56211','','ARP19_HUMAN',4838),(1009806,81235600,'P55957','','BID_HUMAN',4838),(1009807,8923810,'P55854','','SUMO3_HUMAN',4838),(1009808,83859800,'P51809','','VAMP7_HUMAN',4838),(1009809,89399100,'P51148','','RAB5C_HUMAN',4838),(1009810,892779,'P51003','','PAPOA_HUMAN',4838),(1009811,8533240,'P49901','','MCSP_HUMAN',4838),(1009812,89422100,'P49458','','SRP09_HUMAN',4838),(1009813,88448900,'P48735','','IDHP_HUMAN',4838),(1009814,82807000,'P46459','','NSF_HUMAN',4838),(1009815,87406900,'P43490','','NAMPT_HUMAN',4838),(1009816,8921380,'P42892','','ECE1_HUMAN',4838),(1009817,87663600,'P42566','','EPS15_HUMAN',4838),(1009818,8273740,'P41223','','BUD31_HUMAN',4838),(1009819,80573800,'P40818','','UBP8_HUMAN',4838),(1009820,8032490,'P38432','','COIL_HUMAN',4838),(1009821,8298920,'P35251','','RFC1_HUMAN',4838),(1009822,84938100,'P32929','','CGL_HUMAN',4838),(1009823,81780900,'P32322','','P5CR1_HUMAN',4838),(1009824,83846300,'P28799','','GRN_HUMAN',4838),(1009825,80359500,'P27707','','DCK_HUMAN',4838),(1009826,83826300,'P22307','','SCP2_HUMAN',4838),(1009827,87001800,'P21964','','COMT_HUMAN',4838),(1009828,80974100,'P21926','','CD9_HUMAN',4838),(1009829,86804700,'P20936','','RASA1_HUMAN',4838),(1009830,87398500,'P19075','','TSN8_HUMAN',4838),(1009831,84667700,'P18031','','PTN1_HUMAN',4838),(1009832,85946700,'P17980','','PRS6A_HUMAN',4838),(1009833,8708030,'P17676','','CEBPB_HUMAN',4838),(1009834,84703900,'P16083','','NQO2_HUMAN',4838),(1009835,89009200,'P14550','','AK1A1_HUMAN',4838),(1009836,88483100,'P13489','','RINI_HUMAN',4838),(1009837,8025140,'P11717','','MPRI_HUMAN',4838),(1009838,87536400,'P11172','','UMPS_HUMAN',4838),(1009839,8317500,'P10586','','PTPRF_HUMAN',4838),(1009840,89412200,'P0C1S8','','WEE2_HUMAN',4838),(1009841,8513400,'P09668','','CATH_HUMAN',4838),(1009842,8702850,'P09110','','THIK_HUMAN',4838),(1009843,80193400,'P08962','','CD63_HUMAN',4838),(1009844,8964840,'P05362','','ICAM1_HUMAN',4838),(1009845,8008770,'P02751','','FINC_HUMAN',4838),(1009846,82343100,'O96019','','ACL6A_HUMAN',4838),(1009847,8749790,'O95834','','EMAL2_HUMAN',4838),(1009848,81934200,'O94826','','TOM70_HUMAN',4838),(1009849,8814860,'O75717','','WDHD1_HUMAN',4838),(1009850,8713030,'O75663','','TIPRL_HUMAN',4838),(1009851,86273900,'O75592','','MYCB2_HUMAN',4838),(1009852,89222700,'O75436','','VP26A_HUMAN',4838),(1009853,80650100,'O75400','','PR40A_HUMAN',4838),(1009854,83105000,'O60762','','DPM1_HUMAN',4838),(1009855,84557500,'O43592','','XPOT_HUMAN',4838),(1009856,83670600,'O15355','','PPM1G_HUMAN',4838),(1009857,8181230,'O14908','','GIPC1_HUMAN',4838),(1009858,8943040,'O14893','','GEMI2_HUMAN',4838),(1009859,86637400,'O14737','','PDCD5_HUMAN',4838),(1009860,86004400,'O14556','','G3PT_HUMAN',4838),(1009861,8811690,'O00505','','IMA4_HUMAN',4838),(1009862,88296100,'O00303','','EIF3F_HUMAN',4838),(1009863,83400400,'O00232','','PSD12_HUMAN',4838),(1009864,8813460,'O00161','','SNP23_HUMAN',4838),(1009865,88804900,'A0MZ66','','SHOT1_HUMAN',4838),(1009866,7820860,'Q9Y639','','NPTN_HUMAN',4838),(1009867,74545500,'Q9Y5P6','','GMPPB_HUMAN',4838),(1009868,78127900,'Q9Y463','','DYR1B_HUMAN',4838),(1009869,71850800,'Q9Y3C6','','PPIL1_HUMAN',4838),(1009870,7127730,'Q9Y3B9','','RRP15_HUMAN',4838),(1009871,79282100,'Q9Y3B7','','RM11_HUMAN',4838),(1009872,74828700,'Q9Y2R9','','RT07_HUMAN',4838),(1009873,7928800,'Q9Y281','','COF2_HUMAN',4838),(1009874,7746830,'Q9Y223','','GLCNE_HUMAN',4838),(1009875,71562000,'Q9UQ84','','EXO1_HUMAN',4838),(1009876,7319120,'Q9ULX3','','NOB1_HUMAN',4838),(1009877,7864380,'Q9ULG3','','CFA92_HUMAN',4838),(1009878,789455,'Q9UI72','','YE014_HUMAN',4838),(1009879,7538830,'Q9UBB9','','TFP11_HUMAN',4838),(1009880,7448980,'Q9NX40','','OCAD1_HUMAN',4838),(1009881,78101200,'Q9NWV4','','CZIB_HUMAN',4838),(1009882,76792700,'Q9NS69','','TOM22_HUMAN',4838),(1009883,74403900,'Q9NS68','','TNR19_HUMAN',4838),(1009884,7326970,'Q9NRF8','','PYRG2_HUMAN',4838),(1009885,71394000,'Q9NR64','','KLHL1_HUMAN',4838),(1009886,7327720,'Q9NQ48','','LZTL1_HUMAN',4838),(1009887,79464700,'Q9HB07','','MYG1_HUMAN',4838),(1009888,75474800,'Q9H910','','JUPI2_HUMAN',4838),(1009889,7165530,'Q9H6S3','','ES8L2_HUMAN',4838),(1009890,70956100,'Q9H4M9','','EHD1_HUMAN',4838),(1009891,71868900,'Q9H444','','CHM4B_HUMAN',4838),(1009892,74287200,'Q9H2U2','','IPYR2_HUMAN',4838),(1009893,78404600,'Q9BXJ9','','NAA15_HUMAN',4838),(1009894,75474200,'Q9BX97','','PLVAP_HUMAN',4838),(1009895,72254300,'Q9BV68','','RN126_HUMAN',4838),(1009896,7686920,'Q9BTE6','','AASD1_HUMAN',4838),(1009897,73071100,'Q99961','','SH3G1_HUMAN',4838),(1009898,74367000,'Q99816','','TS101_HUMAN',4838),(1009899,73290800,'Q99735','','MGST2_HUMAN',4838),(1009900,73897000,'Q99720','','SGMR1_HUMAN',4838),(1009901,77750100,'Q96JJ3','','ELMO2_HUMAN',4838),(1009902,77203100,'Q96I99','','SUCB2_HUMAN',4838),(1009903,7502360,'Q96G46','','DUS3L_HUMAN',4838),(1009904,78574600,'Q96G03','','PGM2_HUMAN',4838),(1009905,7349210,'Q969G3','','SMCE1_HUMAN',4838),(1009906,7744330,'Q93008','','USP9X_HUMAN',4838),(1009907,7684070,'Q92614','','MY18A_HUMAN',4838),(1009908,73832700,'Q8WW12','','PCNP_HUMAN',4838),(1009909,7102100,'Q8WW01','','SEN15_HUMAN',4838),(1009910,7304940,'Q8WVM8','','SCFD1_HUMAN',4838),(1009911,7165210,'Q8WUD4','','CCD12_HUMAN',4838),(1009912,7793710,'Q8WTT2','','NOC3L_HUMAN',4838),(1009913,77715300,'Q8N999','','CL029_HUMAN',4838),(1009914,7437480,'Q8N6M3','','FITM2_HUMAN',4838),(1009915,7378230,'Q8IYD8','','FANCM_HUMAN',4838),(1009916,75281700,'Q8IY81','','SPB1_HUMAN',4838),(1009917,79330000,'Q8IX12','','CCAR1_HUMAN',4838),(1009918,7345860,'Q8IV33','','K0825_HUMAN',4838),(1009919,7700220,'Q86YN6','','PRGC2_HUMAN',4838),(1009920,7934290,'Q7Z7K6','','CENPV_HUMAN',4838),(1009921,7882730,'Q7Z7F7','','RM55_HUMAN',4838),(1009922,7223930,'Q7L576','','CYFP1_HUMAN',4838),(1009923,7499580,'Q71RC2','','LARP4_HUMAN',4838),(1009924,74829800,'Q6YHU6','','THADA_HUMAN',4838),(1009925,7881700,'Q6UXG2','','ELAP1_HUMAN',4838),(1009926,7877940,'Q6IE81','','JADE1_HUMAN',4838),(1009927,77911500,'Q6GMV3','','PTRD1_HUMAN',4838),(1009928,7349080,'Q5T6F2','','UBAP2_HUMAN',4838),(1009929,7417470,'Q5T5J6','','SWT1_HUMAN',4838),(1009930,7309690,'Q5T447','','HECD3_HUMAN',4838),(1009931,7492070,'Q5R3I4','','TTC38_HUMAN',4838),(1009932,74727500,'Q5M9N0','','CD158_HUMAN',4838),(1009933,79877800,'Q5JSL3','','DOC11_HUMAN',4838),(1009934,7278250,'Q5JRX3','','PREP_HUMAN',4838),(1009935,74871600,'Q562R1','','ACTBL_HUMAN',4838),(1009936,71425200,'Q4VCS5','','AMOT_HUMAN',4838),(1009937,7288080,'Q49A26','','GLYR1_HUMAN',4838),(1009938,73379800,'Q3ZCQ8','','TIM50_HUMAN',4838),(1009939,7055500,'Q15437','','SC23B_HUMAN',4838),(1009940,70605400,'Q15436','','SC23A_HUMAN',4838),(1009941,74505600,'Q15269','','PWP2_HUMAN',4838),(1009942,74298900,'Q14331','','FRG1_HUMAN',4838),(1009943,70177000,'Q14116','','IL18_HUMAN',4838),(1009944,79015700,'Q14108','','SCRB2_HUMAN',4838),(1009945,7206310,'Q13901','','C1D_HUMAN',4838),(1009946,73623200,'Q13620','','CUL4B_HUMAN',4838),(1009947,7327820,'Q13547','','HDAC1_HUMAN',4838),(1009948,71521500,'Q13442','','HAP28_HUMAN',4838),(1009949,7127480,'Q13427','','PPIG_HUMAN',4838),(1009950,7668470,'Q13217','','DNJC3_HUMAN',4838),(1009951,76973300,'Q12888','','TP53B_HUMAN',4838),(1009952,77078900,'Q05682','','CALD1_HUMAN',4838),(1009953,73804500,'Q05519','','SRS11_HUMAN',4838),(1009954,7590060,'Q04726','','TLE3_HUMAN',4838),(1009955,7445230,'Q02487','','DSC2_HUMAN',4838),(1009956,73214400,'P99999','','CYC_HUMAN',4838),(1009957,70574000,'P61803','','DAD1_HUMAN',4838),(1009958,75555800,'P61619','','S61A1_HUMAN',4838),(1009959,73284400,'P61586','','RHOA_HUMAN',4838),(1009960,72700000,'P61201','','CSN2_HUMAN',4838),(1009961,76099900,'P58166','','INHBE_HUMAN',4838),(1009962,70474400,'P56545','','CTBP2_HUMAN',4838),(1009963,70636600,'P56182','','RRP1_HUMAN',4838),(1009964,7207600,'P55061','','BI1_HUMAN',4838),(1009965,79287300,'P54105','','ICLN_HUMAN',4838),(1009966,73021200,'P52888','','THOP1_HUMAN',4838),(1009967,70247700,'P52758','','RIDA_HUMAN',4838),(1009968,7127520,'P52732','','KIF11_HUMAN',4838),(1009969,7381600,'P52306','','GDS1_HUMAN',4838),(1009970,73959000,'P52294','','IMA5_HUMAN',4838),(1009971,78700500,'P52292','','IMA1_HUMAN',4838),(1009972,79099800,'P51665','','PSMD7_HUMAN',4838),(1009973,7611750,'P51398','','RT29_HUMAN',4838),(1009974,7648430,'P50750','','CDK9_HUMAN',4838),(1009975,74273300,'P49821','','NDUV1_HUMAN',4838),(1009976,7102810,'P49643','','PRI2_HUMAN',4838),(1009977,71734700,'P49589','','SYCC_HUMAN',4838),(1009978,7112060,'P49006','','MRP_HUMAN',4838),(1009979,75261400,'P46063','','RECQ1_HUMAN',4838),(1009980,75885200,'P42771','','CDN2A_HUMAN',4838),(1009981,74546700,'P42126','','ECI1_HUMAN',4838),(1009982,72747300,'P39656','','OST48_HUMAN',4838),(1009983,70279200,'P35754','','GLRX1_HUMAN',4838),(1009984,75296400,'P35606','','COPB2_HUMAN',4838),(1009985,7734060,'P30533','','AMRP_HUMAN',4838),(1009986,75373100,'P24941','','CDK2_HUMAN',4838),(1009987,70825200,'P21266','','GSTM3_HUMAN',4838),(1009988,7479620,'P20929','','NEBU_HUMAN',4838),(1009989,7051090,'P17019','','ZN708_HUMAN',4838),(1009990,78274400,'P12259','','FA5_HUMAN',4838),(1009991,77670100,'P11498','','PYC_HUMAN',4838),(1009992,7603340,'P11234','','RALB_HUMAN',4838),(1009993,71458900,'P11216','','PYGB_HUMAN',4838),(1009994,79180700,'P11166','','GTR1_HUMAN',4838),(1009995,72605100,'P10619','','PPGB_HUMAN',4838),(1009996,75302500,'P09417','','DHPR_HUMAN',4838),(1009997,7629620,'P09001','','RM03_HUMAN',4838),(1009998,7667610,'P08651','','NFIC_HUMAN',4838),(1009999,77539700,'P07686','','HEXB_HUMAN',4838),(1010000,70374100,'P06730','','IF4E_HUMAN',4838),(1010001,77846000,'O95782','','AP2A1_HUMAN',4838),(1010002,71044900,'O95571','','ETHE1_HUMAN',4838),(1010003,76883100,'O95155','','UBE4B_HUMAN',4838),(1010004,7688860,'O94856','','NFASC_HUMAN',4838),(1010005,76207600,'O75874','','IDHC_HUMAN',4838),(1010006,77699400,'O75832','','PSD10_HUMAN',4838),(1010007,77659700,'O75530','','EED_HUMAN',4838),(1010008,78351000,'O75475','','PSIP1_HUMAN',4838),(1010009,77861500,'O75340','','PDCD6_HUMAN',4838),(1010010,7116320,'O60885','','BRD4_HUMAN',4838),(1010011,74396800,'O60684','','IMA7_HUMAN',4838),(1010012,7179160,'O60613','','SEP15_HUMAN',4838),(1010013,75731700,'O60220','','TIM8A_HUMAN',4838),(1010014,71948000,'O43837','','IDH3B_HUMAN',4838),(1010015,79795300,'O43809','','CPSF5_HUMAN',4838),(1010016,7153200,'O43663','','PRC1_HUMAN',4838),(1010017,78433200,'O43451','','MGA_HUMAN',4838),(1010018,77849200,'O43396','','TXNL1_HUMAN',4838),(1010019,79722000,'O43292','','GPAA1_HUMAN',4838),(1010020,7470960,'O15498','','YKT6_HUMAN',4838),(1010021,79501400,'O15118','','NPC1_HUMAN',4838),(1010022,72675300,'O14979','','HNRDL_HUMAN',4838),(1010023,73282700,'O14744','','ANM5_HUMAN',4838),(1010024,75746200,'O00629','','IMA3_HUMAN',4838),(1010025,70933300,'O00422','','SAP18_HUMAN',4838),(1010026,74369600,'O00203','','AP3B1_HUMAN',4838),(1010027,70482800,'O00154','','BACH_HUMAN',4838),(1010028,79107000,'O00148','','DX39A_HUMAN',4838),(1010029,77977600,'A0AUZ9','','KAL1L_HUMAN',4838),(1010030,67530600,'Q9Y6M5','','ZNT1_HUMAN',4838),(1010031,6655450,'Q9Y6M0','','TEST_HUMAN',4838),(1010032,65200700,'Q9Y570','','PPME1_HUMAN',4838),(1010033,67522800,'Q9Y520','','PRC2C_HUMAN',4838),(1010034,66251400,'Q9Y4K1','','CRBG1_HUMAN',4838),(1010035,6837420,'Q9Y399','','RT02_HUMAN',4838),(1010036,6450850,'Q9Y2U8','','MAN1_HUMAN',4838),(1010037,60381400,'Q9ULV4','','COR1C_HUMAN',4838),(1010038,6537280,'Q9UK22','','FBX2_HUMAN',4838),(1010039,67819700,'Q9UJZ1','','STML2_HUMAN',4838),(1010040,6673010,'Q9UIQ6','','LCAP_HUMAN',4838),(1010041,6303570,'Q9UBR1','','BUP1_HUMAN',4838),(1010042,61624000,'Q9UBI6','','GBG12_HUMAN',4838),(1010043,6207380,'Q9UBC2','','EP15R_HUMAN',4838),(1010044,68982300,'Q9P0J0','','NDUAD_HUMAN',4838),(1010045,66177600,'Q9P035','','HACD3_HUMAN',4838),(1010046,65490800,'Q9NZL9','','MAT2B_HUMAN',4838),(1010047,67709800,'Q9NX24','','NHP2_HUMAN',4838),(1010048,63141900,'Q9NVP1','','DDX18_HUMAN',4838),(1010049,64618400,'Q9NV06','','DCA13_HUMAN',4838),(1010050,6585010,'Q9NU23','','LYRM2_HUMAN',4838),(1010051,6225500,'Q9NTM9','','CUTC_HUMAN',4838),(1010052,6429840,'Q9HCM7','','FBSL_HUMAN',4838),(1010053,6755980,'Q9H8W5','','TRI45_HUMAN',4838),(1010054,63464300,'Q9H788','','SH24A_HUMAN',4838),(1010055,68801400,'Q9H583','','HEAT1_HUMAN',4838),(1010056,65554200,'Q9H4A4','','AMPB_HUMAN',4838),(1010057,68693500,'Q9H3U1','','UN45A_HUMAN',4838),(1010058,67126700,'Q9H2U1','','DHX36_HUMAN',4838),(1010059,60442900,'Q9H2J7','','S6A15_HUMAN',4838),(1010060,63047800,'Q9GZP8','','IMUP_HUMAN',4838),(1010061,61666900,'Q9C035','','TRIM5_HUMAN',4838),(1010062,66998000,'Q9BZE1','','RM37_HUMAN',4838),(1010063,61068200,'Q9BU76','','MMTA2_HUMAN',4838),(1010064,6455550,'Q9BT22','','ALG1_HUMAN',4838),(1010065,66222100,'Q9BRP8','','PYM1_HUMAN',4838),(1010066,6917500,'Q9BPY3','','F118B_HUMAN',4838),(1010067,64091000,'Q9BPX5','','ARP5L_HUMAN',4838),(1010068,64615400,'Q99708','','CTIP_HUMAN',4838),(1010069,62678800,'Q99614','','TTC1_HUMAN',4838),(1010070,6552780,'Q96SI9','','STRBP_HUMAN',4838),(1010071,64066300,'Q96S52','','PIGS_HUMAN',4838),(1010072,6239120,'Q96QH2','','PRAM_HUMAN',4838),(1010073,6101950,'Q96ND0','','F210A_HUMAN',4838),(1010074,65561200,'Q96N64','','PWP2A_HUMAN',4838),(1010075,665804,'Q96MT8','','CEP63_HUMAN',4838),(1010076,6372780,'Q96KN7','','RPGR1_HUMAN',4838),(1010077,62031900,'Q96HE7','','ERO1A_HUMAN',4838),(1010078,6574130,'Q96GX9','','MTNB_HUMAN',4838),(1010079,6017960,'Q96EX3','','DC2I2_HUMAN',4838),(1010080,6832030,'Q96CU9','','FXRD1_HUMAN',4838),(1010081,61235000,'Q96CT7','','CC124_HUMAN',4838),(1010082,6608080,'Q96CB9','','NSUN4_HUMAN',4838),(1010083,6038880,'Q969U7','','PSMG2_HUMAN',4838),(1010084,61725600,'Q93009','','UBP7_HUMAN',4838),(1010085,60108300,'Q92804','','RBP56_HUMAN',4838),(1010086,69525400,'Q92796','','DLG3_HUMAN',4838),(1010087,66470100,'Q92665','','RT31_HUMAN',4838),(1010088,68185500,'Q92598','','HS105_HUMAN',4838),(1010089,64760300,'Q8WYP5','','ELYS_HUMAN',4838),(1010090,6626190,'Q8WWQ0','','PHIP_HUMAN',4838),(1010091,6730280,'Q8WWI5','','CTL1_HUMAN',4838),(1010092,62090600,'Q8WVH0','','CPLX3_HUMAN',4838),(1010093,6844830,'Q8WUH6','','TM263_HUMAN',4838),(1010094,66288100,'Q8WU90','','ZC3HF_HUMAN',4838),(1010095,6574250,'Q8WTP9','','XAGE3_HUMAN',4838),(1010096,60390700,'Q8TEM1','','PO210_HUMAN',4838),(1010097,67391800,'Q8TED0','','UTP15_HUMAN',4838),(1010098,69281800,'Q8TBB1','','LNX1_HUMAN',4838),(1010099,61409800,'Q8NFJ5','','RAI3_HUMAN',4838),(1010100,6970450,'Q8NFC6','','BD1L1_HUMAN',4838),(1010101,6998590,'Q8N6K7','','SAMD3_HUMAN',4838),(1010102,6688430,'Q8N3X1','','FNBP4_HUMAN',4838),(1010103,64301700,'Q8IVT2','','MISP_HUMAN',4838),(1010104,62872700,'Q8IVS8','','GLCTK_HUMAN',4838),(1010105,6849230,'Q8IVM0','','CCD50_HUMAN',4838),(1010106,63159300,'Q8IVF6','','AN18A_HUMAN',4838),(1010107,6249450,'Q86Y79','','PTH_HUMAN',4838),(1010108,67524200,'Q86U42','','PABP2_HUMAN',4838),(1010109,6655330,'Q7Z4Q2','','HEAT3_HUMAN',4838),(1010110,6255800,'Q7Z478','','DHX29_HUMAN',4838),(1010111,66794000,'Q7Z2K6','','ERMP1_HUMAN',4838),(1010112,6289720,'Q6UB35','','C1TM_HUMAN',4838),(1010113,65039200,'Q6PIU2','','NCEH1_HUMAN',4838),(1010114,6778130,'Q6NYC8','','PPR18_HUMAN',4838),(1010115,63510800,'Q6NVY1','','HIBCH_HUMAN',4838),(1010116,64483500,'Q6IN85','','P4R3A_HUMAN',4838),(1010117,60027600,'Q69YN4','','VIR_HUMAN',4838),(1010118,6526230,'Q5VV41','','ARHGG_HUMAN',4838),(1010119,66702400,'Q5UCC4','','EMC10_HUMAN',4838),(1010120,6657020,'Q5JVF3','','PCID2_HUMAN',4838),(1010121,6947080,'Q5JTZ9','','SYAM_HUMAN',4838),(1010122,64351700,'Q2WGN9','','GAB4_HUMAN',4838),(1010123,67731500,'Q2KHT3','','CL16A_HUMAN',4838),(1010124,6284420,'Q27J81','','INF2_HUMAN',4838),(1010125,65274600,'Q16787','','LAMA3_HUMAN',4838),(1010126,6021720,'Q16775','','GLO2_HUMAN',4838),(1010127,63295400,'Q16533','','SNPC1_HUMAN',4838),(1010128,61148400,'Q16181','','SEPT7_HUMAN',4838),(1010129,62745200,'Q15819','','UB2V2_HUMAN',4838),(1010130,6597440,'Q15629','','TRAM1_HUMAN',4838),(1010131,69210300,'Q15019','','SEPT2_HUMAN',4838),(1010132,6784360,'Q14CX7','','NAA25_HUMAN',4838),(1010133,63683600,'Q14240','','IF4A2_HUMAN',4838),(1010134,68368200,'Q14232','','EI2BA_HUMAN',4838),(1010135,6909970,'Q14197','','ICT1_HUMAN',4838),(1010136,62429300,'Q14118','','DAG1_HUMAN',4838),(1010137,69865800,'Q13886','','KLF9_HUMAN',4838),(1010138,6899460,'Q13823','','NOG2_HUMAN',4838),(1010139,62127300,'Q13541','','4EBP1_HUMAN',4838),(1010140,6136850,'Q13363','','CTBP1_HUMAN',4838),(1010141,69530500,'Q13257','','MD2L1_HUMAN',4838),(1010142,6035770,'Q13042','','CDC16_HUMAN',4838),(1010143,6245950,'Q12824','','SNF5_HUMAN',4838),(1010144,64180700,'Q08380','','LG3BP_HUMAN',4838),(1010145,69146400,'Q07157','','ZO1_HUMAN',4838),(1010146,66964500,'Q06787','','FMR1_HUMAN',4838),(1010147,6009180,'Q06546','','GABPA_HUMAN',4838),(1010148,66628500,'Q00765','','REEP5_HUMAN',4838),(1010149,6758970,'P84157','','MXRA7_HUMAN',4838),(1010150,64702000,'P80370','','DLK1_HUMAN',4838),(1010151,64966300,'P80303','','NUCB2_HUMAN',4838),(1010152,6818900,'P78423','','X3CL1_HUMAN',4838),(1010153,6352300,'P78345','','RPP38_HUMAN',4838),(1010154,60423500,'P63010','','AP2B1_HUMAN',4838),(1010155,63428300,'P62873','','GBB1_HUMAN',4838),(1010156,68405100,'P61758','','PFD3_HUMAN',4838),(1010157,61697200,'P60891','','PRPS1_HUMAN',4838),(1010158,6560530,'P57772','','SELB_HUMAN',4838),(1010159,66197800,'P56199','','ITA1_HUMAN',4838),(1010160,60619700,'P55036','','PSMD4_HUMAN',4838),(1010161,65461300,'P51814','','ZNF41_HUMAN',4838),(1010162,6424750,'P51452','','DUS3_HUMAN',4838),(1010163,6858020,'P49354','','FNTA_HUMAN',4838),(1010164,60747300,'P48739','','PIPNB_HUMAN',4838),(1010165,64716000,'P48444','','COPD_HUMAN',4838),(1010166,6003550,'P46109','','CRKL_HUMAN',4838),(1010167,6098630,'P40855','','PEX19_HUMAN',4838),(1010168,6130960,'P36639','','8ODP_HUMAN',4838),(1010169,6669250,'P36543','','VATE1_HUMAN',4838),(1010170,60710300,'P36405','','ARL3_HUMAN',4838),(1010171,65504800,'P35573','','GDE_HUMAN',4838),(1010172,66111300,'P33176','','KINH_HUMAN',4838),(1010173,61798000,'P32455','','GBP1_HUMAN',4838),(1010174,6862790,'P32321','','DCTD_HUMAN',4838),(1010175,67015400,'P30876','','RPB2_HUMAN',4838),(1010176,68526600,'P30626','','SORCN_HUMAN',4838),(1010177,62972800,'P29144','','TPP2_HUMAN',4838),(1010178,61077900,'P20073','','ANXA7_HUMAN',4838),(1010179,61322400,'P19429','','TNNI3_HUMAN',4838),(1010180,65068700,'P18859','','ATP5J_HUMAN',4838),(1010181,6955660,'P17612','','KAPCA_HUMAN',4838),(1010182,6133300,'P15924','','DESP_HUMAN',4838),(1010183,6790690,'P15144','','AMPN_HUMAN',4838),(1010184,6527590,'P14923','','PLAK_HUMAN',4838),(1010185,65913700,'P13798','','ACPH_HUMAN',4838),(1010186,67920600,'P11182','','ODB2_HUMAN',4838),(1010187,6757920,'P09104','','ENOG_HUMAN',4838),(1010188,6127960,'P08581','','MET_HUMAN',4838),(1010189,66812300,'P07305','','H10_HUMAN',4838),(1010190,6290000,'P06865','','HEXA_HUMAN',4838),(1010191,65206600,'P02656','','APOC3_HUMAN',4838),(1010192,67634300,'P00846','','ATP6_HUMAN',4838),(1010193,61179600,'O95757','','HS74L_HUMAN',4838),(1010194,6329600,'O95630','','STABP_HUMAN',4838),(1010195,6719440,'O95376','','ARI2_HUMAN',4838),(1010196,61844200,'O95347','','SMC2_HUMAN',4838),(1010197,67915900,'O95297','','MPZL1_HUMAN',4838),(1010198,67785300,'O95292','','VAPB_HUMAN',4838),(1010199,69966200,'O95218','','ZRAB2_HUMAN',4838),(1010200,67177100,'O75844','','FACE1_HUMAN',4838),(1010201,64658300,'O75691','','UTP20_HUMAN',4838),(1010202,6090190,'O75676','','KS6A4_HUMAN',4838),(1010203,62160100,'O75534','','CSDE1_HUMAN',4838),(1010204,6402940,'O60573','','IF4E2_HUMAN',4838),(1010205,6399090,'O60486','','PLXC1_HUMAN',4838),(1010206,6382240,'O60437','','PEPL_HUMAN',4838),(1010207,6910260,'O60427','','FADS1_HUMAN',4838),(1010208,67757900,'O60271','','JIP4_HUMAN',4838),(1010209,65981000,'O43768','','ENSA_HUMAN',4838),(1010210,60508700,'O43681','','GET3_HUMAN',4838),(1010211,62895800,'O43598','','DNPH1_HUMAN',4838),(1010212,6316580,'O43402','','EMC8_HUMAN',4838),(1010213,60407900,'O43324','','MCA3_HUMAN',4838),(1010214,62790000,'O15372','','EIF3H_HUMAN',4838),(1010215,6518130,'O15230','','LAMA5_HUMAN',4838),(1010216,62551300,'O15143','','ARC1B_HUMAN',4838),(1010217,60950700,'O14975','','S27A2_HUMAN',4838),(1010218,67571300,'O14773','','TPP1_HUMAN',4838),(1010219,65203500,'O00764','','PDXK_HUMAN',4838),(1010220,54179500,'Q9Y6B6','','SAR1B_HUMAN',4838),(1010221,59721300,'Q9Y676','','RT18B_HUMAN',4838),(1010222,58788800,'Q9Y5L4','','TIM13_HUMAN',4838),(1010223,5861600,'Q9Y5B6','','PAXB1_HUMAN',4838),(1010224,55122600,'Q9Y547','','IFT25_HUMAN',4838),(1010225,56205400,'Q9Y3Y2','','CHTOP_HUMAN',4838),(1010226,56018300,'Q9Y3B3','','TMED7_HUMAN',4838),(1010227,5126200,'Q9Y394','','DHRS7_HUMAN',4838),(1010228,5054110,'Q9Y371','','SHLB1_HUMAN',4838),(1010229,53294300,'Q9Y2V2','','CHSP1_HUMAN',4838),(1010230,54433000,'Q9Y2R5','','RT17_HUMAN',4838),(1010231,51381300,'Q9Y2L8','','ZKSC5_HUMAN',4838),(1010232,56400700,'Q9Y2I7','','FYV1_HUMAN',4838),(1010233,5863620,'Q9UPN7','','PP6R1_HUMAN',4838),(1010234,58766500,'Q9UNI6','','DUS12_HUMAN',4838),(1010235,5523570,'Q9ULR0','','ISY1_HUMAN',4838),(1010236,52713100,'Q9ULI0','','ATD2B_HUMAN',4838),(1010237,57889200,'Q9UKS6','','PACN3_HUMAN',4838),(1010238,55797200,'Q9UKJ3','','GPTC8_HUMAN',4838),(1010239,51416100,'Q9UIA9','','XPO7_HUMAN',4838),(1010240,5194370,'Q9UHR5','','S30BP_HUMAN',4838),(1010241,56642800,'Q9UHG3','','PCYOX_HUMAN',4838),(1010242,59544900,'Q9UHD9','','UBQL2_HUMAN',4838),(1010243,57486200,'Q9UGP8','','SEC63_HUMAN',4838),(1010244,5122420,'Q9UFH2','','DYH17_HUMAN',4838),(1010245,5041260,'Q9UBR2','','CATZ_HUMAN',4838),(1010246,55737800,'Q9P2X0','','DPM3_HUMAN',4838),(1010247,50424700,'Q9P2K5','','MYEF2_HUMAN',4838),(1010248,57344400,'Q9P0J1','','PDP1_HUMAN',4838),(1010249,51052700,'Q9P013','','CWC15_HUMAN',4838),(1010250,59778200,'Q9NZB2','','F120A_HUMAN',4838),(1010251,5809540,'Q9NYJ1','','COA4_HUMAN',4838),(1010252,50270700,'Q9NY97','','B3GN2_HUMAN',4838),(1010253,5949530,'Q9NY27','','PP4R2_HUMAN',4838),(1010254,5500910,'Q9NWV8','','BABA1_HUMAN',4838),(1010255,5701490,'Q9NVH1','','DJC11_HUMAN',4838),(1010256,52899600,'Q9NUQ9','','CYRIB_HUMAN',4838),(1010257,5063030,'Q9NUP9','','LIN7C_HUMAN',4838),(1010258,55376100,'Q9NTZ6','','RBM12_HUMAN',4838),(1010259,5762030,'Q9NTJ5','','SAC1_HUMAN',4838),(1010260,5652980,'Q9NS86','','LANC2_HUMAN',4838),(1010261,58055500,'Q9NRV9','','HEBP1_HUMAN',4838),(1010262,5018560,'Q9NR77','','PXMP2_HUMAN',4838),(1010263,5428330,'Q9H9Y2','','RPF1_HUMAN',4838),(1010264,5689710,'Q9H9J2','','RM44_HUMAN',4838),(1010265,5098280,'Q9H6T3','','RPAP3_HUMAN',4838),(1010266,57653200,'Q9H3P7','','GCP60_HUMAN',4838),(1010267,52397500,'Q9H307','','PININ_HUMAN',4838),(1010268,57857400,'Q9H299','','SH3L3_HUMAN',4838),(1010269,51744600,'Q9GZR7','','DDX24_HUMAN',4838),(1010270,5885190,'Q9C0C9','','UBE2O_HUMAN',4838),(1010271,57489100,'Q9BZL4','','PP12C_HUMAN',4838),(1010272,54548900,'Q9BZG1','','RAB34_HUMAN',4838),(1010273,56965200,'Q9BYS8','','LRRC2_HUMAN',4838),(1010274,5432640,'Q9BYJ9','','YTHD1_HUMAN',4838),(1010275,5040780,'Q9BYC8','','RM32_HUMAN',4838),(1010276,52454100,'Q9BY77','','PDIP3_HUMAN',4838),(1010277,55702900,'Q9BWF3','','RBM4_HUMAN',4838),(1010278,55939700,'Q9BWD1','','THIC_HUMAN',4838),(1010279,5294490,'Q9BVV7','','TIM21_HUMAN',4838),(1010280,5750290,'Q9BTY7','','HGH1_HUMAN',4838),(1010281,54686500,'Q9BTC0','','DIDO1_HUMAN',4838),(1010282,5148870,'Q9BRQ8','','FSP1_HUMAN',4838),(1010283,56440800,'Q9BR76','','COR1B_HUMAN',4838),(1010284,51549500,'Q9BQ69','','MACD1_HUMAN',4838),(1010285,5421980,'Q9BQ39','','DDX50_HUMAN',4838),(1010286,5337500,'Q9BPX3','','CND3_HUMAN',4838),(1010287,50933200,'Q99598','','TSNAX_HUMAN',4838),(1010288,55302600,'Q96R06','','SPAG5_HUMAN',4838),(1010289,5482230,'Q96QF0','','RAB3I_HUMAN',4838),(1010290,55590300,'Q96N66','','MBOA7_HUMAN',4838),(1010291,55747300,'Q96JH7','','VCIP1_HUMAN',4838),(1010292,5328330,'Q96JB5','','CK5P3_HUMAN',4838),(1010293,5622990,'Q96IZ7','','RSRC1_HUMAN',4838),(1010294,58121100,'Q96IZ0','','PAWR_HUMAN',4838),(1010295,52847100,'Q96IU4','','ABHEB_HUMAN',4838),(1010296,55758900,'Q96EP5','','DAZP1_HUMAN',4838),(1010297,54579900,'Q969L2','','MAL2_HUMAN',4838),(1010298,58403400,'Q92878','','RAD50_HUMAN',4838),(1010299,59739700,'Q92542','','NICA_HUMAN',4838),(1010300,5150950,'Q8WZA0','','LZIC_HUMAN',4838),(1010301,5890260,'Q8WW38','','FOG2_HUMAN',4838),(1010302,59877100,'Q8WUX1','','S38A5_HUMAN',4838),(1010303,5873520,'Q8TB61','','S35B2_HUMAN',4838),(1010304,5805730,'Q8NHZ8','','CDC26_HUMAN',4838),(1010305,50505000,'Q8NFH3','','NUP43_HUMAN',4838),(1010306,52592800,'Q8NEW0','','ZNT7_HUMAN',4838),(1010307,54800300,'Q8NCR3','','MFI_HUMAN',4838),(1010308,5498300,'Q8NAA4','','A16L2_HUMAN',4838),(1010309,5212610,'Q8N8B7','','TEANC_HUMAN',4838),(1010310,58308800,'Q8N5M9','','JAGN1_HUMAN',4838),(1010311,53342000,'Q8N1G4','','LRC47_HUMAN',4838),(1010312,50356800,'Q8N0V5','','GNT2A_HUMAN',4838),(1010313,5310090,'Q8IZ73','','RUSD2_HUMAN',4838),(1010314,5711640,'Q8IYS1','','P20D2_HUMAN',4838),(1010315,5149510,'Q8IXT5','','RB12B_HUMAN',4838),(1010316,51195800,'Q8IW75','','SPA12_HUMAN',4838),(1010317,51159500,'Q8IVF2','','AHNK2_HUMAN',4838),(1010318,56521500,'Q86X76','','NIT1_HUMAN',4838),(1010319,59309600,'Q7L2J0','','MEPCE_HUMAN',4838),(1010320,56549300,'Q70Z35','','PREX2_HUMAN',4838),(1010321,52526000,'Q6NUM9','','RETST_HUMAN',4838),(1010322,58794800,'Q6DD88','','ATLA3_HUMAN',4838),(1010323,5337290,'Q5VW36','','FOCAD_HUMAN',4838),(1010324,5210360,'Q5U5X0','','LYRM7_HUMAN',4838),(1010325,51070600,'Q5TCQ9','','MAGI3_HUMAN',4838),(1010326,59371900,'Q5JTV8','','TOIP1_HUMAN',4838),(1010327,57412600,'Q5JTH9','','RRP12_HUMAN',4838),(1010328,5416700,'Q53HC9','','EIPR1_HUMAN',4838),(1010329,50921700,'Q53H12','','AGK_HUMAN',4838),(1010330,5571660,'Q2TAL8','','QRIC1_HUMAN',4838),(1010331,51571600,'Q1L5Z9','','LONF2_HUMAN',4838),(1010332,53643500,'Q16851','','UGPA_HUMAN',4838),(1010333,55739200,'Q15738','','NSDHL_HUMAN',4838),(1010334,50552500,'Q15714','','T22D1_HUMAN',4838),(1010335,5295660,'Q15555','','MARE2_HUMAN',4838),(1010336,51355000,'Q15527','','SURF2_HUMAN',4838),(1010337,56958200,'Q15018','','ABRX2_HUMAN',4838),(1010338,58903200,'Q15008','','PSMD6_HUMAN',4838),(1010339,5527300,'Q15006','','EMC2_HUMAN',4838),(1010340,52754100,'Q14914','','PTGR1_HUMAN',4838),(1010341,5327020,'Q14651','','PLSI_HUMAN',4838),(1010342,59061300,'Q14573','','ITPR3_HUMAN',4838),(1010343,51531800,'Q14258','','TRI25_HUMAN',4838),(1010344,51412000,'Q14203','','DCTN1_HUMAN',4838),(1010345,51593000,'Q14160','','SCRIB_HUMAN',4838),(1010346,5733040,'Q13938','','CAYP1_HUMAN',4838),(1010347,5826090,'Q13418','','ILK_HUMAN',4838),(1010348,5906150,'Q13349','','ITAD_HUMAN',4838),(1010349,52855500,'Q12972','','PP1R8_HUMAN',4838),(1010350,53668700,'Q12965','','MYO1E_HUMAN',4838),(1010351,5383680,'Q08722','','CD47_HUMAN',4838),(1010352,5109240,'Q08379','','GOGA2_HUMAN',4838),(1010353,56098500,'Q07065','','CKAP4_HUMAN',4838),(1010354,52969500,'Q05932','','FOLC_HUMAN',4838),(1010355,5470900,'Q02127','','PYRD_HUMAN',4838),(1010356,5971390,'Q01955','','CO4A3_HUMAN',4838),(1010357,50706300,'Q01449','','MLRA_HUMAN',4838),(1010358,55890200,'P98179','','RBM3_HUMAN',4838),(1010359,50584000,'P98175','','RBM10_HUMAN',4838),(1010360,5072300,'P82094','','TMF1_HUMAN',4838),(1010361,50568000,'P78344','','IF4G2_HUMAN',4838),(1010362,5232530,'P62834','','RAP1A_HUMAN',4838),(1010363,5575920,'P62714','','PP2AB_HUMAN',4838),(1010364,55283000,'P62312','','LSM6_HUMAN',4838),(1010365,52958800,'P62136','','PP1A_HUMAN',4838),(1010366,51439700,'P61221','','ABCE1_HUMAN',4838),(1010367,50524600,'P54725','','RD23A_HUMAN',4838),(1010368,59818200,'P53582','','MAP11_HUMAN',4838),(1010369,5542950,'P52735','','VAV2_HUMAN',4838),(1010370,58840200,'P50402','','EMD_HUMAN',4838),(1010371,59430900,'P49959','','MRE11_HUMAN',4838),(1010372,51961800,'P49591','','SYSC_HUMAN',4838),(1010373,51858500,'P48634','','PRC2A_HUMAN',4838),(1010374,5334010,'P48506','','GSH1_HUMAN',4838),(1010375,54328000,'P41227','','NAA10_HUMAN',4838),(1010376,5536500,'P41214','','EIF2D_HUMAN',4838),(1010377,55379100,'P36507','','MP2K2_HUMAN',4838),(1010378,5605530,'P35716','','SOX11_HUMAN',4838),(1010379,53408800,'P35244','','RFA3_HUMAN',4838),(1010380,54524900,'P34949','','MPI_HUMAN',4838),(1010381,58566600,'P31689','','DNJA1_HUMAN',4838),(1010382,50014800,'P30260','','CDC27_HUMAN',4838),(1010383,57978400,'P29466','','CASP1_HUMAN',4838),(1010384,5104600,'P28715','','ERCC5_HUMAN',4838),(1010385,54643000,'P28288','','ABCD3_HUMAN',4838),(1010386,50321900,'P27449','','VATL_HUMAN',4838),(1010387,50994600,'P26885','','FKBP2_HUMAN',4838),(1010388,54205900,'P26196','','DDX6_HUMAN',4838),(1010389,52841900,'P23193','','TCEA1_HUMAN',4838),(1010390,58791200,'P23142','','FBLN1_HUMAN',4838),(1520655,7586100000,'Q5VZ66','','JKIP3_HUMAN',4836),(1520656,5001230000,'CON_P12763','','FETUA_BOVIN',4836),(1520657,3072410000,'P04406','','G3P_HUMAN',4836),(1520658,2224930000,'P62805','','H4_HUMAN',4836),(1520659,2120480000,'P06703','','S10A6_HUMAN',4836),(1520660,1867340000,'P06733','','ENOA_HUMAN',4836),(1520661,1765290000,'P14618','','KPYM_HUMAN',4836),(1520662,1739940000,'Q15084','','PDIA6_HUMAN',4836),(1520663,1688640000,'P06748','','NPM_HUMAN',4836),(1520664,1621670000,'P62937','','PPIA_HUMAN',4836),(1520665,1423800000,'CON_P34955','','A1AT_BOVIN',4836),(1520666,1099830000,'Q16401','','PSMD5_HUMAN',4836),(1520667,1031000000,'P31949','','S10AB_HUMAN',4836),(1520668,995308000,'P48729','','KC1A_HUMAN',4836),(1520669,932174000,'P00338','','LDHA_HUMAN',4836),(1520670,835992000,'P26447','','S10A4_HUMAN',4836),(1520671,767644000,'P07437','','TBB5_HUMAN',4836),(1520672,745720000,'P00558','','PGK1_HUMAN',4836),(1520673,737938000,'CON_P15636','','API_ACHLY',4836),(1520674,736412000,'P27797','','CALR_HUMAN',4836),(1520675,688758000,'Q06830','','PRDX1_HUMAN',4836),(1520676,673554000,'P46777','','RL5_HUMAN',4836),(1520677,669249000,'P04075','','ALDOA_HUMAN',4836),(1520678,642410000,'P11142','','HSP7C_HUMAN',4836),(1520679,639757000,'P05783','','K1C18_HUMAN',4836),(1520680,639354000,'P10599','','THIO_HUMAN',4836),(1520681,633326000,'P29401','','TKT_HUMAN',4836),(1520682,632227000,'Q9H0W8','','SMG9_HUMAN',4836),(1520683,625123000,'P10809','','CH60_HUMAN',4836),(1520684,611789000,'P11021','','BIP_HUMAN',4836),(1520685,568885000,'CON_P01966','','HBA_BOVIN',4836),(1520686,558964000,'P22626','','ROA2_HUMAN',4836),(1520687,556831000,'CON_P02070','','HBB_BOVIN',4836),(1520688,551540000,'P62826','','RAN_HUMAN',4836),(1520689,542466000,'P08238','','HS90B_HUMAN',4836),(1520690,541085000,'P61978','','HNRPK_HUMAN',4836),(1520691,527062000,'P07195','','LDHB_HUMAN',4836),(1520692,521558000,'Q9P219','','DAPLE_HUMAN',4836),(1520693,518018000,'P18621','','RL17_HUMAN',4836),(1520694,506193000,'Q01082','','SPTB2_HUMAN',4836),(1520695,503733000,'P08670','','VIME_HUMAN',4836),(1520696,494472000,'P07355','','ANXA2_HUMAN',4836),(1520697,486078000,'P07737','','PROF1_HUMAN',4836),(1520698,460746000,'P31327','','CPSM_HUMAN',4836),(1520699,456622000,'Q9BZH6','','WDR11_HUMAN',4836),(1520700,454380000,'P60174','','TPIS_HUMAN',4836),(1520701,453283000,'P05387','','RLA2_HUMAN',4836),(1520702,452641000,'Q16543','','CDC37_HUMAN',4836),(1520703,431425000,'P60903','','S10AA_HUMAN',4836),(1520704,428622000,'P68371','','TBB4B_HUMAN',4836),(1520705,425437000,'P35346','','SSR5_HUMAN',4836),(1520706,416433000,'P62829','','RL23_HUMAN',4836),(1520707,415040000,'CON_P02769','','ALBU_BOVIN',4836),(1520708,410233000,'P13639','','EF2_HUMAN',4836),(1520709,403418000,'P19338','','NUCL_HUMAN',4836),(1520710,402121000,'P15531','','NDKA_HUMAN',4836),(1520711,401623000,'P18124','','RL7_HUMAN',4836),(1520712,395129000,'Q9Y5B9','','SP16H_HUMAN',4836),(1520713,395102000,'P30041','','PRDX6_HUMAN',4836),(1520714,386976000,'CON_Q58D62','','FETUB_BOVIN',4836),(1520715,385497000,'P06576','','ATPB_HUMAN',4836),(1520716,381854000,'Q09666','','AHNK_HUMAN',4836),(1520717,381086000,'Q05639','','EF1A2_HUMAN',4836),(1520718,377079000,'P30050','','RL12_HUMAN',4836),(1520719,376563000,'P26641','','EF1G_HUMAN',4836),(1520720,373160000,'P62258','','1433E_HUMAN',4836),(1520721,368213000,'P21333','','FLNA_HUMAN',4836),(1520722,367236000,'P60866','','RS20_HUMAN',4836),(1520723,365874000,'P62263','','RS14_HUMAN',4836),(1520724,364262000,'P62241','','RS8_HUMAN',4836),(1520725,362889000,'CON_Q2UVX4','','CO3_BOVIN',4836),(1520726,361431000,'P63104','','1433Z_HUMAN',4836),(1520727,360425000,'P30044','','PRDX5_HUMAN',4836),(1520728,360188000,'P23528','','COF1_HUMAN',4836),(1520729,360102000,'P62424','','RL7A_HUMAN',4836),(1520730,357243000,'P80723','','BASP1_HUMAN',4836),(1520731,353750000,'P36578','','RL4_HUMAN',4836),(1520732,351648000,'P61604','','CH10_HUMAN',4836),(1520733,346368000,'P07900','','HS90A_HUMAN',4836),(1520734,345402000,'O75533','','SF3B1_HUMAN',4836),(1520735,345261000,'P15880','','RS2_HUMAN',4836),(1520736,344121000,'P11310','','ACADM_HUMAN',4836),(1520737,343690000,'Q99715','','COCA1_HUMAN',4836),(1520738,342367000,'P05388','','RLA0_HUMAN',4836),(1520739,335424000,'P42766','','RL35_HUMAN',4836),(1520740,334427000,'P23396','','RS3_HUMAN',4836),(1520741,329517000,'CON_P00761','','TRYP_PIG',4836),(1520742,328344000,'P19823','','ITIH2_HUMAN',4836),(1520743,328102000,'P02545','','LMNA_HUMAN',4836),(1520744,315210000,'P62906','','RL10A_HUMAN',4836),(1520745,311542000,'P40926','','MDHM_HUMAN',4836),(1520746,310097000,'P02786','','TFR1_HUMAN',4836),(1520747,309834000,'O43707','','ACTN4_HUMAN',4836),(1520748,309674000,'Q08J23','','NSUN2_HUMAN',4836),(1520749,305963000,'P84098','','RL19_HUMAN',4836),(1520750,303756000,'P30101','','PDIA3_HUMAN',4836),(1520751,303717000,'P06454','','PTMA_HUMAN',4836),(1520752,303701000,'P23284','','PPIB_HUMAN',4836),(1520753,303612000,'P27824','','CALX_HUMAN',4836),(1520754,300863000,'P08865','','RSSA_HUMAN',4836),(1520755,299737000,'P00966','','ASSY_HUMAN',4836),(1520756,298093000,'O43175','','SERA_HUMAN',4836),(1520757,296805000,'A0A075B6X5','','TVA18_HUMAN',4836),(1520758,296338000,'P14174','','MIF_HUMAN',4836),(1520759,296147000,'P61247','','RS3A_HUMAN',4836),(1520760,295618000,'CON_P02672','','FIBA_BOVIN',4836),(1520761,294332000,'Q07020','','RL18_HUMAN',4836),(1520762,294057000,'Q00839','','HNRPU_HUMAN',4836),(1520763,293620000,'P25705','','ATPA_HUMAN',4836),(1520764,291647000,'P26373','','RL13_HUMAN',4836),(1520765,283364000,'P31946','','1433B_HUMAN',4836),(1520766,280852000,'Q12906','','ILF3_HUMAN',4836),(1520767,280138000,'P26038','','MOES_HUMAN',4836),(1520768,275265000,'CON_P81644','','APOA2_BOVIN',4836),(1520769,271855000,'Q02878','','RL6_HUMAN',4836),(1520770,267768000,'P62917','','RL8_HUMAN',4836),(1520771,265926000,'P37802','','TAGL2_HUMAN',4836),(1520772,263461000,'P04083','','ANXA1_HUMAN',4836),(1520773,262770000,'P07910','','HNRPC_HUMAN',4836),(1520774,261701000,'Q04941','','PLP2_HUMAN',4836),(1520775,260952000,'P39023','','RL3_HUMAN',4836),(1520776,259995000,'P32119','','PRDX2_HUMAN',4836),(1520777,258994000,'Q9Y618','','NCOR2_HUMAN',4836),(1520778,257619000,'Q07021','','C1QBP_HUMAN',4836),(1520779,256761000,'Q9Y6W3','','CAN7_HUMAN',4836),(1520780,256700000,'Q12857','','NFIA_HUMAN',4836),(1520781,254284000,'P04792','','HSPB1_HUMAN',4836),(1520782,253003000,'P14625','','ENPL_HUMAN',4836),(1520783,249664000,'P46782','','RS5_HUMAN',4836),(1520784,249272000,'Q14CM0','','FRPD4_HUMAN',4836),(1520785,245921000,'P63244','','RACK1_HUMAN',4836),(1520786,243308000,'Q8NC51','','PAIRB_HUMAN',4836),(1520787,242951000,'Q9Y262','','EIF3L_HUMAN',4836),(1520788,241613000,'CON_Q95121','','PEDF_BOVIN',4836),(1520789,239609000,'CON_P15497','','APOA1_BOVIN',4836),(1520790,238442000,'Q99497','','PARK7_HUMAN',4836),(1520791,237832000,'P62753','','RS6_HUMAN',4836),(1520792,237758000,'O60506','','HNRPQ_HUMAN',4836),(1520793,237096000,'Q13753','','LAMC2_HUMAN',4836),(1520794,234863000,'P13667','','PDIA4_HUMAN',4836),(1520795,233598000,'Q14697','','GANAB_HUMAN',4836),(1520796,232818000,'P52926','','HMGA2_HUMAN',4836),(1520797,231011000,'P46781','','RS9_HUMAN',4836),(1520798,229536000,'Q7Z417','','NUFP2_HUMAN',4836),(1520799,229241000,'P30048','','PRDX3_HUMAN',4836),(1520800,228918000,'Q9Y5G0','','PCDGH_HUMAN',4836),(1520801,227235000,'P36952','','SPB5_HUMAN',4836),(1520802,225705000,'P58166','','INHBE_HUMAN',4836),(1520803,223614000,'P18669','','PGAM1_HUMAN',4836),(1520804,223573000,'P62249','','RS16_HUMAN',4836),(1520805,223511000,'Q6P589','','TP8L2_HUMAN',4836),(1520806,222390000,'P26599','','PTBP1_HUMAN',4836),(1520807,221859000,'P62861','','RS30_HUMAN',4836),(1520808,221532000,'P78527','','PRKDC_HUMAN',4836),(1520809,219121000,'P46779','','RL28_HUMAN',4836),(1520810,219026000,'P49411','','EFTU_HUMAN',4836),(1520811,216954000,'P50238','','CRIP1_HUMAN',4836),(1520812,216324000,'P22234','','PUR6_HUMAN',4836),(1520813,215632000,'P84103','','SRSF3_HUMAN',4836),(1520814,214110000,'P61353','','RL27_HUMAN',4836),(1520815,213226000,'Q9H553','','ALG2_HUMAN',4836),(1520816,212024000,'P55209','','NP1L1_HUMAN',4836),(1520817,210636000,'P41250','','GARS_HUMAN',4836),(1520818,209216000,'P38646','','GRP75_HUMAN',4836),(1520819,208364000,'Q5UCC4','','EMC10_HUMAN',4836),(1520820,207944000,'P00441','','SODC_HUMAN',4836),(1520821,203184000,'P22314','','UBA1_HUMAN',4836),(1520822,202347000,'P62081','','RS7_HUMAN',4836),(1520823,201810000,'P62269','','RS18_HUMAN',4836),(1520824,201730000,'Q9ULC4','','MCTS1_HUMAN',4836),(1520825,201672000,'P83731','','RL24_HUMAN',4836),(1520826,201151000,'P39019','','RS19_HUMAN',4836),(1520827,199560000,'P62899','','RL31_HUMAN',4836),(1520828,196455000,'Q9H845','','ACAD9_HUMAN',4836),(1520829,196378000,'Q8WTV0','','SCRB1_HUMAN',4836),(1520830,194206000,'P62750','','RL23A_HUMAN',4836),(1520831,193463000,'P60842','','IF4A1_HUMAN',4836),(1520832,192499000,'P46778','','RL21_HUMAN',4836),(1520833,191351000,'P67809','','YBOX1_HUMAN',4836),(1520834,188638000,'P12004','','PCNA_HUMAN',4836),(1520835,188560000,'Q13469','','NFAC2_HUMAN',4836),(1520836,188012000,'P15328','','FOLR1_HUMAN',4836),(1520837,186490000,'P35232','','PHB1_HUMAN',4836),(1520838,186096000,'P08174','','DAF_HUMAN',4836),(1520839,186022000,'O76021','','RL1D1_HUMAN',4836),(1520840,185513000,'P49588','','SYAC_HUMAN',4836),(1520841,185441000,'P22695','','QCR2_HUMAN',4836),(1520842,184029000,'P62316','','SMD2_HUMAN',4836),(1520843,183427000,'P29692','','EF1D_HUMAN',4836),(1520844,181982000,'P47914','','RL29_HUMAN',4836),(1520845,181682000,'CON_P01030','','CO4_BOVIN',4836),(1520846,181671000,'P05386','','RLA1_HUMAN',4836),(1520847,181104000,'Q15233','','NONO_HUMAN',4836),(1520848,180835000,'P07237','','PDIA1_HUMAN',4836),(1520849,180730000,'P50454','','SERPH_HUMAN',4836),(1520850,179922000,'P35268','','RL22_HUMAN',4836),(1520851,179452000,'P39687','','AN32A_HUMAN',4836),(1520852,179262000,'P61313','','RL15_HUMAN',4836),(1520853,179116000,'O75832','','PSD10_HUMAN',4836),(1520854,178923000,'P62701','','RS4X_HUMAN',4836),(1520855,178704000,'P62277','','RS13_HUMAN',4836),(1520856,178664000,'P46776','','RL27A_HUMAN',4836),(1520857,177904000,'P31153','','METK2_HUMAN',4836),(1520858,176600000,'P24534','','EF1B_HUMAN',4836),(1520859,176570000,'P23246','','SFPQ_HUMAN',4836),(1520860,176414000,'P30086','','PEBP1_HUMAN',4836),(1520861,176268000,'O75369','','FLNB_HUMAN',4836),(1520862,175821000,'Q9UQ80','','PA2G4_HUMAN',4836),(1520863,175141000,'P62888','','RL30_HUMAN',4836),(1520864,174559000,'Q15185','','TEBP_HUMAN',4836),(1520865,173569000,'P06744','','G6PI_HUMAN',4836),(1520866,172680000,'Q13263','','TIF1B_HUMAN',4836),(1520867,172628000,'P11388','','TOP2A_HUMAN',4836),(1520868,172442000,'P09382','','LEG1_HUMAN',4836),(1520869,170183000,'Q14624','','ITIH4_HUMAN',4836),(1520870,169579000,'P34947','','GRK5_HUMAN',4836),(1520871,169460000,'P62847','','RS24_HUMAN',4836),(1520872,168407000,'P52272','','HNRPM_HUMAN',4836),(1520873,167697000,'O00299','','CLIC1_HUMAN',4836),(1520874,167450000,'Q13813','','SPTN1_HUMAN',4836),(1520875,167115000,'Q03938','','ZNF90_HUMAN',4836),(1520876,166440000,'CON_Q9TTE1','','SPA31_BOVIN',4836),(1520877,166429000,'O14684','','PTGES_HUMAN',4836),(1520878,166272000,'Q15365','','PCBP1_HUMAN',4836),(1520879,166222000,'P20700','','LMNB1_HUMAN',4836),(1520880,166039000,'P27348','','1433T_HUMAN',4836),(1520881,165791000,'P46060','','RAGP1_HUMAN',4836),(1520882,165203000,'P09669','','COX6C_HUMAN',4836),(1520883,163343000,'P30040','','ERP29_HUMAN',4836),(1520884,163312000,'P46940','','IQGA1_HUMAN',4836),(1520885,162911000,'Q16719','','KYNU_HUMAN',4836),(1520886,161839000,'Q92688','','AN32B_HUMAN',4836),(1520887,160909000,'P62913','','RL11_HUMAN',4836),(1520888,160577000,'P08195','','4F2_HUMAN',4836),(1520889,160471000,'P67936','','TPM4_HUMAN',4836),(1520890,160366000,'Q02543','','RL18A_HUMAN',4836),(1520891,159513000,'P06396','','GELS_HUMAN',4836),(1520892,158871000,'Q00610','','CLH1_HUMAN',4836),(1520893,158576000,'P52756','','RBM5_HUMAN',4836),(1520894,158407000,'Q14573','','ITPR3_HUMAN',4836),(1520895,158308000,'Q15293','','RCN1_HUMAN',4836),(1520896,157735000,'Q15366','','PCBP2_HUMAN',4836),(1520897,157261000,'P62851','','RS25_HUMAN',4836),(1520898,156262000,'P21796','','VDAC1_HUMAN',4836),(1520899,154984000,'P27695','','APEX1_HUMAN',4836),(1520900,154833000,'P49207','','RL34_HUMAN',4836),(1520901,154057000,'Q9Y3U8','','RL36_HUMAN',4836),(1520902,153746000,'Q15181','','IPYR_HUMAN',4836),(1520903,153367000,'Q01105','','SET_HUMAN',4836),(1520904,151712000,'P51858','','HDGF_HUMAN',4836),(1520905,151574000,'P04080','','CYTB_HUMAN',4836),(1520906,151567000,'Q00325','','MPCP_HUMAN',4836),(1520907,149222000,'P38919','','IF4A3_HUMAN',4836),(1520908,148487000,'P41252','','SYIC_HUMAN',4836),(1520909,148107000,'Q15056','','IF4H_HUMAN',4836),(1520910,147828000,'P14866','','HNRPL_HUMAN',4836),(1520911,147065000,'P54578','','UBP14_HUMAN',4836),(1520912,146559000,'P50990','','TCPQ_HUMAN',4836),(1520913,146398000,'P53999','','TCP4_HUMAN',4836),(1520914,146182000,'P50914','','RL14_HUMAN',4836),(1520915,145961000,'P62280','','RS11_HUMAN',4836),(1520916,144488000,'Q9H2H8','','PPIL3_HUMAN',4836),(1520917,144439000,'CON_Q9TT36','','THBG_BOVIN',4836),(1520918,144110000,'P62841','','RS15_HUMAN',4836),(1520919,143705000,'P42704','','LPPRC_HUMAN',4836),(1520920,143442000,'P12956','','XRCC6_HUMAN',4836),(1520921,143436000,'P20674','','COX5A_HUMAN',4836),(1520922,143145000,'P25398','','RS12_HUMAN',4836),(1520923,141960000,'P62910','','RL32_HUMAN',4836),(1520924,141899000,'Q9BWP8','','COL11_HUMAN',4836),(1520925,139222000,'P50991','','TCPD_HUMAN',4836),(1520926,138838000,'P08758','','ANXA5_HUMAN',4836),(1520927,136707000,'CON_Q3SZ57','','FETA_BOVIN',4836),(1520928,136655000,'P14314','','GLU2B_HUMAN',4836),(1520929,136239000,'P45880','','VDAC2_HUMAN',4836),(1520930,135865000,'P49327','','FAS_HUMAN',4836),(1520931,134982000,'Q08945','','SSRP1_HUMAN',4836),(1520932,134646000,'Q16881','','TRXR1_HUMAN',4836),(1520933,134126000,'CON_P00735','','THRB_BOVIN',4836),(1520934,133375000,'P23526','','SAHH_HUMAN',4836),(1520935,132954000,'P61923','','COPZ1_HUMAN',4836),(1520936,132875000,'P62857','','RS28_HUMAN',4836),(1520937,132866000,'P18077','','RL35A_HUMAN',4836),(1520938,132696000,'P32969','','RL9_HUMAN',4836),(1520939,132510000,'P17931','','LEG3_HUMAN',4836),(1520940,132242000,'O95347','','SMC2_HUMAN',4836),(1520941,132222000,'CON_P00978','','AMBP_BOVIN',4836),(1520942,131993000,'P40925','','MDHC_HUMAN',4836),(1520943,131924000,'P54577','','SYYC_HUMAN',4836),(1520944,131681000,'P78417','','GSTO1_HUMAN',4836),(1520945,131642000,'Q13137','','CACO2_HUMAN',4836),(1520946,131449000,'O60888','','CUTA_HUMAN',4836),(1520947,131001000,'P34897','','GLYM_HUMAN',4836),(1520948,130943000,'P61981','','1433G_HUMAN',4836),(1520949,130923000,'Q9Y265','','RUVB1_HUMAN',4836),(1520950,130501000,'P55072','','TERA_HUMAN',4836),(1520951,128970000,'P08708','','RS17_HUMAN',4836),(1520952,128569000,'P31948','','STIP1_HUMAN',4836),(1520953,128039000,'CON_P06868','','PLMN_BOVIN',4836),(1520954,127989000,'P18206','','VINC_HUMAN',4836),(1520955,127618000,'P00505','','AATM_HUMAN',4836),(1520956,127401000,'Q14160','','SCRIB_HUMAN',4836),(1520957,127210000,'P52565','','GDIR1_HUMAN',4836),(1520958,127112000,'P08218','','CEL2B_HUMAN',4836),(1520959,126946000,'P39748','','FEN1_HUMAN',4836),(1520960,126796000,'Q9UL41','','PNMA3_HUMAN',4836),(1520961,126670000,'P05198','','IF2A_HUMAN',4836),(1520962,126642000,'Q96IU4','','ABHEB_HUMAN',4836),(1520963,126224000,'P54819','','KAD2_HUMAN',4836),(1520964,125331000,'P51991','','ROA3_HUMAN',4836),(1520965,124462000,'Q9Y277','','VDAC3_HUMAN',4836),(1520966,124240000,'O14678','','ABCD4_HUMAN',4836),(1520967,124022000,'P78371','','TCPB_HUMAN',4836),(1520968,123706000,'P28066','','PSA5_HUMAN',4836),(1520969,123493000,'P27694','','RFA1_HUMAN',4836),(1520970,122896000,'Q14103','','HNRPD_HUMAN',4836),(1520971,122814000,'Q96QK1','','VPS35_HUMAN',4836),(1520972,122059000,'Q5TEC6','','H37_HUMAN',4836),(1520973,121979000,'P52597','','HNRPF_HUMAN',4836),(1520974,121580000,'P31943','','HNRH1_HUMAN',4836),(1520975,121258000,'P27635','','RL10_HUMAN',4836),(1520976,119650000,'O75096','','LRP4_HUMAN',4836),(1520977,118619000,'Q07955','','SRSF1_HUMAN',4836),(1520978,118247000,'P40227','','TCPZ_HUMAN',4836),(1520979,118161000,'P63220','','RS21_HUMAN',4836),(1520980,118075000,'P43243','','MATR3_HUMAN',4836),(1520981,117430000,'P25815','','S100P_HUMAN',4836),(1520982,117364000,'O60664','','PLIN3_HUMAN',4836),(1520983,116529000,'P42892','','ECE1_HUMAN',4836),(1520984,115973000,'Q99623','','PHB2_HUMAN',4836),(1520985,115596000,'P10606','','COX5B_HUMAN',4836),(1520986,114779000,'O75822','','EIF3J_HUMAN',4836),(1520987,114294000,'Q5VV52','','ZN691_HUMAN',4836),(1520988,113496000,'P63173','','RL38_HUMAN',4836),(1520989,113321000,'P46783','','RS10_HUMAN',4836),(1520990,112958000,'P36542','','ATPG_HUMAN',4836),(1520991,112850000,'P20618','','PSB1_HUMAN',4836),(1520992,112778000,'Q14978','','NOLC1_HUMAN',4836),(1520993,112416000,'E9PRG8','','CK098_HUMAN',4836),(1520994,112074000,'P49368','','TCPG_HUMAN',4836),(1520995,111880000,'P52292','','IMA1_HUMAN',4836),(1520996,111867000,'P55786','','PSA_HUMAN',4836),(1520997,111468000,'P11586','','C1TC_HUMAN',4836),(1520998,111399000,'P41091','','IF2G_HUMAN',4836),(1520999,111127000,'O75390','','CISY_HUMAN',4836),(1521000,111011000,'P07954','','FUMH_HUMAN',4836),(1521001,110915000,'Q14019','','COTL1_HUMAN',4836),(1521002,110675000,'Q99714','','HCD2_HUMAN',4836),(1521003,110472000,'P26639','','SYTC_HUMAN',4836),(1521004,110469000,'O14979','','HNRDL_HUMAN',4836),(1521005,110417000,'P15121','','ALDR_HUMAN',4836),(1521006,110415000,'P15311','','EZRI_HUMAN',4836),(1521007,110342000,'Q9BXR3','','POK6_HUMAN',4836),(1521008,110122000,'O00410','','IPO5_HUMAN',4836),(1521009,109503000,'Q8TED1','','GPX8_HUMAN',4836),(1521010,109457000,'Q96AE4','','FUBP1_HUMAN',4836),(1521011,109443000,'P62244','','RS15A_HUMAN',4836),(1521012,108572000,'P13987','','CD59_HUMAN',4836),(1521013,108568000,'Q13485','','SMAD4_HUMAN',4836),(1521014,108555000,'P07602','','SAP_HUMAN',4836),(1521015,108362000,'P49748','','ACADV_HUMAN',4836),(1521016,107841000,'P05141','','ADT2_HUMAN',4836),(1521017,107475000,'P35579','','MYH9_HUMAN',4836),(1521018,107369000,'P48643','','TCPE_HUMAN',4836),(1521019,107128000,'P04279','','SEMG1_HUMAN',4836),(1521020,105855000,'Q9Y678','','COPG1_HUMAN',4836),(1521021,105843000,'O00592','','PODXL_HUMAN',4836),(1521022,105146000,'P25789','','PSA4_HUMAN',4836),(1521023,104016000,'P07108','','ACBP_HUMAN',4836),(1521024,103738000,'Q14974','','IMB1_HUMAN',4836),(1521025,103570000,'P11229','','ACM1_HUMAN',4836),(1521026,103123000,'P19404','','NDUV2_HUMAN',4836),(1521027,102874000,'P33316','','DUT_HUMAN',4836),(1521028,102363000,'Q5TF21','','SOGA3_HUMAN',4836),(1521029,102235000,'Q9BPW4','','APOL4_HUMAN',4836),(1521030,102083000,'P35613','','BASI_HUMAN',4836),(1521031,101400000,'Q9NQC3','','RTN4_HUMAN',4836),(1521032,101264000,'P62979','','RS27A_HUMAN',4836),(1521033,101144000,'P61081','','UBC12_HUMAN',4836),(1521034,100874000,'P06753','','TPM3_HUMAN',4836),(1521035,100651000,'O15014','','ZN609_HUMAN',4836),(1521036,100633000,'O43390','','HNRPR_HUMAN',4836),(1521037,100451000,'Q6NUK1','','SCMC1_HUMAN',4836),(1521038,99551900,'P42330','','AK1C3_HUMAN',4836),(1521039,98715600,'Q9C030','','TRIM6_HUMAN',4836),(1521040,98383400,'Q8N2E2','','VWDE_HUMAN',4836),(1521041,97275300,'P00403','','COX2_HUMAN',4836),(1521042,96848100,'Q9NZ45','','CISD1_HUMAN',4836),(1521043,96794200,'P11940','','PABP1_HUMAN',4836),(1521044,96624600,'P04843','','RPN1_HUMAN',4836),(1521045,96487600,'P40429','','RL13A_HUMAN',4836),(1521046,96383500,'P08621','','RU17_HUMAN',4836),(1521047,96140700,'P17096','','HMGA1_HUMAN',4836),(1521048,96061300,'Q9Y266','','NUDC_HUMAN',4836),(1521049,96036300,'Q96DW6','','S2538_HUMAN',4836),(1521050,95037600,'P04040','','CATA_HUMAN',4836),(1521051,94672100,'P38159','','RBMX_HUMAN',4836),(1521052,94559600,'Q15149','','PLEC_HUMAN',4836),(1521053,94177300,'Q7L1Q6','','5MP2_HUMAN',4836),(1521054,94030700,'Q16629','','SRSF7_HUMAN',4836),(1521055,93746700,'P13073','','COX41_HUMAN',4836),(1521056,93594200,'Q6P2Q9','','PRP8_HUMAN',4836),(1521057,93001200,'O15438','','MRP3_HUMAN',4836),(1521058,92348200,'P11387','','TOP1_HUMAN',4836),(1521059,92306100,'P22102','','PUR2_HUMAN',4836),(1521060,92220400,'P30049','','ATPD_HUMAN',4836),(1521061,91512100,'Q5M775','','CYTSB_HUMAN',4836),(1521062,91209700,'Q14432','','PDE3A_HUMAN',4836),(1521063,91003500,'P07384','','CAN1_HUMAN',4836),(1521064,90985700,'P52209','','6PGD_HUMAN',4836),(1521065,90866500,'P60900','','PSA6_HUMAN',4836),(1521066,90820800,'Q9BVC6','','TM109_HUMAN',4836),(1521067,90600900,'Q9H0C8','','ILKAP_HUMAN',4836),(1521068,89949200,'Q06323','','PSME1_HUMAN',4836),(1521069,89921300,'Q9UMS4','','PRP19_HUMAN',4836),(1521070,89734600,'P35637','','FUS_HUMAN',4836),(1521071,89575400,'P13797','','PLST_HUMAN',4836),(1521072,89031100,'Q12905','','ILF2_HUMAN',4836),(1521073,88324800,'P31947','','1433S_HUMAN',4836),(1521074,88274100,'P43487','','RANG_HUMAN',4836),(1521075,88208600,'P09622','','DLDH_HUMAN',4836),(1521076,88196100,'Q9Y617','','SERC_HUMAN',4836),(1521077,87874900,'O75325','','LRRN2_HUMAN',4836),(1521078,87854500,'P17987','','TCPA_HUMAN',4836),(1521079,87243300,'P62266','','RS23_HUMAN',4836),(1521080,87065500,'Q9Y2B0','','CNPY2_HUMAN',4836),(1521081,86747500,'Q08211','','DHX9_HUMAN',4836),(1521082,86711100,'P12814','','ACTN1_HUMAN',4836),(1521083,86692600,'P13010','','XRCC5_HUMAN',4836),(1521084,86550800,'P49736','','MCM2_HUMAN',4836),(1521085,86543000,'P37837','','TALDO_HUMAN',4836),(1521086,86433700,'Q9P2E3','','ZNFX1_HUMAN',4836),(1521087,85935100,'P25788','','PSA3_HUMAN',4836),(1521088,85174300,'Q09028','','RBBP4_HUMAN',4836),(1521089,84726100,'Q99832','','TCPH_HUMAN',4836),(1521090,84512200,'Q9BVL2','','NUP58_HUMAN',4836),(1521091,84285700,'P52888','','THOP1_HUMAN',4836),(1521092,84222100,'Q12931','','TRAP1_HUMAN',4836),(1521093,83576000,'O43852','','CALU_HUMAN',4836),(1521094,83560400,'Q9BXA7','','TSSK1_HUMAN',4836),(1521095,83329100,'P34932','','HSP74_HUMAN',4836),(1521096,83210600,'CON_Q29RQ1','','CO7_BOVIN',4836),(1521097,82655000,'P42126','','ECI1_HUMAN',4836),(1521098,81959500,'P09960','','LKHA4_HUMAN',4836),(1521099,81867600,'Q9NR30','','DDX21_HUMAN',4836),(1521100,81742800,'P13804','','ETFA_HUMAN',4836),(1521101,81440500,'P61970','','NTF2_HUMAN',4836),(1521102,80561100,'Q969Q0','','RL36L_HUMAN',4836),(1521103,80385300,'P05114','','HMGN1_HUMAN',4836),(1521104,80178700,'P60660','','MYL6_HUMAN',4836),(1521105,80108200,'Q16891','','MIC60_HUMAN',4836),(1521106,80104700,'O95197','','RTN3_HUMAN',4836),(1521107,80098800,'P12268','','IMDH2_HUMAN',4836),(1521108,80009000,'P00751','','CFAB_HUMAN',4836),(1521109,79495600,'O75643','','U520_HUMAN',4836),(1521110,79341600,'P55084','','ECHB_HUMAN',4836),(1521111,79063300,'O60488','','ACSL4_HUMAN',4836),(1521112,78797300,'P07510','','ACHG_HUMAN',4836),(1521113,78659400,'P61106','','RAB14_HUMAN',4836),(1521114,78574900,'P00491','','PNPH_HUMAN',4836),(1521115,78556900,'Q92522','','H1X_HUMAN',4836),(1521116,78371600,'P26583','','HMGB2_HUMAN',4836),(1521117,78354800,'P25786','','PSA1_HUMAN',4836),(1521118,78284500,'P55060','','XPO2_HUMAN',4836),(1521119,78229300,'Q8WXH0','','SYNE2_HUMAN',4836),(1521120,78075800,'Q3V6T2','','GRDN_HUMAN',4836),(1521121,77919100,'Q96FQ6','','S10AG_HUMAN',4836),(1521122,77886800,'P14324','','FPPS_HUMAN',4836),(1521123,77800300,'P62306','','RUXF_HUMAN',4836),(1521124,77031000,'P31942','','HNRH3_HUMAN',4836),(1521125,76996600,'Q70UQ0','','IKIP_HUMAN',4836),(1521126,76964100,'P05455','','LA_HUMAN',4836),(1521127,76898900,'Q12797','','ASPH_HUMAN',4836),(1521128,76719200,'Q13838','','DX39B_HUMAN',4836),(1521129,76655100,'Q14847','','LASP1_HUMAN',4836),(1521130,76530400,'P62318','','SMD3_HUMAN',4836),(1521131,76403100,'P01023','','A2MG_HUMAN',4836),(1521132,76270000,'Q1KMD3','','HNRL2_HUMAN',4836),(1521133,76131700,'P11182','','ODB2_HUMAN',4836),(1521134,75996100,'P50395','','GDIB_HUMAN',4836),(1521135,75956000,'Q13185','','CBX3_HUMAN',4836),(1521136,75894700,'P20042','','IF2B_HUMAN',4836),(1521137,75590900,'Q14247','','SRC8_HUMAN',4836),(1521138,75540600,'P53396','','ACLY_HUMAN',4836),(1521139,75362900,'P19827','','ITIH1_HUMAN',4836),(1521140,75081800,'P28072','','PSB6_HUMAN',4836),(1521141,74939200,'Q96T23','','RSF1_HUMAN',4836),(1521142,74932600,'P33991','','MCM4_HUMAN',4836),(1521143,74623000,'P84090','','ERH_HUMAN',4836),(1521144,74604800,'O75367','','H2AY_HUMAN',4836),(1521145,74445500,'P09429','','HMGB1_HUMAN',4836),(1521146,74409300,'P48047','','ATPO_HUMAN',4836),(1521147,74001600,'P49321','','NASP_HUMAN',4836),(1521148,73891300,'P30740','','ILEU_HUMAN',4836),(1521149,73807800,'P40939','','ECHA_HUMAN',4836),(1521150,73409800,'Q99729','','ROAA_HUMAN',4836),(1521151,72948600,'P42765','','THIM_HUMAN',4836),(1521152,72767800,'Q14108','','SCRB2_HUMAN',4836),(1521153,72724600,'P15559','','NQO1_HUMAN',4836),(1521154,72528800,'Q92734','','TFG_HUMAN',4836),(1521155,72527300,'Q13347','','EIF3I_HUMAN',4836),(1521156,72511800,'P23588','','IF4B_HUMAN',4836),(1521157,72349000,'Q9NWT1','','PK1IP_HUMAN',4836),(1521158,72284100,'Q13409','','DC1I2_HUMAN',4836),(1521159,72205000,'Q9Y5S9','','RBM8A_HUMAN',4836),(1521160,72191800,'Q13492','','PICAL_HUMAN',4836),(1521161,72165100,'P18754','','RCC1_HUMAN',4836),(1521162,72160400,'O75947','','ATP5H_HUMAN',4836),(1521163,72127500,'P13693','','TCTP_HUMAN',4836),(1521164,72053400,'P56537','','IF6_HUMAN',4836),(1521165,71984300,'Q9UKM9','','RALY_HUMAN',4836),(1521166,71711800,'P24539','','AT5F1_HUMAN',4836),(1521167,71703000,'Q69YH5','','CDCA2_HUMAN',4836),(1521168,71634000,'P04004','','VTNC_HUMAN',4836),(1521169,71445600,'O94916','','NFAT5_HUMAN',4836),(1521170,71159500,'Q16576','','RBBP7_HUMAN',4836),(1521171,71154700,'Q96QZ7','','MAGI1_HUMAN',4836),(1521172,70998500,'Q04837','','SSBP_HUMAN',4836),(1521173,70812300,'Q99614','','TTC1_HUMAN',4836),(1521174,70786000,'P51571','','SSRD_HUMAN',4836),(1521175,70619200,'P53985','','MOT1_HUMAN',4836),(1521176,70405200,'P16949','','STMN1_HUMAN',4836),(1521177,70301800,'Q01650','','LAT1_HUMAN',4836),(1521178,70049800,'O43143','','DHX15_HUMAN',4836),(1521179,69988400,'Q5TEA6','','SE1L2_HUMAN',4836),(1521180,69960000,'Q00688','','FKBP3_HUMAN',4836),(1521181,69805900,'Q9Y696','','CLIC4_HUMAN',4836),(1521182,69713800,'Q01130','','SRSF2_HUMAN',4836),(1521183,69561800,'Q9P258','','RCC2_HUMAN',4836),(1521184,69428800,'Q14444','','CAPR1_HUMAN',4836),(1521185,69030900,'P16401','','H15_HUMAN',4836),(1521186,68977400,'P22670','','RFX1_HUMAN',4836),(1521187,68945800,'Q13148','','TADBP_HUMAN',4836),(1521188,68774300,'Q6YN16','','HSDL2_HUMAN',4836),(1521189,68726500,'Q92817','','EVPL_HUMAN',4836),(1521190,68634900,'Q15063','','POSTN_HUMAN',4836),(1521191,68533300,'A6NND4','','O2AT4_HUMAN',4836),(1521192,68480200,'Q86VP6','','CAND1_HUMAN',4836),(1521193,68199500,'Q6BAA4','','FCRLB_HUMAN',4836),(1521194,68190400,'P68366','','TBA4A_HUMAN',4836),(1521195,68090500,'O00422','','SAP18_HUMAN',4836),(1521196,68050000,'P02795','','MT2_HUMAN',4836),(1521197,67570700,'P49915','','GUAA_HUMAN',4836),(1521198,67217800,'Q16658','','FSCN1_HUMAN',4836),(1521199,66898300,'P12429','','ANXA3_HUMAN',4836),(1521200,66761100,'O75347','','TBCA_HUMAN',4836),(1521201,66687000,'P20290','','BTF3_HUMAN',4836),(1521202,66617400,'P41279','','M3K8_HUMAN',4836),(1521203,66546300,'P49257','','LMAN1_HUMAN',4836),(1521204,66403100,'P23381','','SYWC_HUMAN',4836),(1521205,66350800,'Q14152','','EIF3A_HUMAN',4836),(1521206,66155700,'Q06033','','ITIH3_HUMAN',4836),(1521207,66016400,'Q32P28','','P3H1_HUMAN',4836),(1521208,65429700,'Q9P0L0','','VAPA_HUMAN',4836),(1521209,65369200,'P58546','','MTPN_HUMAN',4836),(1521210,65285700,'Q9BY42','','RTF2_HUMAN',4836),(1521211,65247400,'Q16851','','UGPA_HUMAN',4836),(1521212,65148700,'P63167','','DYL1_HUMAN',4836),(1521213,65121100,'Q8N9E0','','F133A_HUMAN',4836),(1521214,65076400,'P05546','','HEP2_HUMAN',4836),(1521215,64932200,'P60228','','EIF3E_HUMAN',4836),(1521216,64814100,'Q96C19','','EFHD2_HUMAN',4836),(1521217,64757500,'Q02790','','FKBP4_HUMAN',4836),(1521218,64738600,'P42677','','RS27_HUMAN',4836),(1521219,64666900,'P16615','','AT2A2_HUMAN',4836),(1521220,64443300,'Q96KR1','','ZFR_HUMAN',4836),(1521221,64348600,'Q9BT23','','LIMD2_HUMAN',4836),(1521222,64237000,'Q9NTJ3','','SMC4_HUMAN',4836),(1521223,64172100,'P62273','','RS29_HUMAN',4836),(1521224,64137200,'P30046','','DOPD_HUMAN',4836),(1521225,64053500,'P30084','','ECHM_HUMAN',4836),(1521226,63934200,'Q96QD8','','S38A2_HUMAN',4836),(1521227,63572600,'Q9BQE3','','TBA1C_HUMAN',4836),(1521228,63561800,'P30153','','2AAA_HUMAN',4836),(1521229,63504900,'P38117','','ETFB_HUMAN',4836),(1521230,63204900,'P05556','','ITB1_HUMAN',4836),(1521231,63178100,'Q96AG4','','LRC59_HUMAN',4836),(1521232,62966200,'Q13283','','G3BP1_HUMAN',4836),(1521233,62942800,'Q9BX97','','PLVAP_HUMAN',4836),(1521234,62942100,'P78406','','RAE1L_HUMAN',4836),(1521235,62886200,'P33992','','MCM5_HUMAN',4836),(1521236,62796800,'Q92945','','FUBP2_HUMAN',4836),(1521237,62595900,'P06737','','PYGL_HUMAN',4836),(1521238,62448900,'P40121','','CAPG_HUMAN',4836),(1521239,62302000,'Q9NX24','','NHP2_HUMAN',4836),(1521240,62041300,'P11413','','G6PD_HUMAN',4836),(1521241,62025400,'Q4L180','','FIL1L_HUMAN',4836),(1521242,61735700,'P12236','','ADT3_HUMAN',4836),(1521243,61698200,'Q15046','','SYK_HUMAN',4836),(1521244,61558700,'Q92841','','DDX17_HUMAN',4836),(1521245,61237600,'Q15717','','ELAV1_HUMAN',4836),(1521246,61001700,'CON_P28800','','A2AP_BOVIN',4836),(1521247,60756600,'O43776','','SYNC_HUMAN',4836),(1521248,60478900,'Q15257','','PTPA_HUMAN',4836),(1521249,60349700,'P05023','','AT1A1_HUMAN',4836),(1521250,60267000,'P17812','','PYRG1_HUMAN',4836),(1521251,59923300,'P63218','','GBG5_HUMAN',4836),(1521252,59816800,'P07814','','SYEP_HUMAN',4836),(1521253,59378400,'P55769','','NH2L1_HUMAN',4836),(1521254,59188500,'Q07666','','KHDR1_HUMAN',4836),(1521255,59163400,'P28331','','NDUS1_HUMAN',4836),(1521256,59158500,'O75964','','ATP5L_HUMAN',4836),(1521257,59149500,'Q13085','','ACACA_HUMAN',4836),(1521258,59128200,'O43684','','BUB3_HUMAN',4836),(1521259,59060100,'O75821','','EIF3G_HUMAN',4836),(1521260,59032100,'P09874','','PARP1_HUMAN',4836),(1521261,58916200,'Q15785','','TOM34_HUMAN',4836),(1521262,58889800,'P07996','','TSP1_HUMAN',4836),(1521263,58825800,'Q8IWS0','','PHF6_HUMAN',4836),(1521264,58811900,'Q01518','','CAP1_HUMAN',4836),(1521265,58768700,'Q14566','','MCM6_HUMAN',4836),(1521266,58664100,'P54886','','P5CS_HUMAN',4836),(1521267,58607000,'Q9BQG0','','MBB1A_HUMAN',4836),(1521268,58596000,'P28074','','PSB5_HUMAN',4836),(1521269,58489800,'P20020','','AT2B1_HUMAN',4836),(1521270,58434100,'Q04637','','IF4G1_HUMAN',4836),(1521271,58169400,'Q9Y3A5','','SBDS_HUMAN',4836),(1521272,58153300,'O60841','','IF2P_HUMAN',4836),(1521273,58053500,'O00541','','PESC_HUMAN',4836),(1521274,57577000,'Q9UBT2','','SAE2_HUMAN',4836),(1521275,57449100,'Q04760','','LGUL_HUMAN',4836),(1521276,57270900,'Q14738','','2A5D_HUMAN',4836),(1521277,57044900,'Q96QP1','','ALPK1_HUMAN',4836),(1521278,56919900,'A2A2Y4','','FRMD3_HUMAN',4836),(1521279,56886100,'P43307','','SSRA_HUMAN',4836),(1521280,56760200,'O94956','','SO2B1_HUMAN',4836),(1521281,56758000,'P30520','','PURA2_HUMAN',4836),(1521282,56647000,'Q9Y6M9','','NDUB9_HUMAN',4836),(1521283,56640600,'P49189','','AL9A1_HUMAN',4836),(1521284,56466100,'P20810','','ICAL_HUMAN',4836),(1521285,56340800,'Q01081','','U2AF1_HUMAN',4836),(1521286,56258300,'P62333','','PRS10_HUMAN',4836),(1521287,56124600,'P33993','','MCM7_HUMAN',4836),(1521288,56120800,'Q14703','','MBTP1_HUMAN',4836),(1521289,56000000,'O14880','','MGST3_HUMAN',4836),(1521290,55744100,'O95831','','AIFM1_HUMAN',4836),(1521291,55495700,'P50213','','IDH3A_HUMAN',4836),(1521292,55412900,'P17030','','ZNF25_HUMAN',4836),(1521293,55350500,'P30405','','PPIF_HUMAN',4836),(1521294,55196900,'P82970','','HMGN5_HUMAN',4836),(1521295,55178000,'P63010','','AP2B1_HUMAN',4836),(1521296,55160600,'O95373','','IPO7_HUMAN',4836),(1521297,55143600,'O00244','','ATOX1_HUMAN',4836),(1521298,55084900,'Q9BXJ9','','NAA15_HUMAN',4836),(1521299,54824800,'Q8WW12','','PCNP_HUMAN',4836),(1521300,54588100,'Q9BRA2','','TXD17_HUMAN',4836),(1521301,54559000,'Q9H9Q2','','CSN7B_HUMAN',4836),(1521302,54479800,'P17844','','DDX5_HUMAN',4836),(1521303,54412800,'O43399','','TPD54_HUMAN',4836),(1521304,54374000,'Q2LD37','','K1109_HUMAN',4836),(1521305,54285400,'P52907','','CAZA1_HUMAN',4836),(1521306,54248500,'Q15843','','NEDD8_HUMAN',4836),(1521307,54244200,'P30043','','BLVRB_HUMAN',4836),(1521308,54221900,'P23921','','RIR1_HUMAN',4836),(1521309,54168200,'P61026','','RAB10_HUMAN',4836),(1521310,54115300,'Q13310','','PABP4_HUMAN',4836),(1521311,54111000,'P04179','','SODM_HUMAN',4836),(1521312,54049800,'Q14204','','DYHC1_HUMAN',4836),(1521313,54037900,'O95297','','MPZL1_HUMAN',4836),(1521314,53946200,'P55316','','FOXG1_HUMAN',4836),(1521315,53838900,'Q7RTP6','','MICA3_HUMAN',4836),(1521316,53768100,'Q15393','','SF3B3_HUMAN',4836),(1521317,53692600,'Q96DT5','','DYH11_HUMAN',4836),(1521318,53690100,'P11279','','LAMP1_HUMAN',4836),(1521319,53470100,'O75396','','SC22B_HUMAN',4836),(1521320,53230500,'Q16643','','DREB_HUMAN',4836),(1521321,53139200,'P31930','','QCR1_HUMAN',4836),(1521322,52999300,'P62314','','SMD1_HUMAN',4836),(1521323,52852700,'P08243','','ASNS_HUMAN',4836),(1521324,52816700,'P31939','','PUR9_HUMAN',4836),(1521325,52778900,'Q9NZM1','','MYOF_HUMAN',4836),(1521326,52749200,'Q7Z6Z7','','HUWE1_HUMAN',4836),(1521327,52735900,'Q99733','','NP1L4_HUMAN',4836),(1521328,52710500,'P16070','','CD44_HUMAN',4836),(1521329,52637100,'P62191','','PRS4_HUMAN',4836),(1521330,52614800,'Q16698','','DECR_HUMAN',4836),(1521331,52520200,'Q9Y230','','RUVB2_HUMAN',4836),(1521332,52499200,'P63279','','UBC9_HUMAN',4836),(1521333,52420900,'Q9NQR4','','NIT2_HUMAN',4836),(1521334,52310800,'Q8NBS9','','TXND5_HUMAN',4836),(1521335,52234400,'Q9UHD9','','UBQL2_HUMAN',4836),(1521336,51983800,'P20645','','MPRD_HUMAN',4836),(1521337,51954300,'P60953','','CDC42_HUMAN',4836),(1521338,51935400,'Q13177','','PAK2_HUMAN',4836),(1521339,51798700,'Q96AY3','','FKB10_HUMAN',4836),(1521340,51721000,'Q04917','','1433F_HUMAN',4836),(1521341,51612100,'Q9UL46','','PSME2_HUMAN',4836),(1521342,51523300,'P27816','','MAP4_HUMAN',4836),(1521343,51500200,'Q13098','','CSN1_HUMAN',4836),(1521344,51224300,'Q92499','','DDX1_HUMAN',4836),(1521345,51074000,'Q6P4E1','','GOLM2_HUMAN',4836),(1521346,50794600,'Q13155','','AIMP2_HUMAN',4836),(1521347,50728100,'Q9UL49','','TCFL5_HUMAN',4836),(1521348,50489600,'P35241','','RADI_HUMAN',4836),(1521349,50378600,'Q9Y4L1','','HYOU1_HUMAN',4836),(1521350,50361900,'P61769','','B2MG_HUMAN',4836),(1521351,50346400,'P04198','','MYCN_HUMAN',4836),(1521352,50255000,'Q8TD19','','NEK9_HUMAN',4836),(1521353,49967500,'Q8NF37','','PCAT1_HUMAN',4836),(1521354,49879300,'Q9NR71','','ASAH2_HUMAN',4836),(1521355,49731400,'Q8TD57','','DYH3_HUMAN',4836),(1521356,49728600,'Q6Y1H2','','HACD2_HUMAN',4836),(1521357,49718100,'Q9NY12','','GAR1_HUMAN',4836),(1521358,49669800,'O00571','','DDX3X_HUMAN',4836),(1521359,49573400,'Q13162','','PRDX4_HUMAN',4836),(1521360,49318900,'P12270','','TPR_HUMAN',4836),(1521361,49264500,'O14744','','ANM5_HUMAN',4836),(1521362,49238300,'Q96RP9','','EFGM_HUMAN',4836),(1521363,49164800,'P35659','','DEK_HUMAN',4836),(1521364,49135700,'O15347','','HMGB3_HUMAN',4836),(1521365,49131900,'Q9Y520','','PRC2C_HUMAN',4836),(1521366,49062200,'O14818','','PSA7_HUMAN',4836),(1521367,49018900,'Q02880','','TOP2B_HUMAN',4836),(1521368,49008800,'P61457','','PHS_HUMAN',4836),(1521369,48926100,'P55010','','IF5_HUMAN',4836),(1521370,48792500,'Q12904','','AIMP1_HUMAN',4836),(1521371,48675400,'P09326','','CD48_HUMAN',4836),(1521372,48668500,'O14561','','ACPM_HUMAN',4836),(1521373,48612800,'P24752','','THIL_HUMAN',4836),(1521374,48389900,'O75531','','BAF_HUMAN',4836),(1521375,48347700,'O95336','','6PGL_HUMAN',4836),(1521376,48269100,'A2RUS2','','DEND3_HUMAN',4836),(1521377,48146600,'P47897','','SYQ_HUMAN',4836),(1521378,48129400,'P28070','','PSB4_HUMAN',4836),(1521379,48086500,'Q9BXP5','','SRRT_HUMAN',4836),(1521380,48055000,'Q5JTZ5','','CI152_HUMAN',4836),(1521381,47977800,'Q9BXL7','','CAR11_HUMAN',4836),(1521382,47783800,'Q14721','','KCNB1_HUMAN',4836),(1521383,47626000,'Q15691','','MARE1_HUMAN',4836),(1521384,47578000,'Q9Y305','','ACOT9_HUMAN',4836),(1521385,47348700,'P62495','','ERF1_HUMAN',4836),(1521386,47297600,'Q13126','','MTAP_HUMAN',4836),(1521387,47228500,'P30613','','KPYR_HUMAN',4836),(1521388,47116700,'P14406','','CX7A2_HUMAN',4836),(1521389,47104300,'Q96N66','','MBOA7_HUMAN',4836),(1521390,46957700,'O15144','','ARPC2_HUMAN',4836),(1521391,46949700,'P22087','','FBRL_HUMAN',4836),(1521392,46847900,'P21291','','CSRP1_HUMAN',4836),(1521393,46844200,'Q96I24','','FUBP3_HUMAN',4836),(1521394,46838900,'P00367','','DHE3_HUMAN',4836),(1521395,46825400,'Q8TDN6','','BRX1_HUMAN',4836),(1521396,46822300,'Q9UHX1','','PUF60_HUMAN',4836),(1521397,46803600,'P15170','','ERF3A_HUMAN',4836),(1521398,46364000,'O00115','','DNS2A_HUMAN',4836),(1521399,46336700,'P61960','','UFM1_HUMAN',4836),(1521400,46207400,'Q14232','','EI2BA_HUMAN',4836),(1521401,46078900,'O75083','','WDR1_HUMAN',4836),(1521402,46025800,'P08240','','SRPRA_HUMAN',4836),(1521403,45988700,'Q9Y2G0','','EFR3B_HUMAN',4836),(1521404,45948800,'Q16531','','DDB1_HUMAN',4836),(1521405,45874500,'Q9UKK3','','PARP4_HUMAN',4836),(1521406,45871300,'Q96TA1','','NIBA2_HUMAN',4836),(1521407,45801600,'P21980','','TGM2_HUMAN',4836),(1521408,45739000,'O95057','','DIRA1_HUMAN',4836),(1521409,45624600,'Q9UHD1','','CHRD1_HUMAN',4836),(1521410,45593500,'P09234','','RU1C_HUMAN',4836),(1521411,45582100,'P47756','','CAPZB_HUMAN',4836),(1521412,45349900,'Q15942','','ZYX_HUMAN',4836),(1521413,45346000,'Q13151','','ROA0_HUMAN',4836),(1521414,45304900,'Q13523','','PRP4B_HUMAN',4836),(1521415,45264200,'H7C350','','CC188_HUMAN',4836),(1521416,45242700,'P61254','','RL26_HUMAN',4836),(1521417,45229700,'P07741','','APT_HUMAN',4836),(1521418,45180500,'Q9UBQ0','','VPS29_HUMAN',4836),(1521419,45088900,'P49720','','PSB3_HUMAN',4836),(1521420,44960800,'Q9NR22','','ANM8_HUMAN',4836),(1521421,44944700,'Q9NX63','','MIC19_HUMAN',4836),(1521422,44905100,'P48169','','GBRA4_HUMAN',4836),(1521423,44865500,'Q8WUM4','','PDC6I_HUMAN',4836),(1521424,44862900,'P49721','','PSB2_HUMAN',4836),(1521425,44858600,'Q6TFL3','','CC171_HUMAN',4836),(1521426,44730600,'P16152','','CBR1_HUMAN',4836),(1521427,44691700,'Q14498','','RBM39_HUMAN',4836),(1521428,44633000,'P12277','','KCRB_HUMAN',4836),(1521429,44616200,'P63000','','RAC1_HUMAN',4836),(1521430,44510900,'Q9Y3F4','','STRAP_HUMAN',4836),(1521431,44501100,'D6REC4','','CFA99_HUMAN',4836),(1521432,44464200,'P30533','','AMRP_HUMAN',4836),(1521433,44452200,'P22830','','HEMH_HUMAN',4836),(1521434,44365000,'Q9BQ61','','TRIR_HUMAN',4836),(1521435,44317000,'Q15276','','RABE1_HUMAN',4836),(1521436,44220500,'Q9NV31','','IMP3_HUMAN',4836),(1521437,43982400,'P63208','','SKP1_HUMAN',4836),(1521438,43901800,'Q9P2J5','','SYLC_HUMAN',4836),(1521439,43897500,'O43615','','TIM44_HUMAN',4836),(1521440,43890700,'O95433','','AHSA1_HUMAN',4836),(1521441,43577300,'Q9HB71','','CYBP_HUMAN',4836),(1521442,43559900,'Q99459','','CDC5L_HUMAN',4836),(1521443,43433600,'Q9UNM6','','PSD13_HUMAN',4836),(1521444,43271400,'P00492','','HPRT_HUMAN',4836),(1521445,42979400,'Q8IYL2','','TRM44_HUMAN',4836),(1521446,42910500,'O00567','','NOP56_HUMAN',4836),(1521447,42860700,'P00568','','KAD1_HUMAN',4836),(1521448,42826500,'O00303','','EIF3F_HUMAN',4836),(1521449,42788600,'P55795','','HNRH2_HUMAN',4836),(1521450,42664200,'P55265','','DSRAD_HUMAN',4836),(1521451,42635700,'P48556','','PSMD8_HUMAN',4836),(1521452,42577800,'Q9BY89','','K1671_HUMAN',4836),(1521453,42552100,'P40261','','NNMT_HUMAN',4836),(1521454,42522200,'Q9Y5X3','','SNX5_HUMAN',4836),(1521455,42500400,'P07686','','HEXB_HUMAN',4836),(1521456,42386100,'P54105','','ICLN_HUMAN',4836),(1521457,42323600,'Q9Y399','','RT02_HUMAN',4836),(1521458,42287700,'O43670','','ZN207_HUMAN',4836),(1521459,41955300,'Q04656','','ATP7A_HUMAN',4836),(1521460,41831600,'P26368','','U2AF2_HUMAN',4836),(1521461,41755700,'P30047','','GFRP_HUMAN',4836),(1521462,41731200,'P18085','','ARF4_HUMAN',4836),(1521463,41730700,'P51148','','RAB5C_HUMAN',4836),(1521464,41561400,'Q99436','','PSB7_HUMAN',4836),(1521465,41438300,'O75223','','GGCT_HUMAN',4836),(1521466,41368300,'O43818','','U3IP2_HUMAN',4836),(1521467,41171800,'Q99708','','CTIP_HUMAN',4836),(1521468,41137500,'Q9NZ01','','TECR_HUMAN',4836),(1521469,41136300,'Q02224','','CENPE_HUMAN',4836),(1521470,41084800,'P55884','','EIF3B_HUMAN',4836),(1521471,40785500,'I3L1E1','','CS084_HUMAN',4836),(1521472,40631400,'Q9H1E3','','NUCKS_HUMAN',4836),(1521473,40610400,'P52294','','IMA5_HUMAN',4836),(1521474,40561800,'Q13724','','MOGS_HUMAN',4836),(1521475,40313200,'Q5T160','','SYRM_HUMAN',4836),(1521476,40278800,'Q92878','','RAD50_HUMAN',4836),(1521477,40271700,'Q8WWI1','','LMO7_HUMAN',4836),(1521478,40174600,'Q01469','','FABP5_HUMAN',4836),(1521479,40134300,'P35244','','RFA3_HUMAN',4836),(1521480,39998600,'Q14116','','IL18_HUMAN',4836),(1521481,39944800,'Q8NBJ5','','GT251_HUMAN',4836),(1521482,39904300,'P11766','','ADHX_HUMAN',4836),(1521483,39888200,'Q9BR26','','OCSTP_HUMAN',4836),(1521484,39747000,'Q9NUX5','','POTE1_HUMAN',4836),(1521485,39746500,'Q99536','','VAT1_HUMAN',4836),(1521486,39667700,'Q9Y2Q3','','GSTK1_HUMAN',4836),(1521487,39624100,'CON_P41361','','ANT3_BOVIN',4836),(1521488,39574400,'P17655','','CAN2_HUMAN',4836),(1521489,39500300,'P15954','','COX7C_HUMAN',4836),(1521490,39405300,'P07099','','HYEP_HUMAN',4836),(1521491,39302400,'Q16836','','HCDH_HUMAN',4836),(1521492,39301400,'O43813','','LANC1_HUMAN',4836),(1521493,39268500,'Q9NX55','','HYPK_HUMAN',4836),(1521494,39258100,'P49458','','SRP09_HUMAN',4836),(1521495,39191400,'Q969H8','','MYDGF_HUMAN',4836),(1521496,39132700,'Q96P70','','IPO9_HUMAN',4836),(1521497,38983400,'P52788','','SPSY_HUMAN',4836),(1521498,38736900,'Q9Y2W1','','TR150_HUMAN',4836),(1521499,38666500,'Q9Y383','','LC7L2_HUMAN',4836),(1521500,38661300,'P46013','','KI67_HUMAN',4836),(1521501,38548000,'P51659','','DHB4_HUMAN',4836),(1521502,38409100,'A8MYA2','','CX049_HUMAN',4836),(1521503,38396300,'O43747','','AP1G1_HUMAN',4836),(1521504,38370100,'Q14914','','PTGR1_HUMAN',4836),(1521505,38339400,'Q9P242','','NYAP2_HUMAN',4836),(1521506,38287800,'Q9Y3Y2','','CHTOP_HUMAN',4836),(1521507,38251200,'O60870','','KIN17_HUMAN',4836),(1521508,38184300,'P68036','','UB2L3_HUMAN',4836),(1521509,38158700,'Q9Y490','','TLN1_HUMAN',4836),(1521510,38139800,'Q13435','','SF3B2_HUMAN',4836),(1521511,38110600,'O60610','','DIAP1_HUMAN',4836),(1521512,37951200,'P12081','','HARS1_HUMAN',4836),(1521513,37822800,'Q8IVM0','','CCD50_HUMAN',4836),(1521514,37820500,'Q9P0W2','','HM20B_HUMAN',4836),(1521515,37614700,'P99999','','CYC_HUMAN',4836),(1521516,37605800,'O00233','','PSMD9_HUMAN',4836),(1521517,37557800,'P61019','','RAB2A_HUMAN',4836),(1521518,37527200,'Q9UKD2','','MRT4_HUMAN',4836),(1521519,37499200,'Q9BVP2','','GNL3_HUMAN',4836),(1521520,37493000,'P21399','','ACOHC_HUMAN',4836),(1521521,37424100,'Q9Y6N5','','SQOR_HUMAN',4836),(1521522,37358400,'Q92973','','TNPO1_HUMAN',4836),(1521523,37217100,'P52594','','AGFG1_HUMAN',4836),(1521524,37191200,'Q9BZZ5','','API5_HUMAN',4836),(1521525,37177600,'O60303','','KATIP_HUMAN',4836),(1521526,37146900,'Q9Y224','','RTRAF_HUMAN',4836),(1521527,37120200,'P62633','','CNBP_HUMAN',4836),(1521528,37071900,'Q7Z2K6','','ERMP1_HUMAN',4836),(1521529,36965300,'Q16666','','IF16_HUMAN',4836),(1521530,36960900,'Q9Y2R0','','COA3_HUMAN',4836),(1521531,36849700,'Q9Y6E2','','5MP1_HUMAN',4836),(1521532,36828600,'P61513','','RL37A_HUMAN',4836),(1521533,36814900,'P61599','','NAA20_HUMAN',4836),(1521534,36785700,'P62140','','PP1B_HUMAN',4836),(1521535,36777000,'P11177','','ODPB_HUMAN',4836),(1521536,36775700,'Q15018','','ABRX2_HUMAN',4836),(1521537,36655500,'O14980','','XPO1_HUMAN',4836),(1521538,36581000,'O95817','','BAG3_HUMAN',4836),(1521539,36416200,'Q9UHD8','','SEPT9_HUMAN',4836),(1521540,36342700,'Q7KZF4','','SND1_HUMAN',4836),(1521541,36334000,'P31040','','SDHA_HUMAN',4836),(1521542,36283600,'Q96FW1','','OTUB1_HUMAN',4836),(1521543,36158900,'Q9Y6C9','','MTCH2_HUMAN',4836),(1521544,36152200,'P09497','','CLCB_HUMAN',4836),(1521545,36062400,'O43181','','NDUS4_HUMAN',4836),(1521546,35939700,'Q16186','','ADRM1_HUMAN',4836),(1521547,35852400,'P25787','','PSA2_HUMAN',4836),(1521548,35832000,'Q8IUD2','','RB6I2_HUMAN',4836),(1521549,35710700,'P50579','','MAP2_HUMAN',4836),(1521550,35702600,'Q15427','','SF3B4_HUMAN',4836),(1521551,35440900,'Q9HDC9','','APMAP_HUMAN',4836),(1521552,35410400,'Q6UN15','','FIP1_HUMAN',4836),(1521553,35374000,'Q15388','','TOM20_HUMAN',4836),(1521554,35308000,'O94906','','PRP6_HUMAN',4836),(1521555,35288500,'P25205','','MCM3_HUMAN',4836),(1521556,35220800,'Q9UKS6','','PACN3_HUMAN',4836),(1521557,35191500,'Q53GA4','','PHLA2_HUMAN',4836),(1521558,35086200,'O00483','','NDUA4_HUMAN',4836),(1521559,35054700,'P50135','','HNMT_HUMAN',4836),(1521560,34990700,'Q13200','','PSMD2_HUMAN',4836),(1521561,34977700,'P78330','','SERB_HUMAN',4836),(1521562,34948900,'P20962','','PTMS_HUMAN',4836),(1521563,34885200,'P49756','','RBM25_HUMAN',4836),(1521564,34839300,'P10619','','PPGB_HUMAN',4836),(1521565,34817900,'Q9H0U4','','RAB1B_HUMAN',4836),(1521566,34804800,'Q13683','','ITA7_HUMAN',4836),(1521567,34662100,'Q9H3K6','','BOLA2_HUMAN',4836),(1521568,34538400,'Q5T6F2','','UBAP2_HUMAN',4836),(1521569,34476500,'P61619','','S61A1_HUMAN',4836),(1521570,34436300,'Q96GQ7','','DDX27_HUMAN',4836),(1521571,34430400,'Q9BTC0','','DIDO1_HUMAN',4836),(1521572,34345000,'A0A1B0GV03','','GG6L7_HUMAN',4836),(1521573,34177200,'P24666','','PPAC_HUMAN',4836),(1521574,34175400,'Q5FWE3','','PRRT3_HUMAN',4836),(1521575,34144100,'Q8TCC3','','RM30_HUMAN',4836),(1521576,34067300,'Q9P035','','HACD3_HUMAN',4836),(1521577,34028300,'P49755','','TMEDA_HUMAN',4836),(1521578,33939100,'Q92949','','FOXJ1_HUMAN',4836),(1521579,33766200,'Q13573','','SNW1_HUMAN',4836),(1521580,33741500,'O75608','','LYPA1_HUMAN',4836),(1521581,33578400,'Q9HCE5','','MET14_HUMAN',4836),(1521582,33480300,'P16989','','YBOX3_HUMAN',4836),(1521583,33331300,'P43490','','NAMPT_HUMAN',4836),(1521584,33295800,'O75436','','VP26A_HUMAN',4836),(1521585,33241400,'Q96K17','','BT3L4_HUMAN',4836),(1521586,33218200,'P35237','','SPB6_HUMAN',4836),(1521587,33199800,'Q09161','','NCBP1_HUMAN',4836),(1521588,33193100,'Q99996','','AKAP9_HUMAN',4836),(1521589,33148100,'P17568','','NDUB7_HUMAN',4836),(1521590,33105100,'Q9BY44','','EIF2A_HUMAN',4836),(1521591,33059000,'P08559','','ODPA_HUMAN',4836),(1521592,32985600,'Q15005','','SPCS2_HUMAN',4836),(1521593,32980100,'Q16555','','DPYL2_HUMAN',4836),(1521594,32979800,'Q92466','','DDB2_HUMAN',4836),(1521595,32975200,'Q14257','','RCN2_HUMAN',4836),(1521596,32959000,'O15427','','MOT4_HUMAN',4836),(1521597,32889000,'Q8IY81','','SPB1_HUMAN',4836),(1521598,32838700,'O60884','','DNJA2_HUMAN',4836),(1521599,32711700,'Q9P2X0','','DPM3_HUMAN',4836),(1521600,32658100,'O75340','','PDCD6_HUMAN',4836),(1521601,32598600,'P56192','','SYMC_HUMAN',4836),(1521602,32587600,'P49773','','HINT1_HUMAN',4836),(1521603,32455100,'P60510','','PP4C_HUMAN',4836),(1521604,32449900,'P09001','','RM03_HUMAN',4836),(1521605,32398700,'P36871','','PGM1_HUMAN',4836),(1521606,32381200,'O75475','','PSIP1_HUMAN',4836),(1521607,32375600,'P39656','','OST48_HUMAN',4836),(1521608,32370900,'Q9BY32','','ITPA_HUMAN',4836),(1521609,32367500,'Q15940','','ZNF67_HUMAN',4836),(1521610,32342000,'Q9NYU2','','UGGG1_HUMAN',4836),(1521611,32330400,'Q15019','','SEPT2_HUMAN',4836),(1521612,32326100,'P47712','','PA24A_HUMAN',4836),(1521613,32174500,'Q9NTK5','','OLA1_HUMAN',4836),(1521614,32139400,'O14975','','S27A2_HUMAN',4836),(1521615,32125900,'Q9H078','','CLPB_HUMAN',4836),(1521616,32120200,'P35716','','SOX11_HUMAN',4836),(1521617,32092500,'Q9UKY7','','CDV3_HUMAN',4836),(1521618,32025300,'Q9UMY1','','NOL7_HUMAN',4836),(1521619,31924500,'Q9UN86','','G3BP2_HUMAN',4836),(1521620,31820500,'P28838','','AMPL_HUMAN',4836),(1521621,31777000,'P80303','','NUCB2_HUMAN',4836),(1521622,31734700,'P09661','','RU2A_HUMAN',4836),(1521623,31650500,'P42167','','LAP2B_HUMAN',4836),(1521624,31645200,'Q9BS26','','ERP44_HUMAN',4836),(1521625,31537300,'P25325','','THTM_HUMAN',4836),(1521626,31452900,'P62195','','PRS8_HUMAN',4836),(1521627,31368000,'Q96PK6','','RBM14_HUMAN',4836),(1521628,31338300,'Q00765','','REEP5_HUMAN',4836),(1521629,31337000,'P45974','','UBP5_HUMAN',4836),(1521630,31320200,'Q702N8','','XIRP1_HUMAN',4836),(1521631,31282100,'P51572','','BAP31_HUMAN',4836),(1521632,31259000,'Q6P9F7','','LRC8B_HUMAN',4836),(1521633,31252300,'Q92979','','NEP1_HUMAN',4836),(1521634,31245200,'P62873','','GBB1_HUMAN',4836),(1521635,31244700,'Q9UHV9','','PFD2_HUMAN',4836),(1521636,31191100,'Q8NBJ7','','SUMF2_HUMAN',4836),(1521637,31030800,'Q8TCJ2','','STT3B_HUMAN',4836),(1521638,30925400,'Q8NC96','','NECP1_HUMAN',4836),(1521639,30902700,'Q14764','','MVP_HUMAN',4836),(1521640,30819700,'O75874','','IDHC_HUMAN',4836),(1521641,30745100,'Q6PJT7','','ZC3HE_HUMAN',4836),(1521642,30732500,'Q7Z7H5','','TMED4_HUMAN',4836),(1521643,30577700,'P51812','','KS6A3_HUMAN',4836),(1521644,30479000,'O43169','','CYB5B_HUMAN',4836),(1521645,30467400,'O43660','','PLRG1_HUMAN',4836),(1521646,30415700,'P37108','','SRP14_HUMAN',4836),(1521647,30413400,'P78344','','IF4G2_HUMAN',4836),(1521648,30406100,'Q7L014','','DDX46_HUMAN',4836),(1521649,30370400,'Q01844','','EWS_HUMAN',4836),(1521650,30259200,'P14868','','SYDC_HUMAN',4836),(1521651,30196200,'P61289','','PSME3_HUMAN',4836),(1521652,29926700,'Q13733','','AT1A4_HUMAN',4836),(1521653,29832500,'P43034','','LIS1_HUMAN',4836),(1521654,29681300,'P48444','','COPD_HUMAN',4836),(1521655,29645300,'Q9Y3T9','','NOC2L_HUMAN',4836),(1521656,29584800,'P27708','','PYR1_HUMAN',4836),(1521657,29567900,'Q9NX14','','NDUBB_HUMAN',4836),(1521658,29540200,'O60869','','EDF1_HUMAN',4836),(1521659,29497600,'Q0VF49','','K2012_HUMAN',4836),(1521660,29494300,'Q86V81','','THOC4_HUMAN',4836),(1521661,29475000,'O43447','','PPIH_HUMAN',4836),(1521662,29474300,'O43809','','CPSF5_HUMAN',4836),(1521663,29469600,'Q9NPF8','','ADAP2_HUMAN',4836),(1521664,29373700,'A6NNT2','','CP096_HUMAN',4836),(1521665,29362000,'Q16630','','CPSF6_HUMAN',4836),(1521666,29346200,'Q92616','','GCN1_HUMAN',4836),(1521667,29345100,'Q9H814','','PHAX_HUMAN',4836),(1521668,29343100,'P07203','','GPX1_HUMAN',4836),(1521669,29323500,'O43324','','MCA3_HUMAN',4836),(1521670,29225900,'Q15369','','ELOC_HUMAN',4836),(1521671,29225400,'Q15029','','U5S1_HUMAN',4836),(1521672,29222800,'P51149','','RAB7A_HUMAN',4836),(1521673,29215900,'P60981','','DEST_HUMAN',4836),(1521674,29143700,'Q03252','','LMNB2_HUMAN',4836),(1521675,29139100,'P55263','','ADK_HUMAN',4836),(1521676,29126400,'Q96F83','','CLBA1_HUMAN',4836),(1521677,29043800,'Q9NY33','','DPP3_HUMAN',4836),(1521678,28317200,'CON_P02676','','FIBB_BOVIN',4836),(1521679,28286500,'CON_Q29443','','TRFE_BOVIN',4836),(1521680,26026200,'CON_P50448','','F12AI_BOVIN',4836),(1521681,24128600,'CON_E1BF81','','CBG_BOVIN',4836),(1521682,23716400,'CON_P02663','','CASA2_BOVIN',4836),(1521683,20216800,'CON_Q3MHN2','','CO9_BOVIN',4836),(1521684,17789400,'CON_P17697','','CLUS_BOVIN',4836),(1521685,17413300,'CON_Q9N2I2','','IPSP_BOVIN',4836),(1521686,16436800,'CON_Q95M17','','CHIA_BOVIN',4836),(1521687,12318600,'CON_Q05443','','LUM_BOVIN',4836),(1521688,12293600,'CON_P01044','','KNG1_BOVIN',4836),(1521689,10933900,'CON_Q03247','','APOE_BOVIN',4836),(1521690,8667710,'CON_P17690','','APOH_BOVIN',4836),(1521691,3581630,'CON_Q28107','','FA5_BOVIN',4836),(1521692,2794410,'CON_Q28065','','C4BPA_BOVIN',4836),(1521693,2584600,'CON_Q28085','','CFAH_BOVIN',4836),(1521694,6935870000,'Q5VZ66','','JKIP3_HUMAN',4837),(1521695,4520470000,'CON_P12763','','FETUA_BOVIN',4837),(1521696,3175140000,'P62805','','H4_HUMAN',4837),(1521697,3025030000,'P04406','','G3P_HUMAN',4837),(1521698,2719080000,'Q9BXS9','','S26A6_HUMAN',4837),(1521699,1950970000,'Q99684','','GFI1_HUMAN',4837),(1521700,1775260000,'P06733','','ENOA_HUMAN',4837),(1521701,1771480000,'P06703','','S10A6_HUMAN',4837),(1521702,1732060000,'P48147','','PPCE_HUMAN',4837),(1521703,1613770000,'CON_P34955','','A1AT_BOVIN',4837),(1521704,1533620000,'P14618','','KPYM_HUMAN',4837),(1521705,1525400000,'P62937','','PPIA_HUMAN',4837),(1521706,1276100000,'P26447','','S10A4_HUMAN',4837),(1521707,1261530000,'P06748','','NPM_HUMAN',4837),(1521708,1015990000,'P05783','','K1C18_HUMAN',4837),(1521709,1010310000,'P31949','','S10AB_HUMAN',4837),(1521710,997176000,'Q92620','','PRP16_HUMAN',4837),(1521711,930789000,'Q5JQC9','','AKAP4_HUMAN',4837),(1521712,900540000,'Q06830','','PRDX1_HUMAN',4837),(1521713,849468000,'P00338','','LDHA_HUMAN',4837),(1521714,798771000,'CON_P15636','','API_ACHLY',4837),(1521715,796826000,'P05387','','RLA2_HUMAN',4837),(1521716,756410000,'P00558','','PGK1_HUMAN',4837),(1521717,755187000,'P23246','','SFPQ_HUMAN',4837),(1521718,726545000,'Q86UL8','','MAGI2_HUMAN',4837),(1521719,726314000,'P07737','','PROF1_HUMAN',4837),(1521720,682035000,'Q9Y5Q9','','TF3C3_HUMAN',4837),(1521721,626175000,'P04075','','ALDOA_HUMAN',4837),(1521722,615677000,'P11142','','HSP7C_HUMAN',4837),(1521723,615067000,'P11021','','BIP_HUMAN',4837),(1521724,610265000,'P63241','','IF5A1_HUMAN',4837),(1521725,606384000,'P10809','','CH60_HUMAN',4837),(1521726,565359000,'P08238','','HS90B_HUMAN',4837),(1521727,562869000,'P10599','','THIO_HUMAN',4837),(1521728,548993000,'CON_P01966','','HBA_BOVIN',4837),(1521729,536255000,'Q9UF83','','YM012_HUMAN',4837),(1521730,529051000,'P07437','','TBB5_HUMAN',4837),(1521731,524574000,'O75146','','HIP1R_HUMAN',4837),(1521732,524216000,'P29401','','TKT_HUMAN',4837),(1521733,522213000,'P55209','','NP1L1_HUMAN',4837),(1521734,501988000,'P08670','','VIME_HUMAN',4837),(1521735,496364000,'CON_P02070','','HBB_BOVIN',4837),(1521736,488709000,'P60174','','TPIS_HUMAN',4837),(1521737,484612000,'Q9BZH6','','WDR11_HUMAN',4837),(1521738,467823000,'Q96QK1','','VPS35_HUMAN',4837),(1521739,467617000,'P62826','','RAN_HUMAN',4837),(1521740,464350000,'P05386','','RLA1_HUMAN',4837),(1521741,462143000,'P02545','','LMNA_HUMAN',4837),(1521742,452585000,'P22626','','ROA2_HUMAN',4837),(1521743,449281000,'P61604','','CH10_HUMAN',4837),(1521744,433509000,'CON_P02769','','ALBU_BOVIN',4837),(1521745,429551000,'P63104','','1433Z_HUMAN',4837),(1521746,426046000,'P68371','','TBB4B_HUMAN',4837),(1521747,422523000,'CON_Q2UVX4','','CO3_BOVIN',4837),(1521748,421257000,'O75167','','PHAR2_HUMAN',4837),(1521749,420727000,'P07195','','LDHB_HUMAN',4837),(1521750,415642000,'Q16543','','CDC37_HUMAN',4837),(1521751,415429000,'P60903','','S10AA_HUMAN',4837),(1521752,414159000,'P46777','','RL5_HUMAN',4837),(1521753,409760000,'P07355','','ANXA2_HUMAN',4837),(1521754,395693000,'P62906','','RL10A_HUMAN',4837),(1521755,386044000,'P06454','','PTMA_HUMAN',4837),(1521756,382489000,'P13639','','EF2_HUMAN',4837),(1521757,382340000,'P19338','','NUCL_HUMAN',4837),(1521758,381260000,'P42766','','RL35_HUMAN',4837),(1521759,378381000,'Q14674','','ESPL1_HUMAN',4837),(1521760,378108000,'CON_Q58D62','','FETUB_BOVIN',4837),(1521761,374117000,'P62829','','RL23_HUMAN',4837),(1521762,366409000,'Q09666','','AHNK_HUMAN',4837),(1521763,366290000,'P62263','','RS14_HUMAN',4837),(1521764,361158000,'P61978','','HNRPK_HUMAN',4837),(1521765,352549000,'P18124','','RL7_HUMAN',4837),(1521766,352170000,'P30041','','PRDX6_HUMAN',4837),(1521767,351555000,'P60866','','RS20_HUMAN',4837),(1521768,345909000,'P36578','','RL4_HUMAN',4837),(1521769,345040000,'P26641','','EF1G_HUMAN',4837),(1521770,344815000,'P07910','','HNRPC_HUMAN',4837),(1521771,344267000,'P80723','','BASP1_HUMAN',4837),(1521772,337932000,'P31327','','CPSM_HUMAN',4837),(1521773,337139000,'Q9NZC9','','SMAL1_HUMAN',4837),(1521774,336938000,'P51858','','HDGF_HUMAN',4837),(1521775,331459000,'P27797','','CALR_HUMAN',4837),(1521776,331204000,'P46782','','RS5_HUMAN',4837),(1521777,327871000,'P19823','','ITIH2_HUMAN',4837),(1521778,326353000,'P06576','','ATPB_HUMAN',4837),(1521779,322528000,'CON_P00761','','TRYP_PIG',4837),(1521780,322151000,'P23396','','RS3_HUMAN',4837),(1521781,321486000,'Q9BZV1','','UBXN6_HUMAN',4837),(1521782,317846000,'P02786','','TFR1_HUMAN',4837),(1521783,316727000,'P30050','','RL12_HUMAN',4837),(1521784,314767000,'P26373','','RL13_HUMAN',4837),(1521785,313241000,'P62258','','1433E_HUMAN',4837),(1521786,312678000,'P08865','','RSSA_HUMAN',4837),(1521787,310917000,'P23284','','PPIB_HUMAN',4837),(1521788,310477000,'P04083','','ANXA1_HUMAN',4837),(1521789,309980000,'P15880','','RS2_HUMAN',4837),(1521790,308593000,'P49419','','AL7A1_HUMAN',4837),(1521791,308284000,'Q02878','','RL6_HUMAN',4837),(1521792,307985000,'Q9Y2B1','','RXLT1_HUMAN',4837),(1521793,306910000,'P62424','','RL7A_HUMAN',4837),(1521794,306500000,'Q9H013','','ADA19_HUMAN',4837),(1521795,304323000,'P14174','','MIF_HUMAN',4837),(1521796,302765000,'P62750','','RL23A_HUMAN',4837),(1521797,301505000,'P32119','','PRDX2_HUMAN',4837),(1521798,296319000,'CON_P15497','','APOA1_BOVIN',4837),(1521799,293982000,'P25705','','ATPA_HUMAN',4837),(1521800,290856000,'Q99497','','PARK7_HUMAN',4837),(1521801,285275000,'P62241','','RS8_HUMAN',4837),(1521802,284558000,'O43175','','SERA_HUMAN',4837),(1521803,284105000,'P62917','','RL8_HUMAN',4837),(1521804,282502000,'O75369','','FLNB_HUMAN',4837),(1521805,282213000,'P30101','','PDIA3_HUMAN',4837),(1521806,280942000,'P30044','','PRDX5_HUMAN',4837),(1521807,280918000,'P23528','','COF1_HUMAN',4837),(1521808,279949000,'P21333','','FLNA_HUMAN',4837),(1521809,278877000,'Q9Y5B9','','SP16H_HUMAN',4837),(1521810,278834000,'P07900','','HS90A_HUMAN',4837),(1521811,278430000,'Q07020','','RL18_HUMAN',4837),(1521812,275082000,'P31946','','1433B_HUMAN',4837),(1521813,272301000,'Q00839','','HNRPU_HUMAN',4837),(1521814,272046000,'P27816','','MAP4_HUMAN',4837),(1521815,265938000,'Q05639','','EF1A2_HUMAN',4837),(1521816,264869000,'P84098','','RL19_HUMAN',4837),(1521817,260946000,'P36952','','SPB5_HUMAN',4837),(1521818,260615000,'O75618','','DEDD_HUMAN',4837),(1521819,257059000,'P61247','','RS3A_HUMAN',4837),(1521820,256386000,'P33316','','DUT_HUMAN',4837),(1521821,256339000,'P39023','','RL3_HUMAN',4837),(1521822,253354000,'P26038','','MOES_HUMAN',4837),(1521823,253084000,'P60842','','IF4A1_HUMAN',4837),(1521824,250671000,'P62753','','RS6_HUMAN',4837),(1521825,247404000,'P00966','','ASSY_HUMAN',4837),(1521826,247277000,'O00299','','CLIC1_HUMAN',4837),(1521827,242667000,'P14406','','CX7A2_HUMAN',4837),(1521828,242396000,'P50914','','RL14_HUMAN',4837),(1521829,235341000,'P62841','','RS15_HUMAN',4837),(1521830,233982000,'Q04941','','PLP2_HUMAN',4837),(1521831,232723000,'Q9Y262','','EIF3L_HUMAN',4837),(1521832,231463000,'P27824','','CALX_HUMAN',4837),(1521833,231302000,'Q9P1Y5','','CAMP3_HUMAN',4837),(1521834,227960000,'P62913','','RL11_HUMAN',4837),(1521835,225128000,'P24534','','EF1B_HUMAN',4837),(1521836,224302000,'P27635','','RL10_HUMAN',4837),(1521837,224087000,'P61981','','1433G_HUMAN',4837),(1521838,223912000,'P46781','','RS9_HUMAN',4837),(1521839,222608000,'P49207','','RL34_HUMAN',4837),(1521840,222348000,'P22314','','UBA1_HUMAN',4837),(1521841,222163000,'Q96HY7','','DHTK1_HUMAN',4837),(1521842,221466000,'P37802','','TAGL2_HUMAN',4837),(1521843,217651000,'P62861','','RS30_HUMAN',4837),(1521844,216424000,'P83731','','RL24_HUMAN',4837),(1521845,214829000,'P18621','','RL17_HUMAN',4837),(1521846,212779000,'P61353','','RL27_HUMAN',4837),(1521847,212768000,'Q08211','','DHX9_HUMAN',4837),(1521848,212038000,'P49411','','EFTU_HUMAN',4837),(1521849,210154000,'P40926','','MDHM_HUMAN',4837),(1521850,209191000,'P00441','','SODC_HUMAN',4837),(1521851,208888000,'Q02543','','RL18A_HUMAN',4837),(1521852,206156000,'Q01105','','SET_HUMAN',4837),(1521853,205491000,'Q15185','','TEBP_HUMAN',4837),(1521854,204733000,'Q13469','','NFAC2_HUMAN',4837),(1521855,204579000,'P14625','','ENPL_HUMAN',4837),(1521856,204357000,'P45880','','VDAC2_HUMAN',4837),(1521857,204115000,'P39019','','RS19_HUMAN',4837),(1521858,203543000,'Q3MJ13','','WDR72_HUMAN',4837),(1521859,202907000,'P25398','','RS12_HUMAN',4837),(1521860,202594000,'P61313','','RL15_HUMAN',4837),(1521861,201339000,'P18669','','PGAM1_HUMAN',4837),(1521862,201025000,'P67809','','YBOX1_HUMAN',4837),(1521863,200856000,'P30154','','2AAB_HUMAN',4837),(1521864,200080000,'P62316','','SMD2_HUMAN',4837),(1521865,197332000,'P55060','','XPO2_HUMAN',4837),(1521866,197126000,'Q9UIR0','','BTNL2_HUMAN',4837),(1521867,196650000,'P27348','','1433T_HUMAN',4837),(1521868,196384000,'P38646','','GRP75_HUMAN',4837),(1521869,191736000,'P10070','','GLI2_HUMAN',4837),(1521870,191599000,'P12004','','PCNA_HUMAN',4837),(1521871,191250000,'P35613','','BASI_HUMAN',4837),(1521872,191080000,'P23381','','SYWC_HUMAN',4837),(1521873,190889000,'Q8NC51','','PAIRB_HUMAN',4837),(1521874,189813000,'P13010','','XRCC5_HUMAN',4837),(1521875,189804000,'P40925','','MDHC_HUMAN',4837),(1521876,189382000,'P26599','','PTBP1_HUMAN',4837),(1521877,189350000,'P62269','','RS18_HUMAN',4837),(1521878,189155000,'P31948','','STIP1_HUMAN',4837),(1521879,188931000,'Q9UQ80','','PA2G4_HUMAN',4837),(1521880,187882000,'P20700','','LMNB1_HUMAN',4837),(1521881,187756000,'P62701','','RS4X_HUMAN',4837),(1521882,187248000,'P06744','','G6PI_HUMAN',4837),(1521883,186849000,'P46776','','RL27A_HUMAN',4837),(1521884,182861000,'P08174','','DAF_HUMAN',4837),(1521885,182007000,'P46940','','IQGA1_HUMAN',4837),(1521886,180984000,'Q9H553','','ALG2_HUMAN',4837),(1521887,180615000,'P25786','','PSA1_HUMAN',4837),(1521888,178583000,'P50238','','CRIP1_HUMAN',4837),(1521889,178574000,'P49368','','TCPG_HUMAN',4837),(1521890,177634000,'Q07021','','C1QBP_HUMAN',4837),(1521891,177330000,'Q14624','','ITIH4_HUMAN',4837),(1521892,177035000,'P47914','','RL29_HUMAN',4837),(1521893,176633000,'P63173','','RL38_HUMAN',4837),(1521894,176144000,'Q8N264','','RHG24_HUMAN',4837),(1521895,175130000,'P29692','','EF1D_HUMAN',4837),(1521896,174290000,'P62249','','RS16_HUMAN',4837),(1521897,173767000,'P04792','','HSPB1_HUMAN',4837),(1521898,173578000,'P30086','','PEBP1_HUMAN',4837),(1521899,172280000,'Q92734','','TFG_HUMAN',4837),(1521900,170127000,'P11388','','TOP2A_HUMAN',4837),(1521901,169712000,'P05388','','RLA0_HUMAN',4837),(1521902,169511000,'P09382','','LEG1_HUMAN',4837),(1521903,169014000,'P14314','','GLU2B_HUMAN',4837),(1521904,168680000,'P08758','','ANXA5_HUMAN',4837),(1521905,168146000,'Q16719','','KYNU_HUMAN',4837),(1521906,167754000,'Q96Q15','','SMG1_HUMAN',4837),(1521907,164353000,'P62851','','RS25_HUMAN',4837),(1521908,164286000,'O95433','','AHSA1_HUMAN',4837),(1521909,164035000,'P00505','','AATM_HUMAN',4837),(1521910,162722000,'Q9H2H8','','PPIL3_HUMAN',4837),(1521911,162712000,'P18859','','ATP5J_HUMAN',4837),(1521912,162407000,'Q9ULX3','','NOB1_HUMAN',4837),(1521913,161899000,'Q9UQ84','','EXO1_HUMAN',4837),(1521914,160519000,'P08195','','4F2_HUMAN',4837),(1521915,160378000,'Q15366','','PCBP2_HUMAN',4837),(1521916,159518000,'Q96GC5','','RM48_HUMAN',4837),(1521917,159511000,'P62899','','RL31_HUMAN',4837),(1521918,158669000,'P52272','','HNRPM_HUMAN',4837),(1521919,158305000,'O75390','','CISY_HUMAN',4837),(1521920,158135000,'P34947','','GRK5_HUMAN',4837),(1521921,158031000,'P21796','','VDAC1_HUMAN',4837),(1521922,157938000,'Q14684','','RRP1B_HUMAN',4837),(1521923,157653000,'O15027','','SC16A_HUMAN',4837),(1521924,156396000,'Q15149','','PLEC_HUMAN',4837),(1521925,156285000,'P84103','','SRSF3_HUMAN',4837),(1521926,155833000,'P04080','','CYTB_HUMAN',4837),(1521927,155549000,'P62280','','RS11_HUMAN',4837),(1521928,154278000,'P50990','','TCPQ_HUMAN',4837),(1521929,153814000,'Q8TEX9','','IPO4_HUMAN',4837),(1521930,153468000,'P25789','','PSA4_HUMAN',4837),(1521931,153127000,'P35268','','RL22_HUMAN',4837),(1521932,152169000,'P17844','','DDX5_HUMAN',4837),(1521933,152116000,'Q92688','','AN32B_HUMAN',4837),(1521934,151957000,'Q15181','','IPYR_HUMAN',4837),(1521935,151947000,'Q969S3','','ZN622_HUMAN',4837),(1521936,151658000,'Q15365','','PCBP1_HUMAN',4837),(1521937,149839000,'P63220','','RS21_HUMAN',4837),(1521938,149645000,'P50454','','SERPH_HUMAN',4837),(1521939,148100000,'P39687','','AN32A_HUMAN',4837),(1521940,147652000,'Q15084','','PDIA6_HUMAN',4837),(1521941,146406000,'O43837','','IDH3B_HUMAN',4837),(1521942,145467000,'P24752','','THIL_HUMAN',4837),(1521943,145194000,'P08218','','CEL2B_HUMAN',4837),(1521944,144798000,'P63244','','RACK1_HUMAN',4837),(1521945,144569000,'P62910','','RL32_HUMAN',4837),(1521946,144221000,'P07602','','SAP_HUMAN',4837),(1521947,142347000,'O75822','','EIF3J_HUMAN',4837),(1521948,142303000,'Q9Y3U8','','RL36_HUMAN',4837),(1521949,142170000,'O60841','','IF2P_HUMAN',4837),(1521950,142001000,'Q9BXT5','','TEX15_HUMAN',4837),(1521951,141947000,'P78527','','PRKDC_HUMAN',4837),(1521952,141851000,'Q15349','','KS6A2_HUMAN',4837),(1521953,141829000,'Q00325','','MPCP_HUMAN',4837),(1521954,141489000,'P35579','','MYH9_HUMAN',4837),(1521955,140903000,'P62857','','RS28_HUMAN',4837),(1521956,140639000,'Q15233','','NONO_HUMAN',4837),(1521957,140548000,'P82979','','SARNP_HUMAN',4837),(1521958,139842000,'Q6DN14','','MCTP1_HUMAN',4837),(1521959,139838000,'P15328','','FOLR1_HUMAN',4837),(1521960,139573000,'P67936','','TPM4_HUMAN',4837),(1521961,139572000,'P30153','','2AAA_HUMAN',4837),(1521962,137726000,'P56192','','SYMC_HUMAN',4837),(1521963,137693000,'P08708','','RS17_HUMAN',4837),(1521964,137673000,'P52597','','HNRPF_HUMAN',4837),(1521965,137362000,'P07237','','PDIA1_HUMAN',4837),(1521966,137003000,'Q13137','','CACO2_HUMAN',4837),(1521967,136038000,'Q99797','','MIPEP_HUMAN',4837),(1521968,135889000,'O00533','','NCHL1_HUMAN',4837),(1521969,135441000,'Q00610','','CLH1_HUMAN',4837),(1521970,135193000,'P46779','','RL28_HUMAN',4837),(1521971,135095000,'P19827','','ITIH1_HUMAN',4837),(1521972,134807000,'CON_P06868','','PLMN_BOVIN',4837),(1521973,134449000,'P63165','','SUMO1_HUMAN',4837),(1521974,134323000,'O60488','','ACSL4_HUMAN',4837),(1521975,134129000,'P34897','','GLYM_HUMAN',4837),(1521976,134023000,'Q7L1Q6','','5MP2_HUMAN',4837),(1521977,133798000,'P55072','','TERA_HUMAN',4837),(1521978,131182000,'P62979','','RS27A_HUMAN',4837),(1521979,130827000,'P14854','','CX6B1_HUMAN',4837),(1521980,130244000,'P05455','','LA_HUMAN',4837),(1521981,130017000,'P27694','','RFA1_HUMAN',4837),(1521982,128960000,'P46778','','RL21_HUMAN',4837),(1521983,128879000,'Q13283','','G3BP1_HUMAN',4837),(1521984,128410000,'P25787','','PSA2_HUMAN',4837),(1521985,128220000,'O60506','','HNRPQ_HUMAN',4837),(1521986,127974000,'Q12906','','ILF3_HUMAN',4837),(1521987,127793000,'P05023','','AT1A1_HUMAN',4837),(1521988,127530000,'O43707','','ACTN4_HUMAN',4837),(1521989,127142000,'Q07955','','SRSF1_HUMAN',4837),(1521990,127099000,'P53396','','ACLY_HUMAN',4837),(1521991,127080000,'P50991','','TCPD_HUMAN',4837),(1521992,127006000,'O60664','','PLIN3_HUMAN',4837),(1521993,127002000,'P40939','','ECHA_HUMAN',4837),(1521994,126682000,'P49588','','SYAC_HUMAN',4837),(1521995,126391000,'CON_Q95121','','PEDF_BOVIN',4837),(1521996,126389000,'P46060','','RAGP1_HUMAN',4837),(1521997,126269000,'Q9BSM1','','PCGF1_HUMAN',4837),(1521998,126164000,'P25815','','S100P_HUMAN',4837),(1521999,125427000,'P62244','','RS15A_HUMAN',4837),(1522000,125306000,'P35232','','PHB1_HUMAN',4837),(1522001,124678000,'P30520','','PURA2_HUMAN',4837),(1522002,123884000,'P18077','','RL35A_HUMAN',4837),(1522003,123875000,'P23526','','SAHH_HUMAN',4837),(1522004,123821000,'Q8WXX5','','DNJC9_HUMAN',4837),(1522005,123302000,'P35716','','SOX11_HUMAN',4837),(1522006,123266000,'P09651','','ROA1_HUMAN',4837),(1522007,122277000,'Q9HBH5','','RDH14_HUMAN',4837),(1522008,122029000,'P08621','','RU17_HUMAN',4837),(1522009,121961000,'Q96K17','','BT3L4_HUMAN',4837),(1522010,121794000,'A8K2U0','','A2ML1_HUMAN',4837),(1522011,120829000,'Q99714','','HCD2_HUMAN',4837),(1522012,120391000,'Q8NEK5','','ZN548_HUMAN',4837),(1522013,119934000,'A6NM62','','LRC53_HUMAN',4837),(1522014,119637000,'Q96T76','','MMS19_HUMAN',4837),(1522015,119283000,'Q05996','','ZP2_HUMAN',4837),(1522016,119055000,'CON_P01030','','CO4_BOVIN',4837),(1522017,118601000,'Q58FF6','','H90B4_HUMAN',4837),(1522018,118337000,'P31943','','HNRH1_HUMAN',4837),(1522019,118143000,'P20929','','NEBU_HUMAN',4837),(1522020,117944000,'CON_Q29443','','TRFE_BOVIN',4837),(1522021,117832000,'CON_P00978','','AMBP_BOVIN',4837),(1522022,117741000,'Q9BUL8','','PDC10_HUMAN',4837),(1522023,117534000,'Q86XS8','','GOLI_HUMAN',4837),(1522024,117521000,'P62266','','RS23_HUMAN',4837),(1522025,116550000,'P30048','','PRDX3_HUMAN',4837),(1522026,116476000,'Q8IVI9','','NOSTN_HUMAN',4837),(1522027,116416000,'P12956','','XRCC6_HUMAN',4837),(1522028,115640000,'P27695','','APEX1_HUMAN',4837),(1522029,115577000,'CON_Q9TTE1','','SPA31_BOVIN',4837),(1522030,115553000,'P07954','','FUMH_HUMAN',4837),(1522031,115351000,'P14866','','HNRPL_HUMAN',4837),(1522032,115004000,'P53999','','TCP4_HUMAN',4837),(1522033,114625000,'CON_Q3SZ57','','FETA_BOVIN',4837),(1522034,114327000,'P28066','','PSA5_HUMAN',4837),(1522035,113571000,'P13987','','CD59_HUMAN',4837),(1522036,113167000,'P62888','','RL30_HUMAN',4837),(1522037,112612000,'Q9H6Z4','','RANB3_HUMAN',4837),(1522038,112191000,'P24539','','AT5F1_HUMAN',4837),(1522039,112121000,'O14980','','XPO1_HUMAN',4837),(1522040,112110000,'P31947','','1433S_HUMAN',4837),(1522041,111839000,'O60888','','CUTA_HUMAN',4837),(1522042,111749000,'P07384','','CAN1_HUMAN',4837),(1522043,111667000,'Q14697','','GANAB_HUMAN',4837),(1522044,110645000,'P22234','','PUR6_HUMAN',4837),(1522045,110391000,'P05198','','IF2A_HUMAN',4837),(1522046,110216000,'O75643','','U520_HUMAN',4837),(1522047,109958000,'Q9Y3D3','','RT16_HUMAN',4837),(1522048,109573000,'Q5MIZ7','','P4R3B_HUMAN',4837),(1522049,109493000,'Q8NFA2','','NOXO1_HUMAN',4837),(1522050,108789000,'Q14254','','FLOT2_HUMAN',4837),(1522051,108283000,'O14818','','PSA7_HUMAN',4837),(1522052,107422000,'P33992','','MCM5_HUMAN',4837),(1522053,107193000,'Q9Y6Q9','','NCOA3_HUMAN',4837),(1522054,105966000,'Q9NZ45','','CISD1_HUMAN',4837),(1522055,105855000,'P40429','','RL13A_HUMAN',4837),(1522056,105237000,'P29320','','EPHA3_HUMAN',4837),(1522057,104268000,'Q12904','','AIMP1_HUMAN',4837),(1522058,103761000,'Q86TM6','','SYVN1_HUMAN',4837),(1522059,103639000,'P60660','','MYL6_HUMAN',4837),(1522060,103223000,'Q99832','','TCPH_HUMAN',4837),(1522061,103084000,'P46783','','RS10_HUMAN',4837),(1522062,102974000,'P61956','','SUMO2_HUMAN',4837),(1522063,101600000,'Q9HCU0','','CD248_HUMAN',4837),(1522064,101579000,'Q16629','','SRSF7_HUMAN',4837),(1522065,100939000,'Q9Y266','','NUDC_HUMAN',4837),(1522066,100690000,'P40227','','TCPZ_HUMAN',4837),(1522067,100641000,'P35637','','FUS_HUMAN',4837),(1522068,100230000,'P39880','','CUX1_HUMAN',4837),(1522069,100177000,'P55265','','DSRAD_HUMAN',4837),(1522070,100129000,'O43390','','HNRPR_HUMAN',4837),(1522071,100039000,'P34932','','HSP74_HUMAN',4837),(1522072,99827300,'P17931','','LEG3_HUMAN',4837),(1522073,99618800,'P78371','','TCPB_HUMAN',4837),(1522074,99607200,'Q9UMS4','','PRP19_HUMAN',4837),(1522075,99360100,'P13804','','ETFA_HUMAN',4837),(1522076,99284800,'P11586','','C1TC_HUMAN',4837),(1522077,99245900,'P10155','','RO60_HUMAN',4837),(1522078,98942400,'P17096','','HMGA1_HUMAN',4837),(1522079,98787000,'Q9Y4F5','','C170B_HUMAN',4837),(1522080,98606200,'P13073','','COX41_HUMAN',4837),(1522081,98549800,'CON_P00735','','THRB_BOVIN',4837),(1522082,98365400,'P38117','','ETFB_HUMAN',4837),(1522083,98264200,'O75935','','DCTN3_HUMAN',4837),(1522084,98066500,'P78417','','GSTO1_HUMAN',4837),(1522085,98048600,'Q9Y2B0','','CNPY2_HUMAN',4837),(1522086,98023800,'P16401','','H15_HUMAN',4837),(1522087,97876000,'P26639','','SYTC_HUMAN',4837),(1522088,97652500,'P43243','','MATR3_HUMAN',4837),(1522089,97623500,'P30043','','BLVRB_HUMAN',4837),(1522090,97580100,'Q9NPQ8','','RIC8A_HUMAN',4837),(1522091,97412600,'P16949','','STMN1_HUMAN',4837),(1522092,96886800,'P55786','','PSA_HUMAN',4837),(1522093,96268800,'Q99536','','VAT1_HUMAN',4837),(1522094,96034900,'Q14103','','HNRPD_HUMAN',4837),(1522095,95923400,'P60953','','CDC42_HUMAN',4837),(1522096,95506400,'P20290','','BTF3_HUMAN',4837),(1522097,95427300,'P47813','','IF1AX_HUMAN',4837),(1522098,95326500,'P43307','','SSRA_HUMAN',4837),(1522099,95257000,'O60241','','AGRB2_HUMAN',4837),(1522100,94535800,'Q13263','','TIF1B_HUMAN',4837),(1522101,94397300,'Q6ZU35','','CRACD_HUMAN',4837),(1522102,94332900,'Q16394','','EXT1_HUMAN',4837),(1522103,94239300,'Q96AE4','','FUBP1_HUMAN',4837),(1522104,94086900,'Q5TEC6','','H37_HUMAN',4837),(1522105,94023900,'P41091','','IF2G_HUMAN',4837),(1522106,93408000,'CON_Q9TT36','','THBG_BOVIN',4837),(1522107,93206300,'P38159','','RBMX_HUMAN',4837),(1522108,92711200,'P35241','','RADI_HUMAN',4837),(1522109,92217500,'P07108','','ACBP_HUMAN',4837),(1522110,92173100,'Q99623','','PHB2_HUMAN',4837),(1522111,92108300,'Q9UNL2','','SSRG_HUMAN',4837),(1522112,91942100,'Q14974','','IMB1_HUMAN',4837),(1522113,91866600,'P11387','','TOP1_HUMAN',4837),(1522114,91794400,'Q96FQ6','','S10AG_HUMAN',4837),(1522115,91591200,'P42126','','ECI1_HUMAN',4837),(1522116,91463900,'P43487','','RANG_HUMAN',4837),(1522117,91375200,'P41250','','GARS_HUMAN',4837),(1522118,91181000,'P31939','','PUR9_HUMAN',4837),(1522119,90944600,'Q8NCN4','','RN169_HUMAN',4837),(1522120,90717500,'P32969','','RL9_HUMAN',4837),(1522121,90602100,'O76021','','RL1D1_HUMAN',4837),(1522122,90204200,'Q9C0B7','','TNG6_HUMAN',4837),(1522123,90055400,'O75531','','BAF_HUMAN',4837),(1522124,89962600,'P11940','','PABP1_HUMAN',4837),(1522125,89913600,'P60900','','PSA6_HUMAN',4837),(1522126,89692200,'P52788','','SPSY_HUMAN',4837),(1522127,89431600,'Q8TCT9','','HM13_HUMAN',4837),(1522128,89323100,'P51991','','ROA3_HUMAN',4837),(1522129,88418700,'O75152','','ZC11A_HUMAN',4837),(1522130,88327600,'P62277','','RS13_HUMAN',4837),(1522131,88161300,'O14979','','HNRDL_HUMAN',4837),(1522132,88091400,'O75367','','H2AY_HUMAN',4837),(1522133,87991000,'P25788','','PSA3_HUMAN',4837),(1522134,87969800,'Q5VZE5','','NAA35_HUMAN',4837),(1522135,87480500,'P49773','','HINT1_HUMAN',4837),(1522136,87423900,'P62081','','RS7_HUMAN',4837),(1522137,87230700,'Q8NBS9','','TXND5_HUMAN',4837),(1522138,87173400,'P20674','','COX5A_HUMAN',4837),(1522139,87141300,'Q12905','','ILF2_HUMAN',4837),(1522140,87105400,'Q7Z6Z7','','HUWE1_HUMAN',4837),(1522141,86829200,'P37837','','TALDO_HUMAN',4837),(1522142,86828600,'P30040','','ERP29_HUMAN',4837),(1522143,86670100,'P52565','','GDIR1_HUMAN',4837),(1522144,86461500,'P31153','','METK2_HUMAN',4837),(1522145,86323400,'P57737','','CORO7_HUMAN',4837),(1522146,85832400,'P49619','','DGKG_HUMAN',4837),(1522147,85782200,'P08559','','ODPA_HUMAN',4837),(1522148,85446300,'P06753','','TPM3_HUMAN',4837),(1522149,85420500,'P48643','','TCPE_HUMAN',4837),(1522150,85395200,'P17987','','TCPA_HUMAN',4837),(1522151,85359300,'P54578','','UBP14_HUMAN',4837),(1522152,85320800,'P00403','','COX2_HUMAN',4837),(1522153,85298000,'Q9UBT2','','SAE2_HUMAN',4837),(1522154,84965800,'P52209','','6PGD_HUMAN',4837),(1522155,84869500,'P50395','','GDIB_HUMAN',4837),(1522156,84701900,'P41252','','SYIC_HUMAN',4837),(1522157,84397500,'Q9NQC3','','RTN4_HUMAN',4837),(1522158,84327700,'Q70UQ0','','IKIP_HUMAN',4837),(1522159,83987700,'P13667','','PDIA4_HUMAN',4837),(1522160,83975100,'P15531','','NDKA_HUMAN',4837),(1522161,83906500,'Q9H9A6','','LRC40_HUMAN',4837),(1522162,83870100,'P06396','','GELS_HUMAN',4837),(1522163,83765500,'P15311','','EZRI_HUMAN',4837),(1522164,83038200,'P49748','','ACADV_HUMAN',4837),(1522165,82553500,'P13693','','TCTP_HUMAN',4837),(1522166,82417400,'P05141','','ADT2_HUMAN',4837),(1522167,82202900,'P13797','','PLST_HUMAN',4837),(1522168,81814700,'P42704','','LPPRC_HUMAN',4837),(1522169,81630400,'P12429','','ANXA3_HUMAN',4837),(1522170,81624400,'Q92522','','H1X_HUMAN',4837),(1522171,81116900,'Q2NL82','','TSR1_HUMAN',4837),(1522172,80703600,'P17655','','CAN2_HUMAN',4837),(1522173,80184300,'P15121','','ALDR_HUMAN',4837),(1522174,80094700,'Q8WWI1','','LMO7_HUMAN',4837),(1522175,79947200,'P07357','','CO8A_HUMAN',4837),(1522176,79741100,'P09874','','PARP1_HUMAN',4837),(1522177,79315100,'P10620','','MGST1_HUMAN',4837),(1522178,79174800,'Q16658','','FSCN1_HUMAN',4837),(1522179,79044300,'P68036','','UB2L3_HUMAN',4837),(1522180,78202900,'Q14152','','EIF3A_HUMAN',4837),(1522181,78124000,'P33991','','MCM4_HUMAN',4837),(1522182,77777100,'P10606','','COX5B_HUMAN',4837),(1522183,77765800,'P04843','','RPN1_HUMAN',4837),(1522184,77513400,'P21281','','VATB2_HUMAN',4837),(1522185,77183300,'P09960','','LKHA4_HUMAN',4837),(1522186,77058600,'O14929','','HAT1_HUMAN',4837),(1522187,76920800,'P12107','','COBA1_HUMAN',4837),(1522188,76603900,'P31689','','DNJA1_HUMAN',4837),(1522189,76533100,'P20042','','IF2B_HUMAN',4837),(1522190,76454300,'O00410','','IPO5_HUMAN',4837),(1522191,74869100,'Q99584','','S10AD_HUMAN',4837),(1522192,74787500,'P26583','','HMGB2_HUMAN',4837),(1522193,74709900,'P52815','','RM12_HUMAN',4837),(1522194,74352400,'P00491','','PNPH_HUMAN',4837),(1522195,74281900,'P84090','','ERH_HUMAN',4837),(1522196,74274700,'Q9P0L0','','VAPA_HUMAN',4837),(1522197,74095200,'Q8N2C7','','UNC80_HUMAN',4837),(1522198,74015900,'P22307','','SCP2_HUMAN',4837),(1522199,73911500,'Q15046','','SYK_HUMAN',4837),(1522200,73759100,'O95297','','MPZL1_HUMAN',4837),(1522201,73586800,'Q7L0X0','','TRIL_HUMAN',4837),(1522202,73569100,'P40121','','CAPG_HUMAN',4837),(1522203,73088300,'Q9Y277','','VDAC3_HUMAN',4837),(1522204,73025800,'Q9Y3A5','','SBDS_HUMAN',4837),(1522205,72921000,'Q13111','','CAF1A_HUMAN',4837),(1522206,72789400,'Q9H1A4','','APC1_HUMAN',4837),(1522207,72381000,'P56537','','IF6_HUMAN',4837),(1522208,72258400,'P26368','','U2AF2_HUMAN',4837),(1522209,72159400,'P22695','','QCR2_HUMAN',4837),(1522210,72007000,'P55084','','ECHB_HUMAN',4837),(1522211,71874800,'Q06033','','ITIH3_HUMAN',4837),(1522212,71737200,'O75964','','ATP5L_HUMAN',4837),(1522213,71690600,'P28074','','PSB5_HUMAN',4837),(1522214,71637000,'Q14444','','CAPR1_HUMAN',4837),(1522215,71006300,'Q92499','','DDX1_HUMAN',4837),(1522216,70785400,'P37108','','SRP14_HUMAN',4837),(1522217,70643200,'P53985','','MOT1_HUMAN',4837),(1522218,70450700,'P39748','','FEN1_HUMAN',4837),(1522219,70314300,'Q14978','','NOLC1_HUMAN',4837),(1522220,70167500,'P61769','','B2MG_HUMAN',4837),(1522221,70083300,'Q9NV31','','IMP3_HUMAN',4837),(1522222,69801600,'Q07666','','KHDR1_HUMAN',4837),(1522223,69785200,'P52594','','AGFG1_HUMAN',4837),(1522224,69126800,'P22102','','PUR2_HUMAN',4837),(1522225,69022600,'P20618','','PSB1_HUMAN',4837),(1522226,68855000,'Q9H223','','EHD4_HUMAN',4837),(1522227,68472000,'P62318','','SMD3_HUMAN',4837),(1522228,68389500,'Q12931','','TRAP1_HUMAN',4837),(1522229,68237400,'Q9NR30','','DDX21_HUMAN',4837),(1522230,67800100,'Q06323','','PSME1_HUMAN',4837),(1522231,67702000,'P78406','','RAE1L_HUMAN',4837),(1522232,67518200,'Q9UNM6','','PSD13_HUMAN',4837),(1522233,67471600,'Q99733','','NP1L4_HUMAN',4837),(1522234,67426200,'Q9UKM9','','RALY_HUMAN',4837),(1522235,67230100,'P42765','','THIM_HUMAN',4837),(1522236,66978500,'P05546','','HEP2_HUMAN',4837),(1522237,66698300,'P49915','','GUAA_HUMAN',4837),(1522238,66614200,'Q9NZ01','','TECR_HUMAN',4837),(1522239,66580900,'P08133','','ANXA6_HUMAN',4837),(1522240,66526200,'Q14019','','COTL1_HUMAN',4837),(1522241,66500400,'O00567','','NOP56_HUMAN',4837),(1522242,66445500,'P23588','','IF4B_HUMAN',4837),(1522243,66433300,'P28072','','PSB6_HUMAN',4837),(1522244,66414600,'Q08257','','QOR_HUMAN',4837),(1522245,66326200,'P49327','','FAS_HUMAN',4837),(1522246,66278300,'Q9BTD3','','TM121_HUMAN',4837),(1522247,66241900,'P09669','','COX6C_HUMAN',4837),(1522248,66140100,'P54819','','KAD2_HUMAN',4837),(1522249,66080900,'O15067','','PUR4_HUMAN',4837),(1522250,66071100,'Q15293','','RCN1_HUMAN',4837),(1522251,66047000,'P23921','','RIR1_HUMAN',4837),(1522252,66038200,'Q9NRD0','','FBX8_HUMAN',4837),(1522253,65841800,'P30049','','ATPD_HUMAN',4837),(1522254,65783800,'O43684','','BUB3_HUMAN',4837),(1522255,65770000,'Q13315','','ATM_HUMAN',4837),(1522256,65147100,'P82970','','HMGN5_HUMAN',4837),(1522257,65086800,'Q96KR7','','PHAR3_HUMAN',4837),(1522258,65027100,'O00571','','DDX3X_HUMAN',4837),(1522259,64667900,'Q7L014','','DDX46_HUMAN',4837),(1522260,64612000,'P30405','','PPIF_HUMAN',4837),(1522261,64546600,'P11177','','ODPB_HUMAN',4837),(1522262,64439400,'Q9UII2','','ATIF1_HUMAN',4837),(1522263,64424200,'P11279','','LAMP1_HUMAN',4837),(1522264,64362000,'P05114','','HMGN1_HUMAN',4837),(1522265,64318400,'Q96S06','','LMF1_HUMAN',4837),(1522266,64222900,'P30084','','ECHM_HUMAN',4837),(1522267,64136300,'P24043','','LAMA2_HUMAN',4837),(1522268,63581200,'P13929','','ENOB_HUMAN',4837),(1522269,63460500,'P15170','','ERF3A_HUMAN',4837),(1522270,63091400,'P07814','','SYEP_HUMAN',4837),(1522271,62872700,'P17174','','AATC_HUMAN',4837),(1522272,62851400,'Q15393','','SF3B3_HUMAN',4837),(1522273,62741100,'P48047','','ATPO_HUMAN',4837),(1522274,62679400,'Q9H3K6','','BOLA2_HUMAN',4837),(1522275,62357900,'Q9BTE3','','MCMBP_HUMAN',4837),(1522276,62350400,'P26440','','IVD_HUMAN',4837),(1522277,62111500,'P01023','','A2MG_HUMAN',4837),(1522278,62022300,'Q01650','','LAT1_HUMAN',4837),(1522279,61815800,'P20810','','ICAL_HUMAN',4837),(1522280,61511400,'P98161','','PKD1_HUMAN',4837),(1522281,61480200,'Q5T5S1','','CC183_HUMAN',4837),(1522282,61374600,'P14324','','FPPS_HUMAN',4837),(1522283,61323900,'P49721','','PSB2_HUMAN',4837),(1522284,61267900,'Q13185','','CBX3_HUMAN',4837),(1522285,61231800,'O00592','','PODXL_HUMAN',4837),(1522286,61193500,'Q16576','','RBBP7_HUMAN',4837),(1522287,61114700,'O75947','','ATP5H_HUMAN',4837),(1522288,61109300,'O75821','','EIF3G_HUMAN',4837),(1522289,61084600,'Q13177','','PAK2_HUMAN',4837),(1522290,60873400,'Q92841','','DDX17_HUMAN',4837),(1522291,60872600,'Q08380','','LG3BP_HUMAN',4837),(1522292,60745700,'O96008','','TOM40_HUMAN',4837),(1522293,60689900,'P63167','','DYL1_HUMAN',4837),(1522294,60307800,'Q01082','','SPTB2_HUMAN',4837),(1522295,60073500,'P22087','','FBRL_HUMAN',4837),(1522296,60054500,'Q92945','','FUBP2_HUMAN',4837),(1522297,60041200,'Q02790','','FKBP4_HUMAN',4837),(1522298,59764500,'Q32P28','','P3H1_HUMAN',4837),(1522299,59617300,'Q02809','','PLOD1_HUMAN',4837),(1522300,59197800,'Q00796','','DHSO_HUMAN',4837),(1522301,59175800,'P31942','','HNRH3_HUMAN',4837),(1522302,59141200,'Q70Z35','','PREX2_HUMAN',4837),(1522303,58925500,'P51572','','BAP31_HUMAN',4837),(1522304,58724100,'Q9P258','','RCC2_HUMAN',4837),(1522305,58465200,'P27708','','PYR1_HUMAN',4837),(1522306,58448800,'Q8NCW5','','NNRE_HUMAN',4837),(1522307,58341800,'Q14980','','NUMA1_HUMAN',4837),(1522308,58231100,'CON_P28800','','A2AP_BOVIN',4837),(1522309,58126200,'Q8IUH3','','RBM45_HUMAN',4837),(1522310,58044700,'P62847','','RS24_HUMAN',4837),(1522311,57917000,'Q9UL41','','PNMA3_HUMAN',4837),(1522312,57911500,'P17812','','PYRG1_HUMAN',4837),(1522313,57845100,'Q96AG4','','LRC59_HUMAN',4837),(1522314,57815900,'Q13813','','SPTN1_HUMAN',4837),(1522315,57706800,'P54577','','SYYC_HUMAN',4837),(1522316,57676600,'Q9UQQ2','','SH2B3_HUMAN',4837),(1522317,57649600,'P55769','','NH2L1_HUMAN',4837),(1522318,57566400,'Q96CW1','','AP2M1_HUMAN',4837),(1522319,57303300,'P02795','','MT2_HUMAN',4837),(1522320,57244400,'Q16891','','MIC60_HUMAN',4837),(1522321,57107900,'P07996','','TSP1_HUMAN',4837),(1522322,56881600,'Q13464','','ROCK1_HUMAN',4837),(1522323,56709200,'P42330','','AK1C3_HUMAN',4837),(1522324,56694800,'P16070','','CD44_HUMAN',4837),(1522325,56682300,'Q9Y265','','RUVB1_HUMAN',4837),(1522326,56662200,'Q15717','','ELAV1_HUMAN',4837),(1522327,56549600,'O60701','','UGDH_HUMAN',4837),(1522328,56509600,'Q9H098','','F107B_HUMAN',4837),(1522329,56494600,'P11413','','G6PD_HUMAN',4837),(1522330,56369600,'P49321','','NASP_HUMAN',4837),(1522331,56310300,'Q08J23','','NSUN2_HUMAN',4837),(1522332,56221800,'Q9BXT4','','TDRD1_HUMAN',4837),(1522333,56035600,'Q04760','','LGUL_HUMAN',4837),(1522334,55948000,'P62633','','CNBP_HUMAN',4837),(1522335,55884100,'Q9HC38','','GLOD4_HUMAN',4837),(1522336,55752900,'Q13423','','NNTM_HUMAN',4837),(1522337,55707500,'P18206','','VINC_HUMAN',4837),(1522338,55648200,'Q15056','','IF4H_HUMAN',4837),(1522339,55644100,'A2RUS2','','DEND3_HUMAN',4837),(1522340,55643100,'P61254','','RL26_HUMAN',4837),(1522341,55579100,'O95373','','IPO7_HUMAN',4837),(1522342,55441500,'Q9Y2T3','','GUAD_HUMAN',4837),(1522343,55235900,'Q86VM9','','ZCH18_HUMAN',4837),(1522344,55135400,'O43776','','SYNC_HUMAN',4837),(1522345,55126100,'P33993','','MCM7_HUMAN',4837),(1522346,54900800,'P35237','','SPB6_HUMAN',4837),(1522347,54754900,'Q9BQE3','','TBA1C_HUMAN',4837),(1522348,54680000,'P62306','','RUXF_HUMAN',4837),(1522349,54621700,'Q09028','','RBBP4_HUMAN',4837),(1522350,54607500,'Q16881','','TRXR1_HUMAN',4837),(1522351,54568200,'Q53F19','','NCBP3_HUMAN',4837),(1522352,54565300,'Q8NBF2','','NHLC2_HUMAN',4837),(1522353,54483200,'P62314','','SMD1_HUMAN',4837),(1522354,54476200,'A8MYA2','','CX049_HUMAN',4837),(1522355,54397600,'Q02153','','GCYB1_HUMAN',4837),(1522356,54348000,'Q9H8M2','','BRD9_HUMAN',4837),(1522357,54091300,'P04632','','CPNS1_HUMAN',4837),(1522358,54033800,'P60981','','DEST_HUMAN',4837),(1522359,54005500,'O43852','','CALU_HUMAN',4837),(1522360,53930200,'Q5HY64','','FA47C_HUMAN',4837),(1522361,53670600,'Q9Y230','','RUVB2_HUMAN',4837),(1522362,53397500,'P49257','','LMAN1_HUMAN',4837),(1522363,53113900,'Q00688','','FKBP3_HUMAN',4837),(1522364,52997600,'Q9Y2W1','','TR150_HUMAN',4837),(1522365,52676500,'Q9UPU5','','UBP24_HUMAN',4837),(1522366,52605700,'P36871','','PGM1_HUMAN',4837),(1522367,52538500,'Q9BRA2','','TXD17_HUMAN',4837),(1522368,52447800,'Q14204','','DYHC1_HUMAN',4837),(1522369,52417900,'Q96KR1','','ZFR_HUMAN',4837),(1522370,52029400,'P17275','','JUNB_HUMAN',4837),(1522371,51993200,'P63279','','UBC9_HUMAN',4837),(1522372,51835300,'CON_E1BF81','','CBG_BOVIN',4837),(1522373,51749300,'O43670','','ZN207_HUMAN',4837),(1522374,51734100,'O75396','','SC22B_HUMAN',4837),(1522375,51604100,'Q9UM54','','MYO6_HUMAN',4837),(1522376,51510300,'Q9BY42','','RTF2_HUMAN',4837),(1522377,51365300,'Q05469','','LIPS_HUMAN',4837),(1522378,51256700,'P09234','','RU1C_HUMAN',4837),(1522379,50961300,'Q9BQ61','','TRIR_HUMAN',4837),(1522380,50912700,'P47897','','SYQ_HUMAN',4837),(1522381,50860500,'Q9BXA5','','SUCR1_HUMAN',4837),(1522382,50794600,'Q9NQR4','','NIT2_HUMAN',4837),(1522383,50758400,'P52907','','CAZA1_HUMAN',4837),(1522384,50719500,'Q6NUK1','','SCMC1_HUMAN',4837),(1522385,50506400,'P63000','','RAC1_HUMAN',4837),(1522386,50361300,'Q9UKK3','','PARP4_HUMAN',4837),(1522387,50273500,'O00115','','DNS2A_HUMAN',4837),(1522388,50227700,'P09012','','SNRPA_HUMAN',4837),(1522389,50158000,'Q13838','','DX39B_HUMAN',4837),(1522390,49933800,'Q15691','','MARE1_HUMAN',4837),(1522391,49921400,'P62333','','PRS10_HUMAN',4837),(1522392,49870000,'P16152','','CBR1_HUMAN',4837),(1522393,49810700,'O15347','','HMGB3_HUMAN',4837),(1522394,49802500,'P49189','','AL9A1_HUMAN',4837),(1522395,49796400,'Q13162','','PRDX4_HUMAN',4837),(1522396,49494600,'P36542','','ATPG_HUMAN',4837),(1522397,49316300,'Q9P2R7','','SUCB1_HUMAN',4837),(1522398,49301400,'P06737','','PYGL_HUMAN',4837),(1522399,49233100,'P55010','','IF5_HUMAN',4837),(1522400,49164700,'O94874','','UFL1_HUMAN',4837),(1522401,49058700,'P83881','','RL36A_HUMAN',4837),(1522402,49055400,'Q96P70','','IPO9_HUMAN',4837),(1522403,48851500,'P12268','','IMDH2_HUMAN',4837),(1522404,48593500,'P62273','','RS29_HUMAN',4837),(1522405,48496900,'P09622','','DLDH_HUMAN',4837),(1522406,48453300,'P04198','','MYCN_HUMAN',4837),(1522407,48421800,'Q9NRS4','','TMPS4_HUMAN',4837),(1522408,48303400,'O43143','','DHX15_HUMAN',4837),(1522409,48054500,'Q9Y617','','SERC_HUMAN',4837),(1522410,47912900,'Q07889','','SOS1_HUMAN',4837),(1522411,47842400,'P05556','','ITB1_HUMAN',4837),(1522412,47804200,'Q6UXK5','','LRRN1_HUMAN',4837),(1522413,47712500,'Q9H0C8','','ILKAP_HUMAN',4837),(1522414,47674000,'P42677','','RS27_HUMAN',4837),(1522415,47669800,'P49755','','TMEDA_HUMAN',4837),(1522416,47545000,'Q14839','','CHD4_HUMAN',4837),(1522417,47477000,'P08243','','ASNS_HUMAN',4837),(1522418,47386200,'Q04837','','SSBP_HUMAN',4837),(1522419,47202100,'Q14116','','IL18_HUMAN',4837),(1522420,47116800,'Q14247','','SRC8_HUMAN',4837),(1522421,47079300,'Q14498','','RBM39_HUMAN',4837),(1522422,47061500,'P35659','','DEK_HUMAN',4837),(1522423,47051200,'P49458','','SRP09_HUMAN',4837),(1522424,46713600,'O14579','','COPE_HUMAN',4837),(1522425,46620300,'Q16842','','SIA4B_HUMAN',4837),(1522426,46543800,'Q08209','','PP2BA_HUMAN',4837),(1522427,46531100,'Q9UK45','','LSM7_HUMAN',4837),(1522428,46364400,'P18754','','RCC1_HUMAN',4837),(1522429,46331800,'P07305','','H10_HUMAN',4837),(1522430,46239300,'P35249','','RFC4_HUMAN',4837),(1522431,46167900,'P78312','','F193A_HUMAN',4837),(1522432,46133200,'Q9Y696','','CLIC4_HUMAN',4837),(1522433,45965800,'Q969Z0','','FAKD4_HUMAN',4837),(1522434,45622000,'Q8NI22','','MCFD2_HUMAN',4837),(1522435,45590500,'P47756','','CAPZB_HUMAN',4837),(1522436,45569100,'Q9Y678','','COPG1_HUMAN',4837),(1522437,45483200,'P61019','','RAB2A_HUMAN',4837),(1522438,45431800,'Q14847','','LASP1_HUMAN',4837),(1522439,45301400,'Q9BXL7','','CAR11_HUMAN',4837),(1522440,45240500,'Q16401','','PSMD5_HUMAN',4837),(1522441,45235200,'P55263','','ADK_HUMAN',4837),(1522442,45212900,'Q04637','','IF4G1_HUMAN',4837),(1522443,45130500,'O76003','','GLRX3_HUMAN',4837),(1522444,45074700,'Q9NVI7','','ATD3A_HUMAN',4837),(1522445,44878600,'Q9BW27','','NUP85_HUMAN',4837),(1522446,44814200,'Q14683','','SMC1A_HUMAN',4837),(1522447,44748000,'P43304','','GPDM_HUMAN',4837),(1522448,44745000,'Q01518','','CAP1_HUMAN',4837),(1522449,44646200,'O43399','','TPD54_HUMAN',4837),(1522450,44596300,'O60476','','MA1A2_HUMAN',4837),(1522451,44578800,'P00492','','HPRT_HUMAN',4837),(1522452,44540200,'P03886','','NU1M_HUMAN',4837),(1522453,44527500,'P09972','','ALDOC_HUMAN',4837),(1522454,44520400,'Q9NQ38','','ISK5_HUMAN',4837),(1522455,44432300,'Q9NPJ3','','ACO13_HUMAN',4837),(1522456,44396000,'O95336','','6PGL_HUMAN',4837),(1522457,44361900,'Q15785','','TOM34_HUMAN',4837),(1522458,44164200,'P12109','','CO6A1_HUMAN',4837),(1522459,44016000,'Q9UKL0','','RCOR1_HUMAN',4837),(1522460,43980800,'O15144','','ARPC2_HUMAN',4837),(1522461,43960200,'P04179','','SODM_HUMAN',4837),(1522462,43837200,'Q12907','','LMAN2_HUMAN',4837),(1522463,43800900,'Q01081','','U2AF1_HUMAN',4837),(1522464,43625600,'P56211','','ARP19_HUMAN',4837),(1522465,43602200,'Q8TDN6','','BRX1_HUMAN',4837),(1522466,43600900,'Q9Y3F4','','STRAP_HUMAN',4837),(1522467,43596500,'Q9Y490','','TLN1_HUMAN',4837),(1522468,43578700,'Q01130','','SRSF2_HUMAN',4837),(1522469,43503900,'Q15363','','TMED2_HUMAN',4837),(1522470,43469900,'Q13347','','EIF3I_HUMAN',4837),(1522471,43428300,'Q9UQE7','','SMC3_HUMAN',4837),(1522472,43288200,'E9PRG8','','CK098_HUMAN',4837),(1522473,43263500,'Q9H910','','JUPI2_HUMAN',4837),(1522474,43249600,'Q9BY44','','EIF2A_HUMAN',4837),(1522475,43208500,'Q15029','','U5S1_HUMAN',4837),(1522476,42857600,'Q6GYQ0','','RGPA1_HUMAN',4837),(1522477,42744500,'Q16531','','DDB1_HUMAN',4837),(1522478,42669100,'Q93096','','TP4A1_HUMAN',4837),(1522479,42609200,'P18085','','ARF4_HUMAN',4837),(1522480,42562800,'P51610','','HCFC1_HUMAN',4837),(1522481,42545700,'O75347','','TBCA_HUMAN',4837),(1522482,42542900,'P30740','','ILEU_HUMAN',4837),(1522483,42206100,'O43396','','TXNL1_HUMAN',4837),(1522484,42170900,'P61970','','NTF2_HUMAN',4837),(1522485,42003600,'Q8IWZ6','','BBS7_HUMAN',4837),(1522486,41785600,'O75582','','KS6A5_HUMAN',4837),(1522487,41748400,'P48634','','PRC2A_HUMAN',4837),(1522488,41690100,'Q13428','','TCOF_HUMAN',4837),(1522489,41470800,'P62495','','ERF1_HUMAN',4837),(1522490,41450400,'P45973','','CBX5_HUMAN',4837),(1522491,41383800,'P19022','','CADH2_HUMAN',4837),(1522492,41338600,'Q15843','','NEDD8_HUMAN',4837),(1522493,41319800,'P25685','','DNJB1_HUMAN',4837),(1522494,41295700,'P12270','','TPR_HUMAN',4837),(1522495,41176000,'Q7L2J0','','MEPCE_HUMAN',4837),(1522496,41154000,'P0C264','','SBK3_HUMAN',4837),(1522497,41130100,'P07741','','APT_HUMAN',4837),(1522498,41054200,'P21291','','CSRP1_HUMAN',4837),(1522499,41042400,'Q15583','','TGIF1_HUMAN',4837),(1522500,40892400,'P54727','','RD23B_HUMAN',4837),(1522501,40867400,'P55884','','EIF3B_HUMAN',4837),(1522502,40825000,'P40261','','NNMT_HUMAN',4837),(1522503,40821500,'Q99729','','ROAA_HUMAN',4837),(1522504,40696000,'P13473','','LAMP2_HUMAN',4837),(1522505,40683600,'Q13151','','ROA0_HUMAN',4837),(1522506,40622300,'Q1KMD3','','HNRL2_HUMAN',4837),(1522507,40582900,'P58546','','MTPN_HUMAN',4837),(1522508,40451200,'Q8N488','','RYBP_HUMAN',4837),(1522509,40394800,'Q9UHX1','','PUF60_HUMAN',4837),(1522510,40199100,'Q86VP6','','CAND1_HUMAN',4837),(1522511,40093400,'P21980','','TGM2_HUMAN',4837),(1522512,39987000,'P09429','','HMGB1_HUMAN',4837),(1522513,39983100,'P19388','','RPAB1_HUMAN',4837),(1522514,39827700,'Q08945','','SSRP1_HUMAN',4837),(1522515,39745000,'Q9HD42','','CHM1A_HUMAN',4837),(1522516,39559700,'Q9H4A4','','AMPB_HUMAN',4837),(1522517,39497500,'P12814','','ACTN1_HUMAN',4837),(1522518,39261400,'Q9UL46','','PSME2_HUMAN',4837),(1522519,39156000,'Q9UHD1','','CHRD1_HUMAN',4837),(1522520,39091000,'P54886','','P5CS_HUMAN',4837),(1522521,39039400,'Q13451','','FKBP5_HUMAN',4837),(1522522,39038000,'O75083','','WDR1_HUMAN',4837),(1522523,39013300,'Q9GZT3','','SLIRP_HUMAN',4837),(1522524,38934500,'Q04656','','ATP7A_HUMAN',4837),(1522525,38879100,'Q8NBJ5','','GT251_HUMAN',4837),(1522526,38771700,'O60551','','NMT2_HUMAN',4837),(1522527,38678900,'P62191','','PRS4_HUMAN',4837),(1522528,38659700,'P61106','','RAB14_HUMAN',4837),(1522529,38635700,'P16615','','AT2A2_HUMAN',4837),(1522530,38625100,'O00116','','ADAS_HUMAN',4837),(1522531,38608600,'O60884','','DNJA2_HUMAN',4837),(1522532,38603200,'Q13683','','ITA7_HUMAN',4837),(1522533,38565200,'Q8NB50','','ZFP62_HUMAN',4837),(1522534,38417800,'P01033','','TIMP1_HUMAN',4837),(1522535,38291200,'Q9NR31','','SAR1A_HUMAN',4837),(1522536,38283500,'Q6YN16','','HSDL2_HUMAN',4837),(1522537,38270800,'Q8NE71','','ABCF1_HUMAN',4837),(1522538,38210700,'O75223','','GGCT_HUMAN',4837),(1522539,38008800,'Q9NX63','','MIC19_HUMAN',4837),(1522540,37999700,'Q96I24','','FUBP3_HUMAN',4837),(1522541,37866800,'P17568','','NDUB7_HUMAN',4837),(1522542,37843000,'Q96F86','','EDC3_HUMAN',4837),(1522543,37831500,'Q9BVP2','','GNL3_HUMAN',4837),(1522544,37827800,'P98179','','RBM3_HUMAN',4837),(1522545,37699800,'P31040','','SDHA_HUMAN',4837),(1522546,37490800,'P04040','','CATA_HUMAN',4837),(1522547,37474200,'Q9Y383','','LC7L2_HUMAN',4837),(1522548,37441600,'Q8WYP5','','ELYS_HUMAN',4837),(1522549,37393000,'Q15063','','POSTN_HUMAN',4837),(1522550,37314200,'Q13247','','SRSF6_HUMAN',4837),(1522551,37225500,'P54136','','SYRC_HUMAN',4837),(1522552,37096400,'P31930','','QCR1_HUMAN',4837),(1522553,36988800,'P48723','','HSP13_HUMAN',4837),(1522554,36958200,'Q7KZF4','','SND1_HUMAN',4837),(1522555,36861900,'P38919','','IF4A3_HUMAN',4837),(1522556,36846200,'Q15121','','PEA15_HUMAN',4837),(1522557,36789100,'P12081','','HARS1_HUMAN',4837),(1522558,36787200,'Q9UL54','','TAOK2_HUMAN',4837),(1522559,36499100,'CON_Q05443','','LUM_BOVIN',4837),(1522560,36448200,'P08579','','RU2B_HUMAN',4837),(1522561,36279300,'Q6P6C2','','ALKB5_HUMAN',4837),(1522562,36201900,'P50748','','KNTC1_HUMAN',4837),(1522563,36021600,'O00148','','DX39A_HUMAN',4837),(1522564,35972500,'P62995','','TRA2B_HUMAN',4837),(1522565,35915500,'Q9H1E3','','NUCKS_HUMAN',4837),(1522566,35886000,'Q9UBQ0','','VPS29_HUMAN',4837),(1522567,35797200,'Q8WUM4','','PDC6I_HUMAN',4837),(1522568,35764700,'O14787','','TNPO2_HUMAN',4837),(1522569,35759100,'O14745','','NHRF1_HUMAN',4837),(1522570,35731800,'Q9H078','','CLPB_HUMAN',4837),(1522571,35726100,'Q8N0U7','','CA087_HUMAN',4837),(1522572,35388900,'Q9BWF3','','RBM4_HUMAN',4837),(1522573,35274500,'P16989','','YBOX3_HUMAN',4837),(1522574,35270500,'Q7Z3Z3','','PIWL3_HUMAN',4837),(1522575,35224200,'Q9Y4L1','','HYOU1_HUMAN',4837),(1522576,35158800,'O15371','','EIF3D_HUMAN',4837),(1522577,35129400,'P51659','','DHB4_HUMAN',4837),(1522578,35092100,'Q9UHD8','','SEPT9_HUMAN',4837),(1522579,34978100,'Q00765','','REEP5_HUMAN',4837),(1522580,34922300,'H7BZ55','','CRCC2_HUMAN',4837),(1522581,34901100,'Q96FW1','','OTUB1_HUMAN',4837),(1522582,34881500,'Q8TER5','','ARH40_HUMAN',4837),(1522583,34836600,'Q8IZU2','','WDR17_HUMAN',4837),(1522584,34815400,'Q4G0P3','','HYDIN_HUMAN',4837),(1522585,34716400,'P68366','','TBA4A_HUMAN',4837),(1522586,34712600,'Q96PK6','','RBM14_HUMAN',4837),(1522587,34655200,'O00425','','IF2B3_HUMAN',4837),(1522588,34617700,'Q9Y5S9','','RBM8A_HUMAN',4837),(1522589,34615000,'Q13435','','SF3B2_HUMAN',4837),(1522590,34587600,'CON_P81644','','APOA2_BOVIN',4837),(1522591,34526800,'Q12797','','ASPH_HUMAN',4837),(1522592,34521600,'O60610','','DIAP1_HUMAN',4837),(1522593,34518400,'Q92973','','TNPO1_HUMAN',4837),(1522594,34506400,'Q9BVK6','','TMED9_HUMAN',4837),(1522595,34481500,'Q15758','','AAAT_HUMAN',4837),(1522596,34427000,'P14868','','SYDC_HUMAN',4837),(1522597,34336000,'Q16698','','DECR_HUMAN',4837),(1522598,34276600,'Q9UNH7','','SNX6_HUMAN',4837),(1522599,34212800,'Q9BX97','','PLVAP_HUMAN',4837),(1522600,34194800,'P60510','','PP4C_HUMAN',4837),(1522601,33975900,'P21912','','SDHB_HUMAN',4837),(1522602,33963700,'Q15427','','SF3B4_HUMAN',4837),(1522603,33915300,'Q8WW12','','PCNP_HUMAN',4837),(1522604,33900600,'P24666','','PPAC_HUMAN',4837),(1522605,33794600,'Q9H299','','SH3L3_HUMAN',4837),(1522606,33661300,'Q92616','','GCN1_HUMAN',4837),(1522607,33603600,'P00367','','DHE3_HUMAN',4837),(1522608,33520700,'Q01469','','FABP5_HUMAN',4837),(1522609,33485700,'Q7RTV0','','PHF5A_HUMAN',4837),(1522610,33469000,'Q92484','','ASM3A_HUMAN',4837),(1522611,33339400,'P30566','','PUR8_HUMAN',4837),(1522612,33328100,'Q6ZNA1','','ZN836_HUMAN',4837),(1522613,33248500,'P11171','','EPB41_HUMAN',4837),(1522614,33242900,'O75475','','PSIP1_HUMAN',4837),(1522615,33159600,'P46087','','NOP2_HUMAN',4837),(1522616,33086700,'Q9H0U4','','RAB1B_HUMAN',4837),(1522617,32919100,'Q7L576','','CYFP1_HUMAN',4837),(1522618,32871100,'P59817','','Z280A_HUMAN',4837),(1522619,32811600,'Q13155','','AIMP2_HUMAN',4837),(1522620,32756000,'P61513','','RL37A_HUMAN',4837),(1522621,32668800,'Q9BUR5','','MIC26_HUMAN',4837),(1522622,32659500,'P35606','','COPB2_HUMAN',4837),(1522623,32554300,'O15355','','PPM1G_HUMAN',4837),(1522624,32515900,'P11766','','ADHX_HUMAN',4837),(1522625,32483200,'Q9Y5X0','','SNX10_HUMAN',4837),(1522626,32445300,'Q14566','','MCM6_HUMAN',4837),(1522627,32404900,'Q8NC56','','LEMD2_HUMAN',4837),(1522628,32365400,'Q9UKY7','','CDV3_HUMAN',4837),(1522629,32321400,'Q9Y520','','PRC2C_HUMAN',4837),(1522630,32112200,'P61289','','PSME3_HUMAN',4837),(1522631,32029000,'P23193','','TCEA1_HUMAN',4837),(1522632,32016700,'Q9Y6N5','','SQOR_HUMAN',4837),(1522633,31988200,'O75937','','DNJC8_HUMAN',4837),(1522634,31986200,'Q9UQ35','','SRRM2_HUMAN',4837),(1522635,31949900,'P50213','','IDH3A_HUMAN',4837),(1522636,31881000,'P99999','','CYC_HUMAN',4837),(1522637,31874000,'Q9HB71','','CYBP_HUMAN',4837),(1522638,31857900,'P59998','','ARPC4_HUMAN',4837),(1522639,31809000,'Q8WXJ9','','ASB17_HUMAN',4837),(1522640,31770100,'Q99436','','PSB7_HUMAN',4837),(1522641,31755500,'Q9P2J5','','SYLC_HUMAN',4837),(1522642,31710900,'P51571','','SSRD_HUMAN',4837),(1522643,31705200,'P15408','','FOSL2_HUMAN',4837),(1522644,31703400,'O43813','','LANC1_HUMAN',4837),(1522645,31682900,'Q3B8N5','','PROX2_HUMAN',4837),(1522646,31647900,'P78330','','SERB_HUMAN',4837),(1522647,31564400,'Q96CT7','','CC124_HUMAN',4837),(1522648,31534500,'O14684','','PTGES_HUMAN',4837),(1522649,31527100,'Q96QD8','','S38A2_HUMAN',4837),(1522650,31447800,'Q9BZZ5','','API5_HUMAN',4837),(1522651,31352400,'P04114','','APOB_HUMAN',4837),(1522652,31319400,'O75340','','PDCD6_HUMAN',4837),(1522653,31283900,'Q9P289','','STK26_HUMAN',4837),(1522654,31270100,'P30419','','NMT1_HUMAN',4837),(1522655,31191100,'Q69YH5','','CDCA2_HUMAN',4837),(1522656,31176100,'O00264','','PGRC1_HUMAN',4837),(1522657,31028400,'Q9Y2L1','','RRP44_HUMAN',4837),(1522658,30925800,'P61619','','S61A1_HUMAN',4837),(1522659,30609200,'O43660','','PLRG1_HUMAN',4837),(1522660,30572400,'Q9NYL9','','TMOD3_HUMAN',4837),(1522661,30509500,'O76050','','NEUL1_HUMAN',4837),(1522662,30475500,'Q9BR76','','COR1B_HUMAN',4837),(1522663,30419100,'P61081','','UBC12_HUMAN',4837),(1522664,30338100,'Q99460','','PSMD1_HUMAN',4837),(1522665,30335400,'P51149','','RAB7A_HUMAN',4837),(1522666,30324700,'Q9HAV0','','GBB4_HUMAN',4837),(1522667,30324100,'P28070','','PSB4_HUMAN',4837),(1522668,30308500,'Q15637','','SF01_HUMAN',4837),(1522669,30302100,'Q9Y2I7','','FYV1_HUMAN',4837),(1522670,30299100,'Q13310','','PABP4_HUMAN',4837),(1522671,30295100,'Q9Y3I0','','RTCB_HUMAN',4837),(1522672,30284600,'P40222','','TXLNA_HUMAN',4837),(1522673,30269400,'O00483','','NDUA4_HUMAN',4837),(1522674,30239300,'P43490','','NAMPT_HUMAN',4837),(1522675,30208100,'Q9UKD2','','MRT4_HUMAN',4837),(1522676,30127400,'O94906','','PRP6_HUMAN',4837),(1522677,30091000,'Q9Y2Q3','','GSTK1_HUMAN',4837),(1522678,30004900,'P19623','','SPEE_HUMAN',4837),(1522679,30004200,'Q9NZM5','','NOP53_HUMAN',4837),(1522680,29854000,'Q14258','','TRI25_HUMAN',4837),(1522681,29822400,'P50135','','HNMT_HUMAN',4837),(1522682,29728300,'P43034','','LIS1_HUMAN',4837),(1522683,29726400,'Q8TB52','','FBX30_HUMAN',4837),(1522684,29673200,'Q9UNX4','','WDR3_HUMAN',4837),(1522685,29575200,'Q9P2X0','','DPM3_HUMAN',4837),(1522686,29563200,'Q9P035','','HACD3_HUMAN',4837),(1522687,29558800,'P43897','','EFTS_HUMAN',4837),(1522688,29344800,'P09661','','RU2A_HUMAN',4837),(1522689,29341600,'A0PJE2','','DHR12_HUMAN',4837),(1522690,29304400,'Q07812','','BAX_HUMAN',4837),(1522691,29263100,'Q13287','','NMI_HUMAN',4837),(1522692,29242500,'Q15369','','ELOC_HUMAN',4837),(1522693,29241400,'P51148','','RAB5C_HUMAN',4837),(1522694,29151800,'P39656','','OST48_HUMAN',4837),(1522695,29109300,'P78344','','IF4G2_HUMAN',4837),(1522696,29030300,'Q9NX24','','NHP2_HUMAN',4837),(1522697,29029600,'P07919','','QCR6_HUMAN',4837),(1522698,28945900,'O00231','','PSD11_HUMAN',4837),(1522699,28887700,'Q9NRX1','','PNO1_HUMAN',4837),(1522700,28856000,'Q9H0H0','','INT2_HUMAN',4837),(1522701,28853900,'Q9Y2X3','','NOP58_HUMAN',4837),(1522702,28722600,'Q96TA1','','NIBA2_HUMAN',4837),(1522703,28693600,'P49591','','SYSC_HUMAN',4837),(1522704,28693200,'Q6FI81','','CPIN1_HUMAN',4837),(1522705,28618600,'Q9NTK5','','OLA1_HUMAN',4837),(1522706,28475300,'P01889','','HLAB_HUMAN',4837),(1522707,28412400,'P35244','','RFA3_HUMAN',4837),(1522708,28396800,'Q53EL6','','PDCD4_HUMAN',4837),(1522709,28336700,'Q9H6F5','','CCD86_HUMAN',4837),(1522710,28313400,'O00429','','DNM1L_HUMAN',4837),(1522711,28285000,'Q02750','','MP2K1_HUMAN',4837),(1522712,28234700,'Q86U86','','PB1_HUMAN',4837),(1522713,28213600,'Q9NR99','','MXRA5_HUMAN',4837),(1522714,28210600,'Q15014','','MO4L2_HUMAN',4837),(1522715,28195200,'Q3SY17','','S2552_HUMAN',4837),(1522716,28173000,'Q8IXJ9','','ASXL1_HUMAN',4837),(1522717,27081200,'CON_P41361','','ANT3_BOVIN',4837),(1522718,23529200,'CON_P50448','','F12AI_BOVIN',4837),(1522719,22075500,'CON_P02676','','FIBB_BOVIN',4837),(1522720,21533500,'CON_Q95M17','','CHIA_BOVIN',4837),(1522721,17550400,'CON_P17697','','CLUS_BOVIN',4837),(1522722,15926000,'CON_Q9N2I2','','IPSP_BOVIN',4837),(1522723,13357100,'CON_Q3MHN2','','CO9_BOVIN',4837),(1522724,13276300,'CON_Q29RQ1','','CO7_BOVIN',4837),(1522725,11686800,'CON_P01044','','KNG1_BOVIN',4837),(1522726,10568600,'CON_P17690','','APOH_BOVIN',4837),(1522727,6603800,'CON_Q28107','','FA5_BOVIN',4837),(1522728,6312820,'CON_Q28065','','C4BPA_BOVIN',4837),(1522729,5526190,'CON_P04258','','CO3A1_BOVIN',4837),(1522730,4479060,'CON_Q03247','','APOE_BOVIN',4837),(1522731,2965160,'CON_P02672','','FIBA_BOVIN',4837),(1522732,2025550,'CON_Q3TTY5','','K22E_MOUSE',4837),(1522733,19148000000,'Q5VZ66','','JKIP3_HUMAN',4838),(1522734,15130700000,'CON_P12763','','FETUA_BOVIN',4838),(1522735,14173100000,'P62805','','H4_HUMAN',4838),(1522736,13280800000,'P04406','','G3P_HUMAN',4838),(1522737,6720790000,'Q9BXS9','','S26A6_HUMAN',4838),(1522738,6560370000,'P06703','','S10A6_HUMAN',4838),(1522739,6445610000,'P06733','','ENOA_HUMAN',4838),(1522740,6425450000,'P62937','','PPIA_HUMAN',4838),(1522741,6070490000,'P06748','','NPM_HUMAN',4838),(1522742,5824240000,'P14618','','KPYM_HUMAN',4838),(1522743,5332100000,'O43520','','AT8B1_HUMAN',4838),(1522744,4714520000,'CON_P34955','','A1AT_BOVIN',4838),(1522745,4358260000,'Q86UL8','','MAGI2_HUMAN',4838),(1522746,3804280000,'P00338','','LDHA_HUMAN',4838),(1522747,3664600000,'Q06830','','PRDX1_HUMAN',4838),(1522748,3207440000,'P26447','','S10A4_HUMAN',4838),(1522749,2834890000,'P05387','','RLA2_HUMAN',4838),(1522750,2792770000,'Q6P2Q9','','PRP8_HUMAN',4838),(1522751,2746440000,'Q9H9Q2','','CSN7B_HUMAN',4838),(1522752,2688570000,'Q9NUD5','','ZCHC3_HUMAN',4838),(1522753,2512670000,'A6NMS7','','L37A1_HUMAN',4838),(1522754,2418200000,'CON_P15636','','API_ACHLY',4838),(1522755,2414560000,'P00558','','PGK1_HUMAN',4838),(1522756,2411500000,'P10809','','CH60_HUMAN',4838),(1522757,2406180000,'P48147','','PPCE_HUMAN',4838),(1522758,2377980000,'P11142','','HSP7C_HUMAN',4838),(1522759,2310910000,'P07737','','PROF1_HUMAN',4838),(1522760,2251990000,'P31949','','S10AB_HUMAN',4838),(1522761,2108720000,'P10599','','THIO_HUMAN',4838),(1522762,2027560000,'P04075','','ALDOA_HUMAN',4838),(1522763,1989000000,'P05783','','K1C18_HUMAN',4838),(1522764,1921590000,'P11021','','BIP_HUMAN',4838),(1522765,1902490000,'CON_P01966','','HBA_BOVIN',4838),(1522766,1871420000,'P29401','','TKT_HUMAN',4838),(1522767,1842010000,'CON_Q2UVX4','','CO3_BOVIN',4838),(1522768,1832710000,'P60174','','TPIS_HUMAN',4838),(1522769,1821950000,'Q00722','','PLCB2_HUMAN',4838),(1522770,1808800000,'P07437','','TBB5_HUMAN',4838),(1522771,1778080000,'Q7Z6J2','','GRASP_HUMAN',4838),(1522772,1747310000,'P22626','','ROA2_HUMAN',4838),(1522773,1743900000,'P0C6C1','','AN34C_HUMAN',4838),(1522774,1719670000,'P13639','','EF2_HUMAN',4838),(1522775,1685840000,'Q2M2I8','','AAK1_HUMAN',4838),(1522776,1662910000,'CON_P02070','','HBB_BOVIN',4838),(1522777,1644300000,'P62826','','RAN_HUMAN',4838),(1522778,1628240000,'P18621','','RL17_HUMAN',4838),(1522779,1597850000,'P08238','','HS90B_HUMAN',4838),(1522780,1584810000,'Q99497','','PARK7_HUMAN',4838),(1522781,1572030000,'P07195','','LDHB_HUMAN',4838),(1522782,1546260000,'P08670','','VIME_HUMAN',4838),(1522783,1521450000,'P06576','','ATPB_HUMAN',4838),(1522784,1489240000,'P62241','','RS8_HUMAN',4838),(1522785,1482420000,'CON_P02769','','ALBU_BOVIN',4838),(1522786,1477580000,'P07355','','ANXA2_HUMAN',4838),(1522787,1467340000,'P60903','','S10AA_HUMAN',4838),(1522788,1465930000,'CON_Q58D62','','FETUB_BOVIN',4838),(1522789,1459780000,'P62750','','RL23A_HUMAN',4838),(1522790,1458390000,'P13807','','GYS1_HUMAN',4838),(1522791,1371200000,'P30041','','PRDX6_HUMAN',4838),(1522792,1359960000,'O43175','','SERA_HUMAN',4838),(1522793,1357480000,'P21333','','FLNA_HUMAN',4838),(1522794,1335660000,'P26641','','EF1G_HUMAN',4838),(1522795,1327150000,'P07900','','HS90A_HUMAN',4838),(1522796,1319190000,'P63241','','IF5A1_HUMAN',4838),(1522797,1313100000,'P18124','','RL7_HUMAN',4838),(1522798,1302170000,'P63104','','1433Z_HUMAN',4838),(1522799,1287730000,'P62258','','1433E_HUMAN',4838),(1522800,1284810000,'Q01105','','SET_HUMAN',4838),(1522801,1281900000,'P23528','','COF1_HUMAN',4838),(1522802,1274860000,'P68371','','TBB4B_HUMAN',4838),(1522803,1256640000,'CON_P00761','','TRYP_PIG',4838),(1522804,1240820000,'P06454','','PTMA_HUMAN',4838),(1522805,1233080000,'P27797','','CALR_HUMAN',4838),(1522806,1223390000,'P19338','','NUCL_HUMAN',4838),(1522807,1219830000,'P30101','','PDIA3_HUMAN',4838),(1522808,1217500000,'P32119','','PRDX2_HUMAN',4838),(1522809,1215390000,'P61978','','HNRPK_HUMAN',4838),(1522810,1213770000,'P60842','','IF4A1_HUMAN',4838),(1522811,1194260000,'Q92733','','PRCC_HUMAN',4838),(1522812,1194240000,'P30044','','PRDX5_HUMAN',4838),(1522813,1189470000,'P36578','','RL4_HUMAN',4838),(1522814,1181280000,'P62424','','RL7A_HUMAN',4838),(1522815,1176150000,'P62906','','RL10A_HUMAN',4838),(1522816,1171120000,'O75369','','FLNB_HUMAN',4838),(1522817,1167530000,'Q09666','','AHNK_HUMAN',4838),(1522818,1129920000,'P00966','','ASSY_HUMAN',4838),(1522819,1129610000,'P36952','','SPB5_HUMAN',4838),(1522820,1126720000,'P14174','','MIF_HUMAN',4838),(1522821,1125710000,'P30050','','RL12_HUMAN',4838),(1522822,1122570000,'Q5XXA6','','ANO1_HUMAN',4838),(1522823,1122270000,'P61247','','RS3A_HUMAN',4838),(1522824,1120600000,'P31153','','METK2_HUMAN',4838),(1522825,1107760000,'P26373','','RL13_HUMAN',4838),(1522826,1102710000,'P25705','','ATPA_HUMAN',4838),(1522827,1096180000,'Q14204','','DYHC1_HUMAN',4838),(1522828,1095290000,'Q9NSK0','','KLC4_HUMAN',4838),(1522829,1088940000,'P04083','','ANXA1_HUMAN',4838),(1522830,1085350000,'O75618','','DEDD_HUMAN',4838),(1522831,1077490000,'P62263','','RS14_HUMAN',4838),(1522832,1063060000,'Q15181','','IPYR_HUMAN',4838),(1522833,1052890000,'P07910','','HNRPC_HUMAN',4838),(1522834,1052330000,'Q6P4D5','','PBIR3_HUMAN',4838),(1522835,1048740000,'P19823','','ITIH2_HUMAN',4838),(1522836,1042370000,'Q9H013','','ADA19_HUMAN',4838),(1522837,1027560000,'P60866','','RS20_HUMAN',4838),(1522838,1027510000,'P80723','','BASP1_HUMAN',4838),(1522839,1026190000,'CON_P02672','','FIBA_BOVIN',4838),(1522840,1017610000,'P61604','','CH10_HUMAN',4838),(1522841,1017140000,'Q00839','','HNRPU_HUMAN',4838),(1522842,997844000,'Q07021','','C1QBP_HUMAN',4838),(1522843,992047000,'P42766','','RL35_HUMAN',4838),(1522844,976262000,'O95433','','AHSA1_HUMAN',4838),(1522845,963241000,'P02545','','LMNA_HUMAN',4838),(1522846,961057000,'P08865','','RSSA_HUMAN',4838),(1522847,957264000,'P23396','','RS3_HUMAN',4838),(1522848,956350000,'O75533','','SF3B1_HUMAN',4838),(1522849,948520000,'P63244','','RACK1_HUMAN',4838),(1522850,944919000,'P26572','','MGAT1_HUMAN',4838),(1522851,943094000,'P50990','','TCPQ_HUMAN',4838),(1522852,942087000,'P62851','','RS25_HUMAN',4838),(1522853,937017000,'Q02878','','RL6_HUMAN',4838),(1522854,927104000,'P12004','','PCNA_HUMAN',4838),(1522855,917422000,'P62753','','RS6_HUMAN',4838),(1522856,916711000,'P23284','','PPIB_HUMAN',4838),(1522857,915329000,'P26599','','PTBP1_HUMAN',4838),(1522858,912385000,'P31327','','CPSM_HUMAN',4838),(1522859,904803000,'Q7Z736','','PKHH3_HUMAN',4838),(1522860,903765000,'P62861','','RS30_HUMAN',4838),(1522861,898282000,'P42677','','RS27_HUMAN',4838),(1522862,895985000,'P49207','','RL34_HUMAN',4838),(1522863,885515000,'Q07020','','RL18_HUMAN',4838),(1522864,882531000,'P39023','','RL3_HUMAN',4838),(1522865,876739000,'P05388','','RLA0_HUMAN',4838),(1522866,873508000,'P84098','','RL19_HUMAN',4838),(1522867,868366000,'P05386','','RLA1_HUMAN',4838),(1522868,843487000,'P62829','','RL23_HUMAN',4838),(1522869,837211000,'P50914','','RL14_HUMAN',4838),(1522870,832486000,'P31946','','1433B_HUMAN',4838),(1522871,820091000,'O60506','','HNRPQ_HUMAN',4838),(1522872,819078000,'P22314','','UBA1_HUMAN',4838),(1522873,805029000,'P15880','','RS2_HUMAN',4838),(1522874,778981000,'Q76N89','','HECW1_HUMAN',4838),(1522875,776914000,'P05023','','AT1A1_HUMAN',4838),(1522876,775963000,'Q53FD0','','ZC21C_HUMAN',4838),(1522877,774564000,'P37802','','TAGL2_HUMAN',4838),(1522878,763783000,'O94964','','SOGA1_HUMAN',4838),(1522879,763592000,'P46781','','RS9_HUMAN',4838),(1522880,758814000,'P23246','','SFPQ_HUMAN',4838),(1522881,757922000,'P83731','','RL24_HUMAN',4838),(1522882,753131000,'P46782','','RS5_HUMAN',4838),(1522883,749934000,'P26038','','MOES_HUMAN',4838),(1522884,747910000,'Q9Y5B9','','SP16H_HUMAN',4838),(1522885,744771000,'CON_P15497','','APOA1_BOVIN',4838),(1522886,744377000,'P62249','','RS16_HUMAN',4838),(1522887,743495000,'Q02543','','RL18A_HUMAN',4838),(1522888,741719000,'O43707','','ACTN4_HUMAN',4838),(1522889,737695000,'Q6ZP82','','CC141_HUMAN',4838),(1522890,731159000,'P02786','','TFR1_HUMAN',4838),(1522891,714181000,'P00441','','SODC_HUMAN',4838),(1522892,713488000,'Q15084','','PDIA6_HUMAN',4838),(1522893,711952000,'P78371','','TCPB_HUMAN',4838),(1522894,709578000,'P52272','','HNRPM_HUMAN',4838),(1522895,705529000,'P08174','','DAF_HUMAN',4838),(1522896,705444000,'P62701','','RS4X_HUMAN',4838),(1522897,699604000,'Q14624','','ITIH4_HUMAN',4838),(1522898,696402000,'P04792','','HSPB1_HUMAN',4838),(1522899,693512000,'P55209','','NP1L1_HUMAN',4838),(1522900,689614000,'Q14103','','HNRPD_HUMAN',4838),(1522901,683529000,'P07357','','CO8A_HUMAN',4838),(1522902,682432000,'Q9Y262','','EIF3L_HUMAN',4838),(1522903,681693000,'Q9H845','','ACAD9_HUMAN',4838),(1522904,681576000,'P62269','','RS18_HUMAN',4838),(1522905,679709000,'P50991','','TCPD_HUMAN',4838),(1522906,675950000,'Q96HA7','','TONSL_HUMAN',4838),(1522907,675745000,'P27635','','RL10_HUMAN',4838),(1522908,674434000,'P13797','','PLST_HUMAN',4838),(1522909,674168000,'P14625','','ENPL_HUMAN',4838),(1522910,671173000,'Q04941','','PLP2_HUMAN',4838),(1522911,667713000,'P07237','','PDIA1_HUMAN',4838),(1522912,667543000,'P39748','','FEN1_HUMAN',4838),(1522913,667462000,'Q15366','','PCBP2_HUMAN',4838),(1522914,666855000,'Q7Z417','','NUFP2_HUMAN',4838),(1522915,661831000,'P09382','','LEG1_HUMAN',4838),(1522916,661224000,'P06744','','G6PI_HUMAN',4838),(1522917,658745000,'P35268','','RL22_HUMAN',4838),(1522918,656719000,'P38646','','GRP75_HUMAN',4838),(1522919,655040000,'Q14254','','FLOT2_HUMAN',4838),(1522920,654810000,'P62917','','RL8_HUMAN',4838),(1522921,652394000,'Q99714','','HCD2_HUMAN',4838),(1522922,652071000,'P14314','','GLU2B_HUMAN',4838),(1522923,649264000,'Q15349','','KS6A2_HUMAN',4838),(1522924,648856000,'P24534','','EF1B_HUMAN',4838),(1522925,641679000,'Q15233','','NONO_HUMAN',4838),(1522926,639786000,'P61313','','RL15_HUMAN',4838),(1522927,637206000,'P67809','','YBOX1_HUMAN',4838),(1522928,636935000,'P25398','','RS12_HUMAN',4838),(1522929,634436000,'P27824','','CALX_HUMAN',4838),(1522930,632627000,'Q15365','','PCBP1_HUMAN',4838),(1522931,627759000,'P78417','','GSTO1_HUMAN',4838),(1522932,623710000,'P46940','','IQGA1_HUMAN',4838),(1522933,619393000,'O75821','','EIF3G_HUMAN',4838),(1522934,615915000,'Q15149','','PLEC_HUMAN',4838),(1522935,610543000,'P46776','','RL27A_HUMAN',4838),(1522936,602722000,'P51159','','RB27A_HUMAN',4838),(1522937,602239000,'P46779','','RL28_HUMAN',4838),(1522938,601756000,'P61981','','1433G_HUMAN',4838),(1522939,599245000,'P82970','','HMGN5_HUMAN',4838),(1522940,598095000,'Q07955','','SRSF1_HUMAN',4838),(1522941,597621000,'Q15185','','TEBP_HUMAN',4838),(1522942,589784000,'P29692','','EF1D_HUMAN',4838),(1522943,589765000,'P47914','','RL29_HUMAN',4838),(1522944,589486000,'P08758','','ANXA5_HUMAN',4838),(1522945,587954000,'P40926','','MDHM_HUMAN',4838),(1522946,587694000,'Q9UQ80','','PA2G4_HUMAN',4838),(1522947,585540000,'Q00325','','MPCP_HUMAN',4838),(1522948,584502000,'P49411','','EFTU_HUMAN',4838),(1522949,581657000,'O60888','','CUTA_HUMAN',4838),(1522950,577987000,'Q8NC51','','PAIRB_HUMAN',4838),(1522951,575739000,'P15531','','NDKA_HUMAN',4838),(1522952,574793000,'P13667','','PDIA4_HUMAN',4838),(1522953,572746000,'P34897','','GLYM_HUMAN',4838),(1522954,571849000,'P26639','','SYTC_HUMAN',4838),(1522955,568058000,'P46777','','RL5_HUMAN',4838),(1522956,563818000,'P49721','','PSB2_HUMAN',4838),(1522957,562916000,'Q9HCM1','','RESF1_HUMAN',4838),(1522958,561244000,'Q04760','','LGUL_HUMAN',4838),(1522959,557821000,'Q12906','','ILF3_HUMAN',4838),(1522960,557469000,'P13010','','XRCC5_HUMAN',4838),(1522961,557349000,'Q9Y3U8','','RL36_HUMAN',4838),(1522962,557338000,'P32969','','RL9_HUMAN',4838),(1522963,556553000,'P39019','','RS19_HUMAN',4838),(1522964,555730000,'P08195','','4F2_HUMAN',4838),(1522965,552162000,'P30086','','PEBP1_HUMAN',4838),(1522966,550564000,'Q1KMD3','','HNRL2_HUMAN',4838),(1522967,549519000,'P12956','','XRCC6_HUMAN',4838),(1522968,544721000,'P53985','','MOT1_HUMAN',4838),(1522969,542571000,'P27348','','1433T_HUMAN',4838),(1522970,539997000,'P18669','','PGAM1_HUMAN',4838),(1522971,539260000,'Q15393','','SF3B3_HUMAN',4838),(1522972,538528000,'Q14CM0','','FRPD4_HUMAN',4838),(1522973,535391000,'P61353','','RL27_HUMAN',4838),(1522974,532790000,'P34932','','HSP74_HUMAN',4838),(1522975,530682000,'P62081','','RS7_HUMAN',4838),(1522976,530247000,'O60610','','DIAP1_HUMAN',4838),(1522977,527981000,'P37108','','SRP14_HUMAN',4838),(1522978,521020000,'P27695','','APEX1_HUMAN',4838),(1522979,516501000,'P63173','','RL38_HUMAN',4838),(1522980,512781000,'CON_Q95121','','PEDF_BOVIN',4838),(1522981,509164000,'O75531','','BAF_HUMAN',4838),(1522982,508057000,'P51858','','HDGF_HUMAN',4838),(1522983,507479000,'P50454','','SERPH_HUMAN',4838),(1522984,504529000,'Q5TEC6','','H37_HUMAN',4838),(1522985,504135000,'Q13137','','CACO2_HUMAN',4838),(1522986,502092000,'P54577','','SYYC_HUMAN',4838),(1522987,501528000,'O60309','','L37A3_HUMAN',4838),(1522988,501460000,'Q9UNL2','','SSRG_HUMAN',4838),(1522989,501136000,'P04004','','VTNC_HUMAN',4838),(1522990,498374000,'O00299','','CLIC1_HUMAN',4838),(1522991,494212000,'P62280','','RS11_HUMAN',4838),(1522992,494115000,'CON_Q29443','','TRFE_BOVIN',4838),(1522993,492178000,'P41250','','GARS_HUMAN',4838),(1522994,489028000,'P62841','','RS15_HUMAN',4838),(1522995,485249000,'P62913','','RL11_HUMAN',4838),(1522996,483870000,'P07602','','SAP_HUMAN',4838),(1522997,483628000,'Q12905','','ILF2_HUMAN',4838),(1522998,481595000,'P62857','','RS28_HUMAN',4838),(1522999,481036000,'P62888','','RL30_HUMAN',4838),(1523000,480415000,'P28072','','PSB6_HUMAN',4838),(1523001,478489000,'Q9H553','','ALG2_HUMAN',4838),(1523002,478455000,'CON_Q9TTE1','','SPA31_BOVIN',4838),(1523003,478398000,'A2RUS2','','DEND3_HUMAN',4838),(1523004,475169000,'Q9P2K8','','E2AK4_HUMAN',4838),(1523005,474052000,'P15311','','EZRI_HUMAN',4838),(1523006,471834000,'P07384','','CAN1_HUMAN',4838),(1523007,471146000,'Q16719','','KYNU_HUMAN',4838),(1523008,467994000,'Q8N122','','RPTOR_HUMAN',4838),(1523009,466698000,'P62899','','RL31_HUMAN',4838),(1523010,466513000,'P55072','','TERA_HUMAN',4838),(1523011,466339000,'P04080','','CYTB_HUMAN',4838),(1523012,463095000,'P45880','','VDAC2_HUMAN',4838),(1523013,462326000,'P78527','','PRKDC_HUMAN',4838),(1523014,459374000,'Q96DW6','','S2538_HUMAN',4838),(1523015,458971000,'Q08211','','DHX9_HUMAN',4838),(1523016,458156000,'P21796','','VDAC1_HUMAN',4838),(1523017,457456000,'P62244','','RS15A_HUMAN',4838),(1523018,457126000,'P62910','','RL32_HUMAN',4838),(1523019,456622000,'P31948','','STIP1_HUMAN',4838),(1523020,455759000,'P15121','','ALDR_HUMAN',4838),(1523021,454875000,'Q01518','','CAP1_HUMAN',4838),(1523022,452623000,'P11388','','TOP2A_HUMAN',4838),(1523023,452352000,'P35637','','FUS_HUMAN',4838),(1523024,451245000,'Q92688','','AN32B_HUMAN',4838),(1523025,442033000,'P14406','','CX7A2_HUMAN',4838),(1523026,440023000,'P00505','','AATM_HUMAN',4838),(1523027,438199000,'Q9C005','','DPY30_HUMAN',4838),(1523028,436039000,'Q8N1W1','','ARG28_HUMAN',4838),(1523029,435610000,'P24539','','AT5F1_HUMAN',4838),(1523030,434435000,'Q9Y5M8','','SRPRB_HUMAN',4838),(1523031,433652000,'Q04637','','IF4G1_HUMAN',4838),(1523032,433649000,'P46087','','NOP2_HUMAN',4838),(1523033,432687000,'P26368','','U2AF2_HUMAN',4838),(1523034,427947000,'Q16881','','TRXR1_HUMAN',4838),(1523035,427819000,'P48643','','TCPE_HUMAN',4838),(1523036,426739000,'P27694','','RFA1_HUMAN',4838),(1523037,424682000,'A2RUB6','','CCD66_HUMAN',4838),(1523038,423549000,'P28066','','PSA5_HUMAN',4838),(1523039,422329000,'Q14019','','COTL1_HUMAN',4838),(1523040,420852000,'P05141','','ADT2_HUMAN',4838),(1523041,420500000,'Q13268','','DHRS2_HUMAN',4838),(1523042,420024000,'P63220','','RS21_HUMAN',4838),(1523043,417590000,'P67936','','TPM4_HUMAN',4838),(1523044,416928000,'CON_Q3SZ57','','FETA_BOVIN',4838),(1523045,415305000,'P46778','','RL21_HUMAN',4838),(1523046,414651000,'P55060','','XPO2_HUMAN',4838),(1523047,412855000,'P23526','','SAHH_HUMAN',4838),(1523048,412650000,'Q92995','','UBP13_HUMAN',4838),(1523049,412368000,'Q14697','','GANAB_HUMAN',4838),(1523050,409154000,'Q8WWQ8','','STAB2_HUMAN',4838),(1523051,408149000,'O95373','','IPO7_HUMAN',4838),(1523052,407077000,'P22695','','QCR2_HUMAN',4838),(1523053,405780000,'CON_P50448','','F12AI_BOVIN',4838),(1523054,405491000,'Q9BQE3','','TBA1C_HUMAN',4838),(1523055,405214000,'Q9HBK9','','AS3MT_HUMAN',4838),(1523056,404364000,'Q8WXI9','','P66B_HUMAN',4838),(1523057,402146000,'P30048','','PRDX3_HUMAN',4838),(1523058,399924000,'CON_P00978','','AMBP_BOVIN',4838),(1523059,398932000,'P25815','','S100P_HUMAN',4838),(1523060,398780000,'Q9H223','','EHD4_HUMAN',4838),(1523061,396659000,'CON_P06868','','PLMN_BOVIN',4838),(1523062,396355000,'P82979','','SARNP_HUMAN',4838),(1523063,394167000,'Q13126','','MTAP_HUMAN',4838),(1523064,393533000,'Q13283','','G3BP1_HUMAN',4838),(1523065,393030000,'Q9C030','','TRIM6_HUMAN',4838),(1523066,392918000,'P40925','','MDHC_HUMAN',4838),(1523067,392034000,'P49368','','TCPG_HUMAN',4838),(1523068,389303000,'P49588','','SYAC_HUMAN',4838),(1523069,388236000,'P52597','','HNRPF_HUMAN',4838),(1523070,387935000,'P25786','','PSA1_HUMAN',4838),(1523071,387091000,'CON_Q28085','','CFAH_BOVIN',4838),(1523072,383032000,'CON_P00735','','THRB_BOVIN',4838),(1523073,382336000,'P49773','','HINT1_HUMAN',4838),(1523074,382325000,'P04035','','HMDH_HUMAN',4838),(1523075,379737000,'O75822','','EIF3J_HUMAN',4838),(1523076,379000000,'P22087','','FBRL_HUMAN',4838),(1523077,378480000,'P23588','','IF4B_HUMAN',4838),(1523078,378158000,'CON_P01030','','CO4_BOVIN',4838),(1523079,377805000,'P43243','','MATR3_HUMAN',4838),(1523080,376419000,'P30043','','BLVRB_HUMAN',4838),(1523081,375559000,'Q00610','','CLH1_HUMAN',4838),(1523082,375106000,'P53999','','TCP4_HUMAN',4838),(1523083,372968000,'Q8WYA1','','BMAL2_HUMAN',4838),(1523084,371520000,'Q8WV41','','SNX33_HUMAN',4838),(1523085,371157000,'P40429','','RL13A_HUMAN',4838),(1523086,370922000,'Q14974','','IMB1_HUMAN',4838),(1523087,370513000,'P15170','','ERF3A_HUMAN',4838),(1523088,369930000,'O75390','','CISY_HUMAN',4838),(1523089,367830000,'P14866','','HNRPL_HUMAN',4838),(1523090,366698000,'Q96AE4','','FUBP1_HUMAN',4838),(1523091,365010000,'P39687','','AN32A_HUMAN',4838),(1523092,364974000,'P62847','','RS24_HUMAN',4838),(1523093,363446000,'P08218','','CEL2B_HUMAN',4838),(1523094,362883000,'P35613','','BASI_HUMAN',4838),(1523095,362781000,'P13987','','CD59_HUMAN',4838),(1523096,361169000,'P18206','','VINC_HUMAN',4838),(1523097,361080000,'Q9BW92','','SYTM_HUMAN',4838),(1523098,360165000,'P62266','','RS23_HUMAN',4838),(1523099,358655000,'O14561','','ACPM_HUMAN',4838),(1523100,358009000,'Q96JP5','','ZFP91_HUMAN',4838),(1523101,357857000,'P17096','','HMGA1_HUMAN',4838),(1523102,356426000,'A6NFX1','','MFS2B_HUMAN',4838),(1523103,356360000,'Q7Z570','','Z804A_HUMAN',4838),(1523104,353913000,'Q16658','','FSCN1_HUMAN',4838),(1523105,352823000,'P41091','','IF2G_HUMAN',4838),(1523106,352737000,'P43487','','RANG_HUMAN',4838),(1523107,350865000,'P12111','','CO6A3_HUMAN',4838),(1523108,350374000,'Q8IVI9','','NOSTN_HUMAN',4838),(1523109,350312000,'O75367','','H2AY_HUMAN',4838),(1523110,346406000,'Q02809','','PLOD1_HUMAN',4838),(1523111,345688000,'Q9NQC3','','RTN4_HUMAN',4838),(1523112,343100000,'P84103','','SRSF3_HUMAN',4838),(1523113,342269000,'Q9Y6M7','','S4A7_HUMAN',4838),(1523114,341595000,'P09972','','ALDOC_HUMAN',4838),(1523115,340429000,'Q92616','','GCN1_HUMAN',4838),(1523116,339247000,'Q70UQ0','','IKIP_HUMAN',4838),(1523117,339166000,'Q9P1Y5','','CAMP3_HUMAN',4838),(1523118,339133000,'P13804','','ETFA_HUMAN',4838),(1523119,338192000,'P18077','','RL35A_HUMAN',4838),(1523120,336605000,'P06753','','TPM3_HUMAN',4838),(1523121,336213000,'P13073','','COX41_HUMAN',4838),(1523122,334935000,'P62304','','RUXE_HUMAN',4838),(1523123,334125000,'P06396','','GELS_HUMAN',4838),(1523124,333245000,'O75643','','U520_HUMAN',4838),(1523125,333143000,'Q9NR30','','DDX21_HUMAN',4838),(1523126,332831000,'P40227','','TCPZ_HUMAN',4838),(1523127,332602000,'P63098','','CANB1_HUMAN',4838),(1523128,332486000,'Q99623','','PHB2_HUMAN',4838),(1523129,330710000,'P20700','','LMNB1_HUMAN',4838),(1523130,330339000,'P18085','','ARF4_HUMAN',4838),(1523131,328237000,'Q99829','','CPNE1_HUMAN',4838),(1523132,327153000,'P22102','','PUR2_HUMAN',4838),(1523133,326790000,'P07814','','SYEP_HUMAN',4838),(1523134,325990000,'Q16643','','DREB_HUMAN',4838),(1523135,325128000,'P20290','','BTF3_HUMAN',4838),(1523136,324900000,'Q8IVL1','','NAV2_HUMAN',4838),(1523137,324015000,'P62979','','RS27A_HUMAN',4838),(1523138,323116000,'P35232','','PHB1_HUMAN',4838),(1523139,322122000,'Q9P2E3','','ZNFX1_HUMAN',4838),(1523140,322072000,'P52209','','6PGD_HUMAN',4838),(1523141,321919000,'P08708','','RS17_HUMAN',4838),(1523142,320162000,'P63000','','RAC1_HUMAN',4838),(1523143,319681000,'P52594','','AGFG1_HUMAN',4838),(1523144,318735000,'P11586','','C1TC_HUMAN',4838),(1523145,318501000,'Q02224','','CENPE_HUMAN',4838),(1523146,318413000,'P10155','','RO60_HUMAN',4838),(1523147,317404000,'P62316','','SMD2_HUMAN',4838),(1523148,317282000,'P49748','','ACADV_HUMAN',4838),(1523149,317061000,'Q06495','','NPT2A_HUMAN',4838),(1523150,316150000,'P20674','','COX5A_HUMAN',4838),(1523151,316092000,'P11387','','TOP1_HUMAN',4838),(1523152,315808000,'Q01082','','SPTB2_HUMAN',4838),(1523153,314528000,'P30049','','ATPD_HUMAN',4838),(1523154,313485000,'P50238','','CRIP1_HUMAN',4838),(1523155,313075000,'O43399','','TPD54_HUMAN',4838),(1523156,312341000,'Q8WWZ4','','ABCAA_HUMAN',4838),(1523157,312295000,'P47897','','SYQ_HUMAN',4838),(1523158,310969000,'P09651','','ROA1_HUMAN',4838),(1523159,310916000,'Q13263','','TIF1B_HUMAN',4838),(1523160,310260000,'P17987','','TCPA_HUMAN',4838),(1523161,309482000,'Q70CQ4','','UBP31_HUMAN',4838),(1523162,309363000,'Q8NE71','','ABCF1_HUMAN',4838),(1523163,308419000,'P05546','','HEP2_HUMAN',4838),(1523164,306497000,'P46783','','RS10_HUMAN',4838),(1523165,306490000,'P09429','','HMGB1_HUMAN',4838),(1523166,306056000,'P14735','','IDE_HUMAN',4838),(1523167,304592000,'P07954','','FUMH_HUMAN',4838),(1523168,304093000,'P31947','','1433S_HUMAN',4838),(1523169,303386000,'P37837','','TALDO_HUMAN',4838),(1523170,302879000,'P25788','','PSA3_HUMAN',4838),(1523171,302588000,'P10606','','COX5B_HUMAN',4838),(1523172,302569000,'Q15293','','RCN1_HUMAN',4838),(1523173,302157000,'Q9Y265','','RUVB1_HUMAN',4838),(1523174,301143000,'P05198','','IF2A_HUMAN',4838),(1523175,300758000,'P08559','','ODPA_HUMAN',4838),(1523176,300395000,'P43307','','SSRA_HUMAN',4838),(1523177,299739000,'O43390','','HNRPR_HUMAN',4838),(1523178,299323000,'Q13813','','SPTN1_HUMAN',4838),(1523179,298408000,'Q99832','','TCPH_HUMAN',4838),(1523180,298082000,'P60900','','PSA6_HUMAN',4838),(1523181,297889000,'Q99584','','S10AD_HUMAN',4838),(1523182,297064000,'P31943','','HNRH1_HUMAN',4838),(1523183,296988000,'P62277','','RS13_HUMAN',4838),(1523184,296727000,'P60660','','MYL6_HUMAN',4838),(1523185,296195000,'Q14432','','PDE3A_HUMAN',4838),(1523186,296088000,'P27708','','PYR1_HUMAN',4838),(1523187,295421000,'Q6UXC1','','AEGP_HUMAN',4838),(1523188,295350000,'P42704','','LPPRC_HUMAN',4838),(1523189,293178000,'Q9NPQ8','','RIC8A_HUMAN',4838),(1523190,291778000,'Q9UHD1','','CHRD1_HUMAN',4838),(1523191,290948000,'A6NI28','','RHG42_HUMAN',4838),(1523192,289989000,'O00592','','PODXL_HUMAN',4838),(1523193,288512000,'P43686','','PRS6B_HUMAN',4838),(1523194,288027000,'P22234','','PUR6_HUMAN',4838),(1523195,286375000,'Q5MNV8','','FBX47_HUMAN',4838),(1523196,285562000,'P55786','','PSA_HUMAN',4838),(1523197,283873000,'Q9Y266','','NUDC_HUMAN',4838),(1523198,283223000,'O60884','','DNJA2_HUMAN',4838),(1523199,282873000,'Q8NCW5','','NNRE_HUMAN',4838),(1523200,282022000,'P00751','','CFAB_HUMAN',4838),(1523201,281003000,'Q9UBT2','','SAE2_HUMAN',4838),(1523202,280888000,'B6SEH8','','ERVV1_HUMAN',4838),(1523203,280598000,'O95831','','AIFM1_HUMAN',4838),(1523204,280572000,'Q969S3','','ZN622_HUMAN',4838),(1523205,280457000,'Q9P0M9','','RM27_HUMAN',4838),(1523206,279369000,'Q09028','','RBBP4_HUMAN',4838),(1523207,277678000,'P52756','','RBM5_HUMAN',4838),(1523208,275996000,'Q9NRU3','','CNNM1_HUMAN',4838),(1523209,275119000,'Q9NWT1','','PK1IP_HUMAN',4838),(1523210,275001000,'Q14978','','NOLC1_HUMAN',4838),(1523211,274841000,'Q8IVT5','','KSR1_HUMAN',4838),(1523212,274831000,'O15347','','HMGB3_HUMAN',4838),(1523213,274818000,'CON_Q6IFZ6','','K2C1B_MOUSE',4838),(1523214,274652000,'O60669','','MOT2_HUMAN',4838),(1523215,272419000,'P00403','','COX2_HUMAN',4838),(1523216,272345000,'Q12931','','TRAP1_HUMAN',4838),(1523217,271464000,'P23381','','SYWC_HUMAN',4838),(1523218,271282000,'Q9NXW2','','DJB12_HUMAN',4838),(1523219,271016000,'Q58A45','','PAN3_HUMAN',4838),(1523220,270906000,'P36776','','LONM_HUMAN',4838),(1523221,270589000,'P61086','','UBE2K_HUMAN',4838),(1523222,269702000,'Q99460','','PSMD1_HUMAN',4838),(1523223,269100000,'Q06033','','ITIH3_HUMAN',4838),(1523224,268953000,'P20042','','IF2B_HUMAN',4838),(1523225,268436000,'P36871','','PGM1_HUMAN',4838),(1523226,268093000,'Q13435','','SF3B2_HUMAN',4838),(1523227,267868000,'Q6DN14','','MCTP1_HUMAN',4838),(1523228,267337000,'Q9UKM9','','RALY_HUMAN',4838),(1523229,266519000,'P08243','','ASNS_HUMAN',4838),(1523230,266163000,'P33993','','MCM7_HUMAN',4838),(1523231,266088000,'P15328','','FOLR1_HUMAN',4838),(1523232,265223000,'P35659','','DEK_HUMAN',4838),(1523233,264954000,'P38117','','ETFB_HUMAN',4838),(1523234,264885000,'O43242','','PSMD3_HUMAN',4838),(1523235,264393000,'P14324','','FPPS_HUMAN',4838),(1523236,264123000,'Q15056','','IF4H_HUMAN',4838),(1523237,263528000,'Q96QK1','','VPS35_HUMAN',4838),(1523238,263080000,'P30040','','ERP29_HUMAN',4838),(1523239,262700000,'P30153','','2AAA_HUMAN',4838),(1523240,262252000,'Q16576','','RBBP7_HUMAN',4838),(1523241,262154000,'P55084','','ECHB_HUMAN',4838),(1523242,261980000,'O14776','','TCRG1_HUMAN',4838),(1523243,261891000,'P13693','','TCTP_HUMAN',4838),(1523244,261512000,'O15067','','PUR4_HUMAN',4838),(1523245,261175000,'P61026','','RAB10_HUMAN',4838),(1523246,260928000,'P53396','','ACLY_HUMAN',4838),(1523247,260919000,'P54578','','UBP14_HUMAN',4838),(1523248,260631000,'Q16401','','PSMD5_HUMAN',4838),(1523249,259951000,'Q9UKD2','','MRT4_HUMAN',4838),(1523250,259328000,'Q9Y617','','SERC_HUMAN',4838),(1523251,259258000,'P61106','','RAB14_HUMAN',4838),(1523252,259020000,'P35579','','MYH9_HUMAN',4838),(1523253,258125000,'O43776','','SYNC_HUMAN',4838),(1523254,257601000,'O75935','','DCTN3_HUMAN',4838),(1523255,257429000,'P10620','','MGST1_HUMAN',4838),(1523256,257359000,'P20810','','ICAL_HUMAN',4838),(1523257,256565000,'Q14320','','FA50A_HUMAN',4838),(1523258,256052000,'P53621','','COPA_HUMAN',4838),(1523259,255488000,'P61254','','RL26_HUMAN',4838),(1523260,255486000,'Q16891','','MIC60_HUMAN',4838),(1523261,254989000,'Q96FQ6','','S10AG_HUMAN',4838),(1523262,254869000,'Q9UNH7','','SNX6_HUMAN',4838),(1523263,254566000,'Q69YH5','','CDCA2_HUMAN',4838),(1523264,254246000,'P16401','','H15_HUMAN',4838),(1523265,253058000,'Q96AG4','','LRC59_HUMAN',4838),(1523266,252783000,'Q9UN86','','G3BP2_HUMAN',4838),(1523267,252517000,'P36542','','ATPG_HUMAN',4838),(1523268,252306000,'P56192','','SYMC_HUMAN',4838),(1523269,251675000,'P55265','','DSRAD_HUMAN',4838),(1523270,251360000,'P38159','','RBMX_HUMAN',4838),(1523271,250540000,'P12429','','ANXA3_HUMAN',4838),(1523272,250183000,'Q92499','','DDX1_HUMAN',4838),(1523273,249828000,'P50395','','GDIB_HUMAN',4838),(1523274,248753000,'P40121','','CAPG_HUMAN',4838),(1523275,247991000,'Q06323','','PSME1_HUMAN',4838),(1523276,247280000,'Q04609','','FOLH1_HUMAN',4838),(1523277,246708000,'P55884','','EIF3B_HUMAN',4838),(1523278,246546000,'Q8N228','','SCML4_HUMAN',4838),(1523279,246313000,'O14929','','HAT1_HUMAN',4838),(1523280,246075000,'P35249','','RFC4_HUMAN',4838),(1523281,245656000,'Q9P0L0','','VAPA_HUMAN',4838),(1523282,245514000,'Q15063','','POSTN_HUMAN',4838),(1523283,245418000,'Q08J23','','NSUN2_HUMAN',4838),(1523284,244371000,'O43852','','CALU_HUMAN',4838),(1523285,243966000,'Q14152','','EIF3A_HUMAN',4838),(1523286,243431000,'P56537','','IF6_HUMAN',4838),(1523287,242373000,'P54819','','KAD2_HUMAN',4838),(1523288,241916000,'O00231','','PSD11_HUMAN',4838),(1523289,241868000,'P51659','','DHB4_HUMAN',4838),(1523290,241355000,'P31146','','COR1A_HUMAN',4838),(1523291,241236000,'P12814','','ACTN1_HUMAN',4838),(1523292,240912000,'Q8N1F7','','NUP93_HUMAN',4838),(1523293,240890000,'Q9UMS4','','PRP19_HUMAN',4838),(1523294,240404000,'Q9NZN5','','ARHGC_HUMAN',4838),(1523295,239749000,'P09874','','PARP1_HUMAN',4838),(1523296,239301000,'P17931','','LEG3_HUMAN',4838),(1523297,238575000,'P25054','','APC_HUMAN',4838),(1523298,238550000,'P60953','','CDC42_HUMAN',4838),(1523299,238414000,'Q8WUM4','','PDC6I_HUMAN',4838),(1523300,237709000,'Q9P281','','BAHC1_HUMAN',4838),(1523301,237620000,'Q92973','','TNPO1_HUMAN',4838),(1523302,237033000,'P31942','','HNRH3_HUMAN',4838),(1523303,236928000,'Q9UII2','','ATIF1_HUMAN',4838),(1523304,236017000,'O14976','','GAK_HUMAN',4838),(1523305,235725000,'Q01650','','LAT1_HUMAN',4838),(1523306,235172000,'P48066','','S6A11_HUMAN',4838),(1523307,231646000,'P30405','','PPIF_HUMAN',4838),(1523308,231412000,'P25789','','PSA4_HUMAN',4838),(1523309,231384000,'O76003','','GLRX3_HUMAN',4838),(1523310,231326000,'P58546','','MTPN_HUMAN',4838),(1523311,231190000,'Q16629','','SRSF7_HUMAN',4838),(1523312,231181000,'P09960','','LKHA4_HUMAN',4838),(1523313,230894000,'Q9NZ01','','TECR_HUMAN',4838),(1523314,230860000,'P46060','','RAGP1_HUMAN',4838),(1523315,230482000,'P07108','','ACBP_HUMAN',4838),(1523316,230283000,'O43760','','SNG2_HUMAN',4838),(1523317,230213000,'Q16543','','CDC37_HUMAN',4838),(1523318,230132000,'Q96L91','','EP400_HUMAN',4838),(1523319,230097000,'Q9BVC6','','TM109_HUMAN',4838),(1523320,230006000,'P51991','','ROA3_HUMAN',4838),(1523321,229454000,'P21912','','SDHB_HUMAN',4838),(1523322,229393000,'P08134','','RHOC_HUMAN',4838),(1523323,229218000,'Q9H4Z3','','CAPAM_HUMAN',4838),(1523324,229138000,'Q07666','','KHDR1_HUMAN',4838),(1523325,228723000,'P27816','','MAP4_HUMAN',4838),(1523326,228694000,'Q9BTE3','','MCMBP_HUMAN',4838),(1523327,227940000,'Q92930','','RAB8B_HUMAN',4838),(1523328,226926000,'Q13428','','TCOF_HUMAN',4838),(1523329,225948000,'O43813','','LANC1_HUMAN',4838),(1523330,224806000,'P47813','','IF1AX_HUMAN',4838),(1523331,224249000,'P09496','','CLCA_HUMAN',4838),(1523332,223812000,'P11413','','G6PD_HUMAN',4838),(1523333,223484000,'Q92522','','H1X_HUMAN',4838),(1523334,222862000,'P33316','','DUT_HUMAN',4838),(1523335,222838000,'P78406','','RAE1L_HUMAN',4838),(1523336,222442000,'Q96S06','','LMF1_HUMAN',4838),(1523337,222335000,'O75152','','ZC11A_HUMAN',4838),(1523338,221983000,'Q86V81','','THOC4_HUMAN',4838),(1523339,221528000,'O00291','','HIP1_HUMAN',4838),(1523340,221348000,'O75964','','ATP5L_HUMAN',4838),(1523341,220856000,'P07996','','TSP1_HUMAN',4838),(1523342,220249000,'O76021','','RL1D1_HUMAN',4838),(1523343,220221000,'Q9UKL0','','RCOR1_HUMAN',4838),(1523344,219410000,'P28331','','NDUS1_HUMAN',4838),(1523345,219078000,'P32004','','L1CAM_HUMAN',4838),(1523346,219041000,'P05556','','ITB1_HUMAN',4838),(1523347,218965000,'Q7Z7H5','','TMED4_HUMAN',4838),(1523348,218449000,'P49327','','FAS_HUMAN',4838),(1523349,218371000,'Q01130','','SRSF2_HUMAN',4838),(1523350,217756000,'P63279','','UBC9_HUMAN',4838),(1523351,217458000,'P31040','','SDHA_HUMAN',4838),(1523352,217315000,'Q13310','','PABP4_HUMAN',4838),(1523353,217050000,'Q04837','','SSBP_HUMAN',4838),(1523354,216681000,'P30740','','ILEU_HUMAN',4838),(1523355,216077000,'P42765','','THIM_HUMAN',4838),(1523356,215493000,'P08621','','RU17_HUMAN',4838),(1523357,215290000,'Q9BTE1','','DCTN5_HUMAN',4838),(1523358,214660000,'Q14444','','CAPR1_HUMAN',4838),(1523359,214073000,'Q8TCT9','','HM13_HUMAN',4838),(1523360,214042000,'Q13085','','ACACA_HUMAN',4838),(1523361,213938000,'Q14653','','IRF3_HUMAN',4838),(1523362,213783000,'Q9HD42','','CHM1A_HUMAN',4838),(1523363,213690000,'Q9BQB6','','VKOR1_HUMAN',4838),(1523364,212547000,'O95478','','NSA2_HUMAN',4838),(1523365,212370000,'P62879','','GBB2_HUMAN',4838),(1523366,211981000,'P49257','','LMAN1_HUMAN',4838),(1523367,211916000,'P62333','','PRS10_HUMAN',4838),(1523368,211081000,'Q9UHX1','','PUF60_HUMAN',4838),(1523369,210547000,'O95816','','BAG2_HUMAN',4838),(1523370,210347000,'Q9UNS2','','CSN3_HUMAN',4838),(1523371,210037000,'P16070','','CD44_HUMAN',4838),(1523372,209614000,'O43143','','DHX15_HUMAN',4838),(1523373,209132000,'P12268','','IMDH2_HUMAN',4838),(1523374,208182000,'Q9Y490','','TLN1_HUMAN',4838),(1523375,208117000,'Q9BUQ8','','DDX23_HUMAN',4838),(1523376,208039000,'Q99436','','PSB7_HUMAN',4838),(1523377,207873000,'P49189','','AL9A1_HUMAN',4838),(1523378,207730000,'P17844','','DDX5_HUMAN',4838),(1523379,207493000,'P41252','','SYIC_HUMAN',4838),(1523380,206077000,'P04040','','CATA_HUMAN',4838),(1523381,205888000,'P68366','','TBA4A_HUMAN',4838),(1523382,205680000,'Q8NCD3','','HJURP_HUMAN',4838),(1523383,205674000,'P31930','','QCR1_HUMAN',4838),(1523384,205374000,'Q7Z6Z7','','HUWE1_HUMAN',4838),(1523385,205128000,'P78330','','SERB_HUMAN',4838),(1523386,205062000,'P49755','','TMEDA_HUMAN',4838),(1523387,205024000,'P48047','','ATPO_HUMAN',4838),(1523388,204825000,'Q13478','','IL18R_HUMAN',4838),(1523389,204786000,'Q9BWS9','','CHID1_HUMAN',4838),(1523390,204729000,'O95336','','6PGL_HUMAN',4838),(1523391,204600000,'P04196','','HRG_HUMAN',4838),(1523392,204498000,'Q9NTI2','','AT8A2_HUMAN',4838),(1523393,204139000,'P14854','','CX6B1_HUMAN',4838),(1523394,203445000,'P55769','','NH2L1_HUMAN',4838),(1523395,203440000,'P52907','','CAZA1_HUMAN',4838),(1523396,203265000,'Q92504','','S39A7_HUMAN',4838),(1523397,203130000,'P52815','','RM12_HUMAN',4838),(1523398,203124000,'P47756','','CAPZB_HUMAN',4838),(1523399,203045000,'P62306','','RUXF_HUMAN',4838),(1523400,202881000,'Q15691','','MARE1_HUMAN',4838),(1523401,202272000,'P11766','','ADHX_HUMAN',4838),(1523402,202094000,'Q96P70','','IPO9_HUMAN',4838),(1523403,201970000,'P54136','','SYRC_HUMAN',4838),(1523404,201556000,'Q92841','','DDX17_HUMAN',4838),(1523405,201502000,'P35998','','PRS7_HUMAN',4838),(1523406,201173000,'Q8IWS0','','PHF6_HUMAN',4838),(1523407,201059000,'P17174','','AATC_HUMAN',4838),(1523408,199513000,'O75694','','NU155_HUMAN',4838),(1523409,198936000,'Q9Y4L1','','HYOU1_HUMAN',4838),(1523410,198844000,'P78310','','CXAR_HUMAN',4838),(1523411,198809000,'O00244','','ATOX1_HUMAN',4838),(1523412,198545000,'Q02790','','FKBP4_HUMAN',4838),(1523413,198538000,'Q92945','','FUBP2_HUMAN',4838),(1523414,198260000,'P07741','','APT_HUMAN',4838),(1523415,198243000,'P98161','','PKD1_HUMAN',4838),(1523416,197896000,'Q9Y3A5','','SBDS_HUMAN',4838),(1523417,197877000,'P00491','','PNPH_HUMAN',4838),(1523418,197786000,'Q96KR1','','ZFR_HUMAN',4838),(1523419,197659000,'P49321','','NASP_HUMAN',4838),(1523420,197620000,'Q9HCS5','','E41LA_HUMAN',4838),(1523421,197319000,'P06493','','CDK1_HUMAN',4838),(1523422,196981000,'P11940','','PABP1_HUMAN',4838),(1523423,196915000,'P30084','','ECHM_HUMAN',4838),(1523424,196615000,'Q50LG9','','LRC24_HUMAN',4838),(1523425,195343000,'P61088','','UBE2N_HUMAN',4838),(1523426,195096000,'P49915','','GUAA_HUMAN',4838),(1523427,195057000,'Q16836','','HCDH_HUMAN',4838),(1523428,194793000,'Q6NUK1','','SCMC1_HUMAN',4838),(1523429,194777000,'P33991','','MCM4_HUMAN',4838),(1523430,194529000,'P20618','','PSB1_HUMAN',4838),(1523431,194341000,'P25787','','PSA2_HUMAN',4838),(1523432,193996000,'Q9GZT3','','SLIRP_HUMAN',4838),(1523433,193887000,'Q7L1Q6','','5MP2_HUMAN',4838),(1523434,193773000,'P04843','','RPN1_HUMAN',4838),(1523435,193574000,'P19256','','LFA3_HUMAN',4838),(1523436,193544000,'P30520','','PURA2_HUMAN',4838),(1523437,192963000,'Q13838','','DX39B_HUMAN',4838),(1523438,192657000,'Q15046','','SYK_HUMAN',4838),(1523439,191576000,'P08754','','GNAI3_HUMAN',4838),(1523440,191575000,'Q9UL41','','PNMA3_HUMAN',4838),(1523441,191370000,'Q15370','','ELOB_HUMAN',4838),(1523442,190527000,'P62191','','PRS4_HUMAN',4838),(1523443,190246000,'Q8TEX9','','IPO4_HUMAN',4838),(1523444,190084000,'Q9UHD8','','SEPT9_HUMAN',4838),(1523445,189591000,'CON_P28800','','A2AP_BOVIN',4838),(1523446,189527000,'Q9P258','','RCC2_HUMAN',4838),(1523447,187917000,'Q00688','','FKBP3_HUMAN',4838),(1523448,187892000,'Q13162','','PRDX4_HUMAN',4838),(1523449,186215000,'P09012','','SNRPA_HUMAN',4838),(1523450,186157000,'E9PRG8','','CK098_HUMAN',4838),(1523451,185905000,'Q16555','','DPYL2_HUMAN',4838),(1523452,185300000,'Q99536','','VAT1_HUMAN',4838),(1523453,185204000,'O43252','','PAPS1_HUMAN',4838),(1523454,184663000,'Q9Y305','','ACOT9_HUMAN',4838),(1523455,184538000,'Q15785','','TOM34_HUMAN',4838),(1523456,183636000,'P62314','','SMD1_HUMAN',4838),(1523457,183622000,'Q9P2P6','','STAR9_HUMAN',4838),(1523458,183475000,'P25205','','MCM3_HUMAN',4838),(1523459,182895000,'Q96IX5','','ATPMK_HUMAN',4838),(1523460,182895000,'P11177','','ODPB_HUMAN',4838),(1523461,182753000,'Q9Y3F4','','STRAP_HUMAN',4838),(1523462,182408000,'Q6PGP7','','TTC37_HUMAN',4838),(1523463,182240000,'Q9UEF7','','KLOT_HUMAN',4838),(1523464,181452000,'P26583','','HMGB2_HUMAN',4838),(1523465,181175000,'O60841','','IF2P_HUMAN',4838),(1523466,180899000,'P21980','','TGM2_HUMAN',4838),(1523467,180458000,'O75953','','DNJB5_HUMAN',4838),(1523468,180235000,'Q13464','','ROCK1_HUMAN',4838),(1523469,180219000,'Q16531','','DDB1_HUMAN',4838),(1523470,180127000,'Q9NQR4','','NIT2_HUMAN',4838),(1523471,179609000,'Q99733','','NP1L4_HUMAN',4838),(1523472,179148000,'Q8N5K1','','CISD2_HUMAN',4838),(1523473,178416000,'P02795','','MT2_HUMAN',4838),(1523474,178395000,'Q2VY69','','ZN284_HUMAN',4838),(1523475,178392000,'P84090','','ERH_HUMAN',4838),(1523476,178246000,'Q9NXB0','','MKS1_HUMAN',4838),(1523477,177533000,'Q6PKG0','','LARP1_HUMAN',4838),(1523478,177422000,'Q15050','','RRS1_HUMAN',4838),(1523479,177398000,'Q13148','','TADBP_HUMAN',4838),(1523480,176981000,'Q96CW1','','AP2M1_HUMAN',4838),(1523481,176594000,'P09669','','COX6C_HUMAN',4838),(1523482,176433000,'P00568','','KAD1_HUMAN',4838),(1523483,176400000,'P51149','','RAB7A_HUMAN',4838),(1523484,176354000,'Q9NY12','','GAR1_HUMAN',4838),(1523485,176348000,'P62273','','RS29_HUMAN',4838),(1523486,176336000,'Q86UP2','','KTN1_HUMAN',4838),(1523487,176313000,'Q9Y696','','CLIC4_HUMAN',4838),(1523488,175881000,'P40261','','NNMT_HUMAN',4838),(1523489,175342000,'Q14247','','SRC8_HUMAN',4838),(1523490,175092000,'Q9NR99','','MXRA5_HUMAN',4838),(1523491,174929000,'Q14134','','TRI29_HUMAN',4838),(1523492,174836000,'Q9P289','','STK26_HUMAN',4838),(1523493,174801000,'P62195','','PRS8_HUMAN',4838),(1523494,174685000,'Q9HC38','','GLOD4_HUMAN',4838),(1523495,174314000,'P05455','','LA_HUMAN',4838),(1523496,173620000,'Q96SB4','','SRPK1_HUMAN',4838),(1523497,173114000,'Q8IY85','','EFC13_HUMAN',4838),(1523498,172996000,'Q15843','','NEDD8_HUMAN',4838),(1523499,172901000,'P25325','','THTM_HUMAN',4838),(1523500,172760000,'Q14C86','','GAPD1_HUMAN',4838),(1523501,172538000,'Q9ULD0','','OGDHL_HUMAN',4838),(1523502,172326000,'Q13423','','NNTM_HUMAN',4838),(1523503,172081000,'P36957','','ODO2_HUMAN',4838),(1523504,171766000,'Q99715','','COCA1_HUMAN',4838),(1523505,171571000,'P56715','','RP1_HUMAN',4838),(1523506,170251000,'P62633','','CNBP_HUMAN',4838),(1523507,169780000,'Q9NSD9','','SYFB_HUMAN',4838),(1523508,169135000,'O43615','','TIM44_HUMAN',4838),(1523509,169054000,'Q01081','','U2AF1_HUMAN',4838),(1523510,168664000,'P31150','','GDIA_HUMAN',4838),(1523511,168260000,'P40939','','ECHA_HUMAN',4838),(1523512,167860000,'Q96T76','','MMS19_HUMAN',4838),(1523513,167225000,'M0R2J8','','DCDC1_HUMAN',4838),(1523514,166754000,'P01023','','A2MG_HUMAN',4838),(1523515,166691000,'P05114','','HMGN1_HUMAN',4838),(1523516,166410000,'O60701','','UGDH_HUMAN',4838),(1523517,166392000,'Q7Z6E9','','RBBP6_HUMAN',4838),(1523518,166154000,'Q9Y230','','RUVB2_HUMAN',4838),(1523519,165858000,'Q7Z5J8','','ANKAR_HUMAN',4838),(1523520,165304000,'Q9UG63','','ABCF2_HUMAN',4838),(1523521,165274000,'O75616','','ERAL1_HUMAN',4838),(1523522,165266000,'Q7Z589','','EMSY_HUMAN',4838),(1523523,164979000,'Q03252','','LMNB2_HUMAN',4838),(1523524,164940000,'P52565','','GDIR1_HUMAN',4838),(1523525,164491000,'O75947','','ATP5H_HUMAN',4838),(1523526,164045000,'Q9UL46','','PSME2_HUMAN',4838),(1523527,163742000,'O14818','','PSA7_HUMAN',4838),(1523528,163366000,'B4DYI2','','S31C2_HUMAN',4838),(1523529,163277000,'Q9NR31','','SAR1A_HUMAN',4838),(1523530,162523000,'Q9BRA2','','TXD17_HUMAN',4838),(1523531,162362000,'Q14721','','KCNB1_HUMAN',4838),(1523532,161864000,'O96000','','NDUBA_HUMAN',4838),(1523533,161689000,'O00410','','IPO5_HUMAN',4838),(1523534,161522000,'P18754','','RCC1_HUMAN',4838),(1523535,160601000,'Q12857','','NFIA_HUMAN',4838),(1523536,160546000,'P60510','','PP4C_HUMAN',4838),(1523537,160342000,'O60832','','DKC1_HUMAN',4838),(1523538,160144000,'P24752','','THIL_HUMAN',4838),(1523539,160112000,'P19387','','RPB3_HUMAN',4838),(1523540,159616000,'P31939','','PUR9_HUMAN',4838),(1523541,159529000,'CON_Q9TT36','','THBG_BOVIN',4838),(1523542,159499000,'Q6NUJ5','','PWP2B_HUMAN',4838),(1523543,159263000,'P43304','','GPDM_HUMAN',4838),(1523544,159225000,'Q13151','','ROA0_HUMAN',4838),(1523545,157768000,'Q03112','','MECOM_HUMAN',4838),(1523546,157351000,'Q9BQ61','','TRIR_HUMAN',4838),(1523547,157196000,'O60664','','PLIN3_HUMAN',4838),(1523548,156912000,'O43169','','CYB5B_HUMAN',4838),(1523549,156817000,'P17655','','CAN2_HUMAN',4838),(1523550,156545000,'O75083','','WDR1_HUMAN',4838),(1523551,155831000,'O43684','','BUB3_HUMAN',4838),(1523552,155584000,'P48637','','GSHB_HUMAN',4838),(1523553,154683000,'Q15717','','ELAV1_HUMAN',4838),(1523554,154159000,'Q9Y6C9','','MTCH2_HUMAN',4838),(1523555,153637000,'Q14764','','MVP_HUMAN',4838),(1523556,153237000,'O60264','','SMCA5_HUMAN',4838),(1523557,153142000,'Q9Y2Z0','','SGT1_HUMAN',4838),(1523558,152876000,'P50416','','CPT1A_HUMAN',4838),(1523559,152678000,'P16152','','CBR1_HUMAN',4838),(1523560,152521000,'Q8N5Y8','','PAR16_HUMAN',4838),(1523561,152043000,'Q969Q0','','RL36L_HUMAN',4838),(1523562,151907000,'P12277','','KCRB_HUMAN',4838),(1523563,151672000,'Q8NDH2','','CC168_HUMAN',4838),(1523564,151651000,'P68036','','UB2L3_HUMAN',4838),(1523565,151573000,'P29353','','SHC1_HUMAN',4838),(1523566,151084000,'P61160','','ARP2_HUMAN',4838),(1523567,150805000,'P12236','','ADT3_HUMAN',4838),(1523568,149641000,'P23921','','RIR1_HUMAN',4838),(1523569,148350000,'Q9BT25','','HAUS8_HUMAN',4838),(1523570,148330000,'Q9Y2L1','','RRP44_HUMAN',4838),(1523571,148262000,'Q9BYB0','','SHAN3_HUMAN',4838),(1523572,148119000,'Q9NV31','','IMP3_HUMAN',4838),(1523573,148094000,'Q14498','','RBM39_HUMAN',4838),(1523574,147918000,'O95232','','LC7L3_HUMAN',4838),(1523575,147869000,'Q96S55','','WRIP1_HUMAN',4838),(1523576,147785000,'O60306','','AQR_HUMAN',4838),(1523577,147743000,'Q96AY3','','FKB10_HUMAN',4838),(1523578,147665000,'O75937','','DNJC8_HUMAN',4838),(1523579,147573000,'O43295','','SRGP3_HUMAN',4838),(1523580,147470000,'Q15369','','ELOC_HUMAN',4838),(1523581,147450000,'Q9NX63','','MIC19_HUMAN',4838),(1523582,146665000,'Q12797','','ASPH_HUMAN',4838),(1523583,146379000,'P04632','','CPNS1_HUMAN',4838),(1523584,146227000,'P49908','','SEPP1_HUMAN',4838),(1523585,146101000,'Q9UQE7','','SMC3_HUMAN',4838),(1523586,145902000,'Q9BXL7','','CAR11_HUMAN',4838),(1523587,145800000,'Q9Y2B0','','CNPY2_HUMAN',4838),(1523588,145593000,'P04844','','RPN2_HUMAN',4838),(1523589,144562000,'Q8NI22','','MCFD2_HUMAN',4838),(1523590,144182000,'Q9Y224','','RTRAF_HUMAN',4838),(1523591,143852000,'P04179','','SODM_HUMAN',4838),(1523592,143838000,'P62140','','PP1B_HUMAN',4838),(1523593,143657000,'P38919','','IF4A3_HUMAN',4838),(1523594,143239000,'Q9UNX4','','WDR3_HUMAN',4838),(1523595,143230000,'Q07960','','RHG01_HUMAN',4838),(1523596,143160000,'Q9NYL9','','TMOD3_HUMAN',4838),(1523597,142833000,'P12081','','HARS1_HUMAN',4838),(1523598,142773000,'Q14919','','NC2A_HUMAN',4838),(1523599,142521000,'Q92747','','ARC1A_HUMAN',4838),(1523600,142395000,'Q13347','','EIF3I_HUMAN',4838),(1523601,142392000,'P61019','','RAB2A_HUMAN',4838),(1523602,142308000,'P25685','','DNJB1_HUMAN',4838),(1523603,142300000,'Q9H0U4','','RAB1B_HUMAN',4838),(1523604,142193000,'P54727','','RD23B_HUMAN',4838),(1523605,141978000,'P56134','','ATPK_HUMAN',4838),(1523606,141773000,'Q8TEA8','','DTD1_HUMAN',4838),(1523607,141525000,'Q9H832','','UBE2Z_HUMAN',4838),(1523608,141394000,'Q8NBJ5','','GT251_HUMAN',4838),(1523609,141316000,'P30047','','GFRP_HUMAN',4838),(1523610,140578000,'P61081','','UBC12_HUMAN',4838),(1523611,140249000,'Q86VP6','','CAND1_HUMAN',4838),(1523612,140082000,'O00115','','DNS2A_HUMAN',4838),(1523613,139726000,'Q14566','','MCM6_HUMAN',4838),(1523614,139672000,'P13473','','LAMP2_HUMAN',4838),(1523615,139670000,'Q9H6F5','','CCD86_HUMAN',4838),(1523616,139494000,'Q9NTK5','','OLA1_HUMAN',4838),(1523617,139307000,'Q3V6T2','','GRDN_HUMAN',4838),(1523618,139271000,'Q9Y5S9','','RBM8A_HUMAN',4838),(1523619,138808000,'Q96I24','','FUBP3_HUMAN',4838),(1523620,138001000,'Q08945','','SSRP1_HUMAN',4838),(1523621,137792000,'O95777','','LSM8_HUMAN',4838),(1523622,137582000,'P42330','','AK1C3_HUMAN',4838),(1523623,137295000,'P09234','','RU1C_HUMAN',4838),(1523624,137143000,'Q9Y383','','LC7L2_HUMAN',4838),(1523625,137138000,'Q15758','','AAAT_HUMAN',4838),(1523626,137112000,'Q8TDN6','','BRX1_HUMAN',4838),(1523627,136881000,'Q13404','','UB2V1_HUMAN',4838),(1523628,136566000,'Q14847','','LASP1_HUMAN',4838),(1523629,136233000,'O14745','','NHRF1_HUMAN',4838),(1523630,136190000,'O15371','','EIF3D_HUMAN',4838),(1523631,136080000,'P21291','','CSRP1_HUMAN',4838),(1523632,136016000,'O00116','','ADAS_HUMAN',4838),(1523633,135910000,'Q9Y277','','VDAC3_HUMAN',4838),(1523634,135892000,'Q13409','','DC1I2_HUMAN',4838),(1523635,135769000,'Q9BY44','','EIF2A_HUMAN',4838),(1523636,135616000,'Q99471','','PFD5_HUMAN',4838),(1523637,135567000,'P63151','','2ABA_HUMAN',4838),(1523638,135368000,'P40937','','RFC5_HUMAN',4838),(1523639,135136000,'P51572','','BAP31_HUMAN',4838),(1523640,135056000,'Q9NQ88','','TIGAR_HUMAN',4838),(1523641,135050000,'P06737','','PYGL_HUMAN',4838),(1523642,134955000,'O94875','','SRBS2_HUMAN',4838),(1523643,134848000,'Q9BQG0','','MBB1A_HUMAN',4838),(1523644,134780000,'Q14839','','CHD4_HUMAN',4838),(1523645,134701000,'Q96K17','','BT3L4_HUMAN',4838),(1523646,134561000,'Q9Y3I0','','RTCB_HUMAN',4838),(1523647,134436000,'Q00796','','DHSO_HUMAN',4838),(1523648,134216000,'Q9NZM5','','NOP53_HUMAN',4838),(1523649,134126000,'O00193','','SMAP_HUMAN',4838),(1523650,134060000,'Q16698','','DECR_HUMAN',4838),(1523651,134018000,'O75347','','TBCA_HUMAN',4838),(1523652,133974000,'O60488','','ACSL4_HUMAN',4838),(1523653,133626000,'O43670','','ZN207_HUMAN',4838),(1523654,133594000,'Q96TA1','','NIBA2_HUMAN',4838),(1523655,133326000,'Q9NPJ3','','ACO13_HUMAN',4838),(1523656,133149000,'Q14696','','MESD_HUMAN',4838),(1523657,132305000,'O14544','','SOCS6_HUMAN',4838),(1523658,131986000,'Q96SR6','','ZN382_HUMAN',4838),(1523659,131973000,'P78316','','NOP14_HUMAN',4838),(1523660,131465000,'Q9HB71','','CYBP_HUMAN',4838),(1523661,131192000,'Q9UBS4','','DJB11_HUMAN',4838),(1523662,130871000,'P12270','','TPR_HUMAN',4838),(1523663,130823000,'O60256','','KPRB_HUMAN',4838),(1523664,130560000,'Q96PK6','','RBM14_HUMAN',4838),(1523665,130460000,'O00567','','NOP56_HUMAN',4838),(1523666,130433000,'O75417','','DPOLQ_HUMAN',4838),(1523667,130278000,'Q13523','','PRP4B_HUMAN',4838),(1523668,130038000,'P61289','','PSME3_HUMAN',4838),(1523669,129925000,'Q9UHV9','','PFD2_HUMAN',4838),(1523670,129840000,'P10909','','CLUS_HUMAN',4838),(1523671,129222000,'P00492','','HPRT_HUMAN',4838),(1523672,129042000,'P63167','','DYL1_HUMAN',4838),(1523673,128904000,'Q7KZF4','','SND1_HUMAN',4838),(1523674,128813000,'Q7L014','','DDX46_HUMAN',4838),(1523675,128539000,'P16615','','AT2A2_HUMAN',4838),(1523676,128531000,'Q13247','','SRSF6_HUMAN',4838),(1523677,128360000,'Q9BZZ5','','API5_HUMAN',4838),(1523678,127864000,'Q99873','','ANM1_HUMAN',4838),(1523679,127761000,'CON_Q28065','','C4BPA_BOVIN',4838),(1523680,127666000,'O00233','','PSMD9_HUMAN',4838),(1523681,127485000,'P35241','','RADI_HUMAN',4838),(1523682,127478000,'Q9H3K6','','BOLA2_HUMAN',4838),(1523683,127245000,'Q9Y4E8','','UBP15_HUMAN',4838),(1523684,127178000,'P17812','','PYRG1_HUMAN',4838),(1523685,126861000,'O00571','','DDX3X_HUMAN',4838),(1523686,126837000,'O75153','','CLU_HUMAN',4838),(1523687,125716000,'P17568','','NDUB7_HUMAN',4838),(1523688,125624000,'P08579','','RU2B_HUMAN',4838),(1523689,124708000,'Q14980','','NUMA1_HUMAN',4838),(1523690,124465000,'Q9P2N5','','RBM27_HUMAN',4838),(1523691,124281000,'P09661','','RU2A_HUMAN',4838),(1523692,123658000,'Q9UBM7','','DHCR7_HUMAN',4838),(1523693,123552000,'Q9NZM1','','MYOF_HUMAN',4838),(1523694,123444000,'O75223','','GGCT_HUMAN',4838),(1523695,123096000,'A8K7I4','','CLCA1_HUMAN',4838),(1523696,122999000,'Q16822','','PCKGM_HUMAN',4838),(1523697,122037000,'Q9HCU5','','PREB_HUMAN',4838),(1523698,121979000,'Q9NY33','','DPP3_HUMAN',4838),(1523699,121481000,'Q86TU7','','SETD3_HUMAN',4838),(1523700,121248000,'Q8TDY2','','RBCC1_HUMAN',4838),(1523701,121220000,'P08574','','CY1_HUMAN',4838),(1523702,121015000,'Q9UQ35','','SRRM2_HUMAN',4838),(1523703,120985000,'Q14683','','SMC1A_HUMAN',4838),(1523704,120855000,'Q13155','','AIMP2_HUMAN',4838),(1523705,120616000,'Q53EL6','','PDCD4_HUMAN',4838),(1523706,120615000,'Q9Y2X3','','NOP58_HUMAN',4838),(1523707,120347000,'B7ZC32','','KIF28_HUMAN',4838),(1523708,120167000,'P53597','','SUCA_HUMAN',4838),(1523709,119984000,'P48723','','HSP13_HUMAN',4838),(1523710,119739000,'P42167','','LAP2B_HUMAN',4838),(1523711,119588000,'O95057','','DIRA1_HUMAN',4838),(1523712,119569000,'P35520','','CBS_HUMAN',4838),(1523713,119263000,'P78347','','GTF2I_HUMAN',4838),(1523714,119111000,'Q12904','','AIMP1_HUMAN',4838),(1523715,119106000,'Q8WW59','','SPRY4_HUMAN',4838),(1523716,118848000,'Q9C0D4','','Z518B_HUMAN',4838),(1523717,118431000,'O75489','','NDUS3_HUMAN',4838),(1523718,118221000,'P49419','','AL7A1_HUMAN',4838),(1523719,118220000,'P20645','','MPRD_HUMAN',4838),(1523720,117831000,'Q9Y2T3','','GUAD_HUMAN',4838),(1523721,117583000,'P30046','','DOPD_HUMAN',4838),(1523722,117559000,'Q6P2E9','','EDC4_HUMAN',4838),(1523723,117463000,'O75608','','LYPA1_HUMAN',4838),(1523724,117275000,'O15305','','PMM2_HUMAN',4838),(1523725,117270000,'Q9NZQ7','','PD1L1_HUMAN',4838),(1523726,116960000,'O14828','','SCAM3_HUMAN',4838),(1523727,116791000,'Q99729','','ROAA_HUMAN',4838),(1523728,116591000,'P35269','','T2FA_HUMAN',4838),(1523729,116535000,'Q9Y2W1','','TR150_HUMAN',4838),(1523730,116202000,'P46013','','KI67_HUMAN',4838),(1523731,115938000,'O15212','','PFD6_HUMAN',4838),(1523732,115497000,'P19827','','ITIH1_HUMAN',4838),(1523733,115339000,'Q7RTV0','','PHF5A_HUMAN',4838),(1523734,114586000,'P54886','','P5CS_HUMAN',4838),(1523735,114474000,'P28074','','PSB5_HUMAN',4838),(1523736,114375000,'O15144','','ARPC2_HUMAN',4838),(1523737,114354000,'Q13185','','CBX3_HUMAN',4838),(1523738,114322000,'Q9NRG0','','CHRC1_HUMAN',4838),(1523739,114263000,'Q99848','','EBP2_HUMAN',4838),(1523740,114171000,'P07203','','GPX1_HUMAN',4838),(1523741,114134000,'Q14244','','MAP7_HUMAN',4838),(1523742,114115000,'P49736','','MCM2_HUMAN',4838),(1523743,114091000,'O60825','','F262_HUMAN',4838),(1523744,113946000,'P14868','','SYDC_HUMAN',4838),(1523745,113854000,'Q5FWE3','','PRRT3_HUMAN',4838),(1523746,113843000,'P35237','','SPB6_HUMAN',4838),(1523747,113611000,'Q9BXP5','','SRRT_HUMAN',4838),(1523748,113412000,'Q86UP3','','ZFHX4_HUMAN',4838),(1523749,113347000,'P62310','','LSM3_HUMAN',4838),(1523750,113119000,'O00170','','AIP_HUMAN',4838),(1523751,112932000,'P24666','','PPAC_HUMAN',4838),(1523752,112917000,'Q9UKY7','','CDV3_HUMAN',4838),(1523753,112694000,'CON_P81644','','APOA2_BOVIN',4838),(1523754,112554000,'P78562','','PHEX_HUMAN',4838),(1523755,112551000,'P19623','','SPEE_HUMAN',4838),(1523756,112238000,'Q15029','','U5S1_HUMAN',4838),(1523757,111942000,'P60228','','EIF3E_HUMAN',4838),(1523758,111915000,'Q9UNE7','','CHIP_HUMAN',4838),(1523759,108694000,'CON_E1BF81','','CBG_BOVIN',4838),(1523760,101611000,'CON_P41361','','ANT3_BOVIN',4838),(1523761,98515900,'CON_Q29RQ1','','CO7_BOVIN',4838),(1523762,86524000,'CON_Q05443','','LUM_BOVIN',4838),(1523763,74974300,'CON_P02676','','FIBB_BOVIN',4838),(1523764,67873700,'CON_Q03247','','APOE_BOVIN',4838),(1523765,63621300,'CON_Q9N2I2','','IPSP_BOVIN',4838),(1523766,57865100,'CON_P17697','','CLUS_BOVIN',4838),(1523767,41800200,'CON_Q95M17','','CHIA_BOVIN',4838),(1523768,39932500,'CON_P01044','','KNG1_BOVIN',4838),(1523769,36877600,'CON_Q3MHN2','','CO9_BOVIN',4838),(1523770,16618900,'CON_P17690','','APOH_BOVIN',4838),(1523771,13671900,'CON_Q28107','','FA5_BOVIN',4838),(1523772,9212570,'CON_P07224','','PROS_BOVIN',4838),(1545248,13390500000,'P02647','','APOA1_HUMAN',4870),(1545249,10261700000,'P02787','','TRFE_HUMAN',4870),(1545250,9200570000,'P01834','','IGKC_HUMAN',4870),(1545251,9101950000,'P00738','','HPT_HUMAN',4870),(1545252,6648880000,'P01009','','A1AT_HUMAN',4870),(1545253,6220500000,'P02679','','FIBG_HUMAN',4870),(1545254,4795470000,'P02652','','APOA2_HUMAN',4870),(1545255,4545240000,'P02675','','FIBB_HUMAN',4870),(1545256,3928630000,'CON_P15636','','API_ACHLY',4870),(1545257,3776130000,'P01876','','IGHA1_HUMAN',4870),(1545258,3601800000,'P02671','','FIBA_HUMAN',4870),(1545259,3281920000,'P01023','','A2MG_HUMAN',4870),(1545260,2378050000,'P01024','','CO3_HUMAN',4870),(1545261,2339560000,'P02763','','A1AG1_HUMAN',4870),(1545262,2320460000,'P40938','','RFC3_HUMAN',4870),(1545263,1907870000,'P02790','','HEMO_HUMAN',4870),(1545264,1690980000,'Q96SN8','','CK5P2_HUMAN',4870),(1545265,1658980000,'P02774','','VTDB_HUMAN',4870),(1545266,1601910000,'P01860','','IGHG3_HUMAN',4870),(1545267,1591320000,'P02765','','FETUA_HUMAN',4870),(1545268,1446170000,'P01871','','IGHM_HUMAN',4870),(1545269,1439430000,'P02749','','APOH_HUMAN',4870),(1545270,1413680000,'CON_P00761','','TRYP_PIG',4870),(1545271,1253040000,'Q13507','','TRPC3_HUMAN',4870),(1545272,1231810000,'P19652','','A1AG2_HUMAN',4870),(1545273,1180150000,'P01861','','IGHG4_HUMAN',4870),(1545274,1011050000,'P00450','','CERU_HUMAN',4870),(1545275,894615000,'P02656','','APOC3_HUMAN',4870),(1545276,848306000,'P01859','','IGHG2_HUMAN',4870),(1545277,836172000,'P00751','','CFAB_HUMAN',4870),(1545278,711506000,'P01011','','AACT_HUMAN',4870),(1545279,702323000,'P22680','','CP7A1_HUMAN',4870),(1545280,688106000,'P04004','','VTNC_HUMAN',4870),(1545281,686717000,'P00734','','THRB_HUMAN',4870),(1545282,686701000,'P19823','','ITIH2_HUMAN',4870),(1545283,678007000,'P01042','','KNG1_HUMAN',4870),(1545284,633678000,'P08603','','CFAH_HUMAN',4870),(1545285,584456000,'P02654','','APOC1_HUMAN',4870),(1545286,545771000,'Q92791','','SC65_HUMAN',4870),(1545287,543050000,'P00747','','PLMN_HUMAN',4870),(1545288,507634000,'P04003','','C4BPA_HUMAN',4870),(1545289,472454000,'P04217','','A1BG_HUMAN',4870),(1545290,442576000,'P04114','','APOB_HUMAN',4870),(1545291,425171000,'P04196','','HRG_HUMAN',4870),(1545292,420675000,'Q14624','','ITIH4_HUMAN',4870),(1545293,407426000,'P05155','','IC1_HUMAN',4870),(1545294,380328000,'P02760','','AMBP_HUMAN',4870),(1545295,363930000,'Q5PRF9','','SMAG2_HUMAN',4870),(1545296,360796000,'P35542','','SAA4_HUMAN',4870),(1545297,357440000,'P06727','','APOA4_HUMAN',4870),(1545298,354252000,'Q5T5P2','','SKT_HUMAN',4870),(1545299,335991000,'P06312','','KV401_HUMAN',4870),(1545300,326114000,'Q9NWS1','','PARI_HUMAN',4870),(1545301,307173000,'P02655','','APOC2_HUMAN',4870),(1545302,297379000,'P10909','','CLUS_HUMAN',4870),(1545303,293807000,'P19827','','ITIH1_HUMAN',4870),(1545304,284083000,'P05546','','HEP2_HUMAN',4870),(1545305,275162000,'P01008','','ANT3_HUMAN',4870),(1545306,265031000,'P01780','','HV307_HUMAN',4870),(1545307,260675000,'P39086','','GRIK1_HUMAN',4870),(1545308,255076000,'P02751','','FINC_HUMAN',4870),(1545309,235371000,'P00387','','NB5R3_HUMAN',4870),(1545310,216308000,'P27169','','PON1_HUMAN',4870),(1545311,205402000,'B4DU55','','ZN879_HUMAN',4870),(1545312,178239000,'Q9NQW7','','XPP1_HUMAN',4870),(1545313,175432000,'P14543','','NID1_HUMAN',4870),(1545314,172868000,'CON_P15497','','APOA1_BOVIN',4870),(1545315,168130000,'Q6ZN30','','BNC2_HUMAN',4870),(1545316,166315000,'O60522','','TDRD6_HUMAN',4870),(1545317,164519000,'Q9UPN3','','MACF1_HUMAN',4870),(1545318,154471000,'P08697','','A2AP_HUMAN',4870),(1545319,152236000,'P06396','','GELS_HUMAN',4870),(1545320,151698000,'P02766','','TTHY_HUMAN',4870),(1545321,140648000,'O95803','','NDST3_HUMAN',4870),(1545322,138791000,'Q6UVK1','','CSPG4_HUMAN',4870),(1545323,137428000,'P01031','','CO5_HUMAN',4870),(1545324,136241000,'Q9H1Y0','','ATG5_HUMAN',4870),(1545325,136193000,'P02746','','C1QB_HUMAN',4870),(1545326,130943000,'P51610','','HCFC1_HUMAN',4870),(1545327,124309000,'Q6Q759','','SPG17_HUMAN',4870),(1545328,124125000,'P00739','','HPTR_HUMAN',4870),(1545329,123051000,'P02753','','RET4_HUMAN',4870),(1545330,119552000,'Q14966','','ZN638_HUMAN',4870),(1545331,116971000,'P01019','','ANGT_HUMAN',4870),(1545332,116386000,'P05090','','APOD_HUMAN',4870),(1545333,116048000,'P00748','','FA12_HUMAN',4870),(1545334,111655000,'P01591','','IGJ_HUMAN',4870),(1545335,103173000,'P35251','','RFC1_HUMAN',4870),(1545336,102729000,'P43652','','AFAM_HUMAN',4870),(1545337,101659000,'P02649','','APOE_HUMAN',4870),(1545338,99948800,'Q9UIG0','','BAZ1B_HUMAN',4870),(1545339,96382500,'P0C0L5','','CO4B_HUMAN',4870),(1545340,93145800,'O43866','','CD5L_HUMAN',4870),(1545341,91937300,'Q86XI8','','ZSWM9_HUMAN',4870),(1545342,90670400,'Q15911','','ZFHX3_HUMAN',4870),(1545343,87840100,'Q4V348','','Z658B_HUMAN',4870),(1545344,85150400,'A0A0J9YX35','','HV64D_HUMAN',4870),(1545345,83835200,'P02747','','C1QC_HUMAN',4870),(1545346,76740600,'P00736','','C1R_HUMAN',4870),(1545347,76655100,'P0DOX3','','IGD_HUMAN',4870),(1545348,74592700,'P69905','','HBA_HUMAN',4870),(1545349,72841100,'Q96PD5','','PGRP2_HUMAN',4870),(1545350,70510800,'P02750','','A2GL_HUMAN',4870),(1545351,69739900,'P05156','','CFAI_HUMAN',4870),(1545352,69482200,'P02748','','CO9_HUMAN',4870),(1545353,69165100,'P07358','','CO8B_HUMAN',4870),(1545354,66567100,'P02743','','SAMP_HUMAN',4870),(1545355,63735000,'P05543','','THBG_HUMAN',4870),(1545356,61314200,'A0A075B6H7','','KV37_HUMAN',4870),(1545357,60049900,'Q15149','','PLEC_HUMAN',4870),(1545358,58493800,'P03952','','KLKB1_HUMAN',4870),(1545359,57703400,'CON_P02769','','ALBU_BOVIN',4870),(1545360,55664300,'P10643','','CO7_HUMAN',4870),(1545361,55547800,'P36955','','PEDF_HUMAN',4870),(1545362,53393800,'P09871','','C1S_HUMAN',4870),(1545363,51013500,'Q06033','','ITIH3_HUMAN',4870),(1545364,48595100,'P01714','','LV319_HUMAN',4870),(1545365,48385300,'P02745','','C1QA_HUMAN',4870),(1545366,47106400,'P55196','','AFAD_HUMAN',4870),(1545367,46853300,'P68871','','HBB_HUMAN',4870),(1545368,46662900,'P0DOX2','','IGA2_HUMAN',4870),(1545369,44756700,'P13671','','CO6_HUMAN',4870),(1545370,43394500,'P07357','','CO8A_HUMAN',4870),(1545371,42705400,'Q96RR1','','PEO1_HUMAN',4870),(1545372,42635600,'Q9UBG0','','MRC2_HUMAN',4870),(1545373,39587700,'P08185','','CBG_HUMAN',4870),(1545374,39465400,'O95445','','APOM_HUMAN',4870),(1545375,39388600,'P25311','','ZA2G_HUMAN',4870),(1545376,37859300,'O75781','','PALM_HUMAN',4870),(1545377,36427300,'P07360','','CO8G_HUMAN',4870),(1545378,35019100,'P22792','','CPN2_HUMAN',4870),(1545379,33330800,'O14978','','ZN263_HUMAN',4870),(1545380,32592500,'P51884','','LUM_HUMAN',4870),(1545381,31217000,'CON_Q2UVX4','','CO3_BOVIN',4870),(1545382,30292000,'A0A0A0MS15','','HV349_HUMAN',4870),(1545383,28304400,'P01704','','LV214_HUMAN',4870),(1545384,27706900,'O14791','','APOL1_HUMAN',4870),(1545385,27055300,'P20851','','C4BPB_HUMAN',4870),(1545386,26708200,'P22352','','GPX3_HUMAN',4870),(1545387,25710000,'P61769','','B2MG_HUMAN',4870),(1545388,25399600,'Q14520','','HABP2_HUMAN',4870),(1545389,25159800,'P00488','','F13A_HUMAN',4870),(1545390,24543300,'P29622','','KAIN_HUMAN',4870),(1545391,23810600,'P08519','','APOA_HUMAN',4870),(1545392,22522000,'P01619','','KV320_HUMAN',4870),(1545393,20616300,'Q96FV0','','LRC46_HUMAN',4870),(1545394,20438100,'Q68DC2','','ANKS6_HUMAN',4870),(1545395,20308600,'A0A0B4J1V0','','HV315_HUMAN',4870),(1545396,19819900,'Q8N3Y3','','LARG2_HUMAN',4870),(1545397,19565300,'P15169','','CBPN_HUMAN',4870),(1545398,17211800,'Q13797','','ITA9_HUMAN',4870),(1545399,16927300,'P12107','','COBA1_HUMAN',4870),(1545400,16740900,'P55289','','CAD12_HUMAN',4870),(1545401,16714600,'P00742','','FA10_HUMAN',4870),(1545402,16132100,'O75882','','ATRN_HUMAN',4870),(1545403,15643100,'Q16610','','ECM1_HUMAN',4870),(1545404,14235400,'P0DOX5','','IGG1_HUMAN',4870),(1545405,13560600,'P80108','','PHLD_HUMAN',4870),(1545406,12740300,'P35858','','ALS_HUMAN',4870),(1545407,12625500,'Q9BYJ1','','LOXE3_HUMAN',4870),(1545408,12207600,'O95613','','PCNT_HUMAN',4870),(1545409,12200300,'A0A0C4DH31','','HV118_HUMAN',4870),(1545410,12145000,'P05160','','F13B_HUMAN',4870),(1545411,11635700,'P36980','','FHR2_HUMAN',4870),(1545412,11409200,'CON_P02676','','FIBB_BOVIN',4870),(1545413,10951800,'P18428','','LBP_HUMAN',4870),(1545414,10849100,'Q15398','','DLGP5_HUMAN',4870),(1545415,10553900,'P06681','','CO2_HUMAN',4870),(1545416,8444520,'Q8WZ42','','TITIN_HUMAN',4870),(1545417,7727330,'P30872','','SSR1_HUMAN',4870),(1545418,7621560,'Q96KN2','','CNDP1_HUMAN',4870),(1545419,6761470,'P06276','','CHLE_HUMAN',4870),(1545420,6535280,'Q92954','','PRG4_HUMAN',4870),(1545421,6306580,'P07225','','PROS_HUMAN',4870),(1545422,6291370,'P04275','','VWF_HUMAN',4870),(1545423,6280420,'P26927','','HGFL_HUMAN',4870),(1545424,5995780,'P00740','','FA9_HUMAN',4870),(1545425,5961010,'P20742','','PZP_HUMAN',4870),(1545426,5600380,'Q96IY4','','CBPB2_HUMAN',4870),(1545427,5113630,'A0A0C4DH36','','HV338_HUMAN',4870),(1545428,4583380,'A0A0B4J1Y9','','HV372_HUMAN',4870),(1545429,3583160,'P12259','','FA5_HUMAN',4870),(1545430,2360480,'P55058','','PLTP_HUMAN',4870),(1545431,2052990,'Q15582','','BGH3_HUMAN',4870),(1545432,621362,'Q8NA19','','LMBL4_HUMAN',4870),(1545433,19499400000,'P01834','','IGKC_HUMAN',4872),(1545434,18344600000,'P02787','','TRFE_HUMAN',4872),(1545435,16709800000,'P02647','','APOA1_HUMAN',4872),(1545436,11097200000,'P00738','','HPT_HUMAN',4872),(1545437,6127090000,'P01009','','A1AT_HUMAN',4872),(1545438,5772860000,'P02675','','FIBB_HUMAN',4872),(1545439,4735590000,'P01876','','IGHA1_HUMAN',4872),(1545440,4652650000,'Q5XG87','','PAPD7_HUMAN',4872),(1545441,4042880000,'P02679','','FIBG_HUMAN',4872),(1545442,4028670000,'P02671','','FIBA_HUMAN',4872),(1545443,3823110000,'P01023','','A2MG_HUMAN',4872),(1545444,3807170000,'CON_P15636','','API_ACHLY',4872),(1545445,3135850000,'P01024','','CO3_HUMAN',4872),(1545446,2753450000,'P02763','','A1AG1_HUMAN',4872),(1545447,2519120000,'Q9HAI6','','TASL_HUMAN',4872),(1545448,2473100000,'P02652','','APOA2_HUMAN',4872),(1545449,2361570000,'Q96SN8','','CK5P2_HUMAN',4872),(1545450,2116960000,'P02790','','HEMO_HUMAN',4872),(1545451,1976250000,'P01860','','IGHG3_HUMAN',4872),(1545452,1640430000,'P02765','','FETUA_HUMAN',4872),(1545453,1620210000,'P01871','','IGHM_HUMAN',4872),(1545454,1538970000,'P02656','','APOC3_HUMAN',4872),(1545455,1496850000,'P40938','','RFC3_HUMAN',4872),(1545456,1379240000,'CON_P00761','','TRYP_PIG',4872),(1545457,1217010000,'P15814','','IGLL1_HUMAN',4872),(1545458,1131210000,'P00450','','CERU_HUMAN',4872),(1545459,1126440000,'P02749','','APOH_HUMAN',4872),(1545460,1117250000,'P02774','','VTDB_HUMAN',4872),(1545461,1098870000,'P19652','','A1AG2_HUMAN',4872),(1545462,961977000,'Q8TF30','','WHAMM_HUMAN',4872),(1545463,931566000,'P04004','','VTNC_HUMAN',4872),(1545464,849068000,'P22680','','CP7A1_HUMAN',4872),(1545465,844760000,'P00751','','CFAB_HUMAN',4872),(1545466,804686000,'P00734','','THRB_HUMAN',4872),(1545467,781005000,'P04217','','A1BG_HUMAN',4872),(1545468,777201000,'P01042','','KNG1_HUMAN',4872),(1545469,775840000,'P39086','','GRIK1_HUMAN',4872),(1545470,770562000,'P01011','','AACT_HUMAN',4872),(1545471,726572000,'P19823','','ITIH2_HUMAN',4872),(1545472,714972000,'P01859','','IGHG2_HUMAN',4872),(1545473,693946000,'Q5H9R4','','ARMX4_HUMAN',4872),(1545474,643648000,'Q5PRF9','','SMAG2_HUMAN',4872),(1545475,627327000,'P08603','','CFAH_HUMAN',4872),(1545476,624566000,'P02654','','APOC1_HUMAN',4872),(1545477,593484000,'P04196','','HRG_HUMAN',4872),(1545478,557584000,'P02760','','AMBP_HUMAN',4872),(1545479,505976000,'P01861','','IGHG4_HUMAN',4872),(1545480,476210000,'P01008','','ANT3_HUMAN',4872),(1545481,464107000,'Q92791','','SC65_HUMAN',4872),(1545482,462945000,'P00747','','PLMN_HUMAN',4872),(1545483,443956000,'P06727','','APOA4_HUMAN',4872),(1545484,440730000,'P04114','','APOB_HUMAN',4872),(1545485,439101000,'P35542','','SAA4_HUMAN',4872),(1545486,425816000,'Q9NWS1','','PARI_HUMAN',4872),(1545487,413140000,'Q9NU53','','GINM1_HUMAN',4872),(1545488,395480000,'P05155','','IC1_HUMAN',4872),(1545489,385823000,'P10909','','CLUS_HUMAN',4872),(1545490,379740000,'Q8N806','','UBR7_HUMAN',4872),(1545491,375062000,'P19827','','ITIH1_HUMAN',4872),(1545492,353603000,'CON_P15497','','APOA1_BOVIN',4872),(1545493,331957000,'Q13790','','APOF_HUMAN',4872),(1545494,315847000,'P27169','','PON1_HUMAN',4872),(1545495,314890000,'P02751','','FINC_HUMAN',4872),(1545496,312282000,'Q03001','','DYST_HUMAN',4872),(1545497,272976000,'P04003','','C4BPA_HUMAN',4872),(1545498,255842000,'P01780','','HV307_HUMAN',4872),(1545499,253276000,'P02655','','APOC2_HUMAN',4872),(1545500,231743000,'Q14624','','ITIH4_HUMAN',4872),(1545501,225756000,'Q9NQW7','','XPP1_HUMAN',4872),(1545502,223954000,'P06312','','KV401_HUMAN',4872),(1545503,220918000,'Q9H8V3','','ECT2_HUMAN',4872),(1545504,203102000,'P02766','','TTHY_HUMAN',4872),(1545505,187168000,'O95803','','NDST3_HUMAN',4872),(1545506,174973000,'Q5T5P2','','SKT_HUMAN',4872),(1545507,169470000,'Q8NE71','','ABCF1_HUMAN',4872),(1545508,169164000,'P05546','','HEP2_HUMAN',4872),(1545509,167548000,'P06396','','GELS_HUMAN',4872),(1545510,160723000,'P00739','','HPTR_HUMAN',4872),(1545511,159767000,'P02746','','C1QB_HUMAN',4872),(1545512,153403000,'P08697','','A2AP_HUMAN',4872),(1545513,150635000,'P69905','','HBA_HUMAN',4872),(1545514,142483000,'P01591','','IGJ_HUMAN',4872),(1545515,141374000,'P43652','','AFAM_HUMAN',4872),(1545516,137387000,'P01019','','ANGT_HUMAN',4872),(1545517,136230000,'P05090','','APOD_HUMAN',4872),(1545518,135492000,'P05156','','CFAI_HUMAN',4872),(1545519,134943000,'Q8N1G0','','ZN687_HUMAN',4872),(1545520,134217000,'P43681','','ACHA4_HUMAN',4872),(1545521,130341000,'O95613','','PCNT_HUMAN',4872),(1545522,124794000,'P02649','','APOE_HUMAN',4872),(1545523,123284000,'Q6ZN30','','BNC2_HUMAN',4872),(1545524,121439000,'P01031','','CO5_HUMAN',4872),(1545525,118865000,'Q6GQQ9','','OTU7B_HUMAN',4872),(1545526,118137000,'Q03591','','FHR1_HUMAN',4872),(1545527,112666000,'O43866','','CD5L_HUMAN',4872),(1545528,112256000,'Q9UPN3','','MACF1_HUMAN',4872),(1545529,110722000,'P0C0L5','','CO4B_HUMAN',4872),(1545530,109241000,'O14490','','DLGP1_HUMAN',4872),(1545531,107712000,'Q8N5U6','','RNF10_HUMAN',4872),(1545532,99070400,'Q6AI12','','ANR40_HUMAN',4872),(1545533,91507500,'P09871','','C1S_HUMAN',4872),(1545534,89551400,'Q96PD5','','PGRP2_HUMAN',4872),(1545535,88325300,'P02753','','RET4_HUMAN',4872),(1545536,86353700,'P02743','','SAMP_HUMAN',4872),(1545537,86267800,'P00736','','C1R_HUMAN',4872),(1545538,85522000,'P07358','','CO8B_HUMAN',4872),(1545539,81216300,'P68871','','HBB_HUMAN',4872),(1545540,78417000,'Q9Y577','','TRI17_HUMAN',4872),(1545541,77959100,'P02747','','C1QC_HUMAN',4872),(1545542,77510700,'CON_P02769','','ALBU_BOVIN',4872),(1545543,76307800,'Q96GS6','','AB17A_HUMAN',4872),(1545544,73021600,'Q8N201','','INT1_HUMAN',4872),(1545545,72611400,'P00748','','FA12_HUMAN',4872),(1545546,71274500,'P02748','','CO9_HUMAN',4872),(1545547,69134000,'P03952','','KLKB1_HUMAN',4872),(1545548,68097000,'O75781','','PALM_HUMAN',4872),(1545549,67778800,'P02745','','C1QA_HUMAN',4872),(1545550,65360800,'P02750','','A2GL_HUMAN',4872),(1545551,61762000,'P25311','','ZA2G_HUMAN',4872),(1545552,59803900,'CON_Q2UVX4','','CO3_BOVIN',4872),(1545553,55332200,'P0DOX2','','IGA2_HUMAN',4872),(1545554,55283200,'P55196','','AFAD_HUMAN',4872),(1545555,51868300,'P08185','','CBG_HUMAN',4872),(1545556,51022700,'P06681','','CO2_HUMAN',4872),(1545557,48880900,'Q9UIC8','','LCMT1_HUMAN',4872),(1545558,46090400,'P09496','','CLCA_HUMAN',4872),(1545559,44330100,'P10643','','CO7_HUMAN',4872),(1545560,41855400,'P13671','','CO6_HUMAN',4872),(1545561,41644700,'P01704','','LV214_HUMAN',4872),(1545562,40588500,'P36955','','PEDF_HUMAN',4872),(1545563,38892500,'Q8TD84','','DSCL1_HUMAN',4872),(1545564,37939200,'P07360','','CO8G_HUMAN',4872),(1545565,36345000,'Q96IY4','','CBPB2_HUMAN',4872),(1545566,36000800,'O14791','','APOL1_HUMAN',4872),(1545567,34434800,'O95848','','NUD14_HUMAN',4872),(1545568,33977300,'P07357','','CO8A_HUMAN',4872),(1545569,33182000,'P61769','','B2MG_HUMAN',4872),(1545570,33113900,'P22352','','GPX3_HUMAN',4872),(1545571,30808300,'P08519','','APOA_HUMAN',4872),(1545572,30413300,'P22792','','CPN2_HUMAN',4872),(1545573,30291600,'P20742','','PZP_HUMAN',4872),(1545574,29640200,'O95445','','APOM_HUMAN',4872),(1545575,27997300,'A0A075B6H7','','KV37_HUMAN',4872),(1545576,26682200,'Q8NHW3','','MAFA_HUMAN',4872),(1545577,26161700,'P00488','','F13A_HUMAN',4872),(1545578,24952300,'P51884','','LUM_HUMAN',4872),(1545579,23712800,'O95239','','KIF4A_HUMAN',4872),(1545580,22779400,'Q96RT1','','ERBIN_HUMAN',4872),(1545581,22452400,'P01714','','LV319_HUMAN',4872),(1545582,21317900,'A0A0B4J1V0','','HV315_HUMAN',4872),(1545583,21078800,'P20851','','C4BPB_HUMAN',4872),(1545584,20966500,'A0M8Q6','','IGLC7_HUMAN',4872),(1545585,20497400,'P18428','','LBP_HUMAN',4872),(1545586,20311600,'Q8N3Y3','','LARG2_HUMAN',4872),(1545587,19802000,'P29622','','KAIN_HUMAN',4872),(1545588,18804000,'P15169','','CBPN_HUMAN',4872),(1545589,18598500,'P49908','','SEPP1_HUMAN',4872),(1545590,18273400,'P01599','','KV117_HUMAN',4872),(1545591,17905500,'O75636','','FCN3_HUMAN',4872),(1545592,16245000,'P80108','','PHLD_HUMAN',4872),(1545593,13120200,'P07225','','PROS_HUMAN',4872),(1545594,12784200,'P35858','','ALS_HUMAN',4872),(1545595,12372000,'P36980','','FHR2_HUMAN',4872),(1545596,12354500,'Q16610','','ECM1_HUMAN',4872),(1545597,11951500,'P12259','','FA5_HUMAN',4872),(1545598,11707100,'A0A0C4DH31','','HV118_HUMAN',4872),(1545599,10806600,'P01619','','KV320_HUMAN',4872),(1545600,10476500,'Q7Z460','','CLAP1_HUMAN',4872),(1545601,9976130,'Q92954','','PRG4_HUMAN',4872),(1545602,8789960,'P04430','','KV116_HUMAN',4872),(1545603,8531970,'P05160','','F13B_HUMAN',4872),(1545604,8525850,'P20929','','NEBU_HUMAN',4872),(1545605,8419500,'A0A0C4DH36','','HV338_HUMAN',4872),(1545606,8079910,'O75882','','ATRN_HUMAN',4872),(1545607,6904420,'A0A0B4J1V6','','HV373_HUMAN',4872),(1545608,5638150,'Q08380','','LG3BP_HUMAN',4872),(1545609,3993860,'P06276','','CHLE_HUMAN',4872),(1545610,2296680,'A0A0B4J1Y9','','HV372_HUMAN',4872),(1545611,1922850,'A0A0B4J1X5','','HV374_HUMAN',4872),(1545612,24978100000,'P02647','','APOA1_HUMAN',4871),(1545613,19673200000,'P00738','','HPT_HUMAN',4871),(1545614,17614100000,'P01834','','IGKC_HUMAN',4871),(1545615,16960300000,'P02787','','TRFE_HUMAN',4871),(1545616,12294400000,'P02679','','FIBG_HUMAN',4871),(1545617,10916100000,'P02675','','FIBB_HUMAN',4871),(1545618,9395800000,'P01009','','A1AT_HUMAN',4871),(1545619,8450510000,'CON_P15636','','API_ACHLY',4871),(1545620,6965010000,'P01876','','IGHA1_HUMAN',4871),(1545621,6314440000,'P02671','','FIBA_HUMAN',4871),(1545622,5514680000,'Q8NE71','','ABCF1_HUMAN',4871),(1545623,5251630000,'P01023','','A2MG_HUMAN',4871),(1545624,4709680000,'P02652','','APOA2_HUMAN',4871),(1545625,4683510000,'P02763','','A1AG1_HUMAN',4871),(1545626,4014250000,'P01024','','CO3_HUMAN',4871),(1545627,3891980000,'P02790','','HEMO_HUMAN',4871),(1545628,3485030000,'P01860','','IGHG3_HUMAN',4871),(1545629,3375270000,'P02765','','FETUA_HUMAN',4871),(1545630,3292400000,'CON_P00761','','TRYP_PIG',4871),(1545631,3289720000,'P02656','','APOC3_HUMAN',4871),(1545632,3065970000,'P01871','','IGHM_HUMAN',4871),(1545633,3019490000,'P19652','','A1AG2_HUMAN',4871),(1545634,2651220000,'Q96SN8','','CK5P2_HUMAN',4871),(1545635,2214240000,'P01861','','IGHG4_HUMAN',4871),(1545636,2124050000,'P02774','','VTDB_HUMAN',4871),(1545637,2107200000,'P00450','','CERU_HUMAN',4871),(1545638,1950590000,'P02749','','APOH_HUMAN',4871),(1545639,1796200000,'P15814','','IGLL1_HUMAN',4871),(1545640,1669850000,'P40938','','RFC3_HUMAN',4871),(1545641,1565300000,'P01859','','IGHG2_HUMAN',4871),(1545642,1274100000,'P01042','','KNG1_HUMAN',4871),(1545643,1251750000,'P04004','','VTNC_HUMAN',4871),(1545644,1182730000,'P00751','','CFAB_HUMAN',4871),(1545645,1178020000,'P05546','','HEP2_HUMAN',4871),(1545646,1160410000,'P02654','','APOC1_HUMAN',4871),(1545647,1146060000,'Q5PRF9','','SMAG2_HUMAN',4871),(1545648,1131750000,'Q53GL7','','PAR10_HUMAN',4871),(1545649,1104980000,'P01011','','AACT_HUMAN',4871),(1545650,1096500000,'P08603','','CFAH_HUMAN',4871),(1545651,1081540000,'P00734','','THRB_HUMAN',4871),(1545652,1053640000,'P04217','','A1BG_HUMAN',4871),(1545653,998815000,'Q92791','','SC65_HUMAN',4871),(1545654,954201000,'O60494','','CUBN_HUMAN',4871),(1545655,936282000,'P00747','','PLMN_HUMAN',4871),(1545656,870562000,'Q96DT5','','DYH11_HUMAN',4871),(1545657,852288000,'P19823','','ITIH2_HUMAN',4871),(1545658,836191000,'P02760','','AMBP_HUMAN',4871),(1545659,803750000,'Q8IZU2','','WDR17_HUMAN',4871),(1545660,733874000,'Q9NWD9','','BEX4_HUMAN',4871),(1545661,723408000,'P10909','','CLUS_HUMAN',4871),(1545662,691580000,'Q9NWS1','','PARI_HUMAN',4871),(1545663,685370000,'P06727','','APOA4_HUMAN',4871),(1545664,657370000,'Q9UPN3','','MACF1_HUMAN',4871),(1545665,653884000,'P01008','','ANT3_HUMAN',4871),(1545666,639929000,'P04114','','APOB_HUMAN',4871),(1545667,625437000,'P04003','','C4BPA_HUMAN',4871),(1545668,609095000,'P02751','','FINC_HUMAN',4871),(1545669,565514000,'P19827','','ITIH1_HUMAN',4871),(1545670,559820000,'P02655','','APOC2_HUMAN',4871),(1545671,558919000,'Q5T5P2','','SKT_HUMAN',4871),(1545672,556311000,'Q03001','','DYST_HUMAN',4871),(1545673,552527000,'P05155','','IC1_HUMAN',4871),(1545674,526468000,'Q8NF91','','SYNE1_HUMAN',4871),(1545675,480007000,'P01780','','HV307_HUMAN',4871),(1545676,447572000,'P27169','','PON1_HUMAN',4871),(1545677,432679000,'P04196','','HRG_HUMAN',4871),(1545678,415126000,'P02766','','TTHY_HUMAN',4871),(1545679,405016000,'P39086','','GRIK1_HUMAN',4871),(1545680,404061000,'P35542','','SAA4_HUMAN',4871),(1545681,378005000,'CON_P02769','','ALBU_BOVIN',4871),(1545682,363666000,'Q14624','','ITIH4_HUMAN',4871),(1545683,360579000,'Q6ZN30','','BNC2_HUMAN',4871),(1545684,333713000,'P00739','','HPTR_HUMAN',4871),(1545685,326332000,'P06312','','KV401_HUMAN',4871),(1545686,306420000,'P02746','','C1QB_HUMAN',4871),(1545687,287107000,'P01591','','IGJ_HUMAN',4871),(1545688,250827000,'P06396','','GELS_HUMAN',4871),(1545689,250506000,'Q9NQW7','','XPP1_HUMAN',4871),(1545690,245680000,'P01031','','CO5_HUMAN',4871),(1545691,231458000,'P05090','','APOD_HUMAN',4871),(1545692,226526000,'P43652','','AFAM_HUMAN',4871),(1545693,223040000,'P01019','','ANGT_HUMAN',4871),(1545694,211732000,'O75781','','PALM_HUMAN',4871),(1545695,203449000,'P02649','','APOE_HUMAN',4871),(1545696,201833000,'O43866','','CD5L_HUMAN',4871),(1545697,196086000,'Q0D2K2','','KLH30_HUMAN',4871),(1545698,187102000,'P0C0L5','','CO4B_HUMAN',4871),(1545699,178748000,'O14791','','APOL1_HUMAN',4871),(1545700,168016000,'P02743','','SAMP_HUMAN',4871),(1545701,163038000,'P55196','','AFAD_HUMAN',4871),(1545702,162638000,'P08697','','A2AP_HUMAN',4871),(1545703,161437000,'CON_P15497','','APOA1_BOVIN',4871),(1545704,158400000,'P48740','','MASP1_HUMAN',4871),(1545705,155136000,'A0A0C4DH25','','KVD20_HUMAN',4871),(1545706,150766000,'P69905','','HBA_HUMAN',4871),(1545707,150411000,'Q15911','','ZFHX3_HUMAN',4871),(1545708,143346000,'P07360','','CO8G_HUMAN',4871),(1545709,143182000,'P02753','','RET4_HUMAN',4871),(1545710,141567000,'P05156','','CFAI_HUMAN',4871),(1545711,139571000,'P02745','','C1QA_HUMAN',4871),(1545712,134159000,'Q96PD5','','PGRP2_HUMAN',4871),(1545713,133848000,'Q9Y618','','NCOR2_HUMAN',4871),(1545714,124617000,'P02748','','CO9_HUMAN',4871),(1545715,124554000,'Q7L1I2','','SV2B_HUMAN',4871),(1545716,123589000,'P09871','','C1S_HUMAN',4871),(1545717,122236000,'P00748','','FA12_HUMAN',4871),(1545718,113873000,'P0DOX3','','IGD_HUMAN',4871),(1545719,113701000,'P02750','','A2GL_HUMAN',4871),(1545720,108883000,'B2RV13','','CF97D_HUMAN',4871),(1545721,100979000,'P0DOX2','','IGA2_HUMAN',4871),(1545722,100216000,'P00736','','C1R_HUMAN',4871),(1545723,99296000,'P02747','','C1QC_HUMAN',4871),(1545724,99019900,'P03952','','KLKB1_HUMAN',4871),(1545725,94333400,'CON_Q2UVX4','','CO3_BOVIN',4871),(1545726,90996800,'P13671','','CO6_HUMAN',4871),(1545727,85166300,'P08185','','CBG_HUMAN',4871),(1545728,84893000,'P36955','','PEDF_HUMAN',4871),(1545729,79251500,'P05543','','THBG_HUMAN',4871),(1545730,78653500,'O95445','','APOM_HUMAN',4871),(1545731,76925200,'P01704','','LV214_HUMAN',4871),(1545732,76244800,'Q13790','','APOF_HUMAN',4871),(1545733,74221100,'Q06033','','ITIH3_HUMAN',4871),(1545734,70800800,'P68871','','HBB_HUMAN',4871),(1545735,70459600,'P07358','','CO8B_HUMAN',4871),(1545736,65083200,'P08519','','APOA_HUMAN',4871),(1545737,63784100,'P10643','','CO7_HUMAN',4871),(1545738,63315500,'P25311','','ZA2G_HUMAN',4871),(1545739,62906700,'Q9P2T0','','THEG_HUMAN',4871),(1545740,61522400,'P00488','','F13A_HUMAN',4871),(1545741,61431100,'P01903','','DRA_HUMAN',4871),(1545742,60775200,'Q12906','','ILF3_HUMAN',4871),(1545743,59625900,'P49454','','CENPF_HUMAN',4871),(1545744,53573800,'O60674','','JAK2_HUMAN',4871),(1545745,53494800,'P35858','','ALS_HUMAN',4871),(1545746,53339500,'A0A0A0MS15','','HV349_HUMAN',4871),(1545747,51706200,'P22792','','CPN2_HUMAN',4871),(1545748,50384200,'A0A0B4J1V0','','HV315_HUMAN',4871),(1545749,47232600,'Q63HN8','','RN213_HUMAN',4871),(1545750,47038900,'Q14520','','HABP2_HUMAN',4871),(1545751,46800800,'P78357','','CNTP1_HUMAN',4871),(1545752,38073300,'O75636','','FCN3_HUMAN',4871),(1545753,37700200,'P20742','','PZP_HUMAN',4871),(1545754,36752800,'Q8IWU6','','SULF1_HUMAN',4871),(1545755,36712400,'P07357','','CO8A_HUMAN',4871),(1545756,36515300,'P51884','','LUM_HUMAN',4871),(1545757,34941600,'P00742','','FA10_HUMAN',4871),(1545758,33953100,'P80108','','PHLD_HUMAN',4871),(1545759,33765800,'P22352','','GPX3_HUMAN',4871),(1545760,32596800,'P15169','','CBPN_HUMAN',4871),(1545761,28403700,'Q13002','','GRIK2_HUMAN',4871),(1545762,26123000,'P36980','','FHR2_HUMAN',4871),(1545763,26034100,'Q8WU76','','SCFD2_HUMAN',4871),(1545764,25845000,'P11309','','PIM1_HUMAN',4871),(1545765,25628300,'P49750','','YLPM1_HUMAN',4871),(1545766,25163400,'P29622','','KAIN_HUMAN',4871),(1545767,23608900,'Q16610','','ECM1_HUMAN',4871),(1545768,22956100,'P06681','','CO2_HUMAN',4871),(1545769,21850600,'O75882','','ATRN_HUMAN',4871),(1545770,21269700,'A0A0C4DH31','','HV118_HUMAN',4871),(1545771,20110700,'P43251','','BTD_HUMAN',4871),(1545772,19474800,'Q96FV0','','LRC46_HUMAN',4871),(1545773,18817600,'P18428','','LBP_HUMAN',4871),(1545774,18709700,'Q96IY4','','CBPB2_HUMAN',4871),(1545775,18446600,'P07225','','PROS_HUMAN',4871),(1545776,15544900,'P05160','','F13B_HUMAN',4871),(1545777,14619100,'P30872','','SSR1_HUMAN',4871),(1545778,11333600,'P00740','','FA9_HUMAN',4871),(1545779,10537800,'Q13224','','NMDE2_HUMAN',4871),(1545780,9600300,'P12259','','FA5_HUMAN',4871),(1545781,8582670,'Q96KN2','','CNDP1_HUMAN',4871),(1545782,8171380,'P49754','','VPS41_HUMAN',4871),(1545783,7734020,'P26927','','HGFL_HUMAN',4871),(1545784,7588690,'P04275','','VWF_HUMAN',4871),(1545785,7230750,'P04430','','KV116_HUMAN',4871),(1545786,6483260,'P01766','','HV313_HUMAN',4871),(1545787,5889410,'O95239','','KIF4A_HUMAN',4871),(1545788,5230040,'CON_P41361','','ANT3_BOVIN',4871),(1545789,4996620,'A0A0B4J1Y9','','HV372_HUMAN',4871),(1545790,4921650,'A0A0B4J1X5','','HV374_HUMAN',4871),(1545791,4176930,'Q15582','','BGH3_HUMAN',4871),(1545792,2037680,'Q02985','','FHR3_HUMAN',4871);
/*!40000 ALTER TABLE `quantification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quantification_seq`
--

DROP TABLE IF EXISTS `quantification_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quantification_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantification_seq`
--

LOCK TABLES `quantification_seq` WRITE;
/*!40000 ALTER TABLE `quantification_seq` DISABLE KEYS */;
INSERT INTO `quantification_seq` VALUES (1545793);
/*!40000 ALTER TABLE `quantification_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_local`
--

DROP TABLE IF EXISTS `request_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_local` (
  `id` bigint(20) NOT NULL,
  `creation_date` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `groupp` varchar(255) DEFAULT NULL,
  `request_code` varchar(255) DEFAULT NULL,
  `samples` varchar(5000) DEFAULT NULL,
  `statuss` varchar(255) DEFAULT NULL,
  `taxonomy` varchar(255) DEFAULT NULL,
  `application_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_request_code` (`request_code`),
  KEY `FKp73aox9pm50r87pd7gt6euxfu` (`application_id`),
  CONSTRAINT `FKp73aox9pm50r87pd7gt6euxfu` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_local`
--

LOCK TABLES `request_local` WRITE;
/*!40000 ALTER TABLE `request_local` DISABLE KEYS */;
INSERT INTO `request_local` VALUES (8017,DATE_SUB(CURRENT_DATE, INTERVAL 10 DAY),'Roger Olivella','Proteomics Unit','2022MQ777','','Created','Human',7),(8020,DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY),'Roger Olivella','Proteomics Unit','2022MK777','','Created','Human',15);
/*!40000 ALTER TABLE `request_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
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
  `id` bigint(20) NOT NULL,
  `api_key` char(50) NOT NULL,
  `non_conformity_direction` varchar(255) DEFAULT NULL,
  `steps` int(11) DEFAULT NULL,
  `wetlab_id` bigint(20) DEFAULT NULL,
  `param_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_9hxspk3fg6bhh4y1yyuu36ov9` (`api_key`),
  KEY `FKl5qysigvx0wpmif73wfo9iya2` (`wetlab_id`),
  KEY `FKmp0khk9w2rhtce4qh73xvu1rc` (`param_id`),
  CONSTRAINT `FKl5qysigvx0wpmif73wfo9iya2` FOREIGN KEY (`wetlab_id`) REFERENCES `wetlab` (`id`),
  CONSTRAINT `FKmp0khk9w2rhtce4qh73xvu1rc` FOREIGN KEY (`param_id`) REFERENCES `param` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threshold`
--

LOCK TABLES `threshold` WRITE;
/*!40000 ALTER TABLE `threshold` DISABLE KEYS */;
/*!40000 ALTER TABLE `threshold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threshold_params`
--

DROP TABLE IF EXISTS `threshold_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threshold_params` (
  `context_source_id` bigint(20) NOT NULL,
  `threshold_id` bigint(20) NOT NULL,
  `initial_value` float DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT 1,
  `step_value` float DEFAULT NULL,
  PRIMARY KEY (`context_source_id`,`threshold_id`),
  KEY `FK8g1pxjaqjdhdc96r5ok5eyd9k` (`threshold_id`),
  CONSTRAINT `FK8g1pxjaqjdhdc96r5ok5eyd9k` FOREIGN KEY (`threshold_id`) REFERENCES `threshold` (`id`),
  CONSTRAINT `FKs85ab4k83uteyqmd8xf4ucb0n` FOREIGN KEY (`context_source_id`) REFERENCES `context_source` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threshold_params`
--

LOCK TABLES `threshold_params` WRITE;
/*!40000 ALTER TABLE `threshold_params` DISABLE KEYS */;
/*!40000 ALTER TABLE `threshold_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threshold_seq`
--

DROP TABLE IF EXISTS `threshold_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threshold_seq` (
  `next_val` bigint(20) DEFAULT NULL
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
  `id` bigint(20) NOT NULL,
  `a` bigint(20) NOT NULL,
  `api_key` char(50) NOT NULL,
  `b` bigint(20) NOT NULL,
  `g` bigint(20) NOT NULL,
  `r` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trace_color`
--

LOCK TABLES `trace_color` WRITE;
/*!40000 ALTER TABLE `trace_color` DISABLE KEYS */;
INSERT INTO `trace_color` VALUES (1,0,'5008da3a-dbcd-49c3-a008-db34c4b0bb39',100,100,100);
/*!40000 ALTER TABLE `trace_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trace_color_seq`
--

DROP TABLE IF EXISTS `trace_color_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trace_color_seq` (
  `next_val` bigint(20) DEFAULT NULL
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
  `id` bigint(20) NOT NULL,
  `agendo_id` bigint(20) DEFAULT NULL,
  `api_key` char(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `groupp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2lxq4yoyabuji9s2a1i0c8938` (`api_key`),
  UNIQUE KEY `UK_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (26,942,'51838265-6475-4237-8d58-8c5bbc053c1f','admin','admin','$2a$10$zBX52L1fispvDUi6BqArKuCX3jY1nURmp6YnWtk1zvnIGPDzMo6.m','admin@admin.com',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_seq`
--

DROP TABLE IF EXISTS `user_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_seq`
--

LOCK TABLES `user_seq` WRITE;
/*!40000 ALTER TABLE `user_seq` DISABLE KEYS */;
INSERT INTO `user_seq` VALUES (27);
/*!40000 ALTER TABLE `user_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  KEY `FKt4v0rrweyk393bdgt107vdx0x` (`role_id`),
  KEY `FKgd3iendaoyh04b95ykqise6qh` (`user_id`),
  CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (26,1),(26,5),(26,4),(26,3);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wetlab_seq`
--

DROP TABLE IF EXISTS `wetlab_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wetlab_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wetlab_seq`
--

LOCK TABLES `wetlab_seq` WRITE;
/*!40000 ALTER TABLE `wetlab_seq` DISABLE KEYS */;
INSERT INTO `wetlab_seq` VALUES (6);
/*!40000 ALTER TABLE `wetlab_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wetlab`
--

DROP TABLE IF EXISTS `wetlab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wetlab` (
  `id` bigint(20) NOT NULL,
  `api_key` char(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `guide_set_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ejfiihgmd6k24h2rg119qycaw` (`api_key`),
  KEY `FKdmtiufjb02q61tejl5ki4bo5u` (`guide_set_id`),
  CONSTRAINT `FKdmtiufjb02q61tejl5ki4bo5u` FOREIGN KEY (`guide_set_id`) REFERENCES `guide_set` (`id`),
  KEY `FK_wetlab_category` (`category_id`),
  CONSTRAINT `FK_wetlab_category` FOREIGN KEY (`category_id`) REFERENCES `wetlab_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wetlab`
--

LOCK TABLES `wetlab` WRITE;
/*!40000 ALTER TABLE `wetlab` DISABLE KEYS */;
INSERT INTO `wetlab` VALUES (1,'5008da3a-dbcd-49c3-a008-db34c4b0bb39','InSolutionQC',NULL,1),(2,'5e0f0077-2ae2-4984-88cd-20bcd62067ff','Offline Fractionation QC',NULL,3),(3,'d7bca60f-a79e-4cb9-9333-9227410629bf','InGelQC',NULL,1),(4,'0237d9fe-9013-4746-a2d7-6e5fcf007a18','Phospho TIO QC',NULL,2),(5,'0c5165d8-05eb-47e0-86e4-22a77beb86ab','FASPQC',NULL,1);
/*!40000 ALTER TABLE `wetlab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wetlab_plot`
--

DROP TABLE IF EXISTS `wetlab_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wetlab_category` (
  `id` bigint NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `wetlab_category` WRITE;
/*!40000 ALTER TABLE `wetlab_category` DISABLE KEYS */;
INSERT INTO `wetlab_category` VALUES (1,'Digestion'),(2,'PTM'),(3,'Fractionation');
/*!40000 ALTER TABLE `wetlab_category` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `wetlab_plot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wetlab_plot` (
  `wet_lab_id` bigint(20) NOT NULL,
  `plot_id` bigint(20) NOT NULL,
  KEY `FKg61sv5eqdbpsytd5lravvkf0j` (`plot_id`),
  KEY `FK79plxrl3k35xg5hme4xu0hidx` (`wet_lab_id`),
  CONSTRAINT `FK79plxrl3k35xg5hme4xu0hidx` FOREIGN KEY (`wet_lab_id`) REFERENCES `wetlab` (`id`),
  CONSTRAINT `FKg61sv5eqdbpsytd5lravvkf0j` FOREIGN KEY (`plot_id`) REFERENCES `plot` (`id`),
  CONSTRAINT `wetlab_plot_key` PRIMARY KEY (`wet_lab_id`, `plot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wetlab_plot`
--

LOCK TABLES `wetlab_plot` WRITE;
/*!40000 ALTER TABLE `wetlab_plot` DISABLE KEYS */;
INSERT INTO `wetlab_plot` VALUES (1,1),(2,3),(5,1),(3,1),(1,3),(3,3),(4,1),(5,3),(4,3),(2,1),(6,4),(6,5),(4,6),(4,7);
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

-- Dump completed on 2023-02-03 11:25:29
