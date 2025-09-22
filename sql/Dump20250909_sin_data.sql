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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$RVg2iH3j7U65ahDxfyR6DV$RTSPlEIMq5ApRADbqk0Bbkdvt4o0gp86rbhWERfJlV8=','2025-09-09 22:57:46.046624',1,'administrador','Eduardo','Duran','aconlledo@vilco.cl',1,1,'2025-08-29 02:40:27.319820');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-08-27 23:28:23.289094'),(2,'auth','0001_initial','2025-08-27 23:28:26.019168'),(3,'admin','0001_initial','2025-08-27 23:28:26.582231'),(4,'admin','0002_logentry_remove_auto_add','2025-08-27 23:28:26.607991'),(5,'admin','0003_logentry_add_action_flag_choices','2025-08-27 23:28:26.638260'),(6,'contenttypes','0002_remove_content_type_name','2025-08-27 23:28:27.088577'),(7,'auth','0002_alter_permission_name_max_length','2025-08-27 23:28:27.299061'),(8,'auth','0003_alter_user_email_max_length','2025-08-27 23:28:27.479149'),(9,'auth','0004_alter_user_username_opts','2025-08-27 23:28:27.502332'),(10,'auth','0005_alter_user_last_login_null','2025-08-27 23:28:27.742234'),(11,'auth','0006_require_contenttypes_0002','2025-08-27 23:28:27.755664'),(12,'auth','0007_alter_validators_add_error_messages','2025-08-27 23:28:27.780666'),(13,'auth','0008_alter_user_username_max_length','2025-08-27 23:28:27.938556'),(14,'auth','0009_alter_user_last_name_max_length','2025-08-27 23:28:28.132579'),(15,'auth','0010_alter_group_name_max_length','2025-08-27 23:28:28.296729'),(16,'auth','0011_update_proxy_permissions','2025-08-27 23:28:28.340182'),(17,'auth','0012_alter_user_first_name_max_length','2025-08-27 23:28:28.491615'),(18,'sessions','0001_initial','2025-08-27 23:28:28.738231'),(19,'tablas','0001_initial','2025-08-27 23:29:12.975605'),(20,'usuarios','0001_initial','2025-08-29 02:44:44.429425'),(21,'tablas','0002_alter_activos_options_activos_accounted_and_more','2025-09-02 23:56:54.469012'),(22,'tablas','0003_alter_activos_options','2025-09-02 23:56:54.477364'),(23,'tablas','0004_alter_activos_fcompra_alter_activos_festado','2025-09-03 00:00:29.680961'),(24,'tablas','0005_alter_modelos_nombre','2025-09-03 00:36:57.186686'),(25,'tablas','0006_alter_modelos_fabricante','2025-09-06 17:41:43.662339'),(26,'tablas','0007_alter_activos_building_alter_activos_city_and_more','2025-09-06 17:41:43.694085'),(27,'tablas','0008_remove_modelos_fabricante_alter_activos_fcompra_and_more','2025-09-06 17:41:44.144098'),(28,'tablas','0009_modelos_fabricante','2025-09-06 17:41:44.231854'),(29,'tablas','0010_alter_modelos_options','2025-09-06 17:41:44.242119'),(30,'tablas','0011_alter_activos_accounted','2025-09-08 23:25:49.550956');
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
INSERT INTO `django_session` VALUES ('08w2rxy83d4nwmsphrvwowsxk9f034f0','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjgB:PLUh9j1In364PajKaxfeAWbi3AWfmFev-gzZK9PJFtA','2025-09-22 21:45:39.670936'),('0w458qzpsrvxzrl32z5nqiexvmqsc99j','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuMXB:LjtxErH23b0gS7KP61A82Pbm18n06KQAo8uMeBgBu0g','2025-09-19 02:50:41.345445'),('0y99rmj086gdh9g7rbgctyhtf3j6f8en','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uuwvV:KSMYeD4xmklEyL1BcslHTxSn6LzMB1qEiDFAk0V9978','2025-09-20 17:42:13.842189'),('1a1hzazbrugsreroxf85jgjuxaxa8tjw','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw7At:PItGN38qXpQKtgNCIBQZTOVvS7cK5_sSpaRuIXWcd2g','2025-09-23 22:50:55.896360'),('1omryjsulr4jrznkj4ezvravz8ewz1hv','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNys:17UyziuH8CCPe7axzE-RMo_1aqfMqa8GBOx6LkN3Zis','2025-09-19 04:23:22.330431'),('2i4xdxzmt752jti27glim2rxavg43fsi','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuO6j:cpgTD3ml6McQyQfxR4-IJQ8mr1bRu1ALGiG9IT3z_aE','2025-09-19 04:31:29.377747'),('2jz7abl5teht07j0qz5pnizqnjr2ip09','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvixU:oM_w_57wOPvLXweEJmF2G4UGi2ZGpriFgm6mfmfxh7U','2025-09-22 20:59:28.397630'),('2y7uw9b6on3d9ezq6rji5m5p0xh4p8hh','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvj8Y:MM69bDyYL8Uw8b060LsvhVw8uc-a82J-GJ0AW9y258I','2025-09-22 21:10:54.485393'),('30euhgdrotdzsaeruttc2glpkwimqsp2','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNYA:6lXSO9boN7Tn6JpUR1Bk1AIGdpfVwa35bhW9ybhazps','2025-09-19 03:55:46.972770'),('357fv7wsdzojkz6ew5r5t0k72jiafdbz','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNle:_LpGBg9fzzU_IudG93aTKbdNqV1I7iXwbF3R0j7cH8o','2025-09-19 04:09:42.951897'),('38ksy2cx8esjclyi9gw1ntd41fxacicm','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5mn:9YocZKAz1DFUtNULPdgRVTyId1DZsShtvBSvqXf99Ak','2025-09-23 21:21:57.572562'),('5pcropxay31r8r0mii6yg3kth1belbmz','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw40f:NRzlZ-h0m-IThcBTeH46smfRV9tAOUqrHCqrtYv8tBo','2025-09-23 19:28:09.874929'),('5pfyy06clxi6ho4tfmngt45otecdjpx1','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjD0:5HqB7gVoqg9TrMqW9Q9dBm5cP8ZBnBBLY-KIBf_5okw','2025-09-22 21:15:30.733654'),('6msdpbm4wbm546qayy11w64cu5f5e1zh','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNmu:fcJIr3n3akpS7xCKy9umvaZ2U8Dc-st7CWzzJuBSuFY','2025-09-19 04:11:00.610904'),('6uwzpux2r17puxj4zer7lktmyer6dqn0','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5UM:hhRLnu6unvi83Ddda2wDwWo5uR-m_PPXDJGCeUvHrAc','2025-09-23 21:02:54.113540'),('7o0f54upuqqjr59coz450v27ram21fzy','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjYH:NDhy1vTsARVBjvAw26R44fD1jWUBbjf9q_SFu4gvXkc','2025-09-22 21:37:29.406726'),('7yebeg4eac9uec4y6ddj1e0ptarq6kuj','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1usW2b:BPwJDmdfo4IJMqUtK8X-x84QDL1PLSbEkuA5jV1dhMI','2025-09-14 00:35:29.488256'),('897gl2zakr1e6ev9qwqyacgvuktsd7qf','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNQa:CbTlCAwE6g_G-PcLNNnIaB8b9Fjj8tJ3ZhxrkyI1xQM','2025-09-19 03:47:56.416913'),('95eb72jof58abs263i7sab75goxlf2bf','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1urpTN:rl2u70RCZCw6GZbe5aXujJk_00FhnlBC_pyj6YW7dp8','2025-09-12 03:08:17.073121'),('aenf9n1h31c57486b269y98ldiau9p4b','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw7C4:u25Pj0FoifduKCB5JFw3ORlRwEyS7LTyXFR9bJ_69QU','2025-09-23 22:52:08.129593'),('akk7aa4x2rj1q12zu8u9sr2wg8jp78ps','.eJxVjDsOwjAQBe_iGln-xR9K-pzB2l0vOIAcKU4qxN0hUgpo38y8l8iwrTVvnZc8FXEWWpx-NwR6cNtBuUO7zZLmti4Tyl2RB-1ynAs_L4f7d1Ch128dvA0Jh2CIEZKySBFJKfIpKjQKcMBirIoa0PriHKWrI6ddYGZPwOL9AeHcOE8:1uuOXY:n2nKqTEtxvSqABtku9NVmKCFaw1pyamNuaDo4zFXGk4','2025-09-19 04:59:12.123054'),('apfr5f755ybttwmo49qv2embhkkbu0id','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5TC:Kfj8nE-V5zcBlv8ZQx_3sgzvfZGOs3se9oMUzLK_P1Y','2025-09-23 21:01:42.684153'),('b7iaiilzr75k1axv41njxo2c6fvevrl9','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1urpHD:umyrc_hWK-xS5PXl1bFRPmA_eLmLPWtaNtZ1CdquFbI','2025-09-12 02:55:43.518573'),('bfoki9e5182vt4rqlkkcx9z3ezvqiowa','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNVq:T6CfX2KKOt7JA1Ybbw7K1zcZgoryWEh7KZhXDefyZGs','2025-09-19 03:53:22.046949'),('cv9go1tb16o0sgwxmdwy74zaf3vefw2v','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1utYj6:y4VEyfqU66fUvgkw4Nbel0-KcQXopMKbUY0iYCi0Q7E','2025-09-16 21:39:40.912523'),('cyyl369gouahgeahow4hcvfovttvl4e1','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNZw:ERudwCKlb5k67hdscgUGuTBElmDt3baRVKqYD-RRTRE','2025-09-19 03:57:36.661057'),('d2kz99c7lzt31d2qqzixt1150l6wozrd','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5Ed:tZselxlF6egmMCS07jERRij8zkufDgjXzRStsYuAAdI','2025-09-23 20:46:39.315859'),('fexprdn4a1lj1gn4dkctvwz16k73t8v0','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvlFg:hGwabVMCrJ3hk3JBgO2pZ6dEZhCH_k1rYq5-4nxEtOo','2025-09-22 23:26:24.460138'),('ffq49gkumqu9hk60agzbi3wqw81as2jr','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNjl:lc9CYgrrZcvFqZExmI55guY3k1t_eMeBqAU8vG5i3J4','2025-09-19 04:07:45.624996'),('fkm96i5vfr2k0qvz23vi9g7j6lpb4w87','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvj32:ZvShHOeK6QvbLedPgFUkI_hgBKOPXErJlJa9UZac_RY','2025-09-22 21:05:12.180749'),('fr0z5jsgf2630b010l4k477q6c1hsb6p','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuOM2:WRck1Us5FDGImTAeeltw9lljnVu7nM0-GXxmyCa9oFY','2025-09-19 04:47:18.631023'),('fzhdwnnrcjtorr6dn90vxarf8hqodbax','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuO1V:g9_RW9b7uffFLuvgr6p811_P0vCMcbzqvIRg3snx4pA','2025-09-19 04:26:05.385769'),('g2gjctmzd7egufdya5vrjx7vwej00ij6','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvj9V:jaGbI0VYjUgOd1vr86uSxkqAy8vwEcxvve8ULVIx9-c','2025-09-22 21:11:53.623425'),('ghov73f8koz1wtgnsffpzjfuuztx83p3','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuMm5:KVLKo4O0crxsotxV4E9gjJLyjEX_QA9vQZSTq-3UXtc','2025-09-19 03:06:05.084408'),('hihnj5we60romnqg3usu7isx9voy824v','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNQy:MDZ5bjm_Q4FkdyCnZfGmFWsEknQ-Yg1nUPO1zkrHXNs','2025-09-19 03:48:20.301493'),('hvykoq2bdl5edrpuo1s76jtp28ns3r1j','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1utYZ7:e_9VMJCzqKFHgBplWZoIVrtXk2BWn_N2DL0H-z_rK1Q','2025-09-16 21:29:21.304762'),('jguhqf5chs2te71bk7ist2wuja1c6639','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjHy:EPAHagxVt9z_Qh35XHuoRqrbK0Axs7sSu7mkt03peo8','2025-09-22 21:20:38.941981'),('jp129d4uat6wmqi2g6gmnzy95wgq96rq','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNOD:cSJRBLFqvUSzVbYRhByjMd_xCbQg3RUN9ugrBBelDC8','2025-09-19 03:45:29.633606'),('l1pl6jkzppzghnm9zn13budddiuvx6hh','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvikJ:WHIOODuyiQGJjugRU1xB6MAMK4UvKkY9ym_h4j2ZPt8','2025-09-22 20:45:51.189423'),('l52qfclf4poc106dcrx4njvqwvmsbjwf','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw7FI:6Lg9RmfkPOjhDE8p_hyDo4vCm1Wu9ks-zxsFr2GxOrA','2025-09-23 22:55:28.653911'),('lkz5dyo9dx85ajeq0m75t1lo44obogfh','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNRv:pJxVC4yaKn5zNjN7uHbk89V_MSsL3798a6g6X01dC40','2025-09-19 03:49:19.477903'),('nihnukyqiw6jn4wwmg39yvg4hguc7ojb','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1utYHH:xQmovlw0SYqgtcEW1mPRTzCocdsT9ftDu-Eoyyhnbp8','2025-09-16 21:10:55.235411'),('nrgf7l5pbaa1575puwfajjt3g4gwfzvm','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1urpHD:umyrc_hWK-xS5PXl1bFRPmA_eLmLPWtaNtZ1CdquFbI','2025-09-12 02:55:43.593688'),('o75l0xnrdq0e2e3ezaq6i11ytz9r86hg','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw556:N-_F7KpSkudbs6yfnDm0E6J-bEVtw6qP1Ed3ZyBMOhI','2025-09-23 20:36:48.556241'),('oz2r45i2baxgm4iwsiy0demyyriba823','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNc0:B95uYc1Zz4f7-0DImWIyprt4fQFJ77aAQYjG5C7YxLk','2025-09-19 03:59:44.593789'),('pcn1wfxwumiyh1dlzx75ytcbldaujnel','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5iV:DL-y5-9FWgIR9U-oa1gzmHcpUtM2uofzNGsMHhxrd6U','2025-09-23 21:17:31.377376'),('qptdz0z7g0psnsrjrskn050ibzg37ite','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuN6o:g-rC2YKKo0cd1qIxVsv4-VjUnoJ7K-phR8pSD6294Hc','2025-09-19 03:27:30.767257'),('qqsgoum2k5adjbu4fn7gikkjjzhtnyvq','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5bC:GAv1qsfnHFN8gVJsZ0ux7qO6DZbTLkjWRdRdOvQj7qQ','2025-09-23 21:09:58.326758'),('r2gl3mmg99qrmnl04r3oz37eoq2dqr9r','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuMdL:Pp5iBMnHW-rzipxYxcpB5YuU-1Ca2MwOyx8n3zUhoLI','2025-09-19 02:57:03.703250'),('rcqw85mhcp0p6j994m9gbxeruauqd06v','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuKhj:BB6CJDxSlTFb-N_C2Nvs7HY0Ha-lEzSH-3VJLNkMh6I','2025-09-19 00:53:27.220911'),('ruwh7gdf1n1vbfaa6m2i7v5bus3zpkfz','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNqt:cz1aA3v1y5Sr4ZIQHV4FG5eSfKYG4YFaQgw4O3HxFhk','2025-09-19 04:15:07.505035'),('senids7vr2rdci2gzw8n323qzsh04ymz','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw79h:2hJ6SUcQuzA07oxzrhuZtAn5iUuzjGYvEF8tP3Qo4K8','2025-09-23 22:49:41.836924'),('t3y3k7bckfq9zrw8tmwmyb4u9xk1w6xb','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjhg:ii7-V47PU1SDlKhz43xy3m8-sPUkH8LfGimi0d0hTgU','2025-09-22 21:47:12.035355'),('trlo4isgbcwqe5qattw94jhqftad9nsx','.eJxVjDsOwjAQBe_iGln-xR9K-pzB2l0vOIAcKU4qxN0hUgpo38y8l8iwrTVvnZc8FXEWWpx-NwR6cNtBuUO7zZLmti4Tyl2RB-1ynAs_L4f7d1Ch128dvA0Jh2CIEZKySBFJKfIpKjQKcMBirIoa0PriHKWrI6ddYGZPwOL9AeHcOE8:1uuOgE:R7_tbzMhYgLOebsq5XnuzjbtmgHyewhpAlzHkUTPIGo','2025-09-19 05:08:10.598841'),('uy0ufbf4mmd58wdcpf2dm2o6sgq301fk','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1utYTQ:WGFQEBjhsWKm2uC5Seb4Mo7eclvrSG8OD66_2iqMRpY','2025-09-16 21:23:28.513550'),('v39dw4g8r843ablle69qem1kgpe3c6sm','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw7HW:5Lca2GNQGgowtKOc_npTFdNuuj2XNPe7wnkqm3ihDKY','2025-09-23 22:57:46.052602'),('v85u5wimrtm1vvwtj6fkwjda9lhmuz51','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjQY:97jrwzQNUHNY4pxl1vXIvxzQF8pqnqhK5HfY2CNEcmc','2025-09-22 21:29:30.553593'),('vihnagf63zojmlrs984vw35ietgjttdu','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNoH:JllAZWSYM09lgYxSpC2KqE2AdI-1Av3x04L50nADRyk','2025-09-19 04:12:25.855827'),('z9iz5xbemsk0y9hgtayg6oe7ozmdzjd5','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5ef:ytIPUifsmfMqC0mn511mEyurV8Wjttw7LXFKS3ePJKU','2025-09-23 21:13:33.374736');
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
  `fcompra` date DEFAULT NULL,
  `vcompra` decimal(10,2) DEFAULT NULL,
  `factivacion` date DEFAULT NULL,
  `vactual` decimal(10,2) DEFAULT NULL,
  `location` varchar(1) NOT NULL,
  `building` varchar(1) NOT NULL,
  `floor` varchar(15) DEFAULT NULL,
  `city` varchar(1) NOT NULL,
  `country` varchar(1) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `festado` date DEFAULT NULL,
  `fingreso` datetime(6) NOT NULL,
  `fmodifica` datetime(6) NOT NULL,
  `fabricante_id` bigint(20) DEFAULT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  `modelo_id` bigint(20) DEFAULT NULL,
  `nombre_id` bigint(20) DEFAULT NULL,
  `usuarioinv_id` bigint(20) DEFAULT NULL,
  `zona_id` bigint(20) DEFAULT NULL,
  `accounted` varchar(1) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_activos`
--

LOCK TABLES `tablas_activos` WRITE;
/*!40000 ALTER TABLE `tablas_activos` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_fabricantes`
--

LOCK TABLES `tablas_fabricantes` WRITE;
/*!40000 ALTER TABLE `tablas_fabricantes` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_items`
--

LOCK TABLES `tablas_items` WRITE;
/*!40000 ALTER TABLE `tablas_items` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_modelos`
--

LOCK TABLES `tablas_modelos` WRITE;
/*!40000 ALTER TABLE `tablas_modelos` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_nombresactivos`
--

LOCK TABLES `tablas_nombresactivos` WRITE;
/*!40000 ALTER TABLE `tablas_nombresactivos` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_usuariosinventario`
--

LOCK TABLES `tablas_usuariosinventario` WRITE;
/*!40000 ALTER TABLE `tablas_usuariosinventario` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_zonas`
--

LOCK TABLES `tablas_zonas` WRITE;
/*!40000 ALTER TABLE `tablas_zonas` DISABLE KEYS */;
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
INSERT INTO `usuarios_personas` VALUES (1,'administrador','Eduardo','Duran','aconlledo@vilco.cl',NULL,'1','0',0,'',1);
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

-- Dump completed on 2025-09-09 20:05:35
