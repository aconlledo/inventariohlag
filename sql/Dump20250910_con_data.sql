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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$jlPDgrqUMtoLPSrrkZ0kqo$RuO7xgSdGvQ4yfFBF85dduqil9lIWK+0lkXaMFy/YFY=','2025-09-10 20:31:13.120912',1,'administrador','Eduardo','Duran','aconlledo@vilco.cl',1,1,'2025-08-29 02:40:27.319820');
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
INSERT INTO `django_session` VALUES ('08w2rxy83d4nwmsphrvwowsxk9f034f0','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjgB:PLUh9j1In364PajKaxfeAWbi3AWfmFev-gzZK9PJFtA','2025-09-22 21:45:39.670936'),('0w458qzpsrvxzrl32z5nqiexvmqsc99j','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuMXB:LjtxErH23b0gS7KP61A82Pbm18n06KQAo8uMeBgBu0g','2025-09-19 02:50:41.345445'),('0y99rmj086gdh9g7rbgctyhtf3j6f8en','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uuwvV:KSMYeD4xmklEyL1BcslHTxSn6LzMB1qEiDFAk0V9978','2025-09-20 17:42:13.842189'),('1a1hzazbrugsreroxf85jgjuxaxa8tjw','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw7At:PItGN38qXpQKtgNCIBQZTOVvS7cK5_sSpaRuIXWcd2g','2025-09-23 22:50:55.896360'),('1omryjsulr4jrznkj4ezvravz8ewz1hv','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNys:17UyziuH8CCPe7axzE-RMo_1aqfMqa8GBOx6LkN3Zis','2025-09-19 04:23:22.330431'),('2i4xdxzmt752jti27glim2rxavg43fsi','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuO6j:cpgTD3ml6McQyQfxR4-IJQ8mr1bRu1ALGiG9IT3z_aE','2025-09-19 04:31:29.377747'),('2jz7abl5teht07j0qz5pnizqnjr2ip09','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvixU:oM_w_57wOPvLXweEJmF2G4UGi2ZGpriFgm6mfmfxh7U','2025-09-22 20:59:28.397630'),('2y7uw9b6on3d9ezq6rji5m5p0xh4p8hh','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvj8Y:MM69bDyYL8Uw8b060LsvhVw8uc-a82J-GJ0AW9y258I','2025-09-22 21:10:54.485393'),('30euhgdrotdzsaeruttc2glpkwimqsp2','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNYA:6lXSO9boN7Tn6JpUR1Bk1AIGdpfVwa35bhW9ybhazps','2025-09-19 03:55:46.972770'),('357fv7wsdzojkz6ew5r5t0k72jiafdbz','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNle:_LpGBg9fzzU_IudG93aTKbdNqV1I7iXwbF3R0j7cH8o','2025-09-19 04:09:42.951897'),('38ksy2cx8esjclyi9gw1ntd41fxacicm','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5mn:9YocZKAz1DFUtNULPdgRVTyId1DZsShtvBSvqXf99Ak','2025-09-23 21:21:57.572562'),('4fuz7fown0w829v9lk9rr1mwdm6bvq86','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwQhO:58dgfHLObNXWt6GejFJsUc_TMor4moglLQF7CU46BZg','2025-09-24 19:41:46.290195'),('5pcropxay31r8r0mii6yg3kth1belbmz','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw40f:NRzlZ-h0m-IThcBTeH46smfRV9tAOUqrHCqrtYv8tBo','2025-09-23 19:28:09.874929'),('5pfyy06clxi6ho4tfmngt45otecdjpx1','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjD0:5HqB7gVoqg9TrMqW9Q9dBm5cP8ZBnBBLY-KIBf_5okw','2025-09-22 21:15:30.733654'),('6msdpbm4wbm546qayy11w64cu5f5e1zh','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNmu:fcJIr3n3akpS7xCKy9umvaZ2U8Dc-st7CWzzJuBSuFY','2025-09-19 04:11:00.610904'),('6uwzpux2r17puxj4zer7lktmyer6dqn0','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5UM:hhRLnu6unvi83Ddda2wDwWo5uR-m_PPXDJGCeUvHrAc','2025-09-23 21:02:54.113540'),('7o0f54upuqqjr59coz450v27ram21fzy','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjYH:NDhy1vTsARVBjvAw26R44fD1jWUBbjf9q_SFu4gvXkc','2025-09-22 21:37:29.406726'),('7yebeg4eac9uec4y6ddj1e0ptarq6kuj','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1usW2b:BPwJDmdfo4IJMqUtK8X-x84QDL1PLSbEkuA5jV1dhMI','2025-09-14 00:35:29.488256'),('897gl2zakr1e6ev9qwqyacgvuktsd7qf','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNQa:CbTlCAwE6g_G-PcLNNnIaB8b9Fjj8tJ3ZhxrkyI1xQM','2025-09-19 03:47:56.416913'),('95eb72jof58abs263i7sab75goxlf2bf','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1urpTN:rl2u70RCZCw6GZbe5aXujJk_00FhnlBC_pyj6YW7dp8','2025-09-12 03:08:17.073121'),('aenf9n1h31c57486b269y98ldiau9p4b','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw7C4:u25Pj0FoifduKCB5JFw3ORlRwEyS7LTyXFR9bJ_69QU','2025-09-23 22:52:08.129593'),('akk7aa4x2rj1q12zu8u9sr2wg8jp78ps','.eJxVjDsOwjAQBe_iGln-xR9K-pzB2l0vOIAcKU4qxN0hUgpo38y8l8iwrTVvnZc8FXEWWpx-NwR6cNtBuUO7zZLmti4Tyl2RB-1ynAs_L4f7d1Ch128dvA0Jh2CIEZKySBFJKfIpKjQKcMBirIoa0PriHKWrI6ddYGZPwOL9AeHcOE8:1uuOXY:n2nKqTEtxvSqABtku9NVmKCFaw1pyamNuaDo4zFXGk4','2025-09-19 04:59:12.123054'),('apfr5f755ybttwmo49qv2embhkkbu0id','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5TC:Kfj8nE-V5zcBlv8ZQx_3sgzvfZGOs3se9oMUzLK_P1Y','2025-09-23 21:01:42.684153'),('b7iaiilzr75k1axv41njxo2c6fvevrl9','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1urpHD:umyrc_hWK-xS5PXl1bFRPmA_eLmLPWtaNtZ1CdquFbI','2025-09-12 02:55:43.518573'),('bfoki9e5182vt4rqlkkcx9z3ezvqiowa','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNVq:T6CfX2KKOt7JA1Ybbw7K1zcZgoryWEh7KZhXDefyZGs','2025-09-19 03:53:22.046949'),('cv9go1tb16o0sgwxmdwy74zaf3vefw2v','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1utYj6:y4VEyfqU66fUvgkw4Nbel0-KcQXopMKbUY0iYCi0Q7E','2025-09-16 21:39:40.912523'),('cyyl369gouahgeahow4hcvfovttvl4e1','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNZw:ERudwCKlb5k67hdscgUGuTBElmDt3baRVKqYD-RRTRE','2025-09-19 03:57:36.661057'),('d2kz99c7lzt31d2qqzixt1150l6wozrd','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5Ed:tZselxlF6egmMCS07jERRij8zkufDgjXzRStsYuAAdI','2025-09-23 20:46:39.315859'),('f7uw31zfwz1tdkpzwo8zw6q6xr8ge4rh','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwRTF:pXiCVHArR17rWGjsLsOLjjdTNFHTyFp_b9P8Egkfypc','2025-09-24 20:31:13.127911'),('fexprdn4a1lj1gn4dkctvwz16k73t8v0','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvlFg:hGwabVMCrJ3hk3JBgO2pZ6dEZhCH_k1rYq5-4nxEtOo','2025-09-22 23:26:24.460138'),('ffq49gkumqu9hk60agzbi3wqw81as2jr','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNjl:lc9CYgrrZcvFqZExmI55guY3k1t_eMeBqAU8vG5i3J4','2025-09-19 04:07:45.624996'),('fkm96i5vfr2k0qvz23vi9g7j6lpb4w87','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvj32:ZvShHOeK6QvbLedPgFUkI_hgBKOPXErJlJa9UZac_RY','2025-09-22 21:05:12.180749'),('fr0z5jsgf2630b010l4k477q6c1hsb6p','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuOM2:WRck1Us5FDGImTAeeltw9lljnVu7nM0-GXxmyCa9oFY','2025-09-19 04:47:18.631023'),('fzhdwnnrcjtorr6dn90vxarf8hqodbax','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuO1V:g9_RW9b7uffFLuvgr6p811_P0vCMcbzqvIRg3snx4pA','2025-09-19 04:26:05.385769'),('g2gjctmzd7egufdya5vrjx7vwej00ij6','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvj9V:jaGbI0VYjUgOd1vr86uSxkqAy8vwEcxvve8ULVIx9-c','2025-09-22 21:11:53.623425'),('ghov73f8koz1wtgnsffpzjfuuztx83p3','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuMm5:KVLKo4O0crxsotxV4E9gjJLyjEX_QA9vQZSTq-3UXtc','2025-09-19 03:06:05.084408'),('hihnj5we60romnqg3usu7isx9voy824v','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNQy:MDZ5bjm_Q4FkdyCnZfGmFWsEknQ-Yg1nUPO1zkrHXNs','2025-09-19 03:48:20.301493'),('hvykoq2bdl5edrpuo1s76jtp28ns3r1j','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1utYZ7:e_9VMJCzqKFHgBplWZoIVrtXk2BWn_N2DL0H-z_rK1Q','2025-09-16 21:29:21.304762'),('jguhqf5chs2te71bk7ist2wuja1c6639','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjHy:EPAHagxVt9z_Qh35XHuoRqrbK0Axs7sSu7mkt03peo8','2025-09-22 21:20:38.941981'),('jp129d4uat6wmqi2g6gmnzy95wgq96rq','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNOD:cSJRBLFqvUSzVbYRhByjMd_xCbQg3RUN9ugrBBelDC8','2025-09-19 03:45:29.633606'),('l1pl6jkzppzghnm9zn13budddiuvx6hh','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvikJ:WHIOODuyiQGJjugRU1xB6MAMK4UvKkY9ym_h4j2ZPt8','2025-09-22 20:45:51.189423'),('l52qfclf4poc106dcrx4njvqwvmsbjwf','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw7FI:6Lg9RmfkPOjhDE8p_hyDo4vCm1Wu9ks-zxsFr2GxOrA','2025-09-23 22:55:28.653911'),('lkz5dyo9dx85ajeq0m75t1lo44obogfh','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNRv:pJxVC4yaKn5zNjN7uHbk89V_MSsL3798a6g6X01dC40','2025-09-19 03:49:19.477903'),('nihnukyqiw6jn4wwmg39yvg4hguc7ojb','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1utYHH:xQmovlw0SYqgtcEW1mPRTzCocdsT9ftDu-Eoyyhnbp8','2025-09-16 21:10:55.235411'),('nrgf7l5pbaa1575puwfajjt3g4gwfzvm','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1urpHD:umyrc_hWK-xS5PXl1bFRPmA_eLmLPWtaNtZ1CdquFbI','2025-09-12 02:55:43.593688'),('o75l0xnrdq0e2e3ezaq6i11ytz9r86hg','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw556:N-_F7KpSkudbs6yfnDm0E6J-bEVtw6qP1Ed3ZyBMOhI','2025-09-23 20:36:48.556241'),('oz2r45i2baxgm4iwsiy0demyyriba823','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNc0:B95uYc1Zz4f7-0DImWIyprt4fQFJ77aAQYjG5C7YxLk','2025-09-19 03:59:44.593789'),('pcn1wfxwumiyh1dlzx75ytcbldaujnel','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5iV:DL-y5-9FWgIR9U-oa1gzmHcpUtM2uofzNGsMHhxrd6U','2025-09-23 21:17:31.377376'),('qptdz0z7g0psnsrjrskn050ibzg37ite','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuN6o:g-rC2YKKo0cd1qIxVsv4-VjUnoJ7K-phR8pSD6294Hc','2025-09-19 03:27:30.767257'),('qqsgoum2k5adjbu4fn7gikkjjzhtnyvq','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5bC:GAv1qsfnHFN8gVJsZ0ux7qO6DZbTLkjWRdRdOvQj7qQ','2025-09-23 21:09:58.326758'),('r2gl3mmg99qrmnl04r3oz37eoq2dqr9r','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuMdL:Pp5iBMnHW-rzipxYxcpB5YuU-1Ca2MwOyx8n3zUhoLI','2025-09-19 02:57:03.703250'),('rcqw85mhcp0p6j994m9gbxeruauqd06v','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuKhj:BB6CJDxSlTFb-N_C2Nvs7HY0Ha-lEzSH-3VJLNkMh6I','2025-09-19 00:53:27.220911'),('ruwh7gdf1n1vbfaa6m2i7v5bus3zpkfz','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNqt:cz1aA3v1y5Sr4ZIQHV4FG5eSfKYG4YFaQgw4O3HxFhk','2025-09-19 04:15:07.505035'),('senids7vr2rdci2gzw8n323qzsh04ymz','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw79h:2hJ6SUcQuzA07oxzrhuZtAn5iUuzjGYvEF8tP3Qo4K8','2025-09-23 22:49:41.836924'),('t3y3k7bckfq9zrw8tmwmyb4u9xk1w6xb','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjhg:ii7-V47PU1SDlKhz43xy3m8-sPUkH8LfGimi0d0hTgU','2025-09-22 21:47:12.035355'),('trlo4isgbcwqe5qattw94jhqftad9nsx','.eJxVjDsOwjAQBe_iGln-xR9K-pzB2l0vOIAcKU4qxN0hUgpo38y8l8iwrTVvnZc8FXEWWpx-NwR6cNtBuUO7zZLmti4Tyl2RB-1ynAs_L4f7d1Ch128dvA0Jh2CIEZKySBFJKfIpKjQKcMBirIoa0PriHKWrI6ddYGZPwOL9AeHcOE8:1uuOgE:R7_tbzMhYgLOebsq5XnuzjbtmgHyewhpAlzHkUTPIGo','2025-09-19 05:08:10.598841'),('uy0ufbf4mmd58wdcpf2dm2o6sgq301fk','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1utYTQ:WGFQEBjhsWKm2uC5Seb4Mo7eclvrSG8OD66_2iqMRpY','2025-09-16 21:23:28.513550'),('v39dw4g8r843ablle69qem1kgpe3c6sm','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw7HW:5Lca2GNQGgowtKOc_npTFdNuuj2XNPe7wnkqm3ihDKY','2025-09-23 22:57:46.052602'),('v85u5wimrtm1vvwtj6fkwjda9lhmuz51','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjQY:97jrwzQNUHNY4pxl1vXIvxzQF8pqnqhK5HfY2CNEcmc','2025-09-22 21:29:30.553593'),('v8y75pq5dp29c9lxffowuom9cgeuao9k','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwRG7:j71ot-ei2ZK34-UDfqoyBNiw32rPIAu5_rIXXdAxlqc','2025-09-24 20:17:39.200209'),('vihnagf63zojmlrs984vw35ietgjttdu','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNoH:JllAZWSYM09lgYxSpC2KqE2AdI-1Av3x04L50nADRyk','2025-09-19 04:12:25.855827'),('z9iz5xbemsk0y9hgtayg6oe7ozmdzjd5','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5ef:ytIPUifsmfMqC0mn511mEyurV8Wjttw7LXFKS3ePJKU','2025-09-23 21:13:33.374736');
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
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_activos`
--

LOCK TABLES `tablas_activos` WRITE;
/*!40000 ALTER TABLE `tablas_activos` DISABLE KEYS */;
INSERT INTO `tablas_activos` VALUES (1,'0','IT-AC-001',4,'  ','FCW1844J1NH','1','N/A','2022-01-03',0.00,'2023-01-02',0.00,'0','0','9','0','0','2','2023-09-27','2025-09-09 23:10:32.899033','2025-09-09 23:10:32.899033',1,1,1,1,NULL,1,'1',NULL),(2,'0','IT-AC-002',4,'  ','FCW1916N6J6','1','N/A','2022-01-03',0.00,'2023-01-02',0.00,'0','0','9','0','0','2','2023-09-27','2025-09-09 23:10:32.911524','2025-09-09 23:10:32.912569',1,1,1,1,NULL,1,'1',NULL),(3,'0','IT-BE-001',4,'  ','VTAF710812L','0','N/A','2020-01-06',0.00,'2020-06-11',0.00,'0','0','9','0','0','2','2023-09-27','2025-09-09 23:10:32.948070','2025-09-09 23:10:32.948070',2,2,2,2,NULL,1,'1',NULL),(4,'0','IT-CE-184',4,'  ','359772046289535','0','N/A','2019-09-06',0.00,'2019-09-08',0.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-09 23:10:32.979931','2025-09-09 23:10:32.979931',3,3,3,3,NULL,1,'1',NULL),(5,'0','IT-CE-027',4,'  ','353204309349836','0','N/A','2023-01-06',278.23,'2023-01-08',278.23,'0','0','9','0','0','0','2023-09-27','2025-09-09 23:10:33.017838','2025-09-09 23:10:33.017838',4,3,4,3,1,1,'1',NULL),(6,'0','IT-CE-028',4,'  ','353204309410885','0','N/A','2023-01-06',278.23,'2023-01-08',278.23,'1','1','N/A','1','0','0','2023-09-27','2025-09-09 23:10:33.035330','2025-09-09 23:10:33.035330',4,3,4,3,2,1,'1',NULL),(7,'0','IT-CE-101',4,'  ','351084396388042','0','N/A','2023-01-06',693.64,'2023-01-08',693.64,'1','1','N/A','1','0','0','2023-09-27','2025-09-09 23:10:33.058008','2025-09-09 23:10:33.058008',4,3,5,3,3,1,'1',NULL),(8,'0','IT-CE-102',4,'  ','352094677594282','0','N/A','2023-01-06',693.64,'2023-01-08',693.64,'1','1','N/A','1','0','0','2023-09-27','2025-09-09 23:10:33.074220','2025-09-09 23:10:33.074220',4,3,5,3,4,1,'1',NULL),(9,'0','IT-CE-103',4,'  ','353917851117703','0','N/A','2023-01-06',564.70,'2023-01-08',564.70,'1','1','N/A','1','0','0','2023-09-27','2025-09-09 23:10:33.092821','2025-09-09 23:10:33.092821',4,3,6,3,5,1,'1',NULL),(10,'0','IT-CE-104',4,'  ','357170855010450','0','N/A','2023-01-06',564.70,'2023-01-08',564.70,'1','1','N/A','1','0','0','2023-09-27','2025-09-09 23:10:33.109759','2025-09-09 23:10:33.109759',4,3,6,3,6,1,'1',NULL),(11,'0','IT-CE-002',4,'  ','356740114289045','0','N/A','2021-01-06',0.00,'2021-01-08',0.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-09 23:10:33.128870','2025-09-09 23:10:33.128870',4,3,7,3,7,1,'1',NULL),(12,'0','IT-CE-003',4,'  ','356741114472532','0','N/A','2021-01-06',0.00,'2021-01-08',0.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-09 23:10:33.144847','2025-09-09 23:10:33.144847',4,3,7,3,8,1,'1',NULL),(13,'0','IT-DE-001',4,'  ','BRZV0R3','0','N/A','2022-03-03',1200.00,'2022-08-04',1200.00,'1','1','N/A','1','0','2','2022-08-04','2025-09-09 23:10:33.173067','2025-09-09 23:10:33.173067',5,4,8,4,NULL,1,'1',NULL),(14,'0','IT-DE-002',4,'  ','6RZV0R3','0','N/A','2020-10-08',700.00,'2020-09-12',700.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-09 23:10:33.190502','2025-09-09 23:10:33.190502',5,4,8,4,9,1,'1',NULL),(15,'0','IT-MO-082',4,'  ','0P9RHTQJ900085R','0','N/A','2022-01-06',212.00,'2022-01-08',212.00,'0','0','9','0','0','2','2023-09-27','2025-09-09 23:10:33.212330','2025-09-09 23:10:33.212330',6,5,9,5,NULL,1,'1',NULL),(16,'0','IT-MO-083',4,'  ','0P9RHTQJ900092P','0','N/A','2022-01-06',212.00,'2022-01-08',212.00,'0','0','9','0','0','2','2023-09-27','2025-09-09 23:10:33.224623','2025-09-09 23:10:33.224623',6,5,9,5,NULL,1,'1',NULL),(17,'0','IT-MO-018',4,'  ','CN-0YMYH1-74261-5BQ-1KPL','0','N/A','2022-01-06',212.00,'2022-01-08',212.00,'0','0','9','0','0','2','2023-09-27','2025-09-09 23:10:33.240265','2025-09-09 23:10:33.240265',5,5,10,5,NULL,1,'1',NULL),(18,'0','IT-MO-019',4,'  ','CN-0YMYH1-74261-5BQ-1KTL','0','N/A','2022-01-06',212.00,'2022-01-08',212.00,'0','0','9','0','0','2','2023-09-27','2025-09-09 23:10:33.253053','2025-09-09 23:10:33.253053',5,5,10,5,NULL,1,'1',NULL),(19,'0','IT-NO-001',4,'  ','H97LP13','0','N/A','2020-10-08',1000.00,'2020-09-12',0.00,'0','0','9','0','0','0','2023-09-27','2025-09-09 23:10:33.280567','2025-09-09 23:10:33.280567',5,6,11,6,10,1,'1',NULL),(20,'0','IT-NO-002',4,'  ','4LTNP13','0','N/A','2020-10-08',1000.00,'2020-09-12',0.00,'0','0','9','0','0','1','2023-09-27','2025-09-09 23:10:33.292290','2025-09-09 23:10:33.292290',5,6,11,6,NULL,1,'1',NULL),(21,'0','IT-NO-026',4,'  ','F0SL573','0','N/A','2022-03-03',1200.00,'2022-08-04',0.00,'1','1','N/A','1','0','4','2023-09-27','2025-09-09 23:10:33.308577','2025-09-09 23:10:33.308577',5,6,12,6,NULL,1,'1',NULL),(22,'0','IT-NO-027',4,'  ','CL4T473','0','N/A','2022-03-03',1200.00,'2022-08-04',0.00,'1','1','N/A','1','0','4','2023-09-27','2025-09-09 23:10:33.320767','2025-09-09 23:10:33.320767',5,6,12,6,NULL,1,'1',NULL),(23,'0','IT-NO-052',4,'  ','168H6J3','0','N/A','2022-06-11',1500.00,'2022-06-11',1500.00,'1','1','N/A','1','0','4','2023-09-27','2025-09-09 23:10:33.337164','2025-09-09 23:10:33.337164',5,6,13,6,NULL,1,'1',NULL),(24,'0','IT-NO-312',4,'  ','D7883J3','0','N/A','2022-06-11',1500.00,'2022-06-11',1500.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-09 23:10:33.354895','2025-09-09 23:10:33.354895',5,6,13,6,11,1,'1',NULL),(25,'0','IT-NO-047',4,'  ','DCRQJR3','0','N/A','2022-05-07',1800.00,'2022-12-10',1800.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-09 23:10:33.374168','2025-09-09 23:10:33.374168',5,6,14,6,12,1,'1',NULL),(26,'0','IT-NO-048',4,'  ','9MYHKR3','0','N/A','2022-05-07',1800.00,'2022-12-10',1800.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-09 23:10:33.390276','2025-09-09 23:10:33.390276',5,6,14,6,13,1,'1',NULL),(27,'0','IT-NO-483',4,'  ','1WLSGY3','0','N/A','2022-05-07',1800.00,'2022-12-10',1800.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-09 23:10:33.407341','2025-09-09 23:10:33.407341',5,6,15,6,NULL,1,'1',NULL),(28,'0','IT-NO-407',4,'  ','100C674','0','N/A','2025-03-15',2100.00,'2025-03-15',2100.00,'1','1','N/A','1','0','0','2025-05-29','2025-09-09 23:10:33.428081','2025-09-09 23:10:33.428081',5,6,16,6,14,1,'1',NULL),(29,'0','IT-NO-408',4,'  ','1BCC674','0','N/A','2025-03-15',2100.00,'2025-03-15',2100.00,'1','1','N/A','1','0','3','2025-05-29','2025-09-09 23:10:33.439058','2025-09-09 23:10:33.439058',5,6,16,6,NULL,1,'1',NULL),(30,'0','IT-NO-484',4,'  ','H2CRRV3','0','N/A','2022-05-07',1800.00,'2022-12-10',1800.00,'1','1','N/A','1','0','1','2023-09-27','2025-09-09 23:10:33.453823','2025-09-09 23:10:33.453823',5,6,17,6,NULL,1,'1',NULL),(31,'0','IT-NO-485',4,'  ','40HVPQ2','0','N/A','2020-10-08',1000.00,'2020-09-12',1000.00,'1','1','N/A','1','0','1','2023-09-27','2025-09-09 23:10:33.469597','2025-09-09 23:10:33.469597',5,6,18,6,NULL,1,'1',NULL),(32,'0','IT-NO-491',4,'  ','GCTV593','0','N/A','2022-04-05',2100.00,'2022-12-10',2100.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-09 23:10:33.490212','2025-09-09 23:10:33.490212',5,6,19,6,15,1,'1',NULL),(33,'0','IT-NO-492',4,'  ','4GZ6JR3','0','N/A','2022-05-07',2100.00,'2022-12-10',2100.00,'1','1','N/A','1','0','0','2023-09-27','2025-09-09 23:10:33.508218','2025-09-09 23:10:33.508218',5,6,20,6,3,1,'1',NULL),(34,'0','IT-NO-493',4,'  ','94QZC74','0','N/A','2025-03-15',2500.00,'2025-03-15',2500.00,'1','1','N/A','1','0','0','2025-03-15','2025-09-09 23:10:33.528050','2025-09-09 23:10:33.528050',5,6,21,6,16,1,'1',NULL),(35,'0','IT-PR-001',4,'  ','5062159473V2C','0','N/A','2022-03-03',3500.00,'2021-01-06',3500.00,'0','0','9','0','0','2','2023-09-27','2025-09-09 23:10:33.553443','2025-09-09 23:10:33.553443',7,7,22,7,NULL,1,'1',NULL),(36,'0','IT-PR-002',4,'  ','50280080G4M6N','0','N/A','2022-03-03',2000.00,'2021-01-06',2000.00,'0','0','9','0','0','2','2023-09-27','2025-09-09 23:10:33.569053','2025-09-09 23:10:33.569053',7,7,23,7,NULL,1,'1',NULL),(37,'0','IT-TV-001',4,'  ','0AW53CSN800978W','0','N/A','2023-01-02',300.00,'2024-03-02',300.00,'0','0','9','0','0','2','2023-09-27','2025-09-09 23:10:33.595936','2025-09-09 23:10:33.595936',8,8,24,8,NULL,2,'1',NULL),(38,'0','IT-TV-002',4,'  ','--','0','N/A','2023-01-02',300.00,'2024-03-02',300.00,'0','0','9','0','0','2','2023-09-27','2025-09-09 23:10:33.610627','2025-09-09 23:10:33.610627',6,8,25,8,NULL,2,'1',NULL),(39,'0','IT-VI-001',4,'  ','FOC2420PM9H','1','N/A','2022-01-04',3500.00,'2022-01-12',3500.00,'0','0','9','0','0','2','2023-09-27','2025-09-09 23:10:33.636290','2025-09-09 23:10:33.636290',1,9,26,9,NULL,3,'1',NULL),(40,'0','IT-VI-002',4,'  ','FOC2541N8NK','1','N/A','2022-01-04',3500.00,'2022-01-12',3500.00,'0','0','9','0','0','2','2023-09-27','2025-09-09 23:10:33.651302','2025-09-09 23:10:33.651302',1,9,26,9,NULL,4,'1',NULL),(41,'1','MO-CAJA-001',4,'ALTO 56 CM-ANCHO 59 CM-FONDO 64 CM  ','','2','F/39052','1900-01-01',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-16','2025-09-09 23:10:33.772849','2025-09-09 23:10:33.772849',9,10,27,10,17,5,'1',''),(42,'1','MO-CAJA-002',4,'ALTO 101 CM-ANCHO 50 CM-FONDO 45 CM  ','','2','F/39052','1900-01-01',0.00,'2022-01-12',0.00,'1','1','11','1','0','5','2023-06-16','2025-09-09 23:10:33.817061','2025-09-09 23:10:33.817061',9,10,28,10,17,6,'1',''),(43,'1','MO-CAJO-001',4,'CAJONERA 3 SMT 344 COLOR BLANCO ','','2','F/9635+9942','2019-10-28',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-16','2025-09-09 23:10:33.854920','2025-09-09 23:10:33.854920',10,11,29,11,18,7,'1',''),(44,'1','MO-CAJO-002',4,'CAJONERA 4 0959 CC COLOR BLANCO ','','2','F/9635+9942','2019-10-28',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-16','2025-09-09 23:10:33.877516','2025-09-09 23:10:33.877516',10,11,29,11,19,8,'1',''),(45,'1','MO-CAJO-283',4,'895 COLOR BLANCO ','','2','F/475','2022-05-17',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-16','2025-09-09 23:10:33.906570','2025-09-09 23:10:33.906570',11,11,30,11,20,8,'1',''),(46,'1','MO-CAJO-284',4,'855 COLOR BLANCO ','','2','F/475','2022-05-17',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-16','2025-09-09 23:10:33.925984','2025-09-09 23:10:33.925984',11,11,30,11,21,8,'1',''),(47,'1','MO-CONG-001',4,'OPEN PLAN LEGAL - E. ESTAY PALMS-FOREST-WITH-SKY_TRUCK ','','2','F/1223','2021-06-10',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:33.958536','2025-09-09 23:10:33.958536',9,12,31,12,22,9,'1',''),(48,'1','MO-CUAD-001',4,'OFICINA GERENCIA GENERAL HLAG_IG_6 ','','2','F/5238+5295','2022-07-04',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:33.993438','2025-09-09 23:10:33.993438',12,13,32,13,23,10,'1',''),(49,'1','MO-CUAD-002',4,'OFICINA GERENCIA GENERAL HLAG_IG_44 ','','2','F/5238+5295','2022-07-04',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:34.005548','2025-09-09 23:10:34.005548',12,13,32,13,23,10,'1',''),(50,'1','MO-ESCR-001',4,' COLOR CEMENTO ','7805437','2','12143','2024-08-01',1458.72,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-09 23:10:34.034963','2025-09-09 23:10:34.034963',NULL,14,33,14,24,11,'1',''),(51,'1','MO-ESCR-002',4,'OFICINA 1 SMT 383 COLOR OLMO ','7805438','2','12143','2024-08-01',1458.72,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-09 23:10:34.045502','2025-09-09 23:10:34.045502',NULL,14,33,14,24,11,'1',''),(52,'1','MO-ESCR-010',4,'OFICINA 98 COLOR OLMO ','7805446','2','12143','2024-08-01',952.97,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-09 23:10:34.066361','2025-09-09 23:10:34.066361',NULL,14,34,14,24,12,'1',''),(53,'1','MO-ESCR-011',4,'OFICINA 98 COLOR CEMENTO ','7805447','2','12143','2024-08-01',952.97,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-09 23:10:34.081896','2025-09-09 23:10:34.081896',NULL,14,34,14,24,13,'1',''),(54,'1','MO-ESCR-035',4,'OFICINA COLOR OLMO ','','2','F/1039','2019-10-28',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:34.126659','2025-09-09 23:10:34.126659',10,14,35,14,25,10,'1',''),(55,'1','MO-ESCR-036',4,' COLOR OLMO ','','2','F/1039','2019-10-28',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:34.142525','2025-09-09 23:10:34.142525',10,14,35,14,26,10,'1',''),(56,'1','MO-ESTA-001',4,'CUBIERTA, TAPA, ESTRUCTURA, SEPARADOR CRISTAL Y ALMEJAS. COLOR CEMENTO Y BLANCO ','','2','F/1039','2019-10-28',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-19','2025-09-09 23:10:34.173354','2025-09-09 23:10:34.173354',10,15,36,15,23,8,'1',''),(57,'1','MO-ESTA-002',4,'CUBIERTA, TAPA, ESTRUCTURA, SEPARADOR CRISTAL Y ALMEJAS. COLOR CEMENTO Y BLANCO ','','2','F/1039','2019-10-28',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-19','2025-09-09 23:10:34.190769','2025-09-09 23:10:34.190769',10,15,37,15,23,8,'1',''),(58,'1','MO-GENE-001',4,' COLOR OLMO ','','2','F/39052','2019-08-30',0.00,'2022-01-12',0.00,'1','1','TECHO','1','0','5','2023-06-16','2025-09-09 23:10:34.218658','2025-09-09 23:10:34.218658',13,16,38,16,NULL,1,'1',''),(59,'1','MO-HORN-001',4,'  ','7805475','2','40532','2024-08-01',428.33,'2022-01-12',0.00,'1','1','9','1','0','5','2025-01-08','2025-09-09 23:10:34.240560','2025-09-09 23:10:34.241910',NULL,17,39,17,24,14,'1',''),(60,'1','MO-JARD-001',4,'  ','7805483','2','241','2024-08-01',287.00,'2022-01-12',0.00,'1','1','9','1','0','5','2025-01-08','2025-09-09 23:10:34.264171','2025-09-09 23:10:34.264171',NULL,18,40,18,24,15,'1',''),(61,'1','MO-JARD-002',4,'  ','7805483','2','241','2024-08-01',287.00,'2022-01-12',0.00,'1','1','9','1','0','5','2025-01-08','2025-09-09 23:10:34.274908','2025-09-09 23:10:34.274908',NULL,18,40,18,24,15,'1',''),(62,'1','MO-MAQU-001',4,'ESCALA 1:200  ','','2','','2024-08-01',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:34.302567','2025-09-09 23:10:34.302567',14,19,41,19,23,8,'1',''),(63,'1','MO-MAQU-002',4,'ESCALA 1:200  ','','2','','2024-08-01',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-16','2025-09-09 23:10:34.322441','2025-09-09 23:10:34.322441',14,19,42,19,23,16,'1',''),(64,'1','MO-MESA-002',4,' COLOR OLMO ','7805450','2','12143','2024-08-01',348.96,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-09 23:10:34.343421','2025-09-09 23:10:34.343421',NULL,20,43,20,24,12,'1',''),(65,'1','MO-MESA-003',4,' COLOR OLMO ','7805451','2','12143','2024-08-01',348.96,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-09 23:10:34.357102','2025-09-09 23:10:34.357102',NULL,20,43,20,24,17,'1',''),(66,'1','MO-MESA-009',4,' COLOR OLMO ','7805461','2','12143','2024-08-01',442.66,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-09 23:10:34.370377','2025-09-09 23:10:34.370377',NULL,20,44,20,24,2,'1',''),(67,'1','MO-MESA-010',4,' COLOR OLMO ','7805462','2','12143','2024-08-01',442.66,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-09 23:10:34.379172','2025-09-09 23:10:34.379172',NULL,20,44,20,24,2,'1',''),(68,'1','MO-MESA-019',4,' COLOR BLANCO ','7805654','2','5718','2024-08-01',100.74,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-09 23:10:34.455966','2025-09-09 23:10:34.455966',NULL,20,45,20,24,18,'1',''),(69,'1','MO-MESA-020',4,' COLOR BLANCO ','7805655','2','5718','2024-08-01',100.74,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-09 23:10:34.467144','2025-09-09 23:10:34.467144',NULL,20,45,20,24,18,'1',''),(70,'1','MO-MESA-030',4,' COLOR OLMO ','','2','F/1039','2019-10-28',0.00,'2022-01-12',0.00,'1','1','11','1','0','5','2023-06-16','2025-09-09 23:10:34.519930','2025-09-09 23:10:34.519930',10,20,46,20,27,10,'1',''),(71,'1','MO-MESA-031',4,' COLOR OLMO ','','2','F/1039','2019-10-28',0.00,'2022-01-12',0.00,'1','1','11','1','0','5','2023-06-16','2025-09-09 23:10:34.537736','2025-09-09 23:10:34.537736',10,20,46,20,28,10,'1',''),(72,'1','MO-MESA-037',4,' COLOR OLMO Y PATAS  BLANCAS ','','2','F/1039','2019-10-28',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:34.558666','2025-09-09 23:10:34.558666',9,20,47,20,22,19,'1',''),(73,'1','MO-MESA-038',4,' COLOR OLMO Y PATAS  BLANCAS ','','2','F/1039','2019-10-28',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:34.572701','2025-09-09 23:10:34.572701',9,20,47,20,22,19,'1',''),(74,'1','MO-MICR-001',4,' COLOR NEGRO ','7805476','2','40532','2024-08-01',250.27,'2022-01-12',250.27,'1','1','9','1','0','5','2025-01-08','2025-09-09 23:10:34.594120','2025-09-09 23:10:34.594120',NULL,21,48,21,24,14,'1',''),(75,'1','MO-MICR-002',4,' COLOR NEGRO ','7805477','2','40532','2024-08-01',250.27,'2022-01-12',250.27,'1','1','9','1','0','5','2025-01-08','2025-09-09 23:10:34.605854','2025-09-09 23:10:34.605854',NULL,21,48,21,24,14,'1',''),(76,'1','MO-MUEB-004',4,' COLOR BLANCO ','','2','','2024-08-01',0.00,'2022-01-12',0.00,'1','1','11','1','0','5','2023-06-16','2025-09-09 23:10:34.637569','2025-09-09 23:10:34.637569',10,22,49,22,29,20,'1',''),(77,'1','MO-MUEB-005',4,' COLOR BLANCO ','','2','','2024-08-01',0.00,'2022-01-12',0.00,'1','1','11','1','0','5','2023-06-16','2025-09-09 23:10:34.653570','2025-09-09 23:10:34.653570',10,22,49,22,30,20,'1',''),(78,'1','MO-PAPE-001',4,'  ','7805484','2','12462- 12530','2024-08-01',26.08,'2022-01-12',0.00,'1','1','9','1','0','5','2025-01-07','2025-09-09 23:10:34.685178','2025-09-09 23:10:34.685178',NULL,23,50,23,24,15,'1',''),(79,'1','MO-PAPE-002',4,'  ','7805484','2','12462- 12530','2024-08-01',26.08,'2022-01-12',0.00,'1','1','9','1','0','5','2025-01-07','2025-09-09 23:10:34.697260','2025-09-09 23:10:34.697260',NULL,23,50,23,24,15,'1',''),(80,'1','MO-PLAN-001',4,'MACETERO PIRAMIDE 40 x 70 h AVOID WATERING IT OR FERTILIZING IT. ','','2','F/176-177','2022-11-14',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-07-12','2025-09-09 23:10:34.721859','2025-09-09 23:10:34.721859',15,18,51,18,31,10,'0',''),(81,'1','MO-PLAN-002',4,'PIRAMIDE 40 X 70 h AVOID WATERING IT OR FERTILIZING IT. ','','2','F/176-177','2022-11-14',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-07-12','2025-09-09 23:10:34.740623','2025-09-09 23:10:34.740623',15,18,52,18,32,7,'0',''),(82,'1','MO-POLT-001',4,'  ','7805660','2','5718','2024-08-01',347.52,'2022-01-12',347.52,'1','1','9','1','0','5','2025-01-08','2025-09-09 23:10:34.761224','2025-09-09 23:10:34.761224',NULL,22,53,22,24,21,'1',''),(83,'1','MO-POLT-002',4,'  ','7805661','2','5718','2024-08-01',347.52,'2022-01-12',347.52,'1','1','9','1','0','5','2025-01-08','2025-09-09 23:10:34.772358','2025-09-09 23:10:34.772358',NULL,22,53,22,24,21,'1',''),(84,'1','MO-REFR-001',4,' COLOR GRIS ','7805473','2','40532','2024-08-01',1163.88,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-09 23:10:34.793264','2025-09-09 23:10:34.793264',NULL,24,54,24,24,14,'1',''),(85,'1','MO-REFR-002',4,' COLOR GRIS OSCURO ','7805474','2','40532','2024-08-01',1163.88,'2022-01-12',0.00,'1','1','9','1','0','5','2023-06-16','2025-09-09 23:10:34.807397','2025-09-09 23:10:34.807397',NULL,24,54,24,24,14,'1',''),(86,'1','MO-SILL-001',4,' COLOR ANARANJADO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-16','2025-09-09 23:10:34.842790','2025-09-09 23:10:34.842790',16,25,55,25,33,22,'1',''),(87,'1','MO-SILL-002',4,' COLOR ANARANJADO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','10','1','0','5','2023-06-16','2025-09-09 23:10:34.854353','2025-09-09 23:10:34.854353',16,25,55,25,33,22,'1',''),(88,'1','MO-SILL-371',4,' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','11','1','0','5','2023-06-16','2025-09-09 23:10:34.885766','2025-09-09 23:10:34.885766',16,25,56,25,34,10,'1',''),(89,'1','MO-SILL-372',4,' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','11','1','0','5','2023-06-16','2025-09-09 23:10:34.899117','2025-09-09 23:10:34.899117',16,25,56,25,34,10,'1',''),(90,'1','MO-SILL-404',4,' CUERO COLOR VERDE ','','2','F/844','2021-07-01',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:34.918861','2025-09-09 23:10:34.918861',17,25,57,25,23,19,'1',''),(91,'1','MO-SILL-405',4,' CUERO COLOR VERDE ','','2','F/844','2021-07-01',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:34.934365','2025-09-09 23:10:34.934365',17,25,57,25,23,19,'1',''),(92,'1','MO-SILL-439',4,' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:34.950891','2025-09-09 23:10:34.950891',16,25,58,25,32,7,'1',''),(93,'1','MO-SILL-440',4,' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:34.965103','2025-09-09 23:10:34.965103',16,25,58,25,32,7,'1',''),(94,'1','MO-SILL-441',4,' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:34.984210','2025-09-09 23:10:34.984210',16,25,59,25,32,7,'1',''),(95,'1','MO-SILL-442',4,' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:34.999933','2025-09-09 23:10:34.999933',16,25,59,25,35,7,'1',''),(96,'1','MO-SILL-521',4,' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:35.019018','2025-09-09 23:10:35.019018',16,25,60,25,27,10,'1',''),(97,'1','MO-SILL-522',4,' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:35.033255','2025-09-09 23:10:35.033255',16,25,60,25,27,10,'1',''),(98,'1','MO-SILL-633',4,' COLOR CAFÉ ','','2','','2019-11-18',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:35.051804','2025-09-09 23:10:35.051804',18,25,61,25,23,20,'1',''),(99,'1','MO-SILL-634',4,' COLOR CAFÉ ','','2','','2019-11-18',0.00,'2022-01-12',0.00,'1','1','12','1','0','5','2023-06-16','2025-09-09 23:10:35.065076','2025-09-09 23:10:35.065076',18,25,61,25,23,20,'1',''),(100,'1','MO-ESCR-001',7805437,'  ','7805437','2','12143','2024-08-01',1458.72,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.076152','2025-09-09 23:10:35.076152',10,14,33,14,24,11,'1',NULL),(101,'1','MO-ESCR-002',7805438,'  ','7805438','2','12143','2024-08-01',1458.72,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.089925','2025-09-09 23:10:35.089925',10,14,33,14,24,11,'1',NULL),(102,'1','MO-ESCR-010',7805446,'  ','7805446','2','12143','2024-08-01',952.97,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.103466','2025-09-09 23:10:35.103466',10,14,34,14,24,12,'1',NULL),(103,'1','MO-ESCR-011',7805447,'  ','7805447','2','12143','2024-08-01',952.97,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.118681','2025-09-09 23:10:35.118681',10,14,34,14,24,13,'1',NULL),(104,'1','MO-JARD-001',780548322,'  ','780548322','2','241','2024-08-01',287.00,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.140957','2025-09-09 23:10:35.140957',15,26,62,26,24,15,'1',NULL),(105,'1','MO-JARD-002',780548323,'  ','780548323','2','241','2024-08-01',287.00,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.153524','2025-09-09 23:10:35.153524',15,26,62,26,24,15,'1',NULL),(106,'1','MO-MESA-001',7805436,'  ','7805436','2','117206','2024-08-01',299.68,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.178257','2025-09-09 23:10:35.178257',19,20,63,20,24,23,'1',NULL),(107,'1','MO-MESA-002',7805450,'  ','7805450','2','12143','2024-08-01',348.96,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.191386','2025-09-09 23:10:35.191386',10,20,43,20,24,12,'1',NULL),(108,'1','MO-MESA-009',7805461,'  ','7805461','2','12143','2024-08-01',442.66,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.221292','2025-09-09 23:10:35.221292',10,20,44,20,24,2,'1',NULL),(109,'1','MO-MESA-010',7805462,'  ','7805462','2','12143','2024-08-01',442.66,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.235060','2025-09-09 23:10:35.235060',10,20,44,20,24,2,'1',NULL),(110,'1','MO-MICR-001',7805476,'  ','7805476','2','40532','2024-08-01',250.27,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.255320','2025-09-09 23:10:35.255320',20,21,64,21,24,14,'1',NULL),(111,'1','MO-MICR-002',7805477,'  ','7805477','2','40532','2024-08-01',250.27,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.268651','2025-09-09 23:10:35.268651',20,21,64,21,24,14,'1',NULL),(112,'1','MO-PAPE-001',7805484,'  ','7805484','2','12462- 12530','2024-08-01',26.08,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.282179','2025-09-09 23:10:35.282179',10,23,50,23,24,15,'1',NULL),(113,'1','MO-PAPE-002',780548401,'  ','780548401','2','12462- 12530','2024-08-01',26.08,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.295519','2025-09-09 23:10:35.295519',10,23,50,23,24,15,'1',NULL),(114,'1','MO-PISO-001',7805689,'  ','7805689','2','577','2024-08-01',0.00,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.324316','2025-09-09 23:10:35.324316',21,27,65,27,24,10,'1',NULL),(115,'1','MO-POLT-001',7805660,'  ','7805660','2','5718','2024-08-01',347.52,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.350958','2025-09-09 23:10:35.350958',22,28,53,28,24,21,'1',NULL),(116,'1','MO-POLT-002',7805661,'  ','7805661','2','5718','2024-08-01',347.52,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.364209','2025-09-09 23:10:35.364209',22,28,53,28,24,21,'1',NULL),(117,'1','MO-REFR-001',7805473,'  ','7805473','2','40532','2024-08-01',1163.88,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.381629','2025-09-09 23:10:35.381629',20,24,54,29,24,14,'1',NULL),(118,'1','MO-REFR-002',7805474,'  ','7805474','2','40532','2024-08-01',1163.88,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.393216','2025-09-09 23:10:35.393216',20,24,54,29,24,14,'1',NULL),(119,'1','MO-SILL-166',7805502,'  ','7805502','2','115063','2024-08-01',576.11,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.409322','2025-09-09 23:10:35.409322',10,25,66,25,24,18,'1',NULL),(120,'1','MO-SILL-167',7805503,'  ','7805503','2','115063','2024-08-01',576.11,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.422986','2025-09-09 23:10:35.422986',10,25,66,25,24,18,'1',NULL),(121,'1','MO-SILLA-162',7805663,'  ','7805663','2','5718','2024-08-01',109.97,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-07','2025-09-09 23:10:35.442965','2025-09-09 23:10:35.442965',22,25,67,25,24,24,'1',''),(122,'1','MO-SILLA-163',7805664,'  ','7805664','2','5718','2024-08-01',109.97,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-07','2025-09-09 23:10:35.455939','2025-09-09 23:10:35.455939',22,25,67,25,24,24,'1',''),(123,'1','MO-SILLO-001',7805648,' CUERO COLOR LIGHT GREY ','7805648','2','5718','2024-08-01',1318.36,'2022-01-12',1318.36,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.474699','2025-09-09 23:10:35.474699',22,29,68,28,24,18,'1',''),(124,'1','MO-SILLO-002',7805649,' CUERO COLOR LIGHT GREY ','7805649','2','5718','2024-08-01',1318.36,'2022-01-12',1318.36,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.488595','2025-09-09 23:10:35.488595',22,29,68,28,24,18,'1',''),(125,'1','MO-TABU-001',7805468,'  ','7805468','2','12143','2024-08-01',165.77,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.517675','2025-09-09 23:10:35.517675',10,30,69,30,24,25,'1',''),(126,'1','MO-TABU-002',7805469,'  ','7805469','2','12143','2024-08-01',165.77,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.535172','2025-09-09 23:10:35.535172',10,30,69,30,24,25,'1',''),(127,'1','MO-TELE-001',7805401,'  ','7805401','2','1831694','2024-05-07',1373.96,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.558699','2025-09-09 23:10:35.558699',6,8,70,31,24,18,'1',NULL),(128,'1','MO-TELE-002',7805402,'  ','7805402','2','1831694','2024-05-07',1373.96,'2022-01-12',0.00,'0','0','9','0','0','5','2025-01-08','2025-09-09 23:10:35.572117','2025-09-09 23:10:35.572117',6,8,70,31,24,18,'1',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_fabricantes`
--

LOCK TABLES `tablas_fabricantes` WRITE;
/*!40000 ALTER TABLE `tablas_fabricantes` DISABLE KEYS */;
INSERT INTO `tablas_fabricantes` VALUES (1,'CISCO'),(2,'EPSON'),(3,'NOKIA'),(4,'APPLE'),(5,'DELL'),(6,'SAMSUNG'),(7,'LEXMARK'),(8,'LG'),(9,'NO NAME'),(10,'EASTON'),(11,'RUBEN TRONCOSO'),(12,'DIGITART'),(13,'VIELCO'),(14,'HL'),(15,'KLEIN & KLEIN'),(16,'DIMUSA'),(17,'EYZAGUIRRE'),(18,'SIN IDENTIFICAR'),(19,'CONTTATO'),(20,'KITCHEN HOUSE'),(21,'WORK KIT'),(22,'INTERGROUPE'),(23,'BOSCH');
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
INSERT INTO `tablas_modelos` VALUES (1,'AIR-CAP2702I-A-K9',1),(2,'POWERLITE 98H',2),(3,'C1 - 02',3),(4,'IPHONE 11 BLACK 64GB',4),(5,'IPHONE 13 AZUL MEDIANOCHE 128GB',4),(6,'IPHONE 14 PRO 256GB SPACE BLACK',4),(7,'IPHONE SE',4),(8,'OPTIPLEX 7000',5),(9,'LC24F390FHLXZS',6),(10,'U2412M',5),(11,'LATITUDE 5400',5),(12,'LATITUDE 5411',5),(13,'LATITUDE 5420',5),(14,'LATITUDE 5430',5),(15,'LATITUDE 5440',5),(16,'LATITUDE 5450',5),(17,'LATITUDE 7430',5),(18,'LATITUDE 7490',5),(19,'LATITUDE 9410',5),(20,'LATITUDE 9420',5),(21,'LATITUDE 9450',5),(22,'C792DE',7),(23,'CS725',7),(24,'55UQ7500',8),(25,'UN65TU6900G',6),(26,'CS KIT MINI K9',1),(27,'CAJA FUERTE 120KG',9),(28,'CAJA FUERTE 400KG',9),(29,'CON RUEDAS 1 CAJON Y 1 ARCHIVERO CON CESTO MELAMINA Y TIRADOR',10),(30,'CON RUEDAS 2 CAJONES',11),(31,'CONGELADOR HORIZONTAL 200 LTS',9),(32,'CUADRO METACRILATO 80X60 CM',12),(33,'ESCRITORIO BENCH 4 PERSONAS',NULL),(34,'ESCRITORIO PRIVADO CAJONERA MOVIL',NULL),(35,'QUADRIFOGLIO X3 INCLUYE CAJONERA',10),(36,'MODELO QUADRIFOGLIO LINEA X3 15P',10),(37,'MODELO QUADRIFOGLIO LINEA X3 12P',10),(38,'DIESEL MODELO GS165CLC',13),(39,'HORNO BOSCH 60 CM HOTAIR INOXIDABLE',NULL),(40,'JARDINERA 178 X 16 X 27 H',NULL),(41,'CORCOVADO SHI 9300 TEU',14),(42,'LUDWIGSHAFEN EXPRESS HHI 13200 TEU',14),(43,'MESA CUBIERTA HPL25MAD 1000X1000',NULL),(44,'MESA DE CAPACITACION HP 18 MAD (2C/TC 45) 1500X800',NULL),(45,'MESA LATERAL AVILL BAJA ESTRUCTURA METALICA LACADA',NULL),(46,'TEAMWORK LINEA X3 6P CON PATA TOTEM LATERAL CUBIERTA TRAPEZOIDAL',10),(47,'MESA COMEDOR EJECUTIVO CUBIERTA MADERA NATIVA Y PATAS METALICAS',9),(48,'MICROONDAS TFL TEKA 25 LITROS ML 825',NULL),(49,'MUEBLE APOYO MELAMINA DE 90 CM CON 4 RUEDAS CON FRENO',10),(50,'48 PAPELERO ACERO ELECTROPINTADO CON TROQUEL',NULL),(51,'FICUS LYRATA',15),(52,'FICUS BENJAMINA \"DANIELLE\"',15),(53,'MONET, POLTRONA DE BASE TRINEO CROMADA',NULL),(54,'REFRIGERADOR EMPOTRABLE BOSCH COMBINADO PANELABLE',23),(55,'FLEXA SIN APOYA CABEZA RUEDA GOMA',16),(56,'ATTIVA APOYA CABEZA RUEDA GOMA Y BASE DE ALUMINIO',16),(57,'SILLON MADERA REPLICA DE BARCO TAPIZ CUERO',17),(58,'OTAVO TRINEO',16),(59,'FLEXA APOYA CABEZA RUEDA GOMA',16),(60,'CRONO RESPALDO TAPIZ CUERO RUEDA DE GOMA',16),(61,'SILLAS RETAURADAS CUERO CON RUEDAS Y APOYA BRAZOS',18),(62,'JARDINERA  178 X 16 X 27 H',15),(63,'MESA ARKET 70X70 GRIS OSCURO',19),(64,'MICROONDAS TFL TEKA 25 LITROS ML 825 NEGRO',20),(65,'PISO OFICINA DESCANSO',21),(66,'SILLA EJECUTIVA CON RESPALDO - DIRECTORIO',10),(67,'SILLA MARION GRIS CALIDO',22),(68,'SILLON NATUZZI PREMURA CUERO DENVER',22),(69,'TABURETE ELEVABLE CIRCULAR',10),(70,'TV SAMSUNG QLED TV,QN85Q80CAG,85,QWW30/Q85CK2',6);
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

-- Dump completed on 2025-09-10 17:49:36
