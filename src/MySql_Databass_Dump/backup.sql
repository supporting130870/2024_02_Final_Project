-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: lms_data
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `campus`
--

DROP TABLE IF EXISTS `campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_kor` varchar(50) NOT NULL,
  `name_eng` varchar(50) NOT NULL,
  `parents_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campus`
--

LOCK TABLES `campus` WRITE;
/*!40000 ALTER TABLE `campus` DISABLE KEYS */;
INSERT INTO `campus` VALUES (1,'서울','seoul',0),(2,'용인','yongin',0);
/*!40000 ALTER TABLE `campus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `college` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parents_id` int NOT NULL,
  `name_kor` varchar(100) NOT NULL,
  `name_eng` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `college_ibfk_1` (`parents_id`),
  CONSTRAINT `college_ibfk_1` FOREIGN KEY (`parents_id`) REFERENCES `campus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES (1,1,'교양','generalS'),(2,1,'ICT융합대학','ict'),(3,1,'경영대학','business'),(4,1,'사회과학대학','social'),(5,1,'인문대학','human'),(6,1,'법학대학','law'),(7,2,'교양','generalY'),(8,2,'공과대학','engineering'),(9,2,'자연과학대학','science'),(10,2,'예술체육대학','art'),(11,2,'건축대학','architecture');
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parents_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `lecturer` varchar(50) NOT NULL,
  `credit` int NOT NULL,
  `time` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `department_id` (`parents_id`,`name`,`lecturer`,`time`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`parents_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,40,'행정학의이해','이현정',3,'목1200-1445'),(2,40,'지방행정론','임승빈',3,'월수0900-1015'),(3,40,'정책학원론','이시연',3,'목0900-1145'),(4,40,'사회복지정책론','이재성',3,'화1200-1445'),(5,40,'재정학','전성훈',3,'수1500-1745'),(6,40,'조직행태론','진종순',3,'월수1330-1445'),(7,29,'기초아랍어','안정국',3,'0900-1015'),(8,29,'아랍어문법','이종화',3,'1030-1145'),(9,29,'중급아랍어','조희선',3,'1200-1300'),(10,29,'아랍각국경제','송경근',3,'1300-1450'),(11,29,'아랍각국정치','김정명',3,'1500-1615'),(12,1,'건축고고학실습','최종규',3,'목0900-1150'),(13,1,'목구조역학','김영민',3,'수1500-1750'),(14,1,'한옥실습','백소훈',3,'수0900-1150'),(15,1,'동양건축사','김왕직',3,'화0900-1150'),(16,27,'한국미술사','이주현',3,'0900-1015'),(17,27,'서양미술사','이지은',3,'1030-1145'),(18,27,'동양미술사','이태호',3,'1200-1300'),(19,27,'일본미술사','최선아',3,'1300-1450'),(20,27,'한국공예사','박정민',3,'1500-1615'),(21,6,'바둑학개론','정수현',3,'화1300-1550'),(22,6,'포석과정석','온소진',3,'수1300-1550'),(23,6,'컴퓨터와바둑','감동근',3,'월1300-1550'),(24,16,'글쓰기','육민수',3,'월수1030-1145'),(25,16,'발표와토의','주민재',3,'월수1030-1145'),(26,2,'건축설계와표현','이재인',4,'월1400-1850'),(27,2,'건축설계','남수현',5,'목1400-1850'),(28,2,'건축과문화','김혜정',3,'목1400-1450'),(29,2,'건축구조의이해','김영민',3,'화0900-1150'),(30,37,'화학2','김선경',3,'월수0900-1015'),(31,44,'아동학취업세미나','김진욱',3,'수15:00-17:45'),(32,44,'한국가족생활문화','김윤전',3,'월15:00-17:45'),(33,44,'아동건강교육','김민경',3,'월12:00-14:45'),(34,22,'중국어현장답사','강연',2,'화16:30-18:15'),(35,22,'중국어발음원리와연습','김보경',3,'화15:00-17:45'),(36,22,'중국어회화2','김명구',3,'월15:00-17:45'),(37,22,'중국어회화2','최석원',3,'목09:00-11:45'),(38,22,'중국고문읽기','김선희',3,'화15:00-17:45'),(39,22,'중국고문읽기','주성일',3,'수15:00-17:45'),(40,22,'중국소설의이해','김명구',3,'목13:30-15:45'),(41,22,'중국어회화4','강연',3,'화12:00-14:45'),(42,22,'중국어문법','성기은',3,'월09:00-11:45'),(43,22,'중국어문법','성기은',3,'화09:00-11:45'),(44,14,'C언어','전종훈',3,'화목1800-1950'),(45,14,'시스템과프로그래밍','권동섭',4,'목금1300-1450'),(46,3,'통합디자인연구','신완식',3,'월0900-1150'),(47,3,'디지털디자인','조태형',3,'화0900-1150'),(48,3,'제품디자인기초','최종운',3,'수0900-1150'),(49,3,'이미지와표현','최재은',3,'목0900-1150'),(50,31,'콘텐츠디자인1','김일주',3,'09:00~10:15'),(51,43,'미디어의이해','이병혜',3,'월수13:30-14:45'),(52,43,'커뮤니케이션이론','김기태',3,'금15:00-17:45'),(53,43,'디지털미디어기술사회','최선규',3,'화목12:00-13:15'),(54,41,'경제통계','이명훈',3,'수금1330-1445'),(55,41,'경제체제론','홍제환',3,'화0900-1145'),(56,41,'국제경제학','안병창',3,'금1030-1315'),(57,41,'한국경제사','김두얼',3,'화목1030-1145'),(58,41,'화폐와금융','안종길',3,'화목1330-1445'),(59,13,'瞪晦瞪濠1','梯團熱',3,'錯熱0900-1015'),(60,13,'瞪晦瞪濠2','梯團熱',3,'錯熱1030-1145'),(61,24,'영문학개론','이기한',3,'수1200-1315'),(62,24,'영어듣기의이론과실제','콜린워커',3,'목1030-1145'),(63,24,'영미문학강독','손일수',3,'금0900-1145'),(64,24,'중급영어회하','콜린워커',3,'월0900-1015'),(65,24,'영어교육론','장지연',3,'월1630-1745'),(66,15,'영어1','여인욱',3,'월수1030-1145'),(67,15,'영어회화1','다니엘',2,'월수1030-1145'),(68,38,'식품학','황지영',3,'월1300-1350'),(69,25,'한국사강독','박진훈',3,'월1630-1745'),(70,25,'동양고대사','최해별',3,'월1030-1145'),(71,25,'서양고대사','황원호',3,'월1500-1745'),(72,25,'동양사강독','정철웅',3,'화1630-1745'),(73,25,'동양근대사','최병욱',3,'화1330-1445'),(74,9,'국제무역론','조미진',3,'월수1030-1145'),(75,9,'국제경제기구론','김태황',3,'화목0900-1015'),(76,9,'무역실무','조병휘',3,'월수1630-1745'),(77,9,'국제물류의이해','최가영',3,'월수1030-1145'),(78,9,'글로벌강소기업론','박재석',3,'화목1030-1145'),(79,23,'초급일본어회화2','스미유리카',3,'월10:30-13:15'),(80,23,'전공기초일본어2','이은미',3,'화13:30-16:15'),(81,23,'중급일본어회화2','사이코아사코',3,'화09:00-11:45'),(82,23,'일본어강독2','이신혜',3,'목15:00-17:45'),(83,23,'실용일본어작문','신은진',3,'금15:00-17:45'),(84,23,'일본현대어문법','윤상실',3,'월09:00-11:45'),(85,23,'일문학의이해','오찬욱',3,'화15:00-17:45'),(86,23,'일본애니메이션의이해','오찬욱',3,'수09:00-11:45'),(87,23,'매스컴일본어','오찬욱',3,'목15:00-17:45'),(88,23,'일본인의언어생활','윤상실',3,'금09:00-11:45'),(89,21,'국어학의이해','조남호',3,'월10:30-13:15'),(90,21,'국문학개론','남재철',3,'월15:00-17:45'),(91,21,'국문학개론','남재철',3,'금09:00-11:45'),(92,21,'고전소설론','이창헌',3,'월14:30-17:15'),(93,21,'국어문법론','윤용선',3,'화12:00-14:45'),(94,21,'현대시교육론','송승환',3,'금12:00-14:45'),(95,21,'신화와설화다시읽기(honor)','이창헌',3,'화13:30-16:15'),(96,21,'한국현대소설특강','이수형',3,'목10:30-13:15'),(97,21,'국어학사','조남호',3,'화10:30-13:15'),(98,21,'한국한문학선독(honor)','남재철',3,'화15:00-17:45'),(99,33,'저작권과소프트웨어','김선주',3,'09:00~10:15'),(100,26,'정보학입문','김현희',3,'월1330-1445'),(101,26,'도서관정보센터경영론','배창섭',3,'월1500-1745'),(102,26,'정보문화사','송승섭',3,'화1030-1145'),(103,26,'참고정보봉사론','권나현',3,'화1330-1445'),(104,26,'고문헌조직론','안미경',3,'화1500-1745'),(105,39,'미생물학','이상희',4,'월0900-1150'),(106,39,'생화학','권형진',3,'화0900-1150'),(107,39,'산업미생물학','홍순광',3,'수0900-1150'),(108,39,'바이러스학','이원근',3,'목0900-1150'),(109,39,'면역학','이창로',3,'금0900-1150'),(110,39,'유전학','최상봉',3,'월1000-1150'),(111,39,'식물발달생리학','김상현',3,'월1300-1350'),(112,39,'식물학','문정환',3,'월1400-1550'),(113,8,'중급회계','김기영',3,'화1500-1615,목1500-1615'),(114,8,'재무분석','심명화',3,'월1630-1745,수1630-1745'),(115,8,'정부회계','박경진',3,'월1500-1615,수1500-1615'),(116,8,'투자론','변영훈',3,'월1330-1615,수1330-1445'),(117,8,'브랜드관리','이은정',3,'월0900-1015,수0900-1015'),(118,8,'기업법2','이종훈',3,'월1330-1445,수1330-1445'),(119,8,'노사관계론','이정현',3,'월1030-1145,수1030-1145'),(120,8,'경영조직론','이상명',3,'월1200-1315,수1200-1315'),(121,8,'관리회계','정다미',3,'월1200-1315,수1200-1315'),(122,12,'교육관리학','김성일',3,'월1300-1550'),(123,10,'정보공학','정동길',3,'월수0900-1015'),(124,10,'법경제','김호균',3,'화목1330-1445'),(125,10,'정보보호입문','정동길',3,'월수1030-1145'),(126,10,'ERP개발','박성헌',3,'화1500-1745'),(127,10,'데이터웨어하우징과마이닝','서필교',3,'월수0900-1015'),(128,10,'회계정보시스템','김성구',3,'화목0900-1015'),(129,35,'수학교재연구및지도법','박진형',2,'화1300-1450'),(130,35,'정수론','소순태',3,'월1300-1350'),(131,35,'해석학개론','홍덕현',3,'월1400-1450'),(132,5,'서양음악사','김영옥',2,'금1100-1250'),(133,5,'반주법','장미경',2,'월1000-1150'),(134,5,'음악통론','정혜윤',2,'화1500-1650'),(135,7,'세계영화사','장병원',3,'금1000-1250'),(136,7,'현대영화의경향','김영진',3,'목1400-1650'),(137,7,'할리우드영화연구','이길성',3,'화1400-1650'),(138,28,'인식론','김준성',3,'0900-1015'),(139,28,'철학원론','강순전',3,'1030-1145'),(140,28,'논리학','김윤구',3,'1200-1300'),(141,28,'정의론','김한상',3,'1300-1450'),(142,28,'합리론','임석진',3,'1500-1615'),(143,4,'체력측정론','김주학',3,'월1000-1150'),(144,4,'운동을위한인체구조','박종성',3,'화0900-1150'),(145,4,'발육과노화','박태섭',3,'수0900-1150'),(146,4,'동작프로그램개발','고성희',3,'목0900-1150'),(147,36,'물리학','김주학',3,'월1000-1150'),(148,34,'정치학개론','정회옥',3,'월수12:00-13:15'),(149,34,'국제정치론','정성철',3,'화목13:30-14:45'),(150,34,'정치심리학','김도종',3,'화15:00-17:45'),(151,11,'감정평가이론','이수겸',3,'토1300-1550'),(152,11,'부동산개발론','조인창',3,'수2020-2245'),(153,11,'부동산컨설팅','권대중',3,'수2020-2245'),(154,11,'부동산자산관리론','순희자',3,'토1300-1550'),(155,11,'부동산개발사례연구','조인창',3,'토1300-1550'),(156,11,'부동산입지론','김준형',3,'수2020-2245'),(157,17,'한국근현대사의이해','윤홍석',3,'월수1030-1145'),(158,17,'민주주의와현대사회','윤홍석',3,'월수1030-1145'),(159,32,'객체지향적사고와프로그래밍','최성운',3,'월수09:00-10:15'),(160,45,'청소년지도학2','조미영',2,'금1000-1150'),(161,45,'청소년문화','권일남',3,'월1500-1615,수1500-1615'),(162,45,'청소년심리및상담','한영희',3,'월0900-1145'),(163,45,'청소년활동','권일남',3,'목1500-1745'),(164,45,'청소년기관운영','박대권',3,'화1200-1315,목1200-1315'),(165,45,'성격심리','이랑주',3,'목0900-1145'),(166,45,'청소년육성제도론','김정율',3,'화1750-2015'),(167,45,'정지취업세미나','박대권',2,'월1100-1250'),(168,45,'집단상담','이은경',3,'화0900-1145'),(169,45,'청소년교육론','조아미',3,'월1330-1445,수1330-1445'),(170,46,'사회복지행정론','이재성',3,'토1600-1835'),(171,46,'가족복지론','김희진',3,'토1300-1550'),(172,46,'사회복지현장실습','김민아',3,'토0900-1150'),(173,46,'영화와사회복지','최인화',3,'수2020-2245'),(174,46,'사회복지세미나','안희철',3,'토0900-1150'),(175,46,'사회복지조사론','백주희',3,'토1300-1550'),(176,30,'시의이해','박상수',3,'목1030-1315'),(177,30,'소설의이해','김종욱',3,'월1500-1745'),(178,30,'시창작연구','남진우',3,'금1500-1745'),(179,30,'소설창작연구','신수정',3,'화1330-1615'),(180,30,'희곡의이해','이재명',3,'월수1030-1145'),(181,30,'소설구성론','노태훈',3,'화목1630-1745');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parents_id` int NOT NULL,
  `name_kor` varchar(100) NOT NULL,
  `name_eng` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `department_ibfk_1` (`parents_id`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`parents_id`) REFERENCES `college` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,11,'건축학부','architect'),(2,11,'공간디자인전공','basicArchitecture'),(3,10,'디자인학부','design'),(4,10,'체육학부','physical'),(5,10,'음악학부','music'),(6,10,'바둑학과','baduk'),(7,10,'영화/뮤지컬학부','musical'),(8,3,'경영학과','management'),(9,3,'국제통상학과','internationalTrade'),(10,3,'경영정보학과','managementInformation'),(11,3,'부동산학과','property'),(12,3,'경영교육혁신센터','managementEducation'),(13,8,'전기공학과','electricity'),(14,8,'컴퓨터공학과','computer'),(15,1,'영어교양','englishYG'),(16,1,'기초교양','basic'),(17,1,'선택교양','selective'),(18,7,'영어교양','englishYG'),(19,7,'기초교양','basic'),(20,7,'선택교양','selective'),(21,5,'국어국문학과','korean'),(22,5,'중어중문학과','chinese'),(23,5,'일어일문학과','japanese'),(24,5,'영어영문학과','english'),(25,5,'사학과','history'),(26,5,'문헌정보학과','library'),(27,5,'미술사학과','artHistory'),(28,5,'철학과','philosophy'),(29,5,'아랍지역학과','arab'),(30,5,'문예창작과','writing'),(31,2,'디지털콘텐츠','digitalContents'),(32,2,'융합소프트웨어','software'),(33,6,'법학과','lawC'),(34,6,'법무정책학과','politics'),(35,9,'수학과','math'),(36,9,'물리학과','physics'),(37,9,'화학과','chemistry'),(38,9,'식품영양학과','food'),(39,9,'생명과학정보학과','life'),(40,4,'행정학과','administration'),(41,4,'경제학과','economy'),(42,4,'정치외교학과','politics'),(43,4,'디지털미디어학과','digitalMedia'),(44,4,'아동학과','children'),(45,4,'청소년지도학과','teenager'),(46,4,'사회복지학과','welfare');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courses`
--

DROP TABLE IF EXISTS `student_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_courses` (
  `NAME` varchar(45) NOT NULL,
  `ID` varchar(45) NOT NULL,
  `STUDENT_NUMBER` varchar(45) NOT NULL,
  `LECTURER` varchar(45) NOT NULL,
  `CREDIT` varchar(45) NOT NULL,
  `TIME` varchar(45) NOT NULL,
  `STATUS` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`,`STUDENT_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courses`
--

LOCK TABLES `student_courses` WRITE;
/*!40000 ALTER TABLE `student_courses` DISABLE KEYS */;
INSERT INTO `student_courses` VALUES ('도서관정보센터경영론','101','60241200','배창섭','3','월1500-1745','M'),('정보문화사','102','60241200','송승섭','3','화1030-1145','M'),('브랜드관리','117','60241200','이은정','3','월0900-1015,수0900-1015','S'),('경영조직론','120','60241200','이상명','3','월1200-1315,수1200-1315','S'),('한국근현대사의이해','157','60241200','윤홍석','3','월수1030-1145','M'),('민주주의와현대사회','158','60241200','윤홍석','3','월수1030-1145','M'),('객체지향적사고와프로그래밍','159','60241172','최성운','3','월수09:00-10:15','M'),('서양미술사','17','60241200','이지은','3','1030-1145','M'),('일본미술사','19','60241200','최선아','3','1300-1450','M'),('사회복지정책론','4','60241200','이재성','3','화1200-1445','S'),('영어교육론','65','60241203','장지연','3','월1630-1745','M'),('영어1','66','60241200','여인욱','3','월수1030-1145','M'),('영어1','66','60241203','여인욱','3','월수1030-1145','M'),('국문학개론','91','60241172','남재철','3','금09:00-11:45','S'),('고전소설론','92','60241172','이창헌','3','월14:30-17:15','M'),('저작권과소프트웨어','99','60241172','김선주','3','09:00~10:15','S'),('저작권과소프트웨어','99','60241200','김선주','3','09:00~10:15','S');
/*!40000 ALTER TABLE `student_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `ID` varchar(45) NOT NULL,
  `PW` varchar(120) NOT NULL,
  `NAME` varchar(45) NOT NULL,
  `PHONE_NUMBER` varchar(45) NOT NULL,
  `ADDRESS` varchar(45) NOT NULL,
  `STUDENT_NUMBER` varchar(45) NOT NULL,
  `EMAIL` varchar(45) NOT NULL,
  `CAMPUS` varchar(45) NOT NULL,
  `COLLEGE` varchar(45) NOT NULL,
  `DEPARTMENT` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`,`STUDENT_NUMBER`,`EMAIL`),
  UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`),
  UNIQUE KEY `STUDENT_NUMBER_UNIQUE` (`STUDENT_NUMBER`),
  UNIQUE KEY `PHONE_NUMBER_UNIQUE` (`PHONE_NUMBER`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES ('donghun','$2a$12$1mLX4MYbaQJv5bEjJE8Om.GsTPy7n6gTt1k0Zn.fqmJvjSyZtPtEy','강동훈','01000000000','서대문구 남가좌동 거북골로 34','60241172','joung130870@gmail.com','[1, 서울, seoul]','[2, ICT융합대학, ict]','[32, 융합소프트웨어, software]'),('kimhongmin','$2a$12$pqsbJ1AWZTm/1Wo2QWiRzeD5y95hHxpQuUV0n07qG54zaVfIjD57C','김홍민','010123412341','가평','60241203','joung130800@gmail.com','[1, 서울, seoul]','[2, ICT융합대학, ict]','[32, 융합소프트웨어, software]'),('supporting130870','$2a$12$uB7gEwMPb7Hc9zWM/5Yv0eA87DsCGkfNEkyThcQG6QYAV40vBVN0q','김지원','01096411308','전남 목포시 청호로 167번길 13-3','60241200','supporting130870@naver.com','[1, 서울, seoul]','[2, ICT융합대학, ict]','[32, 융합소프트웨어, software]');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-11  3:57:37
