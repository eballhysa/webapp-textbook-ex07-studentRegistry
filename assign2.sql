-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: assign2
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `code` varchar(8) NOT NULL,
  `title` varchar(50) NOT NULL,
  `credits` int(11) NOT NULL,
  `department_code` varchar(5) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_COURSE_DEPARTMENT` (`department_code`),
  CONSTRAINT `FK_COURSE_DEPARTMENT` FOREIGN KEY (`department_code`) REFERENCES `departments` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES ('CS101','Introduction to programming',3,'CS',NULL),('CS102','Object oriented programming',4,'CS',NULL),('CS121','Data Structures',4,'CS',NULL),('CS210','Introduction to relational databases',3,'CS',NULL),('CS220','NoSQL Databases',3,'CS',NULL),('CS241','Computer Organization',3,'CS',NULL),('CS250','Functional Programming',3,'CS',NULL),('CS310','Algorithms',3,'CS',NULL),('CS341','Computer Architecture',3,'CS',NULL),('CS350','Automata Theory',3,'CS',NULL),('CS360','Numerical Methods',3,'CS',NULL),('CS370','Networking',3,'CS',NULL),('CS420','Machine Learning',3,'CS',NULL),('CS440','Software Engineering',3,'CS',NULL),('EC101','Introduction to Micro Economics',3,'EC',NULL),('EC102','Introduction to Macro Economics',3,'EC',NULL),('EE350','Information Theory',3,'EE',NULL),('MATH101','Calculus 1',4,'MATH',NULL),('MATH102','Calculus 2',4,'MATH',NULL),('MATH150','Discrete Mathematics',3,'MATH',NULL),('MATH201','Matrix theory',4,'MATH',NULL),('MATH202','Probability Theory',4,'MATH',NULL),('PHIL301','Introduction to Logic',3,'PHIL',NULL),('PHYS121','Classical Mechanics and Thermodynamics',4,'PHYS',NULL),('PHYS201','Electro-magnetism',4,'PHYS',NULL),('PHYS202','Quantum mechanics',4,'PHYS',NULL);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `code` varchar(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES ('CS','Computer Sciences'),('EC','Economics'),('EE','Electronic Engineering'),('HIST','History'),('MATH','Mathematics'),('PHIL','Philosophy'),('PHYS','Physics');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semesters` (
  `code` varchar(6) NOT NULL,
  `name` varchar(45) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
INSERT INTO `semesters` VALUES ('2013-1','2013 Spring',NULL,NULL),('2013-2','2013 Summer',NULL,NULL),('2013-3','2013 Fall',NULL,NULL),('2014-1','2014 Spring',NULL,NULL),('2014-2','2014 Summer',NULL,NULL),('2014-3','2014 Fall',NULL,NULL),('2015-1','2015 Spring',NULL,NULL),('2015-2','2015 Summer',NULL,NULL),('2015-3','2015 Fall',NULL,NULL),('2016-1','2016 Spring',NULL,NULL),('2016-2','2016 Summer',NULL,NULL),('2016-3','2016 Fall',NULL,NULL),('2017-1','2017 Spring',NULL,NULL),('2017-2','2017 Summer',NULL,NULL),('2017-3','2017 Fall',NULL,NULL),('2018-1','2018 Spring',NULL,NULL);
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courses`
--

DROP TABLE IF EXISTS `student_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courses` (
  `student_id` int(11) NOT NULL,
  `course_code` varchar(8) NOT NULL,
  `semester_code` varchar(6) NOT NULL,
  `instructor` varchar(45) NOT NULL,
  `letter_grade` varchar(2) DEFAULT NULL,
  `final_grade` double DEFAULT NULL,
  PRIMARY KEY (`student_id`,`course_code`,`semester_code`),
  KEY `FK_STUDENT_COURSES_COURSE_idx` (`course_code`),
  KEY `FK_STUDENT_COURSES_SEMESTER_idx` (`semester_code`),
  CONSTRAINT `FK_STUDENT_COURSES_COURSE` FOREIGN KEY (`course_code`) REFERENCES `courses` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_STUDENT_COURSES_SEMESTER` FOREIGN KEY (`semester_code`) REFERENCES `semesters` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_STUDENT_COURSES_STUDENT` FOREIGN KEY (`student_id`) REFERENCES `students` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courses`
--

LOCK TABLES `student_courses` WRITE;
/*!40000 ALTER TABLE `student_courses` DISABLE KEYS */;
INSERT INTO `student_courses` VALUES (1,'CS101','2016-1','Edgser Dijkstra','B',83),(1,'CS102','2016-2','Nicklaus Wirth','D+',68),(1,'CS121','2016-2','Donald Knuth','A-',90),(1,'MATH101','2016-1','Gottfried Leibniz','B',84),(1,'MATH102','2016-2','Bernhard Riemann‎','C+',77),(1,'PHYS121','2016-1','Isaac Newton','C',75),(1,'PHYS201','2017-1','Richard Feynmann','B-',80),(2,'CS101','2016-1','Edgser Dijkstra','A',97),(2,'CS102','2016-2','Nicklaus Wirth','A-',90),(2,'CS121','2016-2','Donald Knuth','A-',92),(2,'MATH101','2016-1','Gottfried Leibniz','A-',93),(2,'MATH102','2016-2','Bernhard Riemann‎','A',100),(2,'PHIL301','2017-2','Kurt Godel','A-',90),(2,'PHYS121','2016-1','Isaac Newton','A',86),(2,'PHYS201','2017-1','Richard Feynmann','A',99);
/*!40000 ALTER TABLE `student_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `SURNAME` varchar(45) NOT NULL,
  `EMAIL_ADDRESS` varchar(45) NOT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `GENDER` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Albert','Camus','ac000001@uniweb.edu',NULL,'M'),(2,'Harper','Lee','hl000002@uniweb.edu',NULL,'F'),(3,'Khalid','Hosseini','kh000003@uniweb.edu',NULL,'M');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-08 15:44:26
