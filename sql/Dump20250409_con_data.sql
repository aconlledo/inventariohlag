-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 172.29.1.77    Database: hlagDB
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.22-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add usuarios inventario',7,'add_usuariosinventario'),(26,'Can change usuarios inventario',7,'change_usuariosinventario'),(27,'Can delete usuarios inventario',7,'delete_usuariosinventario'),(28,'Can view usuarios inventario',7,'view_usuariosinventario'),(29,'Can add modelos',8,'add_modelos'),(30,'Can change modelos',8,'change_modelos'),(31,'Can delete modelos',8,'delete_modelos'),(32,'Can view modelos',8,'view_modelos'),(33,'Can add nombres activos',9,'add_nombresactivos'),(34,'Can change nombres activos',9,'change_nombresactivos'),(35,'Can delete nombres activos',9,'delete_nombresactivos'),(36,'Can view nombres activos',9,'view_nombresactivos'),(37,'Can add items activos',10,'add_itemsactivos'),(38,'Can change items activos',10,'change_itemsactivos'),(39,'Can delete items activos',10,'delete_itemsactivos'),(40,'Can view items activos',10,'view_itemsactivos'),(41,'Can add fabricantes',11,'add_fabricantes'),(42,'Can change fabricantes',11,'change_fabricantes'),(43,'Can delete fabricantes',11,'delete_fabricantes'),(44,'Can view fabricantes',11,'view_fabricantes'),(45,'Can add activos',12,'add_activos'),(46,'Can change activos',12,'change_activos'),(47,'Can delete activos',12,'delete_activos'),(48,'Can view activos',12,'view_activos'),(49,'Can add zonas',13,'add_zonas'),(50,'Can change zonas',13,'change_zonas'),(51,'Can delete zonas',13,'delete_zonas'),(52,'Can view zonas',13,'view_zonas'),(53,'Can add usuarios personas',14,'add_usuariospersonas'),(54,'Can change usuarios personas',14,'change_usuariospersonas'),(55,'Can delete usuarios personas',14,'delete_usuariospersonas'),(56,'Can view usuarios personas',14,'view_usuariospersonas');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$Dp1ZSSZbvJestY2KCzupaz$9UHsOFBiqqbjG/yzMGBJaK3xTf/oIrLg8kTRXTE+1N4=','2025-09-05 00:53:27.213792',1,'administrador','','','aconlledo@vilco.cl',1,1,'2025-08-29 02:40:27.319820');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(12,'tablas','activos'),(11,'tablas','fabricantes'),(10,'tablas','itemsactivos'),(8,'tablas','modelos'),(9,'tablas','nombresactivos'),(7,'tablas','usuariosinventario'),(13,'tablas','zonas'),(14,'usuarios','usuariospersonas');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-08-27 23:28:23.289094'),(2,'auth','0001_initial','2025-08-27 23:28:26.019168'),(3,'admin','0001_initial','2025-08-27 23:28:26.582231'),(4,'admin','0002_logentry_remove_auto_add','2025-08-27 23:28:26.607991'),(5,'admin','0003_logentry_add_action_flag_choices','2025-08-27 23:28:26.638260'),(6,'contenttypes','0002_remove_content_type_name','2025-08-27 23:28:27.088577'),(7,'auth','0002_alter_permission_name_max_length','2025-08-27 23:28:27.299061'),(8,'auth','0003_alter_user_email_max_length','2025-08-27 23:28:27.479149'),(9,'auth','0004_alter_user_username_opts','2025-08-27 23:28:27.502332'),(10,'auth','0005_alter_user_last_login_null','2025-08-27 23:28:27.742234'),(11,'auth','0006_require_contenttypes_0002','2025-08-27 23:28:27.755664'),(12,'auth','0007_alter_validators_add_error_messages','2025-08-27 23:28:27.780666'),(13,'auth','0008_alter_user_username_max_length','2025-08-27 23:28:27.938556'),(14,'auth','0009_alter_user_last_name_max_length','2025-08-27 23:28:28.132579'),(15,'auth','0010_alter_group_name_max_length','2025-08-27 23:28:28.296729'),(16,'auth','0011_update_proxy_permissions','2025-08-27 23:28:28.340182'),(17,'auth','0012_alter_user_first_name_max_length','2025-08-27 23:28:28.491615'),(18,'sessions','0001_initial','2025-08-27 23:28:28.738231'),(19,'tablas','0001_initial','2025-08-27 23:29:12.975605'),(20,'usuarios','0001_initial','2025-08-29 02:44:44.429425'),(21,'tablas','0002_alter_activos_options_activos_accounted_and_more','2025-09-02 23:56:54.469012'),(22,'tablas','0003_alter_activos_options','2025-09-02 23:56:54.477364'),(23,'tablas','0004_alter_activos_fcompra_alter_activos_festado','2025-09-03 00:00:29.680961'),(24,'tablas','0005_alter_modelos_nombre','2025-09-03 00:36:57.186686');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7yebeg4eac9uec4y6ddj1e0ptarq6kuj','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1usW2b:BPwJDmdfo4IJMqUtK8X-x84QDL1PLSbEkuA5jV1dhMI','2025-09-14 00:35:29.488256'),('95eb72jof58abs263i7sab75goxlf2bf','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1urpTN:rl2u70RCZCw6GZbe5aXujJk_00FhnlBC_pyj6YW7dp8','2025-09-12 03:08:17.073121'),('b7iaiilzr75k1axv41njxo2c6fvevrl9','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1urpHD:umyrc_hWK-xS5PXl1bFRPmA_eLmLPWtaNtZ1CdquFbI','2025-09-12 02:55:43.518573'),('cv9go1tb16o0sgwxmdwy74zaf3vefw2v','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1utYj6:y4VEyfqU66fUvgkw4Nbel0-KcQXopMKbUY0iYCi0Q7E','2025-09-16 21:39:40.912523'),('hvykoq2bdl5edrpuo1s76jtp28ns3r1j','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1utYZ7:e_9VMJCzqKFHgBplWZoIVrtXk2BWn_N2DL0H-z_rK1Q','2025-09-16 21:29:21.304762'),('nihnukyqiw6jn4wwmg39yvg4hguc7ojb','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1utYHH:xQmovlw0SYqgtcEW1mPRTzCocdsT9ftDu-Eoyyhnbp8','2025-09-16 21:10:55.235411'),('nrgf7l5pbaa1575puwfajjt3g4gwfzvm','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1urpHD:umyrc_hWK-xS5PXl1bFRPmA_eLmLPWtaNtZ1CdquFbI','2025-09-12 02:55:43.593688'),('rcqw85mhcp0p6j994m9gbxeruauqd06v','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuKhj:BB6CJDxSlTFb-N_C2Nvs7HY0Ha-lEzSH-3VJLNkMh6I','2025-09-19 00:53:27.220911'),('uy0ufbf4mmd58wdcpf2dm2o6sgq301fk','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1utYTQ:WGFQEBjhsWKm2uC5Seb4Mo7eclvrSG8OD66_2iqMRpY','2025-09-16 21:23:28.513550');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablas_activos`
--

DROP TABLE IF EXISTS `tablas_activos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablas_activos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(1) NOT NULL,
  `identificador` varchar(45) NOT NULL,
  `especificacion` int(11) DEFAULT NULL,
  `detalle` varchar(250) DEFAULT NULL,
  `serial` varchar(45) DEFAULT NULL,
  `owner` varchar(1) NOT NULL,
  `factura` varchar(45) DEFAULT NULL,
  `fcompra` varchar(10) DEFAULT NULL,
  `vcompra` decimal(10,2) DEFAULT NULL,
  `factivacion` date DEFAULT NULL,
  `vactual` decimal(10,2) DEFAULT NULL,
  `location` varchar(1) NOT NULL,
  `building` varchar(1) NOT NULL,
  `floor` varchar(15) DEFAULT NULL,
  `city` varchar(1) NOT NULL,
  `country` varchar(1) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `festado` varchar(10) DEFAULT NULL,
  `fingreso` datetime(6) NOT NULL,
  `fmodifica` datetime(6) NOT NULL,
  `fabricante_id` bigint(20) DEFAULT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  `modelo_id` bigint(20) DEFAULT NULL,
  `nombre_id` bigint(20) DEFAULT NULL,
  `usuarioinv_id` bigint(20) DEFAULT NULL,
  `zona_id` bigint(20) DEFAULT NULL,
  `accounted` varchar(1) DEFAULT NULL,
  `proveedor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tablas_activos_fabricante_id_c5448c3b_fk_tablas_fabricantes_id` (`fabricante_id`),
  KEY `tablas_activos_item_id_11a20c59_fk_tablas_items_id` (`item_id`),
  KEY `tablas_activos_modelo_id_b8b67fbd_fk_tablas_modelos_id` (`modelo_id`),
  KEY `tablas_activos_nombre_id_3df68f8a_fk_tablas_nombresactivos_id` (`nombre_id`),
  KEY `tablas_activos_usuarioinv_id_07f61139_fk_tablas_us` (`usuarioinv_id`),
  KEY `tablas_activos_zona_id_609b16a0_fk_tablas_zonas_id` (`zona_id`),
  CONSTRAINT `tablas_activos_fabricante_id_c5448c3b_fk_tablas_fabricantes_id` FOREIGN KEY (`fabricante_id`) REFERENCES `tablas_fabricantes` (`id`),
  CONSTRAINT `tablas_activos_item_id_11a20c59_fk_tablas_items_id` FOREIGN KEY (`item_id`) REFERENCES `tablas_items` (`id`),
  CONSTRAINT `tablas_activos_modelo_id_b8b67fbd_fk_tablas_modelos_id` FOREIGN KEY (`modelo_id`) REFERENCES `tablas_modelos` (`id`),
  CONSTRAINT `tablas_activos_nombre_id_3df68f8a_fk_tablas_nombresactivos_id` FOREIGN KEY (`nombre_id`) REFERENCES `tablas_nombresactivos` (`id`),
  CONSTRAINT `tablas_activos_usuarioinv_id_07f61139_fk_tablas_us` FOREIGN KEY (`usuarioinv_id`) REFERENCES `tablas_usuariosinventario` (`id`),
  CONSTRAINT `tablas_activos_zona_id_609b16a0_fk_tablas_zonas_id` FOREIGN KEY (`zona_id`) REFERENCES `tablas_zonas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_activos`
--

LOCK TABLES `tablas_activos` WRITE;
/*!40000 ALTER TABLE `tablas_activos` DISABLE KEYS */;
INSERT INTO `tablas_activos` VALUES (1,'0','IT-AC-001',4,'  ','FCW1844J1NH','1','N/A','2022-01-03',0.00,'2023-01-02',0.00,'0','0','9','0','0','2','2023-09-27','2025-09-05 00:49:50.437968','2025-09-05 00:49:50.437968',1,1,1,1,NULL,1,'1',NULL),(2,'0','IT-AC-002',4,'  ','FCW1916N6J6','1','N/A','2022-01-03',0.00,'2023-01-02',0.00,'0','0','9','0','0','2','2023-09-27','2025-09-05 00:49:50.497602','2025-09-05 00:49:50.497602',1,1,1,1,NULL,1,'1',NULL),(3,'0','IT-BE-001',4,'  ','VTAF710812L','0','N/A','2020-01-06',0.00,'2020-06-11',0.00,'0','0','9','0','0','2','2023-09-27','2025-09-05 00:49:50.531379','2025-09-05 00:49:50.531379',2,2,2,2,NULL,1,'1',NULL),(4,'0','IT-CE-184',4,'  ','359772046289535','0','N/A','2019-09-06',0.00,'2019-09-08',0.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-05 00:49:50.560892','2025-09-05 00:49:50.560892',3,3,3,3,NULL,1,'1',NULL),(5,'0','IT-CE-027',4,'  ','353204309349836','0','N/A','2023-01-06',278.23,'2023-01-08',278.23,'0','0','9','0','0','0','2023-09-27','2025-09-05 00:49:50.587548','2025-09-05 00:49:50.587548',4,3,4,3,1,1,'1',NULL),(6,'0','IT-CE-028',4,'  ','353204309410885','0','N/A','2023-01-06',278.23,'2023-01-08',278.23,'1','1','N/A','1','0','0','2023-09-27','2025-09-05 00:49:50.603560','2025-09-05 00:49:50.603560',4,3,4,3,2,1,'1',NULL),(7,'0','IT-CE-101',4,'  ','351084396388042','0','N/A','2023-01-06',693.64,'2023-01-08',693.64,'1','1','N/A','1','0','0','2023-09-27','2025-09-05 00:49:50.626562','2025-09-05 00:49:50.626562',4,3,5,3,3,1,'1',NULL),(8,'0','IT-CE-102',4,'  ','352094677594282','0','N/A','2023-01-06',693.64,'2023-01-08',693.64,'1','1','N/A','1','0','0','2023-09-27','2025-09-05 00:49:50.641662','2025-09-05 00:49:50.641662',4,3,5,3,4,1,'1',NULL),(9,'0','IT-CE-103',4,'  ','353917851117703','0','N/A','2023-01-06',564.70,'2023-01-08',564.70,'1','1','N/A','1','0','0','2023-09-27','2025-09-05 00:49:50.662386','2025-09-05 00:49:50.662386',4,3,6,3,5,1,'1',NULL),(10,'0','IT-CE-104',4,'  ','357170855010450','0','N/A','2023-01-06',564.70,'2023-01-08',564.70,'1','1','N/A','1','0','0','2023-09-27','2025-09-05 00:49:50.681824','2025-09-05 00:49:50.681824',4,3,6,3,6,1,'1',NULL),(11,'0','IT-CE-002',4,'  ','356740114289045','0','N/A','2021-01-06',0.00,'2021-01-08',0.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-05 00:49:50.702687','2025-09-05 00:49:50.702687',4,3,7,3,7,1,'1',NULL),(12,'0','IT-CE-003',4,'  ','356741114472532','0','N/A','2021-01-06',0.00,'2021-01-08',0.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-05 00:49:50.720123','2025-09-05 00:49:50.720123',4,3,7,3,8,1,'1',NULL),(13,'0','IT-DE-001',4,'  ','BRZV0R3','0','N/A','2022-03-03',1200.00,'2022-08-04',1200.00,'1','1','N/A','1','0','2','2022-08-04','2025-09-05 00:49:50.745845','2025-09-05 00:49:50.745845',5,4,8,4,NULL,1,'1',NULL),(14,'0','IT-DE-002',4,'  ','6RZV0R3','0','N/A','2020-10-08',700.00,'2020-09-12',700.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-05 00:49:50.761020','2025-09-05 00:49:50.761020',5,4,8,4,9,1,'1',NULL),(15,'0','IT-MO-082',4,'  ','0P9RHTQJ900085R','0','N/A','2022-01-06',212.00,'2022-01-08',212.00,'0','0','9','0','0','2','2023-09-27','2025-09-05 00:49:50.788063','2025-09-05 00:49:50.788063',6,5,9,5,NULL,1,'1',NULL),(16,'0','IT-MO-083',4,'  ','0P9RHTQJ900092P','0','N/A','2022-01-06',212.00,'2022-01-08',212.00,'0','0','9','0','0','2','2023-09-27','2025-09-05 00:49:50.799238','2025-09-05 00:49:50.799238',6,5,9,5,NULL,1,'1',NULL),(17,'0','IT-MO-018',4,'  ','CN-0YMYH1-74261-5BQ-1KPL','0','N/A','2022-01-06',212.00,'2022-01-08',212.00,'0','0','9','0','0','2','2023-09-27','2025-09-05 00:49:50.813528','2025-09-05 00:49:50.813528',5,5,10,5,NULL,1,'1',NULL),(18,'0','IT-MO-019',4,'  ','CN-0YMYH1-74261-5BQ-1KTL','0','N/A','2022-01-06',212.00,'2022-01-08',212.00,'0','0','9','0','0','2','2023-09-27','2025-09-05 00:49:50.826624','2025-09-05 00:49:50.826624',5,5,10,5,NULL,1,'1',NULL),(19,'0','IT-NO-001',4,'  ','H97LP13','0','N/A','2020-10-08',1000.00,'2020-09-12',0.00,'0','0','9','0','0','0','2023-09-27','2025-09-05 00:49:50.854379','2025-09-05 00:49:50.854379',5,6,11,6,10,1,'1',NULL),(20,'0','IT-NO-002',4,'  ','4LTNP13','0','N/A','2020-10-08',1000.00,'2020-09-12',0.00,'0','0','9','0','0','1','2023-09-27','2025-09-05 00:49:50.863533','2025-09-05 00:49:50.863533',5,6,11,6,NULL,1,'1',NULL),(21,'0','IT-NO-026',4,'  ','F0SL573','0','N/A','2022-03-03',1200.00,'2022-08-04',0.00,'1','1','N/A','1','0','4','2023-09-27','2025-09-05 00:49:50.879545','2025-09-05 00:49:50.879545',5,6,12,6,NULL,1,'1',NULL),(22,'0','IT-NO-027',4,'  ','CL4T473','0','N/A','2022-03-03',1200.00,'2022-08-04',0.00,'1','1','N/A','1','0','4','2023-09-27','2025-09-05 00:49:50.891307','2025-09-05 00:49:50.891307',5,6,12,6,NULL,1,'1',NULL),(23,'0','IT-NO-052',4,'  ','168H6J3','0','N/A','2022-06-11',1500.00,'2022-06-11',1500.00,'1','1','N/A','1','0','4','2023-09-27','2025-09-05 00:49:50.908126','2025-09-05 00:49:50.908126',5,6,13,6,NULL,1,'1',NULL),(24,'0','IT-NO-312',4,'  ','D7883J3','0','N/A','2022-06-11',1500.00,'2022-06-11',1500.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-05 00:49:50.923305','2025-09-05 00:49:50.923305',5,6,13,6,11,1,'1',NULL),(25,'0','IT-NO-047',4,'  ','DCRQJR3','0','N/A','2022-05-07',1800.00,'2022-12-10',1800.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-05 00:49:50.944298','2025-09-05 00:49:50.944298',5,6,14,6,12,1,'1',NULL),(26,'0','IT-NO-048',4,'  ','9MYHKR3','0','N/A','2022-05-07',1800.00,'2022-12-10',1800.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-05 00:49:50.960283','2025-09-05 00:49:50.960283',5,6,14,6,13,1,'1',NULL),(27,'0','IT-NO-483',4,'  ','1WLSGY3','0','N/A','2022-05-07',1800.00,'2022-12-10',1800.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-05 00:49:50.975120','2025-09-05 00:49:50.975120',5,6,15,6,NULL,1,'1',NULL),(28,'0','IT-NO-407',4,'  ','100C674','0','N/A','2025-03-15',2100.00,'2025-03-15',2100.00,'1','1','N/A','1','0','0','2025-05-29','2025-09-05 00:49:50.995767','2025-09-05 00:49:50.995767',5,6,16,6,14,1,'1',NULL),(29,'0','IT-NO-408',4,'  ','1BCC674','0','N/A','2025-03-15',2100.00,'2025-03-15',2100.00,'1','1','N/A','1','0','3','2025-05-29','2025-09-05 00:49:51.008112','2025-09-05 00:49:51.008112',5,6,16,6,NULL,1,'1',NULL),(30,'0','IT-NO-484',4,'  ','H2CRRV3','0','N/A','2022-05-07',1800.00,'2022-12-10',1800.00,'1','1','N/A','1','0','1','2023-09-27','2025-09-05 00:49:51.024451','2025-09-05 00:49:51.024451',5,6,17,6,NULL,1,'1',NULL),(31,'0','IT-NO-485',4,'  ','40HVPQ2','0','N/A','2020-10-08',1000.00,'2020-09-12',1000.00,'1','1','N/A','1','0','1','2023-09-27','2025-09-05 00:49:51.040415','2025-09-05 00:49:51.040415',5,6,18,6,NULL,1,'1',NULL),(32,'0','IT-NO-491',4,'  ','GCTV593','0','N/A','2022-04-05',2100.00,'2022-12-10',2100.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-05 00:49:51.059715','2025-09-05 00:49:51.059715',5,6,19,6,15,1,'1',NULL),(33,'0','IT-NO-492',4,'  ','4GZ6JR3','0','N/A','2022-05-07',2100.00,'2022-12-10',2100.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-05 00:49:51.076445','2025-09-05 00:49:51.076445',5,6,20,6,3,1,'1',NULL),(34,'0','IT-NO-493',4,'  ','94QZC74','0','N/A','2025-03-15',2500.00,'2025-03-15',2500.00,'1','1','N/A','1','0','0','2025-03-15','2025-09-05 00:49:51.095796','2025-09-05 00:49:51.095796',5,6,21,6,16,1,'1',NULL),(35,'0','IT-PR-001',4,'  ','5062159473V2C','0','N/A','2022-03-03',3500.00,'2021-01-06',3500.00,'0','0','9','0','0','2','2023-09-27','2025-09-05 00:49:51.123951','2025-09-05 00:49:51.123951',7,7,22,7,NULL,1,'1',NULL),(36,'0','IT-PR-002',4,'  ','50280080G4M6N','0','N/A','2022-03-03',2000.00,'2021-01-06',2000.00,'0','0','9','0','0','2','2023-09-27','2025-09-05 00:49:51.139521','2025-09-05 00:49:51.139521',7,7,23,7,NULL,1,'1',NULL),(37,'0','IT-TV-001',4,'  ','0AW53CSN800978W','0','N/A','2023-01-02',300.00,'2024-03-02',300.00,'0','0','9','0','0','2','2023-09-27','2025-09-05 00:49:51.168738','2025-09-05 00:49:51.169729',8,8,24,8,NULL,2,'1',NULL),(38,'0','IT-TV-002',4,'  ','--','0','N/A','2023-01-02',300.00,'2024-03-02',300.00,'0','0','9','0','0','2','2023-09-27','2025-09-05 00:49:51.185334','2025-09-05 00:49:51.185334',6,8,25,8,NULL,2,'1',NULL),(39,'0','IT-VI-001',4,'  ','FOC2420PM9H','1','N/A','2022-01-04',3500.00,'2022-01-12',3500.00,'0','0','9','0','0','2','2023-09-27','2025-09-05 00:49:51.214075','2025-09-05 00:49:51.214075',1,9,26,9,NULL,3,'1',NULL),(40,'0','IT-VI-002',4,'  ','FOC2541N8NK','1','N/A','2022-01-04',3500.00,'2022-01-12',3500.00,'0','0','9','0','0','2','2023-09-27','2025-09-05 00:49:51.229126','2025-09-05 00:49:51.230148',1,9,26,9,NULL,4,'1',NULL),(41,'1','MO-CAJA-001',4,'ALTO 56 CM-ANCHO 59 CM-FONDO 64 CM  ','','2','F/39052','1900-01-01',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-16','2025-09-05 00:49:51.265529','2025-09-05 00:49:51.265529',9,10,27,10,17,5,'1',''),(42,'1','MO-CAJA-002',4,'ALTO 101 CM-ANCHO 50 CM-FONDO 45 CM  ','','2','F/39052','1900-01-01',0.00,'2022-01-12',0.00,'1','1','11','1','0','5','2023-06-16','2025-09-05 00:49:51.285280','2025-09-05 00:49:51.285280',9,10,28,10,17,6,'1',''),(43,'1','MO-CAJO-001',4,'CAJONERA 3 SMT 344 COLOR BLANCO ','','2','F/9635+9942','2019-10-28',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-16','2025-09-05 00:49:51.322207','2025-09-05 00:49:51.322207',10,11,29,11,18,7,'1',''),(44,'1','MO-CAJO-002',4,'CAJONERA 4 0959 CC COLOR BLANCO ','','2','F/9635+9942','2019-10-28',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-16','2025-09-05 00:49:51.425851','2025-09-05 00:49:51.425851',10,11,29,11,19,8,'1',''),(45,'1','MO-CAJO-283',4,'895 COLOR BLANCO ','','2','F/475','2022-05-17',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-16','2025-09-05 00:49:51.453033','2025-09-05 00:49:51.453033',11,11,30,11,20,8,'1',''),(46,'1','MO-CAJO-284',4,'855 COLOR BLANCO ','','2','F/475','2022-05-17',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-16','2025-09-05 00:49:51.470229','2025-09-05 00:49:51.470229',11,11,30,11,21,8,'1',''),(47,'1','MO-CONG-001',4,'OPEN PLAN LEGAL - E. ESTAY PALMS-FOREST-WITH-SKY_TRUCK ','','2','F/1223','2021-06-10',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:51.501557','2025-09-05 00:49:51.501557',9,12,31,12,22,9,'1',''),(48,'1','MO-CUAD-001',4,'OFICINA GERENCIA GENERAL HLAG_IG_6 ','','2','F/5238+5295','2022-07-04',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:51.540990','2025-09-05 00:49:51.540990',12,13,32,13,23,10,'1',''),(49,'1','MO-CUAD-002',4,'OFICINA GERENCIA GENERAL HLAG_IG_44 ','','2','F/5238+5295','2022-07-04',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:51.553563','2025-09-05 00:49:51.553563',12,13,32,13,23,10,'1',''),(50,'1','MO-ESCR-001',4,' COLOR CEMENTO ','7805437','2','12143','2024-08-01',1458.72,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-05 00:49:51.582321','2025-09-05 00:49:51.582321',NULL,14,33,14,24,11,'1',''),(51,'1','MO-ESCR-002',4,'OFICINA 1 SMT 383 COLOR OLMO ','7805438','2','12143','2024-08-01',1458.72,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-05 00:49:51.594466','2025-09-05 00:49:51.594466',NULL,14,33,14,24,11,'1',''),(52,'1','MO-ESCR-010',4,'OFICINA 98 COLOR OLMO ','7805446','2','12143','2024-08-01',952.97,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-05 00:49:51.612994','2025-09-05 00:49:51.612994',NULL,14,34,14,24,12,'1',''),(53,'1','MO-ESCR-011',4,'OFICINA 98 COLOR CEMENTO ','7805447','2','12143','2024-08-01',952.97,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-05 00:49:51.629182','2025-09-05 00:49:51.629182',NULL,14,34,14,24,13,'1',''),(54,'1','MO-ESCR-035',4,'OFICINA COLOR OLMO ','','2','F/1039','2019-10-28',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:51.648004','2025-09-05 00:49:51.648004',10,14,35,14,25,10,'1',''),(55,'1','MO-ESCR-036',4,' COLOR OLMO ','','2','F/1039','2019-10-28',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:51.662716','2025-09-05 00:49:51.662716',10,14,35,14,26,10,'1',''),(56,'1','MO-ESTA-001',4,'CUBIERTA, TAPA, ESTRUCTURA, SEPARADOR CRISTAL Y ALMEJAS. COLOR CEMENTO Y BLANCO ','','2','F/1039','2019-10-28',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-19','2025-09-05 00:49:51.688015','2025-09-05 00:49:51.688015',10,15,36,15,23,8,'1',''),(57,'1','MO-ESTA-002',4,'CUBIERTA, TAPA, ESTRUCTURA, SEPARADOR CRISTAL Y ALMEJAS. COLOR CEMENTO Y BLANCO ','','2','F/1039','2019-10-28',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-19','2025-09-05 00:49:51.702817','2025-09-05 00:49:51.702817',10,15,37,15,23,8,'1',''),(58,'1','MO-GENE-001',4,' COLOR OLMO ','','2','F/39052','2019-08-30',0.00,'2022-01-12',0.00,'1','1','TECHO','1','0','5','2023-06-16','2025-09-05 00:49:51.731484','2025-09-05 00:49:51.731484',13,16,38,16,NULL,1,'1',''),(59,'1','MO-HORN-001',4,'  ','7805475','2','40532','2024-08-01',428.33,'2022-01-12',0.00,'1','1','9','1','0','5','2025-01-08','2025-09-05 00:49:51.755083','2025-09-05 00:49:51.755083',NULL,17,39,17,24,14,'1',''),(60,'1','MO-JARD-001',4,'  ','7805483','2','241','2024-08-01',287.00,'2022-01-12',0.00,'1','1','9','1','0','5','2025-01-08','2025-09-05 00:49:51.777844','2025-09-05 00:49:51.777844',NULL,18,40,18,24,15,'1',''),(61,'1','MO-JARD-002',4,'  ','7805483','2','241','2024-08-01',287.00,'2022-01-12',0.00,'1','1','9','1','0','5','2025-01-08','2025-09-05 00:49:51.790085','2025-09-05 00:49:51.790085',NULL,18,40,18,24,15,'1',''),(62,'1','MO-MAQU-001',4,'ESCALA 1:200  ','','2','','2024-08-01',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:51.813960','2025-09-05 00:49:51.813960',14,19,41,19,23,8,'1',''),(63,'1','MO-MAQU-002',4,'ESCALA 1:200  ','','2','','2024-08-01',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-16','2025-09-05 00:49:51.832283','2025-09-05 00:49:51.832283',14,19,42,19,23,16,'1',''),(64,'1','MO-MESA-002',4,' COLOR OLMO ','7805450','2','12143','2024-08-01',348.96,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-05 00:49:51.852297','2025-09-05 00:49:51.852297',NULL,20,43,20,24,12,'1',''),(65,'1','MO-MESA-003',4,' COLOR OLMO ','7805451','2','12143','2024-08-01',348.96,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-05 00:49:51.865221','2025-09-05 00:49:51.865221',NULL,20,43,20,24,17,'1',''),(66,'1','MO-MESA-009',4,' COLOR OLMO ','7805461','2','12143','2024-08-01',442.66,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-05 00:49:51.879121','2025-09-05 00:49:51.879121',NULL,20,44,20,24,2,'1',''),(67,'1','MO-MESA-010',4,' COLOR OLMO ','7805462','2','12143','2024-08-01',442.66,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-05 00:49:51.891060','2025-09-05 00:49:51.891060',NULL,20,44,20,24,2,'1',''),(68,'1','MO-MESA-019',4,' COLOR BLANCO ','7805654','2','5718','2024-08-01',100.74,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-05 00:49:51.907642','2025-09-05 00:49:51.907642',NULL,20,45,20,24,18,'1',''),(69,'1','MO-MESA-020',4,' COLOR BLANCO ','7805655','2','5718','2024-08-01',100.74,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-05 00:49:51.915930','2025-09-05 00:49:51.915930',NULL,20,45,20,24,18,'1',''),(70,'1','MO-MESA-030',4,' COLOR OLMO ','','2','F/1039','2019-10-28',0.00,'2022-01-12',0.00,'1','1','11','1','0','5','2023-06-16','2025-09-05 00:49:51.933330','2025-09-05 00:49:51.933330',10,20,46,20,27,10,'1',''),(71,'1','MO-MESA-031',4,' COLOR OLMO ','','2','F/1039','2019-10-28',0.00,'2022-01-12',0.00,'1','1','11','1','0','5','2023-06-16','2025-09-05 00:49:51.948015','2025-09-05 00:49:51.948015',10,20,46,20,28,10,'1',''),(72,'1','MO-MESA-037',4,' COLOR OLMO Y PATAS  BLANCAS ','','2','F/1039','2019-10-28',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:51.966925','2025-09-05 00:49:51.966925',9,20,47,20,22,19,'1',''),(73,'1','MO-MESA-038',4,' COLOR OLMO Y PATAS  BLANCAS ','','2','F/1039','2019-10-28',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:51.978263','2025-09-05 00:49:51.978263',9,20,47,20,22,19,'1',''),(74,'1','MO-MICR-001',4,' COLOR NEGRO ','7805476','2','40532','2024-08-01',250.27,'2022-01-12',250.27,'1','1','9','1','0','5','2025-01-08','2025-09-05 00:49:51.999155','2025-09-05 00:49:51.999155',NULL,21,48,21,24,14,'1',''),(75,'1','MO-MICR-002',4,' COLOR NEGRO ','7805477','2','40532','2024-08-01',250.27,'2022-01-12',250.27,'1','1','9','1','0','5','2025-01-08','2025-09-05 00:49:52.009455','2025-09-05 00:49:52.009455',NULL,21,48,21,24,14,'1',''),(76,'1','MO-MUEB-004',4,' COLOR BLANCO ','','2','','2024-08-01',0.00,'2022-01-12',0.00,'1','1','11','1','0','5','2023-06-16','2025-09-05 00:49:52.038269','2025-09-05 00:49:52.038269',10,22,49,22,29,20,'1',''),(77,'1','MO-MUEB-005',4,' COLOR BLANCO ','','2','','2024-08-01',0.00,'2022-01-12',0.00,'1','1','11','1','0','5','2023-06-16','2025-09-05 00:49:52.052390','2025-09-05 00:49:52.052390',10,22,49,22,30,20,'1',''),(78,'1','MO-PAPE-001',4,'  ','7805484','2','12462- 12530','2024-08-01',26.08,'2022-01-12',0.00,'1','1','9','1','0','5','2025-01-07','2025-09-05 00:49:52.074052','2025-09-05 00:49:52.074052',NULL,23,50,23,24,15,'1',''),(79,'1','MO-PAPE-002',4,'  ','7805484','2','12462- 12530','2024-08-01',26.08,'2022-01-12',0.00,'1','1','9','1','0','5','2025-01-07','2025-09-05 00:49:52.084723','2025-09-05 00:49:52.084723',NULL,23,50,23,24,15,'1',''),(80,'1','MO-PLAN-001',4,'MACETERO PIRAMIDE 40 x 70 h AVOID WATERING IT OR FERTILIZING IT. ','','2','F/176-177','2022-11-14',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-07-12','2025-09-05 00:49:52.107175','2025-09-05 00:49:52.107175',15,18,51,18,31,10,'0',''),(81,'1','MO-PLAN-002',4,'PIRAMIDE 40 X 70 h AVOID WATERING IT OR FERTILIZING IT. ','','2','F/176-177','2022-11-14',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-07-12','2025-09-05 00:49:52.126619','2025-09-05 00:49:52.126619',15,18,52,18,32,7,'0',''),(82,'1','MO-POLT-001',4,'  ','7805660','2','5718','2024-08-01',347.52,'2022-01-12',347.52,'1','1','9','1','0','5','2025-01-08','2025-09-05 00:49:52.143944','2025-09-05 00:49:52.143944',NULL,22,53,22,24,21,'1',''),(83,'1','MO-POLT-002',4,'  ','7805661','2','5718','2024-08-01',347.52,'2022-01-12',347.52,'1','1','9','1','0','5','2025-01-08','2025-09-05 00:49:52.159485','2025-09-05 00:49:52.159485',NULL,22,53,22,24,21,'1',''),(84,'1','MO-REFR-001',4,' COLOR GRIS ','7805473','2','40532','2024-08-01',1163.88,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-05 00:49:52.203117','2025-09-05 00:49:52.203117',NULL,24,54,24,24,14,'1',''),(85,'1','MO-REFR-002',4,' COLOR GRIS OSCURO ','7805474','2','40532','2024-08-01',1163.88,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-05 00:49:52.213533','2025-09-05 00:49:52.213533',NULL,24,54,24,24,14,'1',''),(86,'1','MO-SILL-001',4,' COLOR ANARANJADO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-16','2025-09-05 00:49:52.254019','2025-09-05 00:49:52.254019',16,25,55,25,33,22,'1',''),(87,'1','MO-SILL-002',4,' COLOR ANARANJADO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-16','2025-09-05 00:49:52.266403','2025-09-05 00:49:52.266403',16,25,55,25,33,22,'1',''),(88,'1','MO-SILL-371',4,' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','11','1','0','5','2023-06-16','2025-09-05 00:49:52.287191','2025-09-05 00:49:52.287191',16,25,56,25,34,10,'1',''),(89,'1','MO-SILL-372',4,' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','11','1','0','5','2023-06-16','2025-09-05 00:49:52.297804','2025-09-05 00:49:52.297804',16,25,56,25,34,10,'1',''),(90,'1','MO-SILL-404',4,' CUERO COLOR VERDE ','','2','F/844','2021-07-01',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:52.320012','2025-09-05 00:49:52.320012',17,25,57,25,23,19,'1',''),(91,'1','MO-SILL-405',4,' CUERO COLOR VERDE ','','2','F/844','2021-07-01',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:52.331704','2025-09-05 00:49:52.331704',17,25,57,25,23,19,'1',''),(92,'1','MO-SILL-439',4,' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:52.346703','2025-09-05 00:49:52.346703',16,25,58,25,32,7,'1',''),(93,'1','MO-SILL-440',4,' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:52.360183','2025-09-05 00:49:52.360183',16,25,58,25,32,7,'1',''),(94,'1','MO-SILL-441',4,' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:52.376657','2025-09-05 00:49:52.376657',16,25,59,25,32,7,'1',''),(95,'1','MO-SILL-442',4,' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:52.435500','2025-09-05 00:49:52.435500',16,25,59,25,35,7,'1',''),(96,'1','MO-SILL-521',4,' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:52.473322','2025-09-05 00:49:52.473322',16,25,60,25,27,10,'1',''),(97,'1','MO-SILL-522',4,' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:52.487677','2025-09-05 00:49:52.487677',16,25,60,25,27,10,'1',''),(98,'1','MO-SILL-633',4,' COLOR CAFÉ ','','2','','2019-11-18',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:52.507601','2025-09-05 00:49:52.507601',18,25,61,25,23,20,'1',''),(99,'1','MO-SILL-634',4,' COLOR CAFÉ ','','2','','2019-11-18',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-05 00:49:52.520776','2025-09-05 00:49:52.520776',18,25,61,25,23,20,'1',''),(100,'1','MO-ESCR-001',7805437,'  ','7805437','2','12143','2024-08-01',1458.72,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.533460','2025-09-05 00:49:52.533460',10,14,33,14,24,11,'1',NULL),(101,'1','MO-ESCR-002',7805438,'  ','7805438','2','12143','2024-08-01',1458.72,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.545929','2025-09-05 00:49:52.545929',10,14,33,14,24,11,'1',NULL),(102,'1','MO-ESCR-010',7805446,'  ','7805446','2','12143','2024-08-01',952.97,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.559175','2025-09-05 00:49:52.559175',10,14,34,14,24,12,'1',NULL),(103,'1','MO-ESCR-011',7805447,'  ','7805447','2','12143','2024-08-01',952.97,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.573254','2025-09-05 00:49:52.573254',10,14,34,14,24,13,'1',NULL),(104,'1','MO-JARD-001',780548322,'  ','780548322','2','241','2024-08-01',287.00,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.596572','2025-09-05 00:49:52.596572',15,26,62,26,24,15,'1',NULL),(105,'1','MO-JARD-002',780548323,'  ','780548323','2','241','2024-08-01',287.00,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.610310','2025-09-05 00:49:52.610310',15,26,62,26,24,15,'1',NULL),(106,'1','MO-MESA-001',7805436,'  ','7805436','2','117206','2024-08-01',299.68,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.636045','2025-09-05 00:49:52.636045',19,20,63,20,24,23,'1',NULL),(107,'1','MO-MESA-002',7805450,'  ','7805450','2','12143','2024-08-01',348.96,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.648754','2025-09-05 00:49:52.648754',10,20,43,20,24,12,'1',NULL),(108,'1','MO-MESA-009',7805461,'  ','7805461','2','12143','2024-08-01',442.66,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.661942','2025-09-05 00:49:52.661942',10,20,44,20,24,2,'1',NULL),(109,'1','MO-MESA-010',7805462,'  ','7805462','2','12143','2024-08-01',442.66,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.674548','2025-09-05 00:49:52.675554',10,20,44,20,24,2,'1',NULL),(110,'1','MO-MICR-001',7805476,'  ','7805476','2','40532','2024-08-01',250.27,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.695706','2025-09-05 00:49:52.695706',20,21,64,21,24,14,'1',NULL),(111,'1','MO-MICR-002',7805477,'  ','7805477','2','40532','2024-08-01',250.27,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.709503','2025-09-05 00:49:52.709503',20,21,64,21,24,14,'1',NULL),(112,'1','MO-PAPE-001',7805484,'  ','7805484','2','12462- 12530','2024-08-01',26.08,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.723934','2025-09-05 00:49:52.723934',10,23,50,23,24,15,'1',NULL),(113,'1','MO-PAPE-002',780548401,'  ','780548401','2','12462- 12530','2024-08-01',26.08,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.740568','2025-09-05 00:49:52.740568',10,23,50,23,24,15,'1',NULL),(114,'1','MO-PISO-001',7805689,'  ','7805689','2','577','2024-08-01',0.00,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.772391','2025-09-05 00:49:52.772391',21,27,65,27,24,10,'1',NULL),(115,'1','MO-POLT-001',7805660,'  ','7805660','2','5718','2024-08-01',347.52,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.795250','2025-09-05 00:49:52.795250',22,28,53,28,24,21,'1',NULL),(116,'1','MO-POLT-002',7805661,'  ','7805661','2','5718','2024-08-01',347.52,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.809736','2025-09-05 00:49:52.809736',22,28,53,28,24,21,'1',NULL),(117,'1','MO-REFR-001',7805473,'  ','7805473','2','40532','2024-08-01',1163.88,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.845164','2025-09-05 00:49:52.846182',20,24,54,29,24,14,'1',NULL),(118,'1','MO-REFR-002',7805474,'  ','7805474','2','40532','2024-08-01',1163.88,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.857623','2025-09-05 00:49:52.857623',20,24,54,29,24,14,'1',NULL),(119,'1','MO-SILL-166',7805502,'  ','7805502','2','115063','2024-08-01',576.11,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.872505','2025-09-05 00:49:52.872505',10,25,66,25,24,18,'1',NULL),(120,'1','MO-SILL-167',7805503,'  ','7805503','2','115063','2024-08-01',576.11,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.885107','2025-09-05 00:49:52.885107',10,25,66,25,24,18,'1',NULL),(121,'1','MO-SILLA-162',7805663,'  ','7805663','2','5718','2024-08-01',109.97,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-07','2025-09-05 00:49:52.905254','2025-09-05 00:49:52.905254',22,25,67,25,24,24,'1',''),(122,'1','MO-SILLA-163',7805664,'  ','7805664','2','5718','2024-08-01',109.97,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-07','2025-09-05 00:49:52.928081','2025-09-05 00:49:52.928081',22,25,67,25,24,24,'1',''),(123,'1','MO-SILLO-001',7805648,' CUERO COLOR LIGHT GREY ','7805648','2','5718','2024-08-01',1318.36,'2022-01-12',1318.36,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.947566','2025-09-05 00:49:52.947566',22,29,68,28,24,18,'1',''),(124,'1','MO-SILLO-002',7805649,' CUERO COLOR LIGHT GREY ','7805649','2','5718','2024-08-01',1318.36,'2022-01-12',1318.36,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.958518','2025-09-05 00:49:52.958518',22,29,68,28,24,18,'1',''),(125,'1','MO-TABU-001',7805468,'  ','7805468','2','12143','2024-08-01',165.77,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.987834','2025-09-05 00:49:52.987834',10,30,69,30,24,25,'1',''),(126,'1','MO-TABU-002',7805469,'  ','7805469','2','12143','2024-08-01',165.77,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:52.998222','2025-09-05 00:49:52.998222',10,30,69,30,24,25,'1',''),(127,'1','MO-TELE-001',7805401,'  ','7805401','2','1831694','2024-05-07',1373.96,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:53.039246','2025-09-05 00:49:53.039246',6,8,70,31,24,18,'1',NULL),(128,'1','MO-TELE-002',7805402,'  ','7805402','2','1831694','2024-05-07',1373.96,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-05 00:49:53.050222','2025-09-05 00:49:53.050222',6,8,70,31,24,18,'1',NULL);
/*!40000 ALTER TABLE `tablas_activos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablas_fabricantes`
--

DROP TABLE IF EXISTS `tablas_fabricantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablas_fabricantes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_fabricantes`
--

LOCK TABLES `tablas_fabricantes` WRITE;
/*!40000 ALTER TABLE `tablas_fabricantes` DISABLE KEYS */;
INSERT INTO `tablas_fabricantes` VALUES (1,'CISCO'),(2,'EPSON'),(3,'NOKIA'),(4,'APPLE'),(5,'DELL'),(6,'SAMSUNG'),(7,'LEXMARK'),(8,'LG'),(9,'NO NAME'),(10,'EASTON'),(11,'RUBEN TRONCOSO'),(12,'DIGITART'),(13,'VIELCO'),(14,'HL'),(15,'KLEIN & KLEIN'),(16,'DIMUSA'),(17,'EYZAGUIRRE'),(18,'SIN IDENTIFICAR'),(19,'CONTTATO'),(20,'KITCHEN HOUSE'),(21,'WORK KIT'),(22,'INTERGROUPE');
/*!40000 ALTER TABLE `tablas_fabricantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablas_items`
--

DROP TABLE IF EXISTS `tablas_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablas_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_items`
--

LOCK TABLES `tablas_items` WRITE;
/*!40000 ALTER TABLE `tablas_items` DISABLE KEYS */;
INSERT INTO `tablas_items` VALUES (1,'ACCESS-POINT'),(2,'BEAMER'),(3,'CELLPHONES'),(4,'DESKTOP PC'),(5,'MONITOR'),(6,'NOTEBOOK PC'),(7,'PRINTER'),(8,'TV SET'),(9,'VIDEOCONFERENCE'),(10,'CAJA FUERTE'),(11,'CAJONERA'),(12,'CONGELADORA'),(13,'CUADRO'),(14,'ESCRITORIO'),(15,'ESTACION DE TRABAJO'),(16,'GENERADOR'),(17,'HORNO'),(18,'PLANTA'),(19,'MAQUETA'),(20,'MESA'),(21,'MICROONDAS'),(22,'MUEBLE'),(23,'PAPELERO'),(24,'REFRIGERADOR'),(25,'SILLA'),(26,'JARDINERA'),(27,'PISO'),(28,'POLTRONA'),(29,'SILLON'),(30,'BANCA');
/*!40000 ALTER TABLE `tablas_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablas_modelos`
--

DROP TABLE IF EXISTS `tablas_modelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablas_modelos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `fabricante_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tablas_modelos_fabricante_id_f5371202_fk_tablas_fabricantes_id` (`fabricante_id`),
  CONSTRAINT `tablas_modelos_fabricante_id_f5371202_fk_tablas_fabricantes_id` FOREIGN KEY (`fabricante_id`) REFERENCES `tablas_fabricantes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_modelos`
--

LOCK TABLES `tablas_modelos` WRITE;
/*!40000 ALTER TABLE `tablas_modelos` DISABLE KEYS */;
INSERT INTO `tablas_modelos` VALUES (1,'AIR-CAP2702I-A-K9',1),(2,'POWERLITE 98H',2),(3,'C1 - 02',3),(4,'IPHONE 11 BLACK 64GB',4),(5,'IPHONE 13 AZUL MEDIANOCHE 128GB',4),(6,'IPHONE 14 PRO 256GB SPACE BLACK',4),(7,'IPHONE SE',4),(8,'OPTIPLEX 7000',5),(9,'LC24F390FHLXZS',6),(10,'U2412M',5),(11,'LATITUDE 5400',5),(12,'LATITUDE 5411',5),(13,'LATITUDE 5420',5),(14,'LATITUDE 5430',5),(15,'LATITUDE 5440',5),(16,'LATITUDE 5450',5),(17,'LATITUDE 7430',5),(18,'LATITUDE 7490',5),(19,'LATITUDE 9410',5),(20,'LATITUDE 9420',5),(21,'LATITUDE 9450',5),(22,'C792DE',7),(23,'CS725',7),(24,'55UQ7500',8),(25,'UN65TU6900G',6),(26,'CS KIT MINI K9',1),(27,'CAJA FUERTE 120KG',9),(28,'CAJA FUERTE 400KG',9),(29,'CON RUEDAS 1 CAJON Y 1 ARCHIVERO CON CESTO MELAMINA Y TIRADOR',10),(30,'CON RUEDAS 2 CAJONES',11),(31,'CONGELADOR HORIZONTAL 200 LTS',9),(32,'CUADRO METACRILATO 80X60 CM',12),(33,'ESCRITORIO BENCH 4 PERSONAS',NULL),(34,'ESCRITORIO PRIVADO CAJONERA MOVIL',NULL),(35,'QUADRIFOGLIO X3 INCLUYE CAJONERA',10),(36,'MODELO QUADRIFOGLIO LINEA X3 15P',10),(37,'MODELO QUADRIFOGLIO LINEA X3 12P',10),(38,'DIESEL MODELO GS165CLC',13),(39,'HORNO BOSCH 60 CM HOTAIR INOXIDABLE',NULL),(40,'JARDINERA 178 X 16 X 27 H',NULL),(41,'CORCOVADO SHI 9300 TEU',14),(42,'LUDWIGSHAFEN EXPRESS HHI 13200 TEU',14),(43,'MESA CUBIERTA HPL25MAD 1000X1000',NULL),(44,'MESA DE CAPACITACION HP 18 MAD (2C/TC 45) 1500X800',NULL),(45,'MESA LATERAL AVILL BAJA ESTRUCTURA METALICA LACADA',NULL),(46,'TEAMWORK LINEA X3 6P CON PATA TOTEM LATERAL CUBIERTA TRAPEZOIDAL',10),(47,'MESA COMEDOR EJECUTIVO CUBIERTA MADERA NATIVA Y PATAS METALICAS',9),(48,'MICROONDAS TFL TEKA 25 LITROS ML 825',NULL),(49,'MUEBLE APOYO MELAMINA DE 90 CM CON 4 RUEDAS CON FRENO',10),(50,'48 PAPELERO ACERO ELECTROPINTADO CON TROQUEL',NULL),(51,'FICUS LYRATA',15),(52,'FICUS BENJAMINA \"DANIELLE\"',15),(53,'MONET, POLTRONA DE BASE TRINEO CROMADA',NULL),(54,'REFRIGERADOR EMPOTRABLE BOSCH COMBINADO PANELABLE',NULL),(55,'FLEXA SIN APOYA CABEZA RUEDA GOMA',16),(56,'ATTIVA APOYA CABEZA RUEDA GOMA Y BASE DE ALUMINIO',16),(57,'SILLON MADERA REPLICA DE BARCO TAPIZ CUERO',17),(58,'OTAVO TRINEO',16),(59,'FLEXA APOYA CABEZA RUEDA GOMA',16),(60,'CRONO RESPALDO TAPIZ CUERO RUEDA DE GOMA',16),(61,'SILLAS RETAURADAS CUERO CON RUEDAS Y APOYA BRAZOS',18),(62,'JARDINERA  178 X 16 X 27 H',15),(63,'MESA ARKET 70X70 GRIS OSCURO',19),(64,'MICROONDAS TFL TEKA 25 LITROS ML 825 NEGRO',20),(65,'PISO OFICINA DESCANSO',21),(66,'SILLA EJECUTIVA CON RESPALDO - DIRECTORIO',10),(67,'SILLA MARION GRIS CALIDO',22),(68,'SILLON NATUZZI PREMURA CUERO DENVER',22),(69,'TABURETE ELEVABLE CIRCULAR',10),(70,'TV SAMSUNG QLED TV,QN85Q80CAG,85,QWW30/Q85CK2',6);
/*!40000 ALTER TABLE `tablas_modelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablas_nombresactivos`
--

DROP TABLE IF EXISTS `tablas_nombresactivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablas_nombresactivos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_nombresactivos`
--

LOCK TABLES `tablas_nombresactivos` WRITE;
/*!40000 ALTER TABLE `tablas_nombresactivos` DISABLE KEYS */;
INSERT INTO `tablas_nombresactivos` VALUES (1,'ACCESS-POINT'),(2,'BEAMER'),(3,'CELLPHONE'),(4,'DESKTOP PC'),(5,'MONITOR'),(6,'NOTEBOOK PC'),(7,'PRINTER'),(8,'TV SET'),(9,'VIDEOCONFERENCE'),(10,'SAFE BOX'),(11,'DRAWERS'),(12,'FREEZER'),(13,'PHOTO'),(14,'DESK'),(15,'WORKSTATION'),(16,'GENERATOR'),(17,'OVEN'),(18,'PLANT'),(19,'SHIP MODEL'),(20,'TABLE'),(21,'MICROWAVE'),(22,'FURNITURE'),(23,'BASKET'),(24,'FRIDGE'),(25,'CHAIR'),(26,'GARDEN POT'),(27,'CARPET'),(28,'ARMCHAIR'),(29,'FRIGIDAIRE'),(30,'BENCH'),(31,'TVSET');
/*!40000 ALTER TABLE `tablas_nombresactivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablas_usuariosinventario`
--

DROP TABLE IF EXISTS `tablas_usuariosinventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablas_usuariosinventario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_usuariosinventario`
--

LOCK TABLES `tablas_usuariosinventario` WRITE;
/*!40000 ALTER TABLE `tablas_usuariosinventario` DISABLE KEYS */;
INSERT INTO `tablas_usuariosinventario` VALUES (1,'CAROCEL'),(2,'SOLARFA'),(3,'DURANED'),(4,'NOZIGRO'),(5,'SCHOLRN'),(6,'HERREJI'),(7,'FERRASE'),(8,'MUENCMA'),(9,'GARCINY'),(10,'GOMEZDN'),(11,'NAVARSE'),(12,'PEONCL'),(13,'RAMOSKA'),(14,'BURGOJU'),(15,'HURTASE'),(16,'KULKAAN'),(17,'JESSICA ROJAS'),(18,'REBECA JIMENEZ'),(19,'GONZALO OLMEDO'),(20,'BLANCA CORTÉS'),(21,'KATERINA FARIAS'),(22,'COMEDOR'),(23,''),(24,'AARON LOPEZ'),(25,'L4 H. TAMURA'),(26,'L4 SALES'),(27,'L3 R. DIAZ'),(28,'L3'),(29,'SALA REUNION 4P'),(30,'SALA REUNION 6P'),(31,'L2'),(32,'ANA MARÍA HENRIQUEZ'),(33,'SALA 1'),(34,'L4'),(35,'ASISTENTE');
/*!40000 ALTER TABLE `tablas_usuariosinventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablas_zonas`
--

DROP TABLE IF EXISTS `tablas_zonas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablas_zonas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_zonas`
--

LOCK TABLES `tablas_zonas` WRITE;
/*!40000 ALTER TABLE `tablas_zonas` DISABLE KEYS */;
INSERT INTO `tablas_zonas` VALUES (1,'N/A'),(2,'CAFETERIA'),(3,'PACÍFICO'),(4,'LOS ANDES'),(5,'OFICINA DEP LEGAL'),(6,'OFICINA DIRECTOR BA AREA CHILE'),(7,'ASISTENTE'),(8,'OPEN PLAN'),(9,'COCINA'),(10,'OFICINA'),(11,'OPEN PLAN 8 PP'),(12,'OFICINA MD RLA'),(13,'OFICINA MD AREA CHILE'),(14,'ZONA DE SERVICIO'),(15,'PISO 9'),(16,'ACCESO'),(17,'OFICINA DIRECTOR BA'),(18,'SALA DIRECTORIO'),(19,'COMEDOR'),(20,'S.REUNION'),(21,'RECEPCION'),(22,'CAPACITACION'),(23,'SALA PERSONAL DE ASEO'),(24,'MEETING POD 1'),(25,'STAND UP COFEE MEET');
/*!40000 ALTER TABLE `tablas_zonas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_personas`
--

DROP TABLE IF EXISTS `usuarios_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_personas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `nombres` varchar(90) DEFAULT NULL,
  `apellidos` varchar(90) DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  `perfil` varchar(1) NOT NULL,
  `cclave` smallint(5) unsigned NOT NULL CHECK (`cclave` >= 0),
  `token` varchar(64) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `usuarios_personas_usuario_id_d98790c7_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_personas`
--

LOCK TABLES `usuarios_personas` WRITE;
/*!40000 ALTER TABLE `usuarios_personas` DISABLE KEYS */;
INSERT INTO `usuarios_personas` VALUES (1,'administrador','Eduardo','Duran','aconlledo@vilco.cl',NULL,'1','0',0,NULL,1);
/*!40000 ALTER TABLE `usuarios_personas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-04 20:56:09
