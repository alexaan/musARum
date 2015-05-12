CREATE DATABASE  IF NOT EXISTS `museumdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `museumdb`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: museumdb
-- ------------------------------------------------------
-- Server version	5.5.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `ans_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(155) DEFAULT NULL,
  `questions_q_id` int(11) NOT NULL,
  `sessions_session_id` int(11) NOT NULL,
  `groups_grp_id` int(11) NOT NULL,
  PRIMARY KEY (`ans_id`),
  KEY `fk_answers_questions1_idx` (`questions_q_id`),
  KEY `fk_answers_sessions1_idx` (`sessions_session_id`),
  KEY `fk_answers_groups1_idx` (`groups_grp_id`),
  CONSTRAINT `fk_answers_groups1` FOREIGN KEY (`groups_grp_id`) REFERENCES `groups` (`grp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_answers_questions1` FOREIGN KEY (`questions_q_id`) REFERENCES `questions` (`q_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_answers_sessions1` FOREIGN KEY (`sessions_session_id`) REFERENCES `sessions` (`session_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (5,'Nothing',5,332,9),(6,'A lot',5,332,10),(7,'Something',5,332,11),(8,'Hi',6,332,8),(9,'Sup',6,332,10),(10,'Hey',6,332,11),(13,'9',22,333,402),(14,'Nothing',5,333,403),(15,'qwe',21,333,403),(16,'Hey!',6,333,403),(18,'Nothing',5,333,404),(19,'Nothing',5,333,404),(20,'Nothing',5,333,404),(21,'Nothing',5,333,404),(22,'Nothing',5,333,404),(23,'Nothing',5,333,404),(24,'Hey!',6,333,405),(25,'9',22,333,405),(26,'Hey!',6,333,405),(27,'wqe',22,333,288),(29,'Hey!',6,333,288),(30,'etreywreqwrqweqwe',5,333,406),(31,'solution to question',21,333,406),(32,'9',22,333,406),(35,'w',6,333,410),(36,'Hey!',6,333,410),(37,'wqe',22,333,409),(38,'Hey!',6,333,411),(40,'solutionnewQ',22,333,412),(41,'Hey!',6,333,413),(42,'9',22,333,264),(43,'w',22,333,414),(44,'solutionnewQ',22,333,415),(45,'w',6,333,415),(46,'w',22,333,264),(47,'wqe',22,333,264),(48,'Nothing',5,333,264),(49,'Hey!',6,333,264),(50,'wqe',22,333,264),(51,'q',5,333,416),(52,'q',21,333,416),(53,'solution to question',21,333,416),(54,'w',22,333,416),(55,'w',6,333,416),(56,'etreywreqwrqweqwe',5,333,416),(57,'etreywreqwrqweqwe',5,333,416),(58,'2',6,333,416),(59,'8',21,333,416),(61,'9',22,333,416),(62,'qwe',21,333,416),(63,'Nothing',5,333,416),(64,'qwe',21,333,416),(65,'1',5,333,417),(66,'Hey!',6,333,417),(68,'q',21,333,417),(69,'q',5,333,417),(70,'q',21,333,417),(71,'Nothing',5,333,417),(73,'q',5,333,417),(76,'w',22,333,418),(77,'1',5,333,418),(78,'qwe',21,333,418),(81,'q',21,333,419),(82,'etreywreqwrqweqwe',5,333,419),(83,'q',5,333,420),(85,'Hey!',6,333,420),(86,'solution to question',21,333,420),(88,'Hey!',6,333,420),(90,'2',6,333,421),(91,'2',6,333,421),(92,'w',22,333,422),(93,'Nothing',5,333,422),(94,'2',6,333,422),(95,'1',5,333,422),(96,'Hey!',6,333,422),(102,'wqe',22,333,422),(103,'q',21,333,422),(105,'8',21,333,422),(107,'Nothing',5,333,423),(108,'1',5,333,423),(109,'w',6,333,423),(110,'Hey!',6,333,423),(111,'qwe',21,333,423),(112,'8',21,333,423),(113,'qwe',21,333,425),(114,'g',6,333,426),(115,'qwe',21,333,427),(116,'q',21,333,428),(117,'8',21,333,428),(118,'Hey!',6,333,428),(119,'Hey!',6,333,429),(120,'etreywreqwrqweqwe',5,333,429),(121,'qwe',21,333,430),(122,'9',22,333,430),(124,'qwe',21,333,431),(125,'w',22,333,431),(126,'wqe',22,333,432),(129,'2',6,333,433),(130,'qwe',21,333,433),(132,'etreywreqwrqweqwe',5,333,434),(133,'q',21,333,434),(135,'insertAnswer',6,333,434),(136,'qwe',21,333,434),(137,'w',6,333,435),(138,'8',21,333,435),(139,'solutionnewQ',22,333,435),(140,'8',21,333,436),(141,'w',6,333,436),(142,'2',6,333,436),(143,'8',21,333,439),(144,'q',21,333,439),(145,'w',6,333,447),(146,'solution to question',21,333,448),(147,'etreywreqwrqweqwe',5,333,448),(148,'pppppp',33,333,449),(149,'u',34,333,449),(150,'supah',116,333,453),(151,'31',59,333,405),(152,'1',61,333,405),(153,'w',6,333,473),(154,'8',21,333,474),(155,'2',6,333,475),(156,'1',5,333,479),(157,'solution to question',21,333,479),(158,'Yes',8,333,479),(159,'wqe',8,333,488),(160,'2',99,333,488),(161,'5',102,333,488),(162,'g',6,333,490),(163,'qwe',21,333,490),(164,'w',22,333,490),(165,'Nothing',5,333,490),(166,'8',105,333,505),(167,'gwe',108,333,505),(168,'etreywreqwrqweqwe',5,333,259),(169,'Hey!',6,333,506),(170,'8',21,333,506),(171,'etreywreqwrqweqwe',5,333,506),(172,'w',22,333,506),(173,'7',32,333,506),(174,'solution to question',21,333,507),(175,'1',5,333,507),(176,'g',6,333,507),(177,'w',6,333,508),(178,'q',21,333,508),(179,'yy',84,333,514),(180,'weg',80,333,514),(181,'herf',81,333,514),(182,'Yes',8,333,516),(183,'Yes',8,333,517),(184,'alt1',116,333,523),(185,'Nothing',5,333,523),(186,'Nothing',5,333,578),(187,'2',6,333,582),(188,'solutionnewQ',22,333,591),(189,'q',21,333,591),(190,'solution to question',21,333,594),(191,'Hey!',6,333,594),(192,'9',22,333,595),(193,'g',6,333,603),(194,'8',21,333,604),(195,'9',22,333,604),(196,'8',21,333,265),(197,'hrew',77,333,653),(198,'lolololol',79,333,653),(199,'solution to question',21,333,654),(200,'solution to question',21,333,656),(201,'hffrr',102,333,656),(202,'Hey!',6,333,657),(203,'6',115,333,657),(204,'5',102,333,657),(205,'2',99,333,657),(206,'w',6,333,658),(207,'8',21,333,658),(208,'wq',32,333,658),(209,'g',6,333,659),(210,'7',32,333,659),(211,'solutionnewQ',22,333,660),(212,'sss',32,333,660),(213,'solution to question',21,333,661),(214,'wqe',22,333,661),(215,'7',32,333,661),(216,'w',6,333,661),(217,'t',32,333,662),(218,'solution to question',21,333,664),(219,'Hey!',6,333,664),(220,'wqe',22,333,665),(221,'solution to question',21,333,665),(222,'234',102,333,665),(223,'q',21,333,666),(224,'Nothing',5,333,666),(225,'ear',102,333,666),(226,'32324',99,333,666),(227,'ggg',135,333,666),(228,'g',6,333,667),(229,'solutionnewQ',22,333,667),(230,'8',21,333,667),(231,'etreywreqwrqweqwe',5,333,667),(232,'solutionnewQ',22,333,668),(233,'8',21,333,668),(234,'9',22,333,669),(235,'2',6,333,669),(236,'8',21,333,669),(237,'wq',32,333,669),(238,'q',5,333,670),(239,'sss',32,333,670),(240,'9',22,333,670),(241,'w',6,333,670),(242,'qwe',21,333,671),(243,'9',22,333,671),(244,'8',21,333,672),(245,'w',22,333,672),(246,'2',6,333,672),(247,'etreywreqwrqweqwe',5,333,672),(248,'9',22,333,673),(249,'solution to question',21,333,673),(250,'t',32,333,673),(251,'Nothing',5,333,673),(252,'Hey!',6,333,673),(253,'2',6,333,674),(254,'etreywreqwrqweqwe',5,333,674),(255,'8',21,333,674),(256,'wqe',22,333,675),(257,'etreywreqwrqweqwe',5,333,675),(258,'wq',32,333,675),(259,'qwe',21,333,676),(260,'q',5,333,676),(261,'sss',32,333,676),(262,'9',22,333,677),(263,'qwe',21,333,677),(264,'Nothing',5,333,677),(265,'w',22,333,678),(266,'Nothing',5,333,678),(267,'q',21,333,679),(268,'1',5,333,679),(269,'wqe',22,333,680),(270,'Hey!',6,333,680),(271,'q',5,333,680),(272,'w',6,333,681),(273,'1',5,333,683),(274,'w',6,333,683),(275,'1',5,333,684),(276,'Hey!',6,333,684),(277,'1',5,333,685),(278,'solutionnewQ',22,333,685),(279,'7',32,333,685),(280,'8',21,333,691),(281,'9',22,333,694),(282,'2',6,333,694),(283,'8',56,333,698),(284,'+',59,333,698),(285,'we',58,333,698),(286,'t',32,333,698),(287,'8',21,333,698),(288,'ttt',34,333,698),(289,'solutionnewQ',22,333,704),(290,'wq',32,333,705),(291,'y',33,333,706),(292,'wq',32,333,707);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_element_image`
--

DROP TABLE IF EXISTS `ar_element_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_element_image` (
  `ar_elements_ar_element_id` int(11) NOT NULL,
  `ar_i_testfield` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ar_elements_ar_element_id`),
  CONSTRAINT `fk_ar_element_image_ar_elements1` FOREIGN KEY (`ar_elements_ar_element_id`) REFERENCES `ar_elements` (`ar_element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_element_image`
--

LOCK TABLES `ar_element_image` WRITE;
/*!40000 ALTER TABLE `ar_element_image` DISABLE KEYS */;
INSERT INTO `ar_element_image` VALUES (5,'testimage1'),(6,'testimage2');
/*!40000 ALTER TABLE `ar_element_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_element_sound`
--

DROP TABLE IF EXISTS `ar_element_sound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_element_sound` (
  `ar_elements_ar_element_id` int(11) NOT NULL,
  `ar_s_testfield` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ar_elements_ar_element_id`),
  CONSTRAINT `fk_ar_element_sound_ar_elements1` FOREIGN KEY (`ar_elements_ar_element_id`) REFERENCES `ar_elements` (`ar_element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_element_sound`
--

LOCK TABLES `ar_element_sound` WRITE;
/*!40000 ALTER TABLE `ar_element_sound` DISABLE KEYS */;
INSERT INTO `ar_element_sound` VALUES (7,'testsound1'),(8,'testsound2'),(9,'testsound7'),(10,'testsound8'),(11,'testsound9');
/*!40000 ALTER TABLE `ar_element_sound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_elements`
--

DROP TABLE IF EXISTS `ar_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_elements` (
  `ar_element_id` int(11) NOT NULL AUTO_INCREMENT,
  `are_name` varchar(100) DEFAULT NULL,
  `Url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ar_element_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_elements`
--

LOCK TABLES `ar_elements` WRITE;
/*!40000 ALTER TABLE `ar_elements` DISABLE KEYS */;
INSERT INTO `ar_elements` VALUES (5,'are1','1.png'),(6,'are2','Bomb_Up.png'),(7,'are3','vg.no/are3'),(8,'are4','vg.no/are4'),(9,'are5','sound2.mp3'),(10,'are6','lol2'),(11,'are7','lol3'),(12,'areNew','Fire.png');
/*!40000 ALTER TABLE `ar_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `grp_id` int(11) NOT NULL AUTO_INCREMENT,
  `grp_name` varchar(45) DEFAULT NULL,
  `score` bigint(20) DEFAULT NULL,
  `sessions_session_id` int(11) NOT NULL,
  `current_phase` varchar(60) DEFAULT NULL,
  `current_image_id` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`grp_id`),
  KEY `fk_groups_sessions_idx` (`sessions_session_id`),
  CONSTRAINT `fk_groups_sessions` FOREIGN KEY (`sessions_session_id`) REFERENCES `sessions` (`session_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=729 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (8,'grp1',45,332,NULL,NULL),(9,'grp2',34,332,NULL,NULL),(10,'grp3',63,332,NULL,NULL),(11,'grp4',23,332,NULL,NULL),(12,'grp1ses2',88,333,NULL,NULL),(13,'grp2ses2',32,333,NULL,NULL),(14,'grp3ses2',43,333,NULL,NULL),(15,'grp1ses3',NULL,334,NULL,NULL),(16,'looooool',NULL,333,NULL,NULL),(17,'loooooasdasdaol',NULL,333,NULL,NULL),(18,'loooooasdasdaol',NULL,333,NULL,NULL),(19,'loooooasdasdaol',NULL,333,NULL,NULL),(20,'SUUUUUPAH',NULL,333,NULL,NULL),(21,'jejeje',NULL,333,NULL,NULL),(22,'jejeje',NULL,333,NULL,NULL),(23,'jejeje',NULL,333,NULL,NULL),(24,'xDDD',NULL,333,NULL,NULL),(25,'roflmao',NULL,333,NULL,NULL),(26,'yttt',NULL,333,NULL,NULL),(28,'it',NULL,333,NULL,NULL),(29,'qefasdwFEB',NULL,333,NULL,NULL),(30,'feasdawdefqw',NULL,333,NULL,NULL),(31,'asdwefgrwg',NULL,333,NULL,NULL),(32,'asdweg4wrhr',NULL,333,NULL,NULL),(33,'qrewfsgrdtehryj',NULL,333,NULL,NULL),(34,'fwoihnsd',NULL,333,NULL,NULL),(35,'wefwsacwq',NULL,333,NULL,NULL),(36,'eqfdwefe',NULL,333,NULL,NULL),(37,'wsade',NULL,333,NULL,NULL),(38,'asdfghjklø',NULL,333,NULL,NULL),(39,'sadfjkløæ\'ølyrteewr',NULL,333,NULL,NULL),(40,'qwertyhtegrfsdzfffff',NULL,333,NULL,NULL),(41,'swsssss',NULL,333,NULL,NULL),(42,'sssaaa',NULL,333,NULL,NULL),(43,'123e',NULL,333,NULL,NULL),(44,'99982',NULL,333,NULL,NULL),(45,'asdfhjkløæ\'',NULL,333,NULL,NULL),(46,'ffffffffffffffffffffffff',NULL,333,NULL,NULL),(47,'12313123123123',NULL,333,NULL,NULL),(48,'asdasdasdasd',NULL,333,NULL,NULL),(49,'asdasdasd',NULL,333,NULL,NULL),(50,'asdasd',NULL,333,NULL,NULL),(51,'adasdasd',NULL,333,NULL,NULL),(52,'ååååååå',NULL,333,NULL,NULL),(53,'qweqweqwe',NULL,333,NULL,NULL),(54,'qweqewqe',NULL,333,NULL,NULL),(55,'rtyrtyrty',NULL,333,NULL,NULL),(56,'uiouio',NULL,333,NULL,NULL),(57,'tyutyutyu',NULL,333,NULL,NULL),(58,'sdsdsdsd',NULL,333,NULL,NULL),(59,'sasss',NULL,333,NULL,NULL),(60,'saewqwwww',NULL,333,NULL,NULL),(61,'qqqqqqqqqqq',NULL,333,NULL,NULL),(62,'wwwee',NULL,333,NULL,NULL),(63,'asdggggg',NULL,333,NULL,NULL),(64,'saf',NULL,333,NULL,NULL),(65,'ww',NULL,333,NULL,NULL),(66,'qweee',NULL,333,NULL,NULL),(67,'qweqweqwe',NULL,333,NULL,NULL),(68,'www',NULL,333,NULL,NULL),(69,'ewqewqeeewwewe',NULL,333,NULL,NULL),(70,'ej tthd',NULL,333,NULL,NULL),(71,'req',NULL,333,NULL,NULL),(72,'we',NULL,332,NULL,NULL),(73,'we',NULL,333,NULL,NULL),(74,'ew',NULL,333,NULL,NULL),(75,'ewew',NULL,332,NULL,NULL),(76,'eeeee',NULL,334,NULL,NULL),(77,'wqeqwewqe',NULL,333,NULL,NULL),(78,'asdadasd',NULL,333,NULL,NULL),(79,'qwwqwqwqwq',NULL,333,NULL,NULL),(80,'qwewqewxcfe',NULL,333,NULL,NULL),(81,'421424rrr',NULL,333,NULL,NULL),(82,'ewewewewewfwagb',NULL,333,NULL,NULL),(83,'234567890',NULL,333,NULL,NULL),(84,'rffg',NULL,333,NULL,NULL),(85,'tgjkk',NULL,333,NULL,NULL),(86,'team rolf',NULL,333,NULL,NULL),(87,'grrrr',NULL,333,NULL,NULL),(88,'lolerts',NULL,333,NULL,NULL),(89,'ghh',NULL,333,NULL,NULL),(90,'rrt',NULL,333,NULL,NULL),(91,'hhhj',NULL,333,NULL,NULL),(92,'ggg',NULL,333,'Phase 1','2'),(93,'team it',NULL,333,NULL,NULL),(94,'jjhh',NULL,333,NULL,NULL),(95,'dddd',NULL,333,NULL,NULL),(96,'eeegrp',NULL,333,NULL,NULL),(97,'isd',NULL,333,NULL,NULL),(98,'efg',NULL,333,NULL,NULL),(99,'t Gd efh',NULL,333,NULL,NULL),(100,'hjhh',NULL,333,NULL,NULL),(101,'ttcbk',NULL,333,NULL,NULL),(102,'999',NULL,332,NULL,NULL),(103,'55y',NULL,333,NULL,NULL),(104,'f hi u',NULL,333,NULL,NULL),(105,'hgfd',NULL,333,NULL,NULL),(106,'7cugu',NULL,333,NULL,NULL),(107,'hhf',NULL,333,NULL,NULL),(108,'uhg',NULL,333,NULL,NULL),(109,'ggh',NULL,333,NULL,NULL),(110,'7gi',NULL,333,NULL,NULL),(111,'vhddj',NULL,333,NULL,NULL),(112,'hggy',NULL,333,NULL,NULL),(113,'ufuf',NULL,333,NULL,NULL),(114,'ur',NULL,333,NULL,NULL),(115,'khg',NULL,333,NULL,NULL),(116,'lgd',NULL,333,NULL,NULL),(117,'hhrr',NULL,333,NULL,NULL),(118,'uhgc',NULL,333,NULL,NULL),(119,'hhhhh',NULL,333,NULL,NULL),(120,'Gt rgg jo',NULL,333,NULL,NULL),(121,'hhfg',NULL,333,NULL,NULL),(122,'qwe',NULL,333,NULL,NULL),(123,'asd',NULL,333,NULL,NULL),(124,'123',NULL,333,NULL,NULL),(125,'asdasd',NULL,333,NULL,NULL),(126,'vhh',NULL,333,'Phase 1','1'),(127,'asd',NULL,333,NULL,NULL),(128,'ggf',NULL,333,NULL,NULL),(129,'asd',NULL,333,NULL,NULL),(130,'asdasd',NULL,333,NULL,NULL),(131,'asdasdasd',NULL,333,NULL,NULL),(132,'asdasdasd',NULL,333,NULL,NULL),(133,'uzud',NULL,333,NULL,NULL),(134,'ifif',NULL,333,NULL,NULL),(135,'hhgg',NULL,333,NULL,NULL),(136,'rji',NULL,333,NULL,NULL),(137,'hhd',NULL,333,NULL,NULL),(138,'hhhh',NULL,333,NULL,NULL),(139,'gghj',NULL,333,NULL,NULL),(140,'dusu',NULL,333,NULL,NULL),(141,'hhg',NULL,333,NULL,NULL),(142,'asdasd',NULL,333,NULL,NULL),(143,'hhd',NULL,333,NULL,NULL),(144,'gggglj',NULL,333,NULL,NULL),(145,'jjfg',NULL,333,NULL,NULL),(146,'hhj',NULL,333,NULL,NULL),(147,'jjjj',NULL,333,NULL,NULL),(148,'jhgg',NULL,333,NULL,NULL),(149,'vcg',NULL,333,NULL,NULL),(150,'hhh',NULL,333,NULL,NULL),(151,'hhggg',NULL,333,NULL,NULL),(152,'ffhk',NULL,333,NULL,NULL),(153,'hg gfdj',NULL,333,NULL,NULL),(154,'jjh',NULL,333,NULL,NULL),(155,'hjjj',NULL,333,NULL,NULL),(156,'vvvk',NULL,333,NULL,NULL),(157,'hhffh',NULL,333,NULL,NULL),(158,'vhk',NULL,333,NULL,NULL),(159,'vhh',NULL,333,'Phase 1','1'),(160,'bjh',NULL,333,NULL,NULL),(162,'asdads',NULL,333,NULL,NULL),(163,'ufu',NULL,333,NULL,NULL),(164,'hhgg',NULL,333,NULL,NULL),(165,'jhg',NULL,333,NULL,NULL),(166,'yyg vi g g',NULL,333,NULL,NULL),(167,'jhhhh',NULL,333,NULL,NULL),(168,'bjhf',NULL,333,NULL,NULL),(169,'thi',NULL,333,NULL,NULL),(170,'uduf',NULL,333,NULL,NULL),(171,'y yxiwox',NULL,333,NULL,NULL),(172,'jhg',NULL,333,NULL,NULL),(173,'hhh',NULL,333,NULL,NULL),(174,'123123',NULL,333,NULL,NULL),(175,'jhhgh',NULL,333,NULL,NULL),(176,'jmhj',NULL,333,NULL,NULL),(177,'rg',NULL,333,NULL,NULL),(178,'hhh',NULL,333,NULL,NULL),(179,'jjeey',NULL,333,NULL,NULL),(180,'bjg',NULL,333,NULL,NULL),(181,'usu',NULL,333,NULL,NULL),(182,'hhgg',NULL,333,NULL,NULL),(183,'jfgjg',NULL,333,NULL,NULL),(184,'ffdhkgf',NULL,333,NULL,NULL),(185,'PC',NULL,333,NULL,NULL),(186,'jjjjjjjjj',NULL,333,NULL,NULL),(187,'rgyu',NULL,333,NULL,NULL),(188,'jjjjjjjj',NULL,333,NULL,NULL),(189,'asdasdasd',NULL,333,NULL,NULL),(190,'asdasd',NULL,333,NULL,NULL),(191,'asdasd',NULL,333,NULL,NULL),(192,'bbj',NULL,333,'Phase 1','3'),(193,'tzfhj',NULL,333,NULL,NULL),(194,'vvvvvv',NULL,333,NULL,NULL),(195,'hhhhhh',NULL,333,NULL,NULL),(196,'iiiii',NULL,333,NULL,NULL),(197,'jjjj',NULL,333,NULL,NULL),(198,'jjjjjjjjj',NULL,333,NULL,NULL),(199,'hhhhj',NULL,333,NULL,NULL),(200,'asdasd',NULL,333,NULL,NULL),(201,'ooooo',NULL,333,NULL,NULL),(202,'&*&&&',NULL,333,NULL,NULL),(203,'kkkkk',NULL,333,NULL,NULL),(204,'jjjjjjjj',NULL,333,NULL,NULL),(205,'uuu',NULL,333,NULL,NULL),(206,'llll',NULL,333,NULL,NULL),(207,'kkk',NULL,333,'Phase 1','1'),(208,'5gkgj',NULL,333,NULL,NULL),(209,'tja',NULL,333,NULL,NULL),(210,'jam',NULL,333,NULL,NULL),(211,'wmjt',NULL,333,NULL,NULL),(212,'xgyt',NULL,333,NULL,NULL),(213,'gghu',NULL,333,NULL,NULL),(214,'pppp',NULL,333,NULL,NULL),(215,'pppååå',NULL,333,NULL,NULL),(216,'jkkkk',NULL,333,NULL,NULL),(217,'ufj RF 7cufjjf',NULL,333,NULL,NULL),(218,'t g ggg',NULL,333,NULL,NULL),(219,'llll',NULL,333,NULL,NULL),(220,'kkk',NULL,333,'Phase 1','1'),(221,'hhh',NULL,333,NULL,NULL),(222,'jjjjj',NULL,333,NULL,NULL),(223,'gggg',NULL,333,NULL,NULL),(224,'ttf b b',NULL,333,NULL,NULL),(225,'uxufufufuf',NULL,333,NULL,NULL),(226,'kkkkk',NULL,333,NULL,NULL),(227,'ooo',NULL,333,NULL,NULL),(228,'dedeee',NULL,333,NULL,NULL),(229,'gggg',NULL,333,NULL,NULL),(230,'ggggggggg',NULL,333,NULL,NULL),(231,'yyyyyy',NULL,333,NULL,NULL),(232,'påpåpåpå',NULL,333,NULL,NULL),(233,'3asdasd',NULL,333,NULL,NULL),(234,'bbb',NULL,333,NULL,NULL),(235,'ooo',NULL,333,NULL,NULL),(236,'hh',NULL,333,NULL,NULL),(237,'ghhhj',NULL,333,NULL,NULL),(238,'gggg',NULL,333,NULL,NULL),(239,'hhh',NULL,333,NULL,NULL),(240,'jjj',NULL,333,'Phase 1','1'),(241,'kkk',NULL,333,'Phase 1','1'),(242,'ggggg',NULL,333,NULL,NULL),(243,'hhhh',NULL,333,NULL,NULL),(244,'kkk',NULL,333,'Phase 1','1'),(245,'hhhggg',NULL,333,NULL,NULL),(246,'ppp',NULL,333,NULL,NULL),(247,'wqweqwe',NULL,333,NULL,NULL),(249,'ooo',NULL,333,NULL,NULL),(250,'ooo',NULL,333,NULL,NULL),(251,'thj',NULL,333,NULL,NULL),(252,'g hj ki',NULL,333,NULL,NULL),(253,'fff',NULL,333,NULL,NULL),(254,'gggf',NULL,333,NULL,NULL),(255,'ggg',NULL,333,'Phase 1','2'),(256,'ggjj',NULL,333,NULL,NULL),(257,'uuhg',NULL,333,NULL,NULL),(258,'oooop',NULL,333,NULL,NULL),(259,'ttt',NULL,333,NULL,NULL),(260,'rrgg',NULL,333,NULL,NULL),(261,'gjju',NULL,333,NULL,NULL),(262,'rrr',NULL,333,NULL,NULL),(263,'jzj xz',NULL,333,NULL,NULL),(264,'tt',NULL,333,NULL,NULL),(265,'yy',NULL,333,NULL,NULL),(266,'sss',NULL,333,NULL,NULL),(267,'sss',NULL,333,NULL,NULL),(268,'hhy',NULL,333,NULL,NULL),(269,'33',NULL,333,NULL,NULL),(270,'eee',NULL,333,NULL,NULL),(271,'r',NULL,333,NULL,NULL),(272,'ff',NULL,333,NULL,NULL),(273,'333',NULL,333,NULL,NULL),(274,'4',NULL,333,NULL,NULL),(275,'kk',NULL,333,'Phase 1','1'),(276,'jj',NULL,333,NULL,NULL),(277,'bjkk',NULL,333,NULL,NULL),(278,'popo',NULL,333,NULL,NULL),(279,'jdjfjfjfjf',NULL,333,NULL,NULL),(280,'fffrr',NULL,333,NULL,NULL),(281,'vbv',NULL,333,NULL,NULL),(282,'bbh',NULL,333,NULL,NULL),(283,'kkkk',NULL,333,NULL,NULL),(284,'kjj',NULL,333,NULL,NULL),(285,'hjh',NULL,333,NULL,NULL),(286,'bjj',NULL,333,'Phase 1','1'),(287,'ssw',NULL,333,NULL,NULL),(288,'dss',NULL,333,NULL,NULL),(289,'fhr',NULL,333,NULL,NULL),(290,'asdasdsad',NULL,333,NULL,NULL),(291,'sdfsdfsdf',NULL,333,NULL,NULL),(292,'lkf',NULL,333,NULL,NULL),(293,'jjd',NULL,333,NULL,NULL),(294,'bvh',NULL,333,NULL,NULL),(295,'yhg',NULL,333,NULL,NULL),(296,'bvf',NULL,333,NULL,NULL),(297,'jdjfjd',NULL,333,NULL,NULL),(298,'jjg',NULL,333,NULL,NULL),(299,'ccccccc',NULL,333,NULL,NULL),(300,'sss',NULL,332,NULL,NULL),(301,'jjgf',NULL,333,NULL,NULL),(302,'jvff',NULL,333,NULL,NULL),(303,'ggrggifuf i fdvdh',NULL,333,NULL,NULL),(304,'444 g g hj u f g',NULL,333,NULL,NULL),(305,'rgutfhugg',NULL,333,NULL,NULL),(306,'jdbdbdjdufyudufhdhd',NULL,333,NULL,NULL),(307,'hhhv b x kh',NULL,333,NULL,NULL),(308,'hzhdhdhdhd',NULL,333,NULL,NULL),(309,'yshdhdhdj',NULL,333,NULL,NULL),(310,'jzjzjdjdj',NULL,333,NULL,NULL),(311,'yjjh',NULL,333,NULL,NULL),(312,'hhzhzhshsjsjs',NULL,333,NULL,NULL),(313,'jsud7z7s7wj',NULL,333,NULL,NULL),(314,'kzjzjxu uz',NULL,333,NULL,NULL),(315,'sadngfdssd',NULL,333,NULL,NULL),(316,'ttg',NULL,333,NULL,NULL),(317,'rtgh',NULL,333,NULL,NULL),(318,'cv g w3',NULL,333,NULL,NULL),(319,'kfkfkdkskqkjjj',NULL,333,NULL,NULL),(320,'2456hhh',NULL,333,NULL,NULL),(321,'fghyujk',NULL,333,NULL,NULL),(322,'jzjdjzjhdhzvvvbj',NULL,333,NULL,NULL),(323,'hsjdhdhfh',NULL,333,NULL,NULL),(324,'jfjdjdjOi2666',NULL,333,NULL,NULL),(325,'gg66fg',NULL,333,NULL,NULL),(326,'gjfjjffjx',NULL,333,NULL,NULL),(327,'yzhzjzh',NULL,333,NULL,NULL),(328,'ikdkdkdkdk',NULL,333,NULL,NULL),(329,'hzhd',NULL,333,NULL,NULL),(330,'dl EU tu',NULL,333,NULL,NULL),(331,'ufufju',NULL,333,NULL,NULL),(332,'uuuyyyy',NULL,333,NULL,NULL),(333,'ddff gu uj',NULL,333,NULL,NULL),(334,'mcggh',NULL,333,NULL,NULL),(335,'fgi',NULL,333,NULL,NULL),(336,'hzhz',NULL,333,NULL,NULL),(337,'ggjydee',NULL,333,NULL,NULL),(338,'ftuuy',NULL,333,NULL,NULL),(339,'hdhdhd',NULL,333,NULL,NULL),(340,'yyYdysysyysyss',NULL,333,NULL,NULL),(341,'yysysyzyz',NULL,333,NULL,NULL),(342,'ufududud',NULL,333,NULL,NULL),(343,'ffgfergreg',NULL,333,NULL,NULL),(344,'serdtyfguhij',NULL,333,NULL,NULL),(345,'fvjuf',NULL,333,NULL,NULL),(346,'hvk he rr',NULL,333,NULL,NULL),(347,'hhgj',NULL,333,NULL,NULL),(348,'pp',NULL,333,NULL,NULL),(349,'eheju',NULL,333,NULL,NULL),(350,'dhdssadasd',NULL,333,NULL,NULL),(351,'hjhg',NULL,333,NULL,NULL),(352,'udifuufufuf',NULL,333,NULL,NULL),(353,'jhj',NULL,333,NULL,NULL),(354,'yfufufufu',NULL,333,NULL,NULL),(355,'fggg',NULL,333,NULL,NULL),(356,'gyhgggggf',NULL,333,NULL,NULL),(357,'kjjgg',NULL,333,NULL,NULL),(358,'rrtr',NULL,333,NULL,NULL),(359,'yzudududhdhzhzhz',NULL,333,NULL,NULL),(360,'adsasda',NULL,333,NULL,NULL),(361,'jjjjjj',NULL,333,NULL,NULL),(362,'gggghiiii',NULL,333,NULL,NULL),(363,'fgg',NULL,333,NULL,NULL),(364,'asdasdas',NULL,333,NULL,NULL),(365,'rd',NULL,333,NULL,NULL),(366,'eee et t',NULL,333,NULL,NULL),(367,'tyyy',NULL,333,NULL,NULL),(368,'ggcc',NULL,333,NULL,NULL),(369,'ggs hj d ju',NULL,333,NULL,NULL),(370,'uhrrt',NULL,333,NULL,NULL),(371,'asasd',NULL,333,NULL,NULL),(372,'yd5d5',NULL,333,NULL,NULL),(373,'yygg',NULL,333,NULL,NULL),(374,'aSasa',NULL,333,NULL,NULL),(375,'ugdrr',NULL,333,NULL,NULL),(376,'yyytt',NULL,333,NULL,NULL),(377,'ujjj',NULL,333,NULL,NULL),(378,'yytgr',NULL,333,NULL,NULL),(379,'hhhr',NULL,333,NULL,NULL),(380,'hhggt',NULL,333,NULL,NULL),(381,'yyrrr',NULL,333,NULL,NULL),(382,'yjggg',NULL,333,NULL,NULL),(383,'asdagg',NULL,333,NULL,NULL),(384,'ty5',NULL,333,NULL,NULL),(385,'Tys',NULL,333,NULL,NULL),(386,'ggju',NULL,333,NULL,NULL),(387,'tr',NULL,333,NULL,NULL),(388,'tyy',NULL,333,NULL,NULL),(389,'yyy',NULL,333,NULL,NULL),(390,'r fg hy',NULL,333,NULL,NULL),(391,'jhh',NULL,333,NULL,NULL),(392,'tttt',NULL,333,NULL,NULL),(393,'ttr',NULL,333,NULL,NULL),(394,'66h',NULL,333,NULL,NULL),(395,'ghg',NULL,333,NULL,NULL),(396,'ujhh',NULL,333,NULL,NULL),(397,'gg',NULL,333,NULL,NULL),(398,'ghhg',NULL,333,NULL,NULL),(399,'yhy',NULL,333,NULL,NULL),(400,'44',NULL,333,NULL,NULL),(401,'t',NULL,333,NULL,NULL),(402,'rr',NULL,333,NULL,NULL),(403,'err',NULL,333,NULL,NULL),(404,'dd',NULL,333,NULL,NULL),(405,'ddd',NULL,333,NULL,NULL),(406,'jhu',NULL,333,NULL,NULL),(407,'kkj',NULL,333,NULL,NULL),(408,'pkk',NULL,333,NULL,NULL),(409,'ee',NULL,333,NULL,NULL),(410,'ssk',NULL,333,NULL,NULL),(411,'yyt',NULL,333,NULL,NULL),(412,'3tt',NULL,333,NULL,NULL),(413,'reed',NULL,333,NULL,NULL),(414,'eex',NULL,333,NULL,NULL),(415,'e g hj',NULL,333,NULL,NULL),(416,'errrk',NULL,333,NULL,NULL),(417,'128',NULL,333,NULL,NULL),(418,'iii',NULL,333,'Phase 1','1'),(419,'trt',NULL,333,NULL,NULL),(420,'444',NULL,333,NULL,NULL),(421,'erry',NULL,333,NULL,NULL),(422,'frt',NULL,333,NULL,NULL),(423,'sadgr',NULL,333,NULL,NULL),(424,'tert',NULL,333,NULL,NULL),(425,'warqf',NULL,333,NULL,NULL),(426,'sadfxgchjk',NULL,333,NULL,NULL),(427,'swart',NULL,333,NULL,NULL),(428,'asfe',NULL,333,NULL,NULL),(429,'asdchge',NULL,333,NULL,NULL),(430,'asdge',NULL,333,NULL,NULL),(431,'sad',NULL,333,NULL,NULL),(432,'satq3',NULL,333,NULL,NULL),(433,'sadage',NULL,333,NULL,NULL),(434,'sdk',NULL,333,NULL,NULL),(435,'asdfg',NULL,333,NULL,NULL),(436,'asg3e',NULL,333,NULL,NULL),(437,'asfgr',NULL,333,NULL,NULL),(438,'qwer',NULL,333,NULL,NULL),(439,'wqewqzs',NULL,333,NULL,NULL),(440,'wqrqg',NULL,333,NULL,NULL),(441,'wsara',NULL,333,NULL,NULL),(442,'asfxzc',NULL,333,NULL,NULL),(443,'wqrtwqt',NULL,333,NULL,NULL),(444,'weqwrf',NULL,333,NULL,NULL),(445,'sadgsd',NULL,333,NULL,NULL),(446,'qweqw',NULL,333,NULL,NULL),(447,'asdgas',NULL,333,NULL,NULL),(448,'awddwa',NULL,333,NULL,NULL),(449,'wqewq',NULL,333,NULL,NULL),(450,'wqdwqd',NULL,333,NULL,NULL),(451,'qwedqwer',NULL,333,NULL,NULL),(452,'tyfhg',NULL,333,NULL,NULL),(453,'aoihoihqw',NULL,333,NULL,NULL),(454,'dwdas',NULL,333,NULL,NULL),(455,'adac',NULL,333,NULL,NULL),(456,'asdvv',NULL,333,NULL,NULL),(457,'asdc',NULL,333,NULL,NULL),(458,'adwe',NULL,333,NULL,NULL),(459,'qwewef',NULL,333,NULL,NULL),(460,'asdg',NULL,333,NULL,NULL),(461,'qwewqe',NULL,333,NULL,NULL),(462,'qweqwe',NULL,333,NULL,NULL),(463,'dsadas',NULL,333,NULL,NULL),(464,'sdfdsf',NULL,333,NULL,NULL),(465,'df ft',NULL,333,NULL,NULL),(466,'wqewqe',NULL,333,NULL,NULL),(467,'fse',NULL,333,NULL,NULL),(468,'asdasdawd',NULL,333,NULL,NULL),(469,'awdsad',NULL,333,NULL,NULL),(470,'sadaf',NULL,333,NULL,NULL),(471,'dwqdwq',NULL,333,NULL,NULL),(472,'sda',NULL,333,NULL,NULL),(473,'fhy',NULL,333,NULL,NULL),(474,'ftyy',NULL,333,NULL,NULL),(475,'gh',NULL,333,NULL,NULL),(476,'qewwqe',NULL,333,NULL,NULL),(477,'dsa',NULL,333,NULL,NULL),(478,'dqw',NULL,333,NULL,NULL),(479,'aaa',NULL,333,NULL,NULL),(480,'222',NULL,333,NULL,NULL),(481,'fggy',NULL,333,NULL,NULL),(482,'qaa',NULL,333,NULL,NULL),(483,'ty',NULL,333,NULL,NULL),(484,'loil',NULL,333,NULL,NULL),(485,'hteyhge',NULL,333,NULL,NULL),(486,'ssd',NULL,333,NULL,NULL),(487,'rre',NULL,333,NULL,NULL),(488,'ggyy',NULL,333,NULL,NULL),(489,'ysysys',NULL,333,NULL,NULL),(490,'gguu',NULL,333,NULL,NULL),(491,'asdasdad',NULL,333,NULL,NULL),(492,'vccg',NULL,333,NULL,NULL),(493,'4rr',NULL,333,NULL,NULL),(494,'5yy',NULL,333,NULL,NULL),(495,'dawda',NULL,333,NULL,NULL),(496,'wds',NULL,333,NULL,NULL),(497,'sgdw',NULL,333,NULL,NULL),(498,'wqdq',NULL,333,NULL,NULL),(499,'vvvj',NULL,333,NULL,NULL),(500,'ydy',NULL,333,NULL,NULL),(501,'ud',NULL,333,NULL,NULL),(502,'jgkf',NULL,333,NULL,NULL),(503,'gttt',NULL,333,NULL,NULL),(504,'bjhh',NULL,333,NULL,NULL),(505,'t sudt',NULL,333,NULL,NULL),(506,'yhgg',NULL,333,NULL,NULL),(507,'rhh',NULL,333,NULL,NULL),(508,'drrt',NULL,333,NULL,NULL),(509,'lhjmgj',NULL,333,NULL,NULL),(510,'rt',NULL,333,NULL,NULL),(511,'asdad',NULL,333,NULL,NULL),(512,'njjh',NULL,333,NULL,NULL),(513,'vvbv',NULL,333,NULL,NULL),(514,'vvvv',NULL,333,NULL,NULL),(515,'vvd',NULL,333,NULL,NULL),(516,'hhgh',NULL,333,NULL,NULL),(517,'hgff',NULL,333,NULL,NULL),(518,'%&-;',NULL,333,NULL,NULL),(519,'sdfsfs',NULL,333,NULL,NULL),(520,'fddg',NULL,333,NULL,NULL),(521,'dwasf',NULL,333,NULL,NULL),(522,'wads',NULL,333,NULL,NULL),(523,'fft',NULL,333,NULL,NULL),(524,'trr',NULL,333,NULL,NULL),(525,'hzh',NULL,333,NULL,NULL),(526,'ergg',NULL,333,NULL,NULL),(527,'hvhh',NULL,333,NULL,NULL),(528,'rfr',NULL,333,NULL,NULL),(529,'hhyy',NULL,333,NULL,NULL),(530,'4tr',NULL,333,NULL,NULL),(531,'wqda',NULL,333,NULL,NULL),(532,'dassad',NULL,333,NULL,NULL),(533,'da',NULL,333,NULL,NULL),(534,'adsa',NULL,333,NULL,NULL),(535,'ds',NULL,333,NULL,NULL),(536,'dasa',NULL,333,NULL,NULL),(537,'daw',NULL,333,NULL,NULL),(538,'fw',NULL,333,NULL,NULL),(539,'CF ghj',NULL,333,NULL,NULL),(540,'faswqe',NULL,333,NULL,NULL),(541,'wqdas',NULL,333,NULL,NULL),(542,'qrqwrd',NULL,333,NULL,NULL),(543,'adq',NULL,333,NULL,NULL),(544,'das',NULL,333,NULL,NULL),(545,'ddwq',NULL,333,NULL,NULL),(546,'qwd',NULL,333,NULL,NULL),(547,'knjj',NULL,333,NULL,NULL),(548,'ydydyd',NULL,333,NULL,NULL),(549,'yfyd',NULL,333,NULL,NULL),(550,'ujhg',NULL,333,NULL,NULL),(551,'hzjdyd',NULL,333,NULL,NULL),(552,'vbbl',NULL,333,NULL,NULL),(553,'5syd',NULL,333,NULL,NULL),(554,'vjk',NULL,333,NULL,NULL),(555,'bbf',NULL,333,NULL,NULL),(556,'yyfy',NULL,333,NULL,NULL),(557,'5xyx',NULL,333,NULL,NULL),(558,'hshd',NULL,333,NULL,NULL),(559,'yzyz',NULL,333,NULL,NULL),(560,'ffr',NULL,333,NULL,NULL),(561,'fgtx',NULL,333,NULL,NULL),(562,'hzys',NULL,333,NULL,NULL),(563,'mn xdu',NULL,333,NULL,NULL),(564,'bfd',NULL,333,NULL,NULL),(565,'mnhh',NULL,333,NULL,NULL),(566,'dtsts',NULL,333,NULL,NULL),(567,'ggt',NULL,333,NULL,NULL),(568,'cc',NULL,333,NULL,NULL),(569,'5frr',NULL,333,NULL,NULL),(570,'rgtf',NULL,333,NULL,NULL),(571,'fff g',NULL,333,NULL,NULL),(572,'zxffgg',NULL,333,NULL,NULL),(573,'dydydy',NULL,333,NULL,NULL),(574,'rrr666',NULL,333,NULL,NULL),(575,'fggfffgggt u xigogøft',NULL,333,NULL,NULL),(576,'5sysff',NULL,333,NULL,NULL),(577,'bbbjh',NULL,333,NULL,NULL),(578,'bbfgk',NULL,333,NULL,NULL),(579,'bxt',NULL,333,NULL,NULL),(580,'ydydy',NULL,333,NULL,NULL),(581,'ft',NULL,333,NULL,NULL),(582,'ysy',NULL,333,NULL,NULL),(583,'hdh',NULL,333,NULL,NULL),(584,'tzyz',NULL,333,NULL,NULL),(585,'kfuf',NULL,333,NULL,NULL),(586,'hsysysyd',NULL,333,NULL,NULL),(587,'dtstst',NULL,333,NULL,NULL),(588,'usududu',NULL,333,NULL,NULL),(589,'k fg',NULL,333,NULL,NULL),(590,'tty',NULL,333,NULL,NULL),(591,'hdydy',NULL,333,NULL,NULL),(592,'cgg',NULL,333,NULL,NULL),(593,'jdud',NULL,333,NULL,NULL),(594,'vvv',NULL,333,NULL,NULL),(595,'vhhui',NULL,333,NULL,NULL),(596,'rrrr',NULL,333,NULL,NULL),(597,'zjsj',NULL,333,NULL,NULL),(598,'igg',NULL,333,NULL,NULL),(599,'r55e',NULL,333,NULL,NULL),(600,'hhdh',NULL,333,NULL,NULL),(601,'vhj',NULL,333,NULL,NULL),(602,'dyd',NULL,333,NULL,NULL),(603,'xxf',NULL,333,NULL,NULL),(604,'vv',NULL,333,NULL,NULL),(605,'xd det',NULL,333,NULL,NULL),(606,'hht',NULL,333,NULL,NULL),(607,'re',NULL,333,NULL,NULL),(608,'gr',NULL,333,NULL,NULL),(609,'gcg',NULL,333,NULL,NULL),(610,'6',NULL,333,NULL,NULL),(611,'fdsfds',NULL,333,NULL,NULL),(612,'vj',NULL,333,NULL,NULL),(613,'bhcf',NULL,333,NULL,NULL),(614,'gfg',NULL,333,NULL,NULL),(615,'gfr',NULL,333,NULL,NULL),(616,'ydu',NULL,333,NULL,NULL),(617,'gy',NULL,333,NULL,NULL),(618,'uu',NULL,333,NULL,NULL),(619,'gtt',NULL,333,NULL,NULL),(620,'hdhd',NULL,333,NULL,NULL),(621,'yxy',NULL,333,NULL,NULL),(622,'dtd',NULL,333,NULL,NULL),(623,'6uu',NULL,333,NULL,NULL),(624,'rtr',NULL,333,NULL,NULL),(625,'hzy',NULL,333,NULL,NULL),(626,'xxggh',NULL,333,'Phase 1','1'),(627,'hsh',NULL,333,'Phase 1','1'),(628,'xccccvhhjkio',NULL,333,'Phase 1','1'),(629,'gggtikkkll',NULL,333,'Phase 1','1'),(630,'lgkxjxdw3333rr',NULL,333,'Phase 1','1'),(631,'gdsd ty uuhgggrr',NULL,333,'Phase 1','1'),(632,'bbnllo of fff g uu',NULL,333,'Phase 1','1'),(633,'ogifgghukjuy4r32',NULL,333,'Phase 1','1'),(634,'bzkzksjjJJzjhh666',NULL,333,'Phase 1','1'),(635,'jfjdkdiuus2664h',NULL,333,'Phase 1','1'),(636,'hhy54334 Det 677',NULL,333,'Phase 1','1'),(637,'gggg5533377',NULL,333,'Phase 1','1'),(638,'7xiix666xyh',NULL,333,'Phase 1','1'),(639,'55gg8855h',NULL,333,'Phase 1','1'),(640,'h ok fkfr4444',NULL,333,'Phase 1','2'),(641,'444466zhhhz',NULL,333,'Phase 2','1'),(642,'ggg77556777 hhf',NULL,333,'Phase 1','1'),(643,'123123123',NULL,333,'Phase 1','1'),(644,'bxbzbxjx777xjjj',NULL,333,'Phase 2','1'),(645,'gtty677gggd6',NULL,333,'Phase 2','1'),(646,'hzhjjh55553w',NULL,333,'Phase 2','1'),(647,'yy55yy22',NULL,333,'Phase 2','1'),(648,'yyyy4444',NULL,333,'Phase 2','1'),(649,'mmmnnn',NULL,333,'Phase 2','1'),(650,'121212',NULL,333,'Phase 2','1'),(651,'445544',NULL,333,'Phase 2','1'),(652,'wpwp2',NULL,333,'Phase 2','1'),(653,'1222sdsd',NULL,333,'Phase 2','1'),(654,'isbil',NULL,333,'Phase 2','2'),(655,'tiger',NULL,333,'Phase 1','1'),(656,'mast',NULL,333,'Phase 2','2'),(657,'5454r',NULL,333,'Phase 2','2'),(658,'erer3434',NULL,333,'Phase 2','1'),(659,'fett2',NULL,333,'Phase 2','1'),(660,'maseek',NULL,333,'Phase 2','1'),(661,'misty',NULL,333,'Phase 2','1'),(662,'334433rt',NULL,333,'Phase 2','1'),(663,'eter',NULL,333,'Phase 2','1'),(664,'mette',NULL,333,'Phase 2','1'),(665,'lard',NULL,333,'Phase 2','2'),(666,'isen',NULL,333,'Phase 2','2'),(667,'esteban',NULL,333,'Phase 2','1'),(668,'egg34',NULL,333,'Phase 2','1'),(669,'teit5',NULL,333,'Phase 2','1'),(670,'stein',NULL,333,'Phase 2','1'),(671,'mark',NULL,333,'Phase 2','1'),(672,'11rr33qq',NULL,333,'Phase 2','1'),(673,'fisken',NULL,333,'Phase 2','1'),(674,'vifte',NULL,333,'Phase 2','1'),(675,'inder',NULL,333,'Phase 2','1'),(676,'tenk',NULL,333,'Phase 2','1'),(677,'esken',NULL,333,'Phase 2','1'),(678,'hesten',NULL,333,'Phase 2','1'),(679,'Kætten',NULL,333,'Phase 2','1'),(680,'ting',NULL,333,'Phase 2','1'),(681,'masken',NULL,333,'Phase 2','1'),(682,'helele',NULL,333,'Phase 2','1'),(683,'lætt',NULL,333,'Phase 2','1'),(684,'osdt',NULL,333,'Phase 2','1'),(685,'mann2',NULL,333,'Phase 2','1'),(686,'endre',NULL,333,'Phase 2','1'),(687,'lusker',NULL,333,'Phase 1','1'),(688,'reeeeka',NULL,333,'Phase 2','1'),(689,'eeeesj',NULL,333,'Phase 1','1'),(690,'melkkk',NULL,333,'Phase 2','1'),(691,'eeeevvvv',NULL,333,'Phase 2','1'),(692,'lll',NULL,333,'Phase 1','1'),(693,'jjjk',NULL,333,'Phase 1','1'),(694,'skurk',NULL,333,'Phase 2','1'),(695,'eww34',NULL,333,'Phase 2','1'),(696,'reven',NULL,333,'Phase 2','1'),(697,'gud',NULL,333,'Phase 2','1'),(698,'eeesssggg',NULL,333,'Phase 1','2'),(699,'bjjb',NULL,333,'Phase 1','1'),(700,'jjdr',NULL,333,'Phase 1','1'),(701,'kkjg',NULL,333,'Phase 1','1'),(702,'errt',NULL,333,'Phase 1','2'),(703,'bbjj',NULL,333,'Phase 1','1'),(704,'889988',NULL,333,'Phase 2','2'),(705,'kongen',NULL,333,'Phase 2','2'),(706,'øløløl',NULL,333,'Phase 2','2'),(707,'kattemat',NULL,333,'Phase 2','2'),(708,'kattemas',NULL,333,'Phase 1','2'),(709,'jkj',NULL,333,'Phase 1','1'),(710,'rrr333',NULL,333,'Phase 1','2'),(711,'dust',NULL,333,'Phase 1','1'),(712,'eexx',NULL,333,'Phase 1','1'),(713,'12qw12qw',NULL,333,'Phase 1','1'),(714,'nnn',NULL,333,'Phase 1','1'),(715,'eryt',NULL,333,'Phase 1','1'),(716,'hhh444ff',NULL,333,'Phase 1','1'),(717,'ttrrccjj',NULL,333,'Phase 1','1'),(718,'yyvvgg33',NULL,333,'Phase 1','1'),(719,'99ooøøiii',NULL,333,'Phase 1','1'),(720,'5544hhfffy',NULL,333,'Phase 1','1'),(721,'nkk',NULL,333,'Phase 1','1'),(722,'4577kkh',NULL,333,'Phase 1','1'),(723,'hhhrrrrååpøøjhf664',NULL,333,'Phase 1','1'),(724,'56jjj',NULL,333,'Phase 1','1'),(725,'vvvgikdkfkfjfj',NULL,333,'Phase 2','1'),(726,'hhryjb',NULL,333,'Phase 2','1'),(727,'bbv',NULL,333,'Phase 2','1'),(728,'vd',NULL,333,'Phase 1','1');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(155) DEFAULT NULL,
  `solution` varchar(155) DEFAULT NULL,
  `alternative1` varchar(60) DEFAULT NULL,
  `alternative2` varchar(60) DEFAULT NULL,
  `alternative3` varchar(60) DEFAULT NULL,
  `groups_grp_id` int(11) NOT NULL,
  `sessions_session_id` int(11) NOT NULL,
  `target_pictures_tp_id` int(11) NOT NULL,
  PRIMARY KEY (`q_id`),
  KEY `fk_questions_groups1_idx` (`groups_grp_id`),
  KEY `fk_questions_sessions1_idx` (`sessions_session_id`),
  KEY `fk_questions_target_pictures1_idx` (`target_pictures_tp_id`),
  CONSTRAINT `fk_questions_groups1` FOREIGN KEY (`groups_grp_id`) REFERENCES `groups` (`grp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_questions_sessions1` FOREIGN KEY (`sessions_session_id`) REFERENCES `sessions` (`session_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_questions_target_pictures1` FOREIGN KEY (`target_pictures_tp_id`) REFERENCES `target_pictures` (`tp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (5,'What\'s up?','Nothing','1','q','etreywreqwrqweqwe',8,332,1),(6,'Hey you?','Hey!','2','w','g',9,332,1),(7,'Problem?','No..','3','e','gwe',8,332,2),(8,'You mad?','Yes','4','r','wqe',8,332,3),(9,'Who painted Mona Lisa?','Me','5','t','qwe',9,332,2),(11,'insquestion','inssolution','6','y','qwe',8,332,2),(14,'insquestion2','inssolution2','7','u','qwe',8,332,2),(21,'question to add?','solution to question','8','q','qwe',11,333,1),(22,'addnewQ','solutionnewQ','9','w','wqe',11,333,1),(32,'qqq','sss','7','t','wq',95,333,1),(33,'iiiiii','pppppp','8','y','qrw',96,333,1),(34,'yyy','ttt','9','u','qwr',96,333,1),(35,'ppk','yyyf','0','q','wqedsa',97,333,1),(36,'roll','klo','+','w','sad',97,333,1),(37,'t','y','\\','e','ads',97,333,1),(38,'tt','yhy','1','r','ads',98,333,1),(39,'tt','yy','2','t','w',99,333,1),(40,'tt','wgh','3','y','wads',102,332,1),(41,'333','tjg','4','f','rasfd',103,333,1),(42,'fgh','thj','5','s','qweads',103,333,1),(43,'ttty','5xgy','6','d','qwds',103,333,1),(44,'f hi','7f7','7','s','a',106,333,1),(45,'hugi g','ugug7','8','a','sd',106,333,1),(46,'ucug','vucu','9','w','wsdaxz',106,333,1),(47,'333','ufi','0','f','sad',110,333,1),(48,'ig','uf','+','w','adsx',113,333,1),(49,'tt','ug','1','f','ac',114,333,1),(50,'5t','tt','2','s','qfs',114,333,1),(51,'tff','rr','3','q','qwesd',117,333,1),(52,'7tit','urug','4','f','q',117,333,1),(53,'nxcg','kfff','5','s','31t23f',117,333,1),(54,'kdjff','kfnff','6','g','12',117,333,1),(55,'k x g','7fr','7','g','123',117,333,1),(56,'uruugug','udufuf','8','ge','123',117,333,1),(57,'lllooo','qwerty','9','gr','123',120,333,1),(58,'ttt','hhh','0','we','23',163,333,1),(59,'555','jdjd','+','ewr','31',163,333,1),(60,'333','DK vn','\\','fwe','21',163,333,1),(61,'jfk','kfk','1','fwe','123',163,333,1),(62,'mmm','rgju','2','gwe','213',166,333,1),(63,'tttt','yfud','3','we','3',169,333,1),(64,'jdj','jd','4','gew','12',170,333,1),(65,'jjj','jjht','5','weg','213',168,333,1),(66,'ooo','hhduj','6','ewg','234123',168,333,1),(68,'5445','jtgmj','7','weg','4',176,333,1),(69,'tty','udude','8','ewg','23',177,333,1),(70,'work?','no?','9','gth','235',194,333,1),(71,'&&&&','nkkk','0','r','5',223,333,1),(72,'hhhh','ppp','+','hr','523',223,333,1),(73,'eee','ufuf','\\','w','32',225,333,1),(74,'err','evvv','1','hef','325',225,333,1),(75,'yyyyyy','tyyyyy','2','wrhegf','234',231,333,1),(76,'mmm','kkk','3','wet','234',231,333,1),(77,'yeeeeeeee','noooo?','4','hrew','43',232,333,1),(78,'test2','jjjjooo','5','wef','342',232,333,1),(79,'hhhhh','lolololol','6','gwe','234',234,333,1),(80,'test1','tull2','7','weg','324',242,333,1),(81,'æææææ','ååååå','8','herf','r',245,333,1),(82,'lol','nub','9','24hbwgef','we',246,333,1),(83,'ggg','gtt','0','gew','ewr',251,333,1),(84,'334','yy','+','g2we','wer',251,333,1),(85,'tt','gg','\\','ewf','ewr',252,333,1),(86,'gc','44d','1','2eg','ewr',256,333,1),(87,'555','222','2','alt2','ewr',257,333,1),(88,'11','22','3','alt2','we',257,333,1),(89,'hadde Mona iPhone?','kænskje.. .','4','gwef','32rwe',259,333,1),(90,'eee','eee','5','ggg','4',261,333,1),(91,'uf','uf','6','43tf','432',263,333,1),(92,'3','2','7','23','432',264,333,1),(93,'tt','hh','8','gre','432',265,333,1),(94,'q for p2','ans for p2','9','a2','34',270,333,2),(95,'skewl....','lol','0','trolololol','324r',283,333,1),(96,'tihi','buuu','+','re','4',283,333,2),(97,'lolkkk','bgf','\\','rwed','wre23',285,333,1),(98,'tgghhhh','jhfffg','1','rg','rwe',295,333,1),(99,'hgghj','øøøøø','2','qgr','32324',295,333,3),(100,'hgfhj','jgd','3','re','26323t',295,333,2),(101,'uuhf','hgg','4','er','234',296,333,1),(102,'uytff','hffrr','5','ear','234',296,333,3),(103,'44444','ggggtt','6','re','234',297,333,1),(104,'jhg','yhhh','7','gre','234',298,333,1),(105,'mmk','rrr','8','wed','234',297,333,1),(106,'44','tt','9','wed','234',299,333,1),(107,'444','44','0','few','234235',299,333,1),(108,'etgg','fffd','+','gwe','342',298,333,1),(109,'hhdjfj','hdjfu','\\','wd','432234',309,333,1),(110,'555','3rgy','1','qwd','6232',309,333,1),(111,'e555','egh ttf fgy','2','sda','235',310,333,1),(112,'uujjj','bjjj','3','qwd','324',310,333,1),(113,'ttg','jhhy','4','asd','qwe',311,333,1),(114,'tt','yyy','5','asgf','3qrfw',322,333,1),(115,'333','332','6','qwe','qwe',326,333,3),(116,'supernew','supah','alt1','alt2','alt3',326,333,1),(117,'tt','yey','hd','hs','wy',113,333,1),(118,'44','vc','ggg','h g','gt',602,333,1),(119,'gt','xg','gh','gg','gg',397,333,1),(120,'hh','tt','tt','tt','tt',268,333,1),(121,'yd','jf','jf','jf','yf',253,333,1),(122,'tt','yy','hh','hh','hg',610,333,1),(123,'gHf','hd','dhy','jfu','jf',615,333,1),(124,'rt','gg','tt','gg','tttt',633,333,1),(125,'rtt','jfjfur','yryeue','ydyfyf','ydyfyf',634,333,1),(126,'5tt','rr','frr','rrr','ffrw',635,333,1),(127,'t gc jx','jdr','kr','nd','mne',636,333,1),(128,'gg','uduff','jf','jdrr','udft',637,333,1),(129,'yey','hdy','yd','hd','yd',638,333,1),(130,'tttt','hdj','jfu','jfjf','jxj',639,333,1),(131,'uufu','jeje','jduf','urur','jfuf',640,333,1),(132,'ixrt','kc','if','if','uf',640,333,1),(133,'ufuf','uxf','ux','6d','7f',640,333,1),(134,'tz f','I xgg','ighh','k xgg','ucfg',641,333,1),(135,'hhg','ggg','tht','ggg','hhg',641,333,3),(136,'fgg','we er t','hN wer','j d ft','gfr',641,333,2),(137,'tt','cg','gt','ty','ft',654,333,1),(138,'55t','gg6','ggg','hyy','hyy',695,333,1),(139,'vhhh','jjj','jjj','ojj','bjhj',192,333,1),(140,'uju','jjjj','bbjj','jjj','kkkk',192,333,1),(141,'gg','ed','dd','trr','trt',702,333,1),(142,'uh','gt','hg','tg','tg',708,333,1),(143,'tt','tt','tt','tt','yy',710,333,1),(144,'ujyy','hh','jjjj','jjjj','jjjj',721,333,1),(145,'h','v','j','j','b',721,333,1),(146,'jjj','bbj','bjj','jkj','kjk',721,333,2),(147,'ku','lo','gge','jki','hjj',721,333,2),(148,'tt','tt','ty','hh','gg',725,333,1),(149,'ht','hg','hdh','ysyd','ydyd',725,333,3),(150,'hyd','bxjz','jfjf','jfjf','jxkdi a',725,333,2),(151,'gfffx','uy','jhh','vvh','jj',726,333,1),(152,'tesy','lljg','nni','llo','BI',726,333,3),(153,'hhhh','kjgf','lkjh','åok','ikkl',726,333,2);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_target_picture`
--

DROP TABLE IF EXISTS `session_target_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_target_picture` (
  `sessions_session_id` int(11) NOT NULL,
  `target_pictures_tp_id` int(11) NOT NULL,
  `route_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`sessions_session_id`,`target_pictures_tp_id`),
  KEY `fk_session_target_picture_sessions1_idx` (`sessions_session_id`),
  KEY `fk_session_target_picture_target_pictures1_idx` (`target_pictures_tp_id`),
  CONSTRAINT `fk_session_target_picture_sessions1` FOREIGN KEY (`sessions_session_id`) REFERENCES `sessions` (`session_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_session_target_picture_target_pictures1` FOREIGN KEY (`target_pictures_tp_id`) REFERENCES `target_pictures` (`tp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_target_picture`
--

LOCK TABLES `session_target_picture` WRITE;
/*!40000 ALTER TABLE `session_target_picture` DISABLE KEYS */;
INSERT INTO `session_target_picture` VALUES (332,1,NULL),(332,2,NULL),(332,3,NULL),(333,1,1),(333,2,3),(333,3,2),(334,2,NULL);
/*!40000 ALTER TABLE `session_target_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `creation_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (332,'112',NULL),(333,'113',NULL),(334,'911',NULL),(335,'1337',NULL),(336,'888',NULL);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target_pictures`
--

DROP TABLE IF EXISTS `target_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target_pictures` (
  `tp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tp_name` varchar(155) DEFAULT NULL,
  `tp_info` varchar(1000) DEFAULT NULL,
  `tp_hintImg` text,
  PRIMARY KEY (`tp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_pictures`
--

LOCK TABLES `target_pictures` WRITE;
/*!40000 ALTER TABLE `target_pictures` DISABLE KEYS */;
INSERT INTO `target_pictures` VALUES (1,'Mona Lisa','Data om MonaLisa dette er rad 2.','mona_lisa.jpg'),(2,'American Gothic',' oppdaterte sitt nåværende bosted til Budapest, Hungary. oppdaterte sitt nåværende bosted til Budapest, Hungary. oppdaterte sitt nåværende bosted til Budapest, Hungary.','american_gothic.jpg'),(3,'Skrik','«Skrik» er et av Edvard Munchs mest berømte bilder ,og en av Norges sentrale kunstskatter. Teknikken er fettstift på papp, og bildet er datert til 1893,nå til antagelig 1910[1] Bildet finnes i fire originalversjoner, hvorav to tilhører Munch-museet, ett Nasjonalgalleriet og det siste ble auksjonert bort til en ukjent kjøper i 2012.','skrik.jpg'),(4,'asd','asd','test.png'),(5,'Test2','asdg41','bitnami.png'),(6,'Test3','asdy6423','test.png'),(7,'lol','asdy43q',NULL);
/*!40000 ALTER TABLE `target_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tp_ar_element`
--

DROP TABLE IF EXISTS `tp_ar_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tp_ar_element` (
  `target_pictures_tp_id` int(11) NOT NULL,
  `ar_elements_ar_element_id` int(11) NOT NULL,
  PRIMARY KEY (`target_pictures_tp_id`,`ar_elements_ar_element_id`),
  KEY `fk_tp_ar_element_target_pictures1_idx` (`target_pictures_tp_id`),
  KEY `fk_tp_ar_element_ar_elements1_idx` (`ar_elements_ar_element_id`),
  CONSTRAINT `fk_tp_ar_element_ar_elements1` FOREIGN KEY (`ar_elements_ar_element_id`) REFERENCES `ar_elements` (`ar_element_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tp_ar_element_target_pictures1` FOREIGN KEY (`target_pictures_tp_id`) REFERENCES `target_pictures` (`tp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tp_ar_element`
--

LOCK TABLES `tp_ar_element` WRITE;
/*!40000 ALTER TABLE `tp_ar_element` DISABLE KEYS */;
INSERT INTO `tp_ar_element` VALUES (1,5),(1,6),(1,9),(1,10),(1,11),(2,5),(2,6),(2,7),(3,6);
/*!40000 ALTER TABLE `tp_ar_element` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-12 20:50:19
