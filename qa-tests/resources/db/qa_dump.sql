-- MySQL dump 10.17  Distrib 10.4.0-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: radar_db
-- ------------------------------------------------------
-- Server version	10.4.0-MariaDB-1:10.4.0+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add monument',7,'add_monument'),(26,'Can change monument',7,'change_monument'),(27,'Can delete monument',7,'delete_monument'),(28,'Can view monument',7,'view_monument'),(29,'Can add museum',8,'add_museum'),(30,'Can change museum',8,'change_museum'),(31,'Can delete museum',8,'delete_museum'),(32,'Can view museum',8,'view_museum'),(33,'Can add high school',9,'add_highschool'),(34,'Can change high school',9,'change_highschool'),(35,'Can delete high school',9,'delete_highschool'),(36,'Can view high school',9,'view_highschool'),(37,'Can add library',10,'add_library'),(38,'Can change library',10,'change_library'),(39,'Can delete library',10,'delete_library'),(40,'Can view library',10,'view_library'),(41,'Can add nursery school',11,'add_nurseryschool'),(42,'Can change nursery school',11,'change_nurseryschool'),(43,'Can delete nursery school',11,'delete_nurseryschool'),(44,'Can view nursery school',11,'view_nurseryschool'),(45,'Can add school',12,'add_school'),(46,'Can change school',12,'change_school'),(47,'Can delete school',12,'delete_school'),(48,'Can view school',12,'view_school'),(49,'Can add security force',13,'add_securityforce'),(50,'Can change security force',13,'change_securityforce'),(51,'Can delete security force',13,'delete_securityforce'),(52,'Can view security force',13,'view_securityforce');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'radar','highschool'),(10,'radar','library'),(7,'radar','monument'),(8,'radar','museum'),(11,'radar','nurseryschool'),(12,'radar','school'),(13,'radar','securityforce'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-06-02 18:50:16.796838'),(2,'auth','0001_initial','2021-06-02 18:50:16.965971'),(3,'admin','0001_initial','2021-06-02 18:50:17.485359'),(4,'admin','0002_logentry_remove_auto_add','2021-06-02 18:50:17.584975'),(5,'admin','0003_logentry_add_action_flag_choices','2021-06-02 18:50:17.595122'),(6,'contenttypes','0002_remove_content_type_name','2021-06-02 18:50:17.647978'),(7,'auth','0002_alter_permission_name_max_length','2021-06-02 18:50:17.659924'),(8,'auth','0003_alter_user_email_max_length','2021-06-02 18:50:17.674867'),(9,'auth','0004_alter_user_username_opts','2021-06-02 18:50:17.686000'),(10,'auth','0005_alter_user_last_login_null','2021-06-02 18:50:17.724654'),(11,'auth','0006_require_contenttypes_0002','2021-06-02 18:50:17.728946'),(12,'auth','0007_alter_validators_add_error_messages','2021-06-02 18:50:17.740382'),(13,'auth','0008_alter_user_username_max_length','2021-06-02 18:50:17.769824'),(14,'auth','0009_alter_user_last_name_max_length','2021-06-02 18:50:17.784539'),(15,'auth','0010_alter_group_name_max_length','2021-06-02 18:50:17.806831'),(16,'auth','0011_update_proxy_permissions','2021-06-02 18:50:17.826311'),(17,'radar','0001_initial','2021-06-02 18:50:17.860189'),(18,'radar','0002_auto_20200601_0911','2021-06-02 18:50:17.945044'),(19,'radar','0003_monument_museum','2021-06-02 18:50:17.992397'),(20,'radar','0004_delete_pharmacy','2021-06-02 18:50:18.006773'),(21,'radar','0005_highschool_library_nurseryschool_school_securityforce','2021-06-02 18:50:18.139584'),(22,'sessions','0001_initial','2021-06-02 18:50:18.171038');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radar_highschool`
--

DROP TABLE IF EXISTS `radar_highschool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radar_highschool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `latitude` decimal(12,7) NOT NULL,
  `longitude` decimal(12,7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radar_highschool`
--

LOCK TABLES `radar_highschool` WRITE;
/*!40000 ALTER TABLE `radar_highschool` DISABLE KEYS */;
INSERT INTO `radar_highschool` VALUES (1,'I.E.S. test_qa_001','985000011',43.5333490,-5.6336900),(2,'I.E.S. test_qa_002','985000012',43.5328270,-5.6703170),(3,'I.E.S. test_qa_003','985000013',43.5351600,-5.6336900),(4,'I.E.S. test_qa_004','985000014',43.5333490,-5.6695810);
/*!40000 ALTER TABLE `radar_highschool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radar_library`
--

DROP TABLE IF EXISTS `radar_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radar_library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `latitude` decimal(12,7) NOT NULL,
  `longitude` decimal(12,7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radar_library`
--

LOCK TABLES `radar_library` WRITE;
/*!40000 ALTER TABLE `radar_library` DISABLE KEYS */;
INSERT INTO `radar_library` VALUES (1,'Biblioteca test_qa_001','985000021',43.5409683,-5.6619860),(2,'Biblioteca test_qa_002','985000022',43.5390220,-5.6503750),(3,'Biblioteca test_qa_003','985000023',43.5300000,-5.6750000),(4,'Biblioteca test_qa_004','985000024',43.5211880,-5.7469380);
/*!40000 ALTER TABLE `radar_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radar_monument`
--

DROP TABLE IF EXISTS `radar_monument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radar_monument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `latitude` decimal(12,7) NOT NULL,
  `longitude` decimal(12,7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radar_monument`
--

LOCK TABLES `radar_monument` WRITE;
/*!40000 ALTER TABLE `radar_monument` DISABLE KEYS */;
INSERT INTO `radar_monument` VALUES (1,'Monumento test_qa_001','985000031',43.5352342,-5.6839832),(2,'Monumento test_qa_002','985000032',43.5480321,-5.6386973),(3,'Monumento test_qa_003','985000033',43.5322015,-5.6611195),(4,'Monumento test_qa_004','985000034',43.5490624,-5.6376448);
/*!40000 ALTER TABLE `radar_monument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radar_museum`
--

DROP TABLE IF EXISTS `radar_museum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radar_museum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `latitude` decimal(12,7) NOT NULL,
  `longitude` decimal(12,7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radar_museum`
--

LOCK TABLES `radar_museum` WRITE;
/*!40000 ALTER TABLE `radar_museum` DISABLE KEYS */;
INSERT INTO `radar_museum` VALUES (1,'Museo test_qa_001','985000041',43.5441870,-5.6638120),(2,'Museo test_qa_002','985000042',43.5453000,-5.6636160),(3,'Museo test_qa_003','985000043',43.5370070,-5.6347470),(4,'Museo test_qa_004','985000044',43.5425260,-5.6768670);
/*!40000 ALTER TABLE `radar_museum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radar_nurseryschool`
--

DROP TABLE IF EXISTS `radar_nurseryschool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radar_nurseryschool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `latitude` decimal(12,7) NOT NULL,
  `longitude` decimal(12,7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radar_nurseryschool`
--

LOCK TABLES `radar_nurseryschool` WRITE;
/*!40000 ALTER TABLE `radar_nurseryschool` DISABLE KEYS */;
INSERT INTO `radar_nurseryschool` VALUES (1,'Escuela infantil test_qa_001','985000051',43.5289870,-5.6406410),(2,'Escuela infantil test_qa_002','985000052',43.4913550,-5.6521190),(3,'Escuela infantil test_qa_003','985000053',43.5125290,-5.6688480),(4,'Escuela infantil test_qa_004','985000054',43.5276610,-5.6840050);
/*!40000 ALTER TABLE `radar_nurseryschool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radar_school`
--

DROP TABLE IF EXISTS `radar_school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radar_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `latitude` decimal(12,7) NOT NULL,
  `longitude` decimal(12,7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radar_school`
--

LOCK TABLES `radar_school` WRITE;
/*!40000 ALTER TABLE `radar_school` DISABLE KEYS */;
INSERT INTO `radar_school` VALUES (1,'Colegio test_qa_001','985000061',43.5284480,-5.6710510),(2,'Colegio test_qa_002','985000062',43.5300020,-5.6435430),(3,'Colegio test_qa_003','985000063',43.5271880,-5.6540620),(4,'Colegio test_qa_004','985000064',43.5208130,-5.7504370);
/*!40000 ALTER TABLE `radar_school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `radar_securityforce`
--

DROP TABLE IF EXISTS `radar_securityforce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radar_securityforce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `latitude` decimal(12,7) NOT NULL,
  `longitude` decimal(12,7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `radar_securityforce`
--

LOCK TABLES `radar_securityforce` WRITE;
/*!40000 ALTER TABLE `radar_securityforce` DISABLE KEYS */;
INSERT INTO `radar_securityforce` VALUES (1,'Bomberos test_qa_001','985000071',43.5156870,-5.6794370),(2,'Bomberos test_qa_002','985000072',43.5352190,-5.6588450),(3,'Guardia Civil test_qa_003','985000073',43.5319380,-5.6506870),(4,'Guardia Civil test_qa_004','985000074',43.5383310,-5.6771870);
/*!40000 ALTER TABLE `radar_securityforce` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-18 10:24:09
