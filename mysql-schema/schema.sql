-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: biecoplatform
-- ------------------------------------------------------
-- Server version	5.7.33

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

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activation_code` varchar(255) NOT NULL,
  `active` bit(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `input` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `element_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `html` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `visible_on_ui` tinyint(4) NOT NULL DEFAULT '1',
  `tool_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `started` datetime DEFAULT NULL,
  `finished` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `updated` datetime DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `json_parameters` text,
  `design_time` text,
  `run_time` text,
  `settings` text,
  PRIMARY KEY (`id`),
  KEY `FKihd6m3auwpenduntl3e1opcoq` (`user_id`),
  CONSTRAINT `FKihd6m3auwpenduntl3e1opcoq` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `job_id` varchar(255) DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `body` text,
  `tool_id` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6008 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `json_parameters` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `setupdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setupdata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `jsondata` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `endpoint` varchar(255) NOT NULL,
  `incoming_token` varchar(255) NOT NULL,
  `outgoing_token` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `developer` varchar(255) NOT NULL,
  `description` text,
  `user_id` bigint(20) unsigned NOT NULL,
  `stateless` tinyint(1) DEFAULT '0',
  `synchronous_access` tinyint(1) DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '99',
  `monotasking` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `uitool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uitool` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `uitool` WRITE;
/*!40000 ALTER TABLE `uitool` DISABLE KEYS */;
INSERT INTO `uitool` (`id`, `title`,`url`) VALUES
  (1, 'Data Collection Tool','https://dct.bieco.org'),
  (2, 'Vulnerabilities Forecasting Tool','http://vf.bieco.org'),
  (3, 'GraphWalker Studio','http://155.54.210.200:9090/studio.html'),
  (4, 'Test Suite Generator','http://155.54.210.200:5555/'),
  (5, 'MUD Updater','http://localhost:5555/updater');
/*!40000 ALTER TABLE `uitool` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`,`active`,`email`,`name`,`password`,`role`) VALUES
	 (1, 1,'admin@admin.com','Administrator','{bcrypt}$2a$10$5qTrSo4QrL2Mo0Tyld7NDOuK34gEZFnwsFsaJXjH5Lcs/GP/ewhGK','ADMIN');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `tool` WRITE;
/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
INSERT INTO `tool` VALUES 
(4, b'0', b'1','https://api.dct.bieco.org/ils/','ajw4gti43yugtlai3k43yg','99998a72-ede0-11eb-9f9b-110eb294d8b7','Data Collection Tool','Technical University of Cluj-Napoca, Romania','The Data Collection Tool is a web application that represents the implementation support for the DSV. It has a RESTful API for communicating with the other BIECO tools, and a web user interface. The following sections contain a detailed description of the DCT architecture, the DSV information structure, the API specification and the user interface. ',1,1,1,2, b'0'),
(5, b'0', b'1','http://bieco-ui:8080/ui/biecointerface','iVBQ#L;*4a5o78','LSE7oweb87vowe87','Bieco UI','HOLISUN SRL','The UI for the BIECO Platform',1,0,1,1, b'0'),
(6, b'0', b'1','http://mock-tool:8080/mock/biecointerface','rK6ILPiurtfFV','JAD7A6WAD454AS33AF4','Holisun Mock Tool','Holisun','Mock',1,0,0,3,b'0'),
(7, b'0', b'1','http://security-scorer:4500/mock/biecointerface','rK6ILPiurtfFV','JAD7A6WAD454AS33AF4','Security Scorer','7bulls','Security Scorer - initial configuration try',1,0,0,3,b'0'),
(8, b'0', b'1','http://predictive-simulation:4600/ps/biecointerface','6sdQpBgkrL6yu','32z27348127482371kk8(())=)=)(=))(76hgh))', 'Predictive Simulation', 'IESE', 'Initial Testing of the Predictive Simulation',1,0,0,3,b'0');
/*!40000 ALTER TABLE `tool` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `input` WRITE;
/*!40000 ALTER TABLE `input` DISABLE KEYS */;
INSERT INTO `input` (`required`,`element_id`,`name`,`label`,`html`,`type`,`visible_on_ui`,`tool_id`) VALUES
	 (1,'6.values','values','Values to be displayed','','string',1,6);
/*!40000 ALTER TABLE `input` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES 
(3,'2022-01-11 10:11:15','2022-01-28 13:04:48',NULL,'Test Job 1','2022-01-11 10:11:15',1,'{}','{\"name\":\"DesignTime Methodology\",\"description\":\"The DesignTime Methodology will generate Test Results based on User Preference\",\"isRuntime\":false,\"startedTime\":1643367888774,\"finishedTime\":0,\"finished\":false,\"lastUpdate\":\"\",\"currentStep\":1,\"firstStep\":1,\"lastStep\":9,\"steps\":[{\"id\":1,\"previous\":1,\"next\":2,\"isComplete\":false,\"name\":\"Risk Identification\",\"toolsStatuses\":{},\"usedTools\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":2,\"previous\":1,\"next\":3,\"isComplete\":false,\"name\":\"Test Design\",\"toolsStatuses\":{},\"usedTools\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":3,\"previous\":2,\"next\":4,\"isComplete\":false,\"name\":\"Test Implementation\",\"toolsStatuses\":{},\"usedTools\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":4,\"previous\":3,\"next\":5,\"isComplete\":false,\"name\":\"Environment Setup\",\"toolsStatuses\":{},\"usedTools\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":5,\"previous\":4,\"next\":6,\"isComplete\":false,\"name\":\"Test Execution\",\"toolsStatuses\":{},\"usedTools\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":6,\"previous\":5,\"next\":7,\"isComplete\":false,\"name\":\"Risk Estimation\",\"toolsStatuses\":{},\"usedTools\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":7,\"previous\":6,\"next\":8,\"isComplete\":false,\"name\":\"Risk Evaluation\",\"toolsStatuses\":{},\"usedTools\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":8,\"previous\":7,\"next\":9,\"isComplete\":false,\"name\":\"Labeling\",\"toolsStatuses\":{},\"usedTools\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":9,\"previous\":8,\"next\":1,\"isComplete\":false,\"name\":\"Treatment\",\"toolsStatuses\":{},\"usedTools\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]}],\"results\":{},\"events\":[],\"usedTools\":[]}','{\"name\":\"Runtime Methodology\",\"description\":\"Test methodology\",\"isRuntime\":true,\"startedTime\":0,\"finishedTime\":0,\"finished\":false,\"lastUpdate\":\"\",\"currentStep\":2,\"firstStep\":1,\"lastStep\":4,\"steps\":[{\"id\":1,\"previous\":1,\"next\":2,\"isComplete\":true,\"name\":\"Step 1\",\"toolsStatuses\":{},\"usedTools\":[4,12],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":2,\"previous\":1,\"next\":3,\"isComplete\":true,\"name\":\"Second Step\",\"toolsStatuses\":{},\"usedTools\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":3,\"previous\":2,\"next\":4,\"isComplete\":false,\"name\":\"Third Step\",\"toolsStatuses\":{},\"usedTools\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":4,\"previous\":3,\"next\":5,\"isComplete\":false,\"name\":\"Fourth Step\",\"toolsStatuses\":{},\"usedTools\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]}],\"results\":{},\"events\":[],\"usedTools\":[]}','{}'),
(4,'2022-01-25 10:56:32','2022-01-28 14:04:04','2022-01-28 14:04:19','Job with Mock Tool','2022-01-27 14:35:38',1,'{\"6.values\":\"66, 66, 33, 0, 100, 33\"}','{\"name\":\"DesignTime Methodology\",\"description\":\"This is a mock design time methodology, to prove the working of the BIECO Platform\",\"isRuntime\":false,\"startedTime\":1643371444138,\"finishedTime\":1643371459318,\"finished\":true,\"lastUpdate\":\"\",\"currentStep\":1,\"firstStep\":1,\"lastStep\":1,\"steps\":[{\"id\":1,\"previous\":1,\"next\":1,\"isComplete\":true,\"name\":\"Run Mock Tool\",\"toolsStatuses\":{\"6\":\"Finished\"},\"usedTools\":[6],\"transfer\":[],\"inputs\":[],\"outputs\":[{\"toolId\":6,\"messages\":[{\"jobID\":\"4\",\"timestamp\":\"2022-01-28 14:04:13.218\",\"messageType\":\"Error\",\"sourceIP\":\"0.0.0.0\",\"sourceID\":\"6\",\"destinationID\":\"\",\"event\":\"Error\",\"accessLevel\":\"public\",\"priority\":5,\"crc\":25042718311,\"bodyFormat\":\"text\",\"bodyCompression\":\"none\",\"body\":\"Failure on line 55 of file main.cpp\"},{\"jobID\":\"4\",\"timestamp\":\"2022-01-28 14:04:15.246\",\"messageType\":\"Error\",\"sourceIP\":\"0.0.0.0\",\"sourceID\":\"6\",\"destinationID\":\"\",\"event\":\"Error\",\"accessLevel\":\"public\",\"priority\":5,\"crc\":27814316112,\"bodyFormat\":\"text\",\"bodyCompression\":\"none\",\"body\":\"Possible Zero-Day Exploit in module org.example.serialinput.ReadInput\"},{\"jobID\":\"4\",\"timestamp\":\"2022-01-28 14:04:17.272\",\"messageType\":\"Finishing\",\"sourceIP\":\"0.0.0.0\",\"sourceID\":\"6\",\"destinationID\":\"\",\"event\":\"Finishing\",\"accessLevel\":\"public\",\"priority\":5,\"crc\":24081978791,\"bodyFormat\":\"JSON\",\"bodyCompression\":\"none\",\"body\":\"{\\\"radarValues\\\":\\\"66, 66, 33, 0, 100, 33\\\"}\"}]}],\"nextStepTransitions\":[]}],\"results\":{\"Holisun Mock Tool - Error - 1\":\"Possible Zero-Day Exploit in module org.example.serialinput.ReadInput\",\"Holisun Mock Tool - Error - 0\":\"Failure on line 55 of file main.cpp\",\"Holisun Mock Tool - Finished - 2\":\"{\\\"radarValues\\\":\\\"66, 66, 33, 0, 100, 33\\\"}\",\"Holisun Mock Tool - Finished - 1\":\"Possible Zero-Day Exploit in module org.example.serialinput.ReadInput\",\"Holisun Mock Tool - Finished - 0\":\"Failure on line 55 of file main.cpp\"},\"events\":[],\"usedTools\":[6]}','{\"name\":\"Runtime Methodology\",\"description\":\"\",\"isRuntime\":true,\"startedTime\":0,\"finishedTime\":0,\"finished\":false,\"lastUpdate\":\"\",\"currentStep\":2,\"firstStep\":1,\"lastStep\":4,\"steps\":[{\"id\":1,\"previous\":1,\"next\":2,\"isComplete\":true,\"name\":\"First Step\",\"toolsStatuses\":{},\"usedTools\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":2,\"previous\":1,\"next\":3,\"isComplete\":true,\"name\":\"Second Step\",\"toolsStatuses\":{},\"usedTools\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":3,\"previous\":2,\"next\":4,\"isComplete\":false,\"name\":\"Third Step\",\"toolsStatuses\":{},\"usedTools\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":4,\"previous\":3,\"next\":5,\"isComplete\":false,\"name\":\"Fourth Step\",\"toolsStatuses\":{},\"usedTools\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]}],\"results\":{},\"events\":[],\"usedTools\":[]}','null');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES 
(1,'messageToReaction','{\"store\":[\"org.bieco.orchestrator.reactions.StoreInDCTReaction\"],\"retrieve\":[\"org.bieco.orchestrator.reactions.RetrieveFromDCTReaction\"],\"apiaccess\":[\"org.bieco.orchestrator.reactions.ApiAccessReaction\"],\"display\":[\"org.bieco.orchestrator.reactions.SendToUiReaction\"],\"iframe\":[\"org.bieco.orchestrator.reactions.StartIframeReaction\"],\"iframeend\":[\"org.bieco.orchestrator.reactions.EndIframeReaction\"],\"info\":[\"org.bieco.orchestrator.reactions.SendToUiReaction\"],\"notice\":[\"org.bieco.orchestrator.reactions.SendToUiReaction\"],\"warning\":[\"org.bieco.orchestrator.reactions.SendToUiReaction\"],\"ui\":[\"org.bieco.orchestrator.reactions.SendToUiReaction\"],\"uirequest\":[\"org.bieco.orchestrator.reactions.UiRequestReaction\"]}'),
(2,'defaultDesignMethodologyBak','{\"name\":\"DesignTime Methodology\",\"description\":\"\",\"isRuntime\":false,\"lastUpdate\":null,\"currentStep\":3,\"firstStep\":1,\"lastStep\":9,\"steps\":[{\"id\":1,\"previous\":null,\"next\":2,\"isComplete\":true,\"name\":\"Risk Identification\",\"toolsStatuses\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":2,\"previous\":1,\"next\":3,\"isComplete\":true,\"name\":\"Test Design\",\"toolsStatuses\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":3,\"previous\":2,\"next\":4,\"isComplete\":false,\"name\":\"Test Implementation\",\"toolsStatuses\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":4,\"previous\":3,\"next\":5,\"isComplete\":false,\"name\":\"Environment Setup\",\"toolsStatuses\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":5,\"previous\":4,\"next\":6,\"isComplete\":false,\"name\":\"Test Execution\",\"toolsStatuses\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":6,\"previous\":5,\"next\":7,\"isComplete\":false,\"name\":\"Risk Estimation\",\"toolsStatuses\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":7,\"previous\":6,\"next\":8,\"isComplete\":false,\"name\":\"Risk Evaluation\",\"toolsStatuses\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":8,\"previous\":7,\"next\":9,\"isComplete\":false,\"name\":\"Labeling\",\"toolsStatuses\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":9,\"previous\":8,\"next\":null,\"isComplete\":false,\"name\":\"Treatment\",\"toolsStatuses\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]}]}'),
(3,'defaultRunMethodology','{\"name\":\"Runtime Methodology\",\"description\":\"\",\"isRuntime\":true,\"lastUpdate\":null,\"currentStep\":2,\"firstStep\":1,\"lastStep\":4,\"steps\":[{\"id\":1,\"previous\":null,\"next\":2,\"isComplete\":true,\"name\":\"First Step\",\"toolsStatuses\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":2,\"previous\":1,\"next\":3,\"isComplete\":true,\"name\":\"Second Step\",\"toolsStatuses\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":3,\"previous\":2,\"next\":4,\"isComplete\":false,\"name\":\"Third Step\",\"toolsStatuses\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]},{\"id\":4,\"previous\":3,\"next\":5,\"isComplete\":false,\"name\":\"Fourth Step\",\"toolsStatuses\":[],\"transfer\":[],\"inputs\":[],\"outputs\":[],\"nextStepTransitions\":[]}]}'),
(4,'uiWsconnURL','http://localhost:1000/wsconn'),
(5,'heartbeatIntervalSeconds','10'),
(6,'defaultDesignMethodology','{\n  \"name\": \"DesignTime Methodology\",\n  \"description\": \"This is a mock design time methodology, to prove the working of the BIECO Platform\",\n  \"isRuntime\": false,\n  \"startTime\": 0,\n  \"finishTime\": 0,\n  \"finished\": false,\n  \"lastUpdate\": \"\",\n  \"currentStep\": 1,\n  \"firstStep\": 1,\n  \"lastStep\": 1,\n  \"steps\": [\n    {\n      \"id\": 1,\n      \"previous\": null,\n      \"next\": null,\n      \"isComplete\": false,\n      \"name\": \"Run Mock Tool\",\n      \"toolsStatuses\": [],\n      \"usedTools\": [6],\n      \"transfer\": [],\n      \"inputs\": [],\n      \"outputs\": [],\n      \"nextStepTransitions\": []\n    }\n  ],\n  \"results\": [],\n  \"events\": [],\n  \"usedTools\": [6]\n}');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;




/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-23 10:57:33
