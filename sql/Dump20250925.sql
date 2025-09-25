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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add usuarios inventario',7,'add_usuariosinventario'),(26,'Can change usuarios inventario',7,'change_usuariosinventario'),(27,'Can delete usuarios inventario',7,'delete_usuariosinventario'),(28,'Can view usuarios inventario',7,'view_usuariosinventario'),(29,'Can add modelos',8,'add_modelos'),(30,'Can change modelos',8,'change_modelos'),(31,'Can delete modelos',8,'delete_modelos'),(32,'Can view modelos',8,'view_modelos'),(33,'Can add nombres activos',9,'add_nombresactivos'),(34,'Can change nombres activos',9,'change_nombresactivos'),(35,'Can delete nombres activos',9,'delete_nombresactivos'),(36,'Can view nombres activos',9,'view_nombresactivos'),(37,'Can add items activos',10,'add_itemsactivos'),(38,'Can change items activos',10,'change_itemsactivos'),(39,'Can delete items activos',10,'delete_itemsactivos'),(40,'Can view items activos',10,'view_itemsactivos'),(41,'Can add fabricantes',11,'add_fabricantes'),(42,'Can change fabricantes',11,'change_fabricantes'),(43,'Can delete fabricantes',11,'delete_fabricantes'),(44,'Can view fabricantes',11,'view_fabricantes'),(45,'Can add activos',12,'add_activos'),(46,'Can change activos',12,'change_activos'),(47,'Can delete activos',12,'delete_activos'),(48,'Can view activos',12,'view_activos'),(49,'Can add zonas',13,'add_zonas'),(50,'Can change zonas',13,'change_zonas'),(51,'Can delete zonas',13,'delete_zonas'),(52,'Can view zonas',13,'view_zonas'),(53,'Can add usuarios personas',14,'add_usuariospersonas'),(54,'Can change usuarios personas',14,'change_usuariospersonas'),(55,'Can delete usuarios personas',14,'delete_usuariospersonas'),(56,'Can view usuarios personas',14,'view_usuariospersonas'),(57,'Can add proveedores',15,'add_proveedores'),(58,'Can change proveedores',15,'change_proveedores'),(59,'Can delete proveedores',15,'delete_proveedores'),(60,'Can view proveedores',15,'view_proveedores'),(61,'Can add ciudades',16,'add_ciudades'),(62,'Can change ciudades',16,'change_ciudades'),(63,'Can delete ciudades',16,'delete_ciudades'),(64,'Can view ciudades',16,'view_ciudades'),(65,'Can add paises',17,'add_paises'),(66,'Can change paises',17,'change_paises'),(67,'Can delete paises',17,'delete_paises'),(68,'Can view paises',17,'view_paises'),(69,'Can add edificios',18,'add_edificios'),(70,'Can change edificios',18,'change_edificios'),(71,'Can delete edificios',18,'delete_edificios'),(72,'Can view edificios',18,'view_edificios'),(73,'Can add activos',19,'add_activos'),(74,'Can change activos',19,'change_activos'),(75,'Can delete activos',19,'delete_activos'),(76,'Can view activos',19,'view_activos'),(77,'Can add admin paises',20,'add_adminpaises'),(78,'Can change admin paises',20,'change_adminpaises'),(79,'Can delete admin paises',20,'delete_adminpaises'),(80,'Can view admin paises',20,'view_adminpaises'),(81,'Can add areas',21,'add_areas'),(82,'Can change areas',21,'change_areas'),(83,'Can delete areas',21,'delete_areas'),(84,'Can view areas',21,'view_areas'),(85,'Can add nombres areas',22,'add_nombresareas'),(86,'Can change nombres areas',22,'change_nombresareas'),(87,'Can delete nombres areas',22,'delete_nombresareas'),(88,'Can view nombres areas',22,'view_nombresareas');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$X9Ab1SZsapwdrta6xJWwdW$8ak+Oy7QqbpO7Z+UF9KqiH47SgF6m9mEoQpmw9bDJjg=','2025-09-25 00:12:47.448918',1,'administrador','Eduardo','Duran','aconlledo@vilco.cl',1,1,'2025-08-29 02:40:27.319820'),(10,'pbkdf2_sha256$1000000$WI32rbU41Lz4ewQ5vxUSJ4$efnjdTJ/jpQ2fwStRiv2HnFfZYlYDyBQM9NvmS9qq1g=','2025-09-24 22:53:31.817486',0,'aconlledo','Armando','Conlledo','aconlledo@vilco.cl',1,1,'2025-09-15 22:28:42.818572');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(19,'inventariohlag','activos'),(20,'inventariohlag','adminpaises'),(21,'inventariohlag','areas'),(6,'sessions','session'),(12,'tablas','activos'),(16,'tablas','ciudades'),(18,'tablas','edificios'),(11,'tablas','fabricantes'),(10,'tablas','itemsactivos'),(8,'tablas','modelos'),(9,'tablas','nombresactivos'),(22,'tablas','nombresareas'),(17,'tablas','paises'),(15,'tablas','proveedores'),(7,'tablas','usuariosinventario'),(13,'tablas','zonas'),(14,'usuarios','usuariospersonas');
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-08-27 23:28:23.289094'),(2,'auth','0001_initial','2025-08-27 23:28:26.019168'),(3,'admin','0001_initial','2025-08-27 23:28:26.582231'),(4,'admin','0002_logentry_remove_auto_add','2025-08-27 23:28:26.607991'),(5,'admin','0003_logentry_add_action_flag_choices','2025-08-27 23:28:26.638260'),(6,'contenttypes','0002_remove_content_type_name','2025-08-27 23:28:27.088577'),(7,'auth','0002_alter_permission_name_max_length','2025-08-27 23:28:27.299061'),(8,'auth','0003_alter_user_email_max_length','2025-08-27 23:28:27.479149'),(9,'auth','0004_alter_user_username_opts','2025-08-27 23:28:27.502332'),(10,'auth','0005_alter_user_last_login_null','2025-08-27 23:28:27.742234'),(11,'auth','0006_require_contenttypes_0002','2025-08-27 23:28:27.755664'),(12,'auth','0007_alter_validators_add_error_messages','2025-08-27 23:28:27.780666'),(13,'auth','0008_alter_user_username_max_length','2025-08-27 23:28:27.938556'),(14,'auth','0009_alter_user_last_name_max_length','2025-08-27 23:28:28.132579'),(15,'auth','0010_alter_group_name_max_length','2025-08-27 23:28:28.296729'),(16,'auth','0011_update_proxy_permissions','2025-08-27 23:28:28.340182'),(17,'auth','0012_alter_user_first_name_max_length','2025-08-27 23:28:28.491615'),(18,'sessions','0001_initial','2025-08-27 23:28:28.738231'),(19,'tablas','0001_initial','2025-08-27 23:29:12.975605'),(20,'usuarios','0001_initial','2025-08-29 02:44:44.429425'),(21,'tablas','0002_alter_activos_options_activos_accounted_and_more','2025-09-02 23:56:54.469012'),(22,'tablas','0003_alter_activos_options','2025-09-02 23:56:54.477364'),(23,'tablas','0004_alter_activos_fcompra_alter_activos_festado','2025-09-03 00:00:29.680961'),(24,'tablas','0005_alter_modelos_nombre','2025-09-03 00:36:57.186686'),(25,'tablas','0006_alter_modelos_fabricante','2025-09-06 17:41:43.662339'),(26,'tablas','0007_alter_activos_building_alter_activos_city_and_more','2025-09-06 17:41:43.694085'),(27,'tablas','0008_remove_modelos_fabricante_alter_activos_fcompra_and_more','2025-09-06 17:41:44.144098'),(28,'tablas','0009_modelos_fabricante','2025-09-06 17:41:44.231854'),(29,'tablas','0010_alter_modelos_options','2025-09-06 17:41:44.242119'),(30,'tablas','0011_alter_activos_accounted','2025-09-08 23:25:49.550956'),(31,'tablas','0012_remove_activos_item_alter_activos_options_and_more','2025-09-10 20:52:06.422281'),(32,'tablas','0013_ciudades_paises_proveedores_edificios_ciudades_pais','2025-09-10 22:28:16.423645'),(33,'tablas','0014_delete_activos','2025-09-10 22:42:25.465595'),(34,'inventariohlag','0001_initial','2025-09-11 00:56:10.196953'),(35,'usuarios','0002_alter_usuariospersonas_options_and_more','2025-09-11 23:01:01.748072'),(36,'usuarios','0003_usuariospersonas_tipoactivo','2025-09-15 16:43:19.095185'),(37,'usuarios','0004_alter_usuariospersonas_options_and_more','2025-09-15 16:55:58.914135'),(38,'inventariohlag','0002_alter_activos_tipo_adminpaises','2025-09-16 00:12:43.145980'),(39,'usuarios','0005_alter_usuariospersonas_estado_and_more','2025-09-16 00:12:43.170299'),(40,'tablas','0015_alter_ciudades_options_alter_paises_options_and_more','2025-09-16 20:05:53.105790'),(41,'inventariohlag','0003_areas_delete_adminpaises','2025-09-16 20:45:08.327721'),(42,'tablas','0016_nombresareas','2025-09-16 21:07:40.737632'),(43,'inventariohlag','0004_alter_areas_options_remove_areas_nombre_and_more','2025-09-16 21:25:35.841662'),(44,'usuarios','0006_alter_usuariospersonas_options_usuariospersonas_area_and_more','2025-09-24 19:58:54.173014'),(45,'inventariohlag','0005_alter_activos_options_activos_sku','2025-09-24 23:25:44.580903');
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
INSERT INTO `django_session` VALUES ('08w2rxy83d4nwmsphrvwowsxk9f034f0','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjgB:PLUh9j1In364PajKaxfeAWbi3AWfmFev-gzZK9PJFtA','2025-09-22 21:45:39.670936'),('0h8vcs113o4hpddqgn0q2ns12enh8ubr','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1AM2:ZbfeJ3kOO5_LDRjl3qHuzeWd9LuYrSwgZmcP4YrQcfk','2025-10-07 21:15:18.807005'),('0w458qzpsrvxzrl32z5nqiexvmqsc99j','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuMXB:LjtxErH23b0gS7KP61A82Pbm18n06KQAo8uMeBgBu0g','2025-09-19 02:50:41.345445'),('0y99rmj086gdh9g7rbgctyhtf3j6f8en','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uuwvV:KSMYeD4xmklEyL1BcslHTxSn6LzMB1qEiDFAk0V9978','2025-09-20 17:42:13.842189'),('1a1hzazbrugsreroxf85jgjuxaxa8tjw','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw7At:PItGN38qXpQKtgNCIBQZTOVvS7cK5_sSpaRuIXWcd2g','2025-09-23 22:50:55.896360'),('1hqypvc4dh0f3ph3v1f0z5420lmyu3tp','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uyBhw:gfPf79pTdFhQSlZlmOOJIWYIltoiKp8SEFSAU8H2UtU','2025-09-29 16:05:36.872342'),('1ndt6f5xmvjwea0iyezx9j6wkqjxw6zm','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v195j:y5D_lnQOvhF1tIVIt0m2ao5cxyEp4ErELEtRjJ6CpoE','2025-10-07 19:54:23.072498'),('1omryjsulr4jrznkj4ezvravz8ewz1hv','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNys:17UyziuH8CCPe7axzE-RMo_1aqfMqa8GBOx6LkN3Zis','2025-09-19 04:23:22.330431'),('2i4xdxzmt752jti27glim2rxavg43fsi','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuO6j:cpgTD3ml6McQyQfxR4-IJQ8mr1bRu1ALGiG9IT3z_aE','2025-09-19 04:31:29.377747'),('2jz7abl5teht07j0qz5pnizqnjr2ip09','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvixU:oM_w_57wOPvLXweEJmF2G4UGi2ZGpriFgm6mfmfxh7U','2025-09-22 20:59:28.397630'),('2wmdbywmzve089pr6kuzhb6h9ez3c9ce','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uyBtF:kvUzDUH9XcldIsh-tRstzx8j6TY4k_yStGq6pmJOC1c','2025-09-29 16:17:17.037303'),('2y7uw9b6on3d9ezq6rji5m5p0xh4p8hh','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvj8Y:MM69bDyYL8Uw8b060LsvhVw8uc-a82J-GJ0AW9y258I','2025-09-22 21:10:54.485393'),('30euhgdrotdzsaeruttc2glpkwimqsp2','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNYA:6lXSO9boN7Tn6JpUR1Bk1AIGdpfVwa35bhW9ybhazps','2025-09-19 03:55:46.972770'),('357fv7wsdzojkz6ew5r5t0k72jiafdbz','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNle:_LpGBg9fzzU_IudG93aTKbdNqV1I7iXwbF3R0j7cH8o','2025-09-19 04:09:42.951897'),('38ksy2cx8esjclyi9gw1ntd41fxacicm','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5mn:9YocZKAz1DFUtNULPdgRVTyId1DZsShtvBSvqXf99Ak','2025-09-23 21:21:57.572562'),('3zbuj04n2mmm5h2y7bdvyy5izhepzgfb','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uyBFi:bF-PEj0VXkxDY2tuivrE-QE4qyuqji1gQV5yDpkQfF8','2025-09-29 15:36:26.571944'),('4fuz7fown0w829v9lk9rr1mwdm6bvq86','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwQhO:58dgfHLObNXWt6GejFJsUc_TMor4moglLQF7CU46BZg','2025-09-24 19:41:46.290195'),('4gyr21sfdn8wr1elw1pym7ppcjop71kf','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1C5y:izNz-uY9_uYGv7iaab3AXgn4noH6V4EJuyjoBQrUgXU','2025-10-07 23:06:50.755876'),('50ifqirkye0rfilk78g0oisftqlb8k98','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1Acl:zDdyaK-TNfhIKueKRDoiaLoNzWxdThsn1VIskJ3qk5k','2025-10-07 21:32:35.566482'),('526ftyh5gbhpknyn08pdmrre91yhhobc','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1uyIfd:L-WuE7YwRWHdRjIMAtlFVCuYASXpuZYWtalvn6Cnv8k','2025-09-29 23:31:41.358677'),('5c813qugk0w4rgrrcdrcntmtiz1h2bil','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v19YI:jd4BuhndAST6RnFPlaqZGohPPS7I0c6LYNooyC3a9vU','2025-10-07 20:23:54.485273'),('5i8b4cu5vjzmi06xs61uz82hr112s5h9','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v18z4:pr3aCtQqbK0jHX_4dkZSvqWSGv9qCYH0HcKw-SPVL50','2025-10-07 19:47:30.869031'),('5pcropxay31r8r0mii6yg3kth1belbmz','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw40f:NRzlZ-h0m-IThcBTeH46smfRV9tAOUqrHCqrtYv8tBo','2025-09-23 19:28:09.874929'),('5pfyy06clxi6ho4tfmngt45otecdjpx1','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjD0:5HqB7gVoqg9TrMqW9Q9dBm5cP8ZBnBBLY-KIBf_5okw','2025-09-22 21:15:30.733654'),('6msdpbm4wbm546qayy11w64cu5f5e1zh','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNmu:fcJIr3n3akpS7xCKy9umvaZ2U8Dc-st7CWzzJuBSuFY','2025-09-19 04:11:00.610904'),('6uwzpux2r17puxj4zer7lktmyer6dqn0','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5UM:hhRLnu6unvi83Ddda2wDwWo5uR-m_PPXDJGCeUvHrAc','2025-09-23 21:02:54.113540'),('6yw4gchh32famka1nlexrysjg3ftdotr','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwVMy:tia0ZW3IElNra4CkVKBYTOmIn9T1z76FSsV0tIdLesQ','2025-09-25 00:41:00.679231'),('76hsrdvzjvmwrrbvdurztbwhyk8yazpt','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1uyFNz:qajlzXI9HT7yDOs8hCgVJdKBI46d69L5wS3VomhQspQ','2025-09-29 20:01:15.957175'),('7kkr8yd21xdq84eerc587oqrla78hqy5','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwWTc:VKfxs0BDz6SCzRSMeK0IT7yFPaymbo4UWjQ71aWXEmU','2025-09-25 01:51:56.850448'),('7o0f54upuqqjr59coz450v27ram21fzy','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjYH:NDhy1vTsARVBjvAw26R44fD1jWUBbjf9q_SFu4gvXkc','2025-09-22 21:37:29.406726'),('7yebeg4eac9uec4y6ddj1e0ptarq6kuj','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1usW2b:BPwJDmdfo4IJMqUtK8X-x84QDL1PLSbEkuA5jV1dhMI','2025-09-14 00:35:29.488256'),('897gl2zakr1e6ev9qwqyacgvuktsd7qf','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNQa:CbTlCAwE6g_G-PcLNNnIaB8b9Fjj8tJ3ZhxrkyI1xQM','2025-09-19 03:47:56.416913'),('8h1l6jxy93vbpdq7q9n9df7yj1qs65fs','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1X6k:GLEJnq0ffewaVc0KlSOQwKnAQavKMIY7p0SZ6deRN9c','2025-10-08 21:33:02.044640'),('95eb72jof58abs263i7sab75goxlf2bf','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1urpTN:rl2u70RCZCw6GZbe5aXujJk_00FhnlBC_pyj6YW7dp8','2025-09-12 03:08:17.073121'),('9b12wv6h4cfp3iq7d4ych4ie8l0rzl0x','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1XGb:VmwQWz5sJ1FO3AfHoBxujCNnYyOS_MMjgb0CBw-RJTI','2025-10-08 21:43:13.906079'),('9mdrkyibha92zof5dspk0lu1xlt2lruf','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1ADA:ZrjxM3hEcHM73-IiiPXCAOuZr4gSec7tkUmzkYO756k','2025-10-07 21:06:08.732785'),('a5ylo93cirt3cmxufhdhmtk0ahl3bogo','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1uyGmd:_g68W9YfDLUQlMQrvtnCEv6P2fBcMfxAhpbN0l-00-Q','2025-09-29 21:30:47.147613'),('aenf9n1h31c57486b269y98ldiau9p4b','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw7C4:u25Pj0FoifduKCB5JFw3ORlRwEyS7LTyXFR9bJ_69QU','2025-09-23 22:52:08.129593'),('akk7aa4x2rj1q12zu8u9sr2wg8jp78ps','.eJxVjDsOwjAQBe_iGln-xR9K-pzB2l0vOIAcKU4qxN0hUgpo38y8l8iwrTVvnZc8FXEWWpx-NwR6cNtBuUO7zZLmti4Tyl2RB-1ynAs_L4f7d1Ch128dvA0Jh2CIEZKySBFJKfIpKjQKcMBirIoa0PriHKWrI6ddYGZPwOL9AeHcOE8:1uuOXY:n2nKqTEtxvSqABtku9NVmKCFaw1pyamNuaDo4zFXGk4','2025-09-19 04:59:12.123054'),('aper0kmqm0k4m5q0hc0p57mzwurjrns5','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1uydMz:fqPG5qbV3blxZYDeNf4fnXhurtMR47lQWJ0Q7ElieHU','2025-09-30 21:37:49.255680'),('apfr5f755ybttwmo49qv2embhkkbu0id','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5TC:Kfj8nE-V5zcBlv8ZQx_3sgzvfZGOs3se9oMUzLK_P1Y','2025-09-23 21:01:42.684153'),('ayvi5pxvyrkocbdbad0576m3bxosdcvc','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v18qJ:hg6kPdFcDt-F5LUt1qW3XK4DITqaJbmL9qqKjJd_F2Y','2025-10-07 19:38:27.618905'),('b7iaiilzr75k1axv41njxo2c6fvevrl9','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1urpHD:umyrc_hWK-xS5PXl1bFRPmA_eLmLPWtaNtZ1CdquFbI','2025-09-12 02:55:43.518573'),('b9sjc7xsl2q54sbcbyu7nj5y4qcphqxe','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwWZw:P5aqOHMWOm12HMOkfEWG7O4b70ra983NUeMV35pt_R8','2025-09-25 01:58:28.318589'),('bfoki9e5182vt4rqlkkcx9z3ezvqiowa','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNVq:T6CfX2KKOt7JA1Ybbw7K1zcZgoryWEh7KZhXDefyZGs','2025-09-19 03:53:22.046949'),('c3czbowh2av5ww2ibo3ry0kwy7d74wd1','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwW1R:2bOO8a8mEbuwOvQuTCpmuksq7ba6f7NxpWfNPSRkVvQ','2025-09-25 01:22:49.310344'),('c5006kn5ys5f07jfyucbvd1icse1k5ho','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1AEp:vc3pOnlYzuGz1kxrBByjquYmMXPUusGRsURZxwQQgqY','2025-10-07 21:07:51.924513'),('cd1oxyru9xg8lfmy8nbfd9jlkfdnougp','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1uyc6w:g6PbNwzG2U_v1b5teWZFPVXqVJFZ1bSO17Szbiue2YE','2025-09-30 20:17:10.419168'),('cv9go1tb16o0sgwxmdwy74zaf3vefw2v','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1utYj6:y4VEyfqU66fUvgkw4Nbel0-KcQXopMKbUY0iYCi0Q7E','2025-09-16 21:39:40.912523'),('cypnyxphoibv2tu8f074nulsc0ko6o7u','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v15ZC:YxeEeAScMoSRYDdqfToFvSqi0-7VeYaxabKTmfELe4A','2025-10-07 16:08:34.801825'),('cyyl369gouahgeahow4hcvfovttvl4e1','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNZw:ERudwCKlb5k67hdscgUGuTBElmDt3baRVKqYD-RRTRE','2025-09-19 03:57:36.661057'),('cze29j0mfag8azz0bt3g545652nm5t9j','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1uycgv:4hFoRrJ8sHFjqsR5LJZtJN7g-LqAjpaUo6w15rMHzbg','2025-09-30 20:54:21.895812'),('d2kz99c7lzt31d2qqzixt1150l6wozrd','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5Ed:tZselxlF6egmMCS07jERRij8zkufDgjXzRStsYuAAdI','2025-09-23 20:46:39.315859'),('d57nny6d4rkuwr8w3j7cj3h1b5z5bey7','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1A9W:QrukX7tISBe-HiLzgb7HPY3dqufYRSglIpP4skqGelo','2025-10-07 21:02:22.735968'),('dmpas7icg5brkde5kdvuda6ddn9ga2g4','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1AIm:EYfH249TWB08XftsH9Y4VU6gWruMExlJAcKWIYin7hE','2025-10-07 21:11:56.866409'),('duuw6pnxvmj88n5ze54cp2l76xcer1pr','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uyC2S:p74j2jhm9fL_wbY2g4W_po4Rv7cKE8MWfAwtI0tIZgI','2025-09-29 16:26:48.958890'),('e1ak6sjsdl18t6ylbqsgj2jjk7arm8ct','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1Wc2:UXMiwMLOoMlA6kd_nBrI5fP4SK7ydSjKEOviTw9fhsQ','2025-10-08 21:01:18.650405'),('e1ww1ee9ddkap7bg8er9ekb6kaecs2as','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwWQH:_R24d_0n_NvSAHxqtEosS3E0QNV72jFj9YHtzQyZakE','2025-09-25 01:48:29.801476'),('e8aoovu9rleot58dt0dlii2annz2pe2c','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1Vds:P-odTo_Jp2_m2LNIi7pXoDbNu-QZ1LgGbdw8Ws8J7LM','2025-10-08 19:59:08.163697'),('e97c5hz7apgl5lndqao8wirehwxtm91a','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1uyGk3:PBL9waFy6f25L0OKSlHqzS9KBFuNOVXiIaP1DQJoS-0','2025-09-29 21:28:07.026269'),('e9a71z49sc6putk837pd92eho7peiio2','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1Yqn:1ACCjsjzWIyzywJcspi940bI8yf-2sr8wi9wDiVRLHI','2025-10-08 23:24:41.713552'),('ea6ngfjs7829pdcl2bqh1gitaisqeafd','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1A3G:FY9StmEKKfRYZ7qM3aqQXBdB2VJIlxFZDBE4lEl6GrA','2025-10-07 20:55:54.143215'),('evbjrmfdtit4p18k60wze2126e8wjlqd','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uyBnX:6wIZZm4kLo4BYxak5yBfiaBS7YMk4r1wT139cIv0G38','2025-09-29 16:11:23.726442'),('evdzmk53zyjqdiw14jbdzzdnsrmxvgxw','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1CXr:WeYuSAUi8cHzhfOyfEa4XoGRKQWBwv8KhKAJd4_9MH0','2025-10-07 23:35:39.207907'),('f7uw31zfwz1tdkpzwo8zw6q6xr8ge4rh','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwUFW:_y6Y3RijX3j2qYsf-udAqITstZovTcpmSMVxk_ZHFsw','2025-09-24 23:29:14.600630'),('fexprdn4a1lj1gn4dkctvwz16k73t8v0','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvlFg:hGwabVMCrJ3hk3JBgO2pZ6dEZhCH_k1rYq5-4nxEtOo','2025-09-22 23:26:24.460138'),('ffq49gkumqu9hk60agzbi3wqw81as2jr','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNjl:lc9CYgrrZcvFqZExmI55guY3k1t_eMeBqAU8vG5i3J4','2025-09-19 04:07:45.624996'),('fkm96i5vfr2k0qvz23vi9g7j6lpb4w87','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvj32:ZvShHOeK6QvbLedPgFUkI_hgBKOPXErJlJa9UZac_RY','2025-09-22 21:05:12.180749'),('fr0z5jsgf2630b010l4k477q6c1hsb6p','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuOM2:WRck1Us5FDGImTAeeltw9lljnVu7nM0-GXxmyCa9oFY','2025-09-19 04:47:18.631023'),('fzhdwnnrcjtorr6dn90vxarf8hqodbax','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuO1V:g9_RW9b7uffFLuvgr6p811_P0vCMcbzqvIRg3snx4pA','2025-09-19 04:26:05.385769'),('g2gjctmzd7egufdya5vrjx7vwej00ij6','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvj9V:jaGbI0VYjUgOd1vr86uSxkqAy8vwEcxvve8ULVIx9-c','2025-09-22 21:11:53.623425'),('gg70rcfdnf3njo59am5gge3scitvqik1','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v18sZ:xmSjkOw4ZBJjHefW0zCz1r58GDL9Z7m7sfUgxtehDZI','2025-10-07 19:40:47.531970'),('ghov73f8koz1wtgnsffpzjfuuztx83p3','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuMm5:KVLKo4O0crxsotxV4E9gjJLyjEX_QA9vQZSTq-3UXtc','2025-09-19 03:06:05.084408'),('ghw0a1uumfmwirsi6sf0jqwpxuo43a0c','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v18vc:OjyR-0kaNLGDve37zCA5aF7qmqmpBetrGPBWVl7-NQ8','2025-10-07 19:43:56.729651'),('h0g2puztd4p1w49uwxqiiu2noc9fvqzz','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwWVi:pUHvbHsJLK0dqIR2mwGc8rGCELgZBWyovCsikGpDmhg','2025-09-25 01:54:06.944353'),('h1c989qlgddjrrji1tbz49evcplq12et','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1AKS:gPD98UbBJ00GdgjEQ9fMuYBUVC1nDdXd7ambVRsAo-U','2025-10-07 21:13:40.816031'),('hihnj5we60romnqg3usu7isx9voy824v','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNQy:MDZ5bjm_Q4FkdyCnZfGmFWsEknQ-Yg1nUPO1zkrHXNs','2025-09-19 03:48:20.301493'),('hrpsor4ojpjcxl6dgn7qgnbkqonaww05','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1uyIOn:UGnPM5XybTCqhfdtNe4V9cXiU30JrjI3Ema79mY-xxk','2025-09-29 23:14:17.179339'),('hvykoq2bdl5edrpuo1s76jtp28ns3r1j','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1utYZ7:e_9VMJCzqKFHgBplWZoIVrtXk2BWn_N2DL0H-z_rK1Q','2025-09-16 21:29:21.304762'),('i5no4fuw507gupsc0i2e8fontp645jgf','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwVLJ:XxWlABcg7q2wrLqDd0OGRLcHcTJcHLyU1QsriztXPlU','2025-09-25 00:39:17.200514'),('i78ceyv7y3pkzl5iyhwwgrvm30rdsij4','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1Wzh:L4F4hTmQi0vGXiRT3bScT-42Gry--o7SSOYdEo4Dh-4','2025-10-08 21:25:45.703736'),('ib04v0kfjjb2kfokwfgnm9rmecbhcuul','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1X3e:AYAgsErwI_MpSrW5vJV31mn1Scg0_8vtFL9XcjZHgqs','2025-10-08 21:29:50.193689'),('iduneztnslyxj9uzjsn8tpg6j1qatkjx','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1AFc:kZZpMLATVOixeEWphTccrnnZ03aq3pHnWx2RSVpu3bA','2025-10-07 21:08:40.335994'),('ih3tl9evolpkv6kbqjtuubau84vo1f21','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v19OU:pWDqHxaUdty7o6Z4GQHxgqggpjh9EV2fQdIIN-sWYYQ','2025-10-07 20:13:46.597665'),('j0gna71gibh7wze18yh8ishnt8zcdem5','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1YL2:L3YVcfvwtYNW0ypCsIU-LplbB2agAl4QCEXXwLo4NCc','2025-10-08 22:51:52.453122'),('j2g9idyvave5tahd988251c6tgarv0ha','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1XKr:5u91taZnt8K6vOdAEMe5b5emrPXjC4UP3zxXyaqvxfk','2025-10-08 21:47:37.554190'),('jb9ixu81nkof2ngu4juxezbs9qrhrzce','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v18o3:QDur_SwDPMhRQfTGcTcygRqGDVgVQsNAjEqGFZOmrPM','2025-10-07 19:36:07.466840'),('jguhqf5chs2te71bk7ist2wuja1c6639','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjHy:EPAHagxVt9z_Qh35XHuoRqrbK0Axs7sSu7mkt03peo8','2025-09-22 21:20:38.941981'),('jlyv2v4bkmhcw7odhn1n8gkxvruqdjku','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uyCOL:mDEZoGq517K8JXiu6OT6pAJR911kg04sGOdoha4WwAU','2025-09-29 16:49:25.046146'),('jp129d4uat6wmqi2g6gmnzy95wgq96rq','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNOD:cSJRBLFqvUSzVbYRhByjMd_xCbQg3RUN9ugrBBelDC8','2025-09-19 03:45:29.633606'),('jtvwaw4wknxpyr60m1r51v20iy5mipgd','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v19xo:KiJ4R0PFiGFqm6PRaQmP1fFiKmM0n36Oj_QL9ymhzfM','2025-10-07 20:50:16.510864'),('k98oidm0wr068ygo70bpjnrk75qq0a5c','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1AC1:V_tjnD109kBrJv_V8CGL2IAb97OSkJjuz_lNC0Y9APM','2025-10-07 21:04:57.807959'),('kag1pb5f15gz4eegbqevkl70kcfskk05','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uyC0m:t4pJ7E7UedKcYLN8fjMuQ7HICBOI39EUgiaHVZdJl-8','2025-09-29 16:25:04.560131'),('kbwqr73c4mzbkoyfzy7mqujhscvyty9n','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1C1d:HZvB_Y1UZPd2LHZnN5W-PNd2ObdeiB4xzUkcM2Ga2v0','2025-10-07 23:02:21.270317'),('kcugmdo56t6p35sjy81wzemyopp1k7ac','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1Ae0:spOv8HNOv5xbZvoNxe0EAczz0fVtauztoQUSv7PEHvk','2025-10-07 21:33:52.456069'),('kjxs5bnynezl3dc8fpckqdnpzcf3f0gf','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1XIB:GQ1g-litCVwt9A2v5wploLAIch1hkJ0eCorpK97Fxpw','2025-10-08 21:44:51.608209'),('kvl1awsmi8stivpdlk10jhnavmrxq2rx','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1uyHZd:6OKGHHM8o-KKe5ULn33olFsGcAnedhxNuq5mKTl0ZwU','2025-09-29 22:21:25.686649'),('kz73tp4pyy3w005200e1at3tsiujgid0','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwUT6:W2mWLXZwcH4B-p-qonbGFtT-wpQZJFVrRfhJ9NKGYg4','2025-09-24 23:43:16.267636'),('l1pl6jkzppzghnm9zn13budddiuvx6hh','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvikJ:WHIOODuyiQGJjugRU1xB6MAMK4UvKkY9ym_h4j2ZPt8','2025-09-22 20:45:51.189423'),('l52qfclf4poc106dcrx4njvqwvmsbjwf','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw7FI:6Lg9RmfkPOjhDE8p_hyDo4vCm1Wu9ks-zxsFr2GxOrA','2025-09-23 22:55:28.653911'),('lkz5dyo9dx85ajeq0m75t1lo44obogfh','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNRv:pJxVC4yaKn5zNjN7uHbk89V_MSsL3798a6g6X01dC40','2025-09-19 03:49:19.477903'),('lryivbt1gquludemkshn6nsxfpz94ltz','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwWCL:VbSvO0k16n1pVFN1EZobKwJx1WEW9TiVSAGZYeN0kok','2025-09-25 01:34:05.425957'),('mhc0e4r9gm4lasilwl6hkb6khszoml0o','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwUYJ:2YOwiZSNbXIhElzJxj9VbTQAUpNJ0buGYL7PD5b-Qus','2025-09-24 23:48:39.740906'),('mhhdl9qlwgfizj2wdiy4tnbtsg78j423','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uyC1V:y9MMlswXP5l-iZWnpzlWLXolqQ_dlwQw33bW8Q6Us8w','2025-09-29 16:25:49.462121'),('mvgucb7f8nicfduf9sskdpitqz12c03p','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v15J9:0GJXOgI2PnVLExM3KXankKIr8hBeFYTmDlLzURUS6g4','2025-10-07 15:51:59.999015'),('n1tvwiw4xbnj1txu652m65k4zzzlps6y','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v15AS:R1U553OJ2AEJDHYuJ5f8Kiso33vGqIMzeYUBlOl4dYk','2025-10-07 15:43:00.899085'),('n9vvsjsngn3fnfhmyn74u94bbl0xgqep','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1AV4:YN1MAmCWjoDWZVAn6VRythRXprHwRCrJbkUKO-Nbors','2025-10-07 21:24:38.451432'),('na1p8z5um23m9p5m8tmpj9yvwf99n68a','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v15OC:qPkTwwdzA5UupizvDaHB6-xcYS9eS6RoX55W37ef_kQ','2025-10-07 15:57:12.675935'),('nihnukyqiw6jn4wwmg39yvg4hguc7ojb','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1utYHH:xQmovlw0SYqgtcEW1mPRTzCocdsT9ftDu-Eoyyhnbp8','2025-09-16 21:10:55.235411'),('nrgf7l5pbaa1575puwfajjt3g4gwfzvm','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1urpHD:umyrc_hWK-xS5PXl1bFRPmA_eLmLPWtaNtZ1CdquFbI','2025-09-12 02:55:43.593688'),('o2qxxzluw1t2r8kn6eblb7o6l88mqxqj','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1XEf:Uj6Wwe8_pIQ-EExjfEYrb6vVucDbeEdRmrbIn2l090c','2025-10-08 21:41:13.660861'),('o75l0xnrdq0e2e3ezaq6i11ytz9r86hg','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw556:N-_F7KpSkudbs6yfnDm0E6J-bEVtw6qP1Ed3ZyBMOhI','2025-09-23 20:36:48.556241'),('oz2r45i2baxgm4iwsiy0demyyriba823','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNc0:B95uYc1Zz4f7-0DImWIyprt4fQFJ77aAQYjG5C7YxLk','2025-09-19 03:59:44.593789'),('p0mk92qh9s4yixevgbtp3epngfkrpu7k','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uyBpY:WfLdjRm-xqlSraNZQarJz7nUdnVA9pdQykmMgP3CAEg','2025-09-29 16:13:28.444800'),('pcn1wfxwumiyh1dlzx75ytcbldaujnel','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5iV:DL-y5-9FWgIR9U-oa1gzmHcpUtM2uofzNGsMHhxrd6U','2025-09-23 21:17:31.377376'),('prletxzwdhu9d5rx9lp3bhzjn9qxb1yz','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1uyEqj:DGKZ3d0JyMQcjatLKsJRbJ1YsCjC5-87sDqphXQh1ok','2025-09-29 19:26:53.288557'),('qijolgvydwjsvvhajd6bx040skosvvmv','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uyBOP:4or-F026QReWlk0t0FzO2LunKnyi9Ffv-txqjfbksmk','2025-09-29 15:45:25.132578'),('qnwjfxycuvkf08nwgvjc65bqpdoke082','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v18kw:NVv9CmOcavReEnDP8yV7T8Cic6D9U0eiNz5-KXvCw3A','2025-10-07 19:32:54.427285'),('qptdz0z7g0psnsrjrskn050ibzg37ite','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuN6o:g-rC2YKKo0cd1qIxVsv4-VjUnoJ7K-phR8pSD6294Hc','2025-09-19 03:27:30.767257'),('qqsgoum2k5adjbu4fn7gikkjjzhtnyvq','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5bC:GAv1qsfnHFN8gVJsZ0ux7qO6DZbTLkjWRdRdOvQj7qQ','2025-09-23 21:09:58.326758'),('qsn5e9kz70f7udf45zhtrmrg3p0ip0b9','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v19BJ:lsRebO5m7Z1qxXw2EGXayCas0O7GxjLzQ1vzTQQH6CI','2025-10-07 20:00:09.786831'),('qv71ghjsc4wb8d9xdqlhjplv9d7tqt2q','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwUWu:LezIMb5NlmL7JOW67lErLDclXz_Q6CsvJd2o4sJZblw','2025-09-24 23:47:12.247704'),('r2gl3mmg99qrmnl04r3oz37eoq2dqr9r','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuMdL:Pp5iBMnHW-rzipxYxcpB5YuU-1Ca2MwOyx8n3zUhoLI','2025-09-19 02:57:03.703250'),('rcqw85mhcp0p6j994m9gbxeruauqd06v','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuKhj:BB6CJDxSlTFb-N_C2Nvs7HY0Ha-lEzSH-3VJLNkMh6I','2025-09-19 00:53:27.220911'),('rkl4y4rpcyhb056todw6wev8hy56j5d7','.eJxVjEEOgjAQRe_StWk6Qwsdl-49QzPMtIIaSCisjHdXEha6_e-9_zKJt3VIW81LGtWcDThz-h17lkeedqJ3nm6zlXlal7G3u2IPWu111vy8HO7fwcB1-NYMnfhQnOTSFmRykDU2xF3wHRZRbAMW9KEVRGqUSCMIRgIPFF1A8_4AA_43Iw:1uybl7:rUBZ3WkF0riRK6AncfcKC-GSss75wpxXTbVV7L_sDz4','2025-09-30 19:54:37.556218'),('rthota5zu6viux6bgfnqc2zfe6mde9e3','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v15Sd:50JQdZGLICbggGUTT_rjVW-rGRsR_eUC_YQqlBYAhw8','2025-10-07 16:01:47.394167'),('ruwh7gdf1n1vbfaa6m2i7v5bus3zpkfz','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNqt:cz1aA3v1y5Sr4ZIQHV4FG5eSfKYG4YFaQgw4O3HxFhk','2025-09-19 04:15:07.505035'),('rw1v4nxehzztywycw1ns05o2dt0jlu8k','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uyBba:IHsIHIzhQn8KEKYjaleOEg_NBpAkH8RbW6jU9S_TI7Y','2025-09-29 15:59:02.076558'),('ryeu1iq4ekx8rlel0nrx7o9cd7heus6g','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v190U:skXbAZrQyi4keE3Sn062pfrDD3H3h4HsXTRdDZ_bLgI','2025-10-07 19:48:58.863511'),('s2zwwicwqkjeuwnal8eskt67ptudl923','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1YOF:U39P-JTRRBmFwPVtp84QyHqKqpS2tfHCGoTaYBHeKRs','2025-10-08 22:55:11.062510'),('s3hlgzkbu6ifc6ykxhw3hs8gaghqj8yo','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1uybVy:7IOtLb7knkczA6r2z3b92toeJR3kvRRA_VSbTSSIF6k','2025-09-30 19:38:58.688759'),('senids7vr2rdci2gzw8n323qzsh04ymz','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw79h:2hJ6SUcQuzA07oxzrhuZtAn5iUuzjGYvEF8tP3Qo4K8','2025-09-23 22:49:41.836924'),('si1ot4inzvlwveijafneorkgqgxzw74n','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1ZbL:AglXP0Zaij7nM40SuA8RkHFoJoIExE0h8fooP92G9S4','2025-10-09 00:12:47.455819'),('smlxvs2fscoip366pgl7avwlfypsws1a','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uyCiY:b7Pxia-6RnPuRTfXC-nQTlXK7gjX3OMqdajX4OP13wY','2025-09-29 17:10:18.338615'),('su1c3sajs415zlfotchu9tvulm6zrugj','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1uyJUj:8kZOH8Vb0WmsbW4sZIz9aM5g7abxe4ZD08yTwwAm-9U','2025-09-30 00:24:29.102390'),('sz8egml798p33yt7hc8jhbmydh47z3ok','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1Aaq:9b5x3zCYVStrV4YJzOA8KxP-T21AaS72LxUiSjhXGg0','2025-10-07 21:30:36.290682'),('t3y3k7bckfq9zrw8tmwmyb4u9xk1w6xb','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjhg:ii7-V47PU1SDlKhz43xy3m8-sPUkH8LfGimi0d0hTgU','2025-09-22 21:47:12.035355'),('tkt0d7982e497tsj0pvf9c2hf5g1vgxj','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1uydK7:2WwJfbWn4nm6-ti6pA6FBnG_kHbfZWvU_srysFq6sRo','2025-09-30 21:34:51.134411'),('tqhebu6wbsnjny9r067v5qo2up8e9jr8','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1A13:X__SEuEssOyFBKZ8NEn6-AoqJNlP7GZrYeRT4ckMiKg','2025-10-07 20:53:37.664767'),('trlo4isgbcwqe5qattw94jhqftad9nsx','.eJxVjDsOwjAQBe_iGln-xR9K-pzB2l0vOIAcKU4qxN0hUgpo38y8l8iwrTVvnZc8FXEWWpx-NwR6cNtBuUO7zZLmti4Tyl2RB-1ynAs_L4f7d1Ch128dvA0Jh2CIEZKySBFJKfIpKjQKcMBirIoa0PriHKWrI6ddYGZPwOL9AeHcOE8:1uuOgE:R7_tbzMhYgLOebsq5XnuzjbtmgHyewhpAlzHkUTPIGo','2025-09-19 05:08:10.598841'),('twtc5r1qngqok3gavcgg6jg9md2u9u2i','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1uyFYr:gxqSV-1cfTDzj0qQgLXEojU2gPs3uQm3XwYhpRSfUBA','2025-09-29 20:12:29.871348'),('uisrkymbxooympu4l9725753zx5w8dcq','.eJxVjEEOgjAQRe_StWk6Qwsdl-49QzPMtIIaSCisjHdXEha6_e-9_zKJt3VIW81LGtWcDThz-h17lkeedqJ3nm6zlXlal7G3u2IPWu111vy8HO7fwcB1-NYMnfhQnOTSFmRykDU2xF3wHRZRbAMW9KEVRGqUSCMIRgIPFF1A8_4AA_43Iw:1v1YMd:rl41OMQheckBwGFuYNwaySNiam_pelYSGSo8lCf3K9Y','2025-10-08 22:53:31.824750'),('uodd5ym04q4jbk4xjt65dod2nendo4vo','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1BjQ:A6jPuC0xOK6zTV67rs2fbgbZJnajk3wRWPOwISdWngo','2025-10-07 22:43:32.253889'),('uy0ufbf4mmd58wdcpf2dm2o6sgq301fk','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1utYTQ:WGFQEBjhsWKm2uC5Seb4Mo7eclvrSG8OD66_2iqMRpY','2025-09-16 21:23:28.513550'),('uyi82ju65m9xke2y9stahzjzders7nfl','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwVNy:WOT1lPh71cPvAzcMxSh183crFo6nIjJOH0xXjKhGVEQ','2025-09-25 00:42:02.189715'),('v26wxdysf4p5ef3hknn1eyw4d2h339o4','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uyBqT:CcbvYGRGWR3T5sTdqgBjXSwCvekQNDR4-oTUQw-hGzg','2025-09-29 16:14:25.825429'),('v39dw4g8r843ablle69qem1kgpe3c6sm','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw7HW:5Lca2GNQGgowtKOc_npTFdNuuj2XNPe7wnkqm3ihDKY','2025-09-23 22:57:46.052602'),('v3fuub9wfqy8d3ji81ir4zafj3sr22of','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1CSf:38EMLH_RKDuHSTEpq_jYJYhcJc-h75y9qh25-FEdel8','2025-10-07 23:30:17.837726'),('v3j9xrsbfbuzn1qr7m09g03czxq6qiut','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwk6O:OVxcWGH84qnYiTZKu3wKOAiha9rfktpA1PP2Vjtuqo4','2025-09-25 16:24:52.293412'),('v85u5wimrtm1vvwtj6fkwjda9lhmuz51','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uvjQY:97jrwzQNUHNY4pxl1vXIvxzQF8pqnqhK5HfY2CNEcmc','2025-09-22 21:29:30.553593'),('v8y75pq5dp29c9lxffowuom9cgeuao9k','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwRG7:j71ot-ei2ZK34-UDfqoyBNiw32rPIAu5_rIXXdAxlqc','2025-09-24 20:17:39.200209'),('vihnagf63zojmlrs984vw35ietgjttdu','.eJxVjDsOwyAQBe9CHSE-BnZTpvcZELAQnERYMnYV5e6xJRdJOzPvvZkP21r91vPiJ2JXJtnll8WQnrkdgh6h3Wee5rYuU-RHwk_b-ThTft3O9u-ghl73tUpuMCpKyEUpoymJkNE5TGEgwGJlFqVosCKS1dbRDgVZTBrBACCyzxfePTd1:1uuNoH:JllAZWSYM09lgYxSpC2KqE2AdI-1Av3x04L50nADRyk','2025-09-19 04:12:25.855827'),('vla1saztduc1nb696l9puq248gi713oo','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwV4k:UwtXPaj-bMpCPro4SF0NI1IPOFP4xTqp4i9NuRUq03U','2025-09-25 00:22:10.391915'),('w5mdqd8kvwvw5hl90i88w5m8lzzff8ca','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwVwR:pFVdQzcSgTcp7kmvxkdLdvNJqNgeooIMvzOjFUOT8Ig','2025-09-25 01:17:39.615766'),('wv41yxb4mku027trxhulmw3rvrsebb94','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1XCh:lk7GqJ0hu1H_glvynbyTfyYVxhKEIOT2Dkd-J5IHe8Q','2025-10-08 21:39:11.222808'),('x59zk0s3qsaylttgwqd73euk7wmtpguz','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v19om:VjJ7I7RQLoA1aWYb-cGz2mL4g0pjv4sqDCS_hH1cV-E','2025-10-07 20:40:56.639064'),('x8xlpfa74kdnpmw3mtohvhvmufbegni5','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1uydBa:J2OFYVIclrw45n3xUrtLNjmGmhDbsIzjmWgHHG6MKHE','2025-09-30 21:26:02.797434'),('xnhj7zn8z862fe64hpl3n6zcfmtvucge','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwUhT:CcElvkS8oz8QsikWmVWWBrRoio9Ia6YKwS5BomAQCns','2025-09-24 23:58:07.303657'),('xnmb9pi17tyfmf46xa7wjkefjuphdvr6','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v19fj:LxXEb20vboRe1DdHc0g6DUP6BupPDUivOENU3ZvNnUE','2025-10-07 20:31:35.790818'),('y64wpnv996foytoelg9azmtxp4vmy4t9','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uyCV7:QDr5CDYlt2WitBPNdijlpXmifgSJCz-9nAwOM4N7fV8','2025-09-29 16:56:25.547209'),('yb0rgcdmdzyqept3hbrfr9dpg42y7976','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uyCK7:PEktkxbVJzOSQAe3yljODbCNc0z5E0hze-ZPq5by5Ts','2025-09-29 16:45:03.022936'),('yfoo5d1wr74q5ko4pijo9mv2q2stjsup','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v14KF:OfQ0WNCRomNy0tB_PW3dYhT1jKAgLNteTc6kxJ_wyOs','2025-10-07 14:49:03.345310'),('z00k325moqo8qxxs62pebyorxxymcr7e','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1ZSJ:b27fGwxwGTKKwhnz0b_2FLSTivKYUXAODDVBklMQjaY','2025-10-09 00:03:27.576679'),('z9iz5xbemsk0y9hgtayg6oe7ozmdzjd5','.eJxVjDsOwjAQBe_iGlkx_q0p6XMGa9de4wBypDipEHeHSCmgfTPzXiLitta4dV7ilMVFKHH63QjTg9sO8h3bbZZpbusykdwVedAuxznz83q4fwcVe_3WCYofDBvrbNGZg9aZELAgQQBQZ8WZ3MBeAXnyrrgQjNfOKiJiZYN4fwDvUzfx:1uw5ef:ytIPUifsmfMqC0mn511mEyurV8Wjttw7LXFKS3ePJKU','2025-09-23 21:13:33.374736'),('zastycwhhgvhi2p5uav4gzhjetrc3p8h','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwWYW:TE2avdE6OUkuwIxcMLsnGxYChERx0oLqJqir7qJdqMA','2025-09-25 01:57:00.089693'),('zbjaucceaodu0mhz4wt3qz3md4bfr60f','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1AP9:Ei7NYk0ni4vMxCSi4sXBCjSCdymi4-POCg2YKGNRnZI','2025-10-07 21:18:31.017195'),('zgg66xwp2w7q5tk9j0daodapvjdvz2v8','.eJxVjEEOwiAQRe_C2hAY6rS4dN8zNMwMSNVAUtqV8e7apAvd_vfef6kpbGuethaXaRZ1UVadfjcK_IhlB3IP5VY117IuM-ld0QdteqwSn9fD_TvIoeVv3XkfkZK4fkgCYjtMZJFjZxEGx0iAPVA0DhMYBjBI515YhD1b61i9P-WWN_s:1uwWLv:BXOCdhrG8Y8BNWG0yPYW4ovvoJX6T1SeuAeHWNKjeJU','2025-09-25 01:43:59.069175'),('zirv74hiyqzm3n97f66ykqwdijathjfa','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1BmL:sklZkZdp-7V4XqaIEaEhf4_mKKeEDhEpAxPGlw2_VpY','2025-10-07 22:46:33.977831'),('zlwian4z9sfco88nf0s0b5y2munr9klq','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1v1ZaG:dLkSUNcBD-V39AfJdPJdst13uwCUnnvYCTg5_YBurYg','2025-10-09 00:11:40.701126'),('zwi2gpazvphx9r0iu5ov415h6bf9vuqj','.eJxVjEEOwiAURO_C2hCg8KEu3fcM5MMHqRqalHZlvLs06UJn-ebNvJnHfSt-b2n1M7Erk-zyywLGZ6pHQQ-s94XHpW7rHPih8LNtfFoovW6n-3dQsJW-RsxK5KhVTzSgAxkJdowdOaudEWgBBAEMSEaTM4OUchRJZ0VWgWCfL9C5Ntk:1uyFbD:LUYvxxAjPPNLySsmXtcjZGPPTLZCa9PY14gNviphiq0','2025-09-29 20:14:55.911706');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hlag_activos`
--

DROP TABLE IF EXISTS `hlag_activos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hlag_activos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(1) NOT NULL,
  `identificador` varchar(45) NOT NULL,
  `detalle` varchar(250) DEFAULT NULL,
  `serial` varchar(45) DEFAULT NULL,
  `owner` varchar(1) NOT NULL,
  `factura` varchar(45) DEFAULT NULL,
  `fcompra` date DEFAULT NULL,
  `vcompra` decimal(10,2) DEFAULT NULL,
  `factivacion` date DEFAULT NULL,
  `accounted` varchar(1) NOT NULL,
  `vactual` decimal(10,2) DEFAULT NULL,
  `location` varchar(1) NOT NULL,
  `floor` varchar(15) DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  `festado` date DEFAULT NULL,
  `fingreso` datetime(6) NOT NULL,
  `fmodifica` datetime(6) NOT NULL,
  `building_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  `fabricante_id` bigint(20) DEFAULT NULL,
  `modelo_id` bigint(20) DEFAULT NULL,
  `nombre_id` bigint(20) DEFAULT NULL,
  `proveedor_id` bigint(20) DEFAULT NULL,
  `usuarioinv_id` bigint(20) DEFAULT NULL,
  `zona_id` bigint(20) DEFAULT NULL,
  `sku` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hlag_activos_building_id_2e6613b1_fk_tablas_edificios_id` (`building_id`),
  KEY `hlag_activos_city_id_f062a576_fk_tablas_ciudades_id` (`city_id`),
  KEY `hlag_activos_country_id_6fb3d261_fk_tablas_paises_id` (`country_id`),
  KEY `hlag_activos_fabricante_id_68d7227f_fk_tablas_fabricantes_id` (`fabricante_id`),
  KEY `hlag_activos_modelo_id_27ce62c8_fk_tablas_modelos_id` (`modelo_id`),
  KEY `hlag_activos_nombre_id_dcf0f5be_fk_tablas_nombresactivos_id` (`nombre_id`),
  KEY `hlag_activos_proveedor_id_76e0c546_fk_tablas_proveedores_id` (`proveedor_id`),
  KEY `hlag_activos_usuarioinv_id_d69e40c7_fk_tablas_us` (`usuarioinv_id`),
  KEY `hlag_activos_zona_id_666206ed_fk_tablas_zonas_id` (`zona_id`),
  CONSTRAINT `hlag_activos_building_id_2e6613b1_fk_tablas_edificios_id` FOREIGN KEY (`building_id`) REFERENCES `tablas_edificios` (`id`),
  CONSTRAINT `hlag_activos_city_id_f062a576_fk_tablas_ciudades_id` FOREIGN KEY (`city_id`) REFERENCES `tablas_ciudades` (`id`),
  CONSTRAINT `hlag_activos_country_id_6fb3d261_fk_tablas_paises_id` FOREIGN KEY (`country_id`) REFERENCES `tablas_paises` (`id`),
  CONSTRAINT `hlag_activos_fabricante_id_68d7227f_fk_tablas_fabricantes_id` FOREIGN KEY (`fabricante_id`) REFERENCES `tablas_fabricantes` (`id`),
  CONSTRAINT `hlag_activos_modelo_id_27ce62c8_fk_tablas_modelos_id` FOREIGN KEY (`modelo_id`) REFERENCES `tablas_modelos` (`id`),
  CONSTRAINT `hlag_activos_nombre_id_dcf0f5be_fk_tablas_nombresactivos_id` FOREIGN KEY (`nombre_id`) REFERENCES `tablas_nombresactivos` (`id`),
  CONSTRAINT `hlag_activos_proveedor_id_76e0c546_fk_tablas_proveedores_id` FOREIGN KEY (`proveedor_id`) REFERENCES `tablas_proveedores` (`id`),
  CONSTRAINT `hlag_activos_usuarioinv_id_d69e40c7_fk_tablas_us` FOREIGN KEY (`usuarioinv_id`) REFERENCES `tablas_usuariosinventario` (`id`),
  CONSTRAINT `hlag_activos_zona_id_666206ed_fk_tablas_zonas_id` FOREIGN KEY (`zona_id`) REFERENCES `tablas_zonas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hlag_activos`
--

LOCK TABLES `hlag_activos` WRITE;
/*!40000 ALTER TABLE `hlag_activos` DISABLE KEYS */;
INSERT INTO `hlag_activos` VALUES (1,'1','IT-AC-001','  ','FCW1844J1NH','1','N/A','2022-01-03',0.00,'2023-01-02','1',0.00,'0','9','2','2023-09-27','2025-09-11 01:03:38.657367','2025-09-11 01:03:38.657367',2,2,1,1,1,1,NULL,NULL,1,NULL),(2,'1','IT-AC-002','  ','FCW1916N6J6','1','N/A','2022-01-03',0.00,'2023-01-02','1',0.00,'0','9','2','2023-09-27','2025-09-11 01:03:38.685639','2025-09-11 01:03:38.686652',2,2,1,1,1,1,NULL,NULL,1,NULL),(3,'1','IT-BE-001','  ','VTAF710812L','0','N/A','2020-01-06',0.00,'2020-06-11','1',0.00,'0','9','2','2023-09-27','2025-09-11 01:03:38.717057','2025-09-11 01:03:38.717057',2,2,1,2,2,2,NULL,NULL,1,NULL),(4,'1','IT-CE-184','  ','359772046289535','0','N/A','2019-09-06',0.00,'2019-09-08','1',0.00,'1','N/A','0','2023-09-27','2025-09-11 01:03:38.740415','2025-09-11 01:03:38.740415',1,1,1,3,3,3,NULL,NULL,1,NULL),(5,'1','IT-CE-027','  ','353204309349836','0','N/A','2023-01-06',278.23,'2023-01-08','1',278.23,'0','9','0','2023-09-27','2025-09-11 01:03:38.768751','2025-09-11 01:03:38.768751',2,2,1,4,4,3,NULL,1,1,NULL),(6,'1','IT-CE-028','  ','353204309410885','0','N/A','2023-01-06',278.23,'2023-01-08','1',278.23,'1','N/A','0','2023-09-27','2025-09-11 01:03:38.802550','2025-09-11 01:03:38.802550',1,1,1,4,4,3,NULL,2,1,NULL),(7,'1','IT-CE-101','  ','351084396388042','0','N/A','2023-01-06',693.64,'2023-01-08','1',693.64,'1','N/A','0','2023-09-27','2025-09-11 01:03:38.828019','2025-09-11 01:03:38.828019',1,1,1,4,5,3,NULL,3,1,NULL),(8,'1','IT-CE-102','  ','352094677594282','0','N/A','2023-01-06',693.64,'2023-01-08','1',693.64,'1','N/A','0','2023-09-27','2025-09-11 01:03:38.853889','2025-09-11 01:03:38.853889',1,1,1,4,5,3,NULL,4,1,NULL),(9,'1','IT-CE-103','  ','353917851117703','0','N/A','2023-01-06',564.70,'2023-01-08','1',564.70,'1','N/A','0','2023-09-27','2025-09-11 01:03:38.882569','2025-09-11 01:03:38.882569',1,1,1,4,6,3,NULL,5,1,NULL),(10,'1','IT-CE-104','  ','357170855010450','0','N/A','2023-01-06',564.70,'2023-01-08','1',564.70,'1','N/A','0','2023-09-27','2025-09-11 01:03:38.911014','2025-09-11 01:03:38.911014',1,1,1,4,6,3,NULL,6,1,NULL),(11,'1','IT-CE-002','  ','356740114289045','0','N/A','2021-01-06',0.00,'2021-01-08','1',0.00,'1','N/A','0','2023-09-27','2025-09-11 01:03:38.937440','2025-09-11 01:03:38.937440',1,1,1,4,7,3,NULL,7,1,NULL),(12,'1','IT-CE-003','  ','356741114472532','0','N/A','2021-01-06',0.00,'2021-01-08','1',0.00,'1','N/A','0','2023-09-27','2025-09-11 01:03:38.965547','2025-09-11 01:03:38.965547',1,1,1,4,7,3,NULL,8,1,NULL),(13,'1','IT-DE-001','  ','BRZV0R3','0','N/A','2022-03-03',1200.00,'2022-08-04','1',1200.00,'1','N/A','2','2022-08-04','2025-09-11 01:03:38.991768','2025-09-11 01:03:38.991768',1,1,1,5,8,4,NULL,NULL,1,NULL),(14,'1','IT-DE-002','  ','6RZV0R3','0','N/A','2020-10-08',700.00,'2020-09-12','1',700.00,'1','N/A','0','2023-09-27','2025-09-11 01:03:39.017693','2025-09-11 01:03:39.017693',1,1,1,5,8,4,NULL,9,1,NULL),(15,'1','IT-MO-082','  ','0P9RHTQJ900085R','0','N/A','2022-01-06',212.00,'2022-01-08','1',212.00,'0','9','2','2023-09-27','2025-09-11 01:03:39.041404','2025-09-11 01:03:39.041404',2,2,1,6,9,5,NULL,NULL,1,NULL),(16,'1','IT-MO-083','  ','0P9RHTQJ900092P','0','N/A','2022-01-06',212.00,'2022-01-08','1',212.00,'0','9','2','2023-09-27','2025-09-11 01:03:39.064328','2025-09-11 01:03:39.064328',2,2,1,6,9,5,NULL,NULL,1,NULL),(17,'1','IT-MO-018','  ','CN-0YMYH1-74261-5BQ-1KPL','0','N/A','2022-01-06',212.00,'2022-01-08','1',212.00,'0','9','2','2023-09-27','2025-09-11 01:03:39.085570','2025-09-11 01:03:39.085570',2,2,1,5,10,5,NULL,NULL,1,NULL),(18,'1','IT-MO-019','  ','CN-0YMYH1-74261-5BQ-1KTL','0','N/A','2022-01-06',212.00,'2022-01-08','1',212.00,'0','9','2','2023-09-27','2025-09-11 01:03:39.112052','2025-09-11 01:03:39.112052',2,2,1,5,10,5,NULL,NULL,1,NULL),(19,'1','IT-NO-001','  ','H97LP13','0','N/A','2020-10-08',1000.00,'2020-09-12','1',0.00,'0','9','0','2023-09-27','2025-09-11 01:03:39.135553','2025-09-11 01:03:39.135553',2,2,1,5,11,6,NULL,10,1,NULL),(20,'1','IT-NO-002','  ','4LTNP13','0','N/A','2020-10-08',1000.00,'2020-09-12','1',0.00,'0','9','1','2023-09-27','2025-09-11 01:03:39.156876','2025-09-11 01:03:39.156876',2,2,1,5,11,6,NULL,NULL,1,NULL),(21,'1','IT-NO-026','  ','F0SL573','0','N/A','2022-03-03',1200.00,'2022-08-04','1',0.00,'1','N/A','4','2023-09-27','2025-09-11 01:03:39.182309','2025-09-11 01:03:39.182309',1,1,1,5,12,6,NULL,NULL,1,NULL),(22,'1','IT-NO-027','  ','CL4T473','0','N/A','2022-03-03',1200.00,'2022-08-04','1',0.00,'1','N/A','4','2023-09-27','2025-09-11 01:03:39.210730','2025-09-11 01:03:39.210730',1,1,1,5,12,6,NULL,NULL,1,NULL),(23,'1','IT-NO-052','  ','168H6J3','0','N/A','2022-06-11',1500.00,'2022-06-11','1',1500.00,'1','N/A','4','2023-09-27','2025-09-11 01:03:39.238536','2025-09-11 01:03:39.238536',1,1,1,5,13,6,NULL,NULL,1,NULL),(24,'1','IT-NO-312','  ','D7883J3','0','N/A','2022-06-11',1500.00,'2022-06-11','1',1500.00,'1','N/A','0','2023-09-27','2025-09-11 01:03:39.269182','2025-09-11 01:03:39.269182',1,1,1,5,13,6,NULL,11,1,NULL),(25,'1','IT-NO-047','  ','DCRQJR3','0','N/A','2022-05-07',1800.00,'2022-12-10','1',1800.00,'1','N/A','0','2023-09-27','2025-09-11 01:03:39.299566','2025-09-11 01:03:39.299566',1,1,1,5,14,6,NULL,12,1,NULL),(26,'1','IT-NO-048','  ','9MYHKR3','0','N/A','2022-05-07',1800.00,'2022-12-10','1',1800.00,'1','N/A','0','2023-09-27','2025-09-11 01:03:39.331287','2025-09-11 01:03:39.331287',1,1,1,5,14,6,NULL,13,1,NULL),(27,'1','IT-NO-483','  ','1WLSGY3','0','N/A','2022-05-07',1800.00,'2022-12-10','1',1800.00,'1','N/A','0','2023-09-27','2025-09-11 01:03:39.359586','2025-09-11 01:03:39.359586',1,1,1,5,15,6,NULL,NULL,1,NULL),(28,'1','IT-NO-407','  ','100C674','0','N/A','2025-03-15',2100.00,'2025-03-15','1',2100.00,'1','N/A','0','2025-05-29','2025-09-11 01:03:39.386348','2025-09-11 01:03:39.386348',1,1,1,5,16,6,NULL,14,1,NULL),(29,'1','IT-NO-408','  ','1BCC674','0','N/A','2025-03-15',2100.00,'2025-03-15','1',2100.00,'1','N/A','3','2025-05-29','2025-09-11 01:03:39.410652','2025-09-11 01:03:39.410652',1,1,1,5,16,6,NULL,NULL,1,NULL),(30,'1','IT-NO-484','  ','H2CRRV3','0','N/A','2022-05-07',1800.00,'2022-12-10','1',1800.00,'1','N/A','1','2023-09-27','2025-09-11 01:03:39.434172','2025-09-11 01:03:39.434172',1,1,1,5,17,6,NULL,NULL,1,NULL),(31,'1','IT-NO-485','  ','40HVPQ2','0','N/A','2020-10-08',1000.00,'2020-09-12','1',1000.00,'1','N/A','1','2023-09-27','2025-09-11 01:03:39.458984','2025-09-11 01:03:39.458984',1,1,1,5,18,6,NULL,NULL,1,NULL),(32,'1','IT-NO-491','  ','GCTV593','0','N/A','2022-04-05',2100.00,'2022-12-10','1',2100.00,'1','N/A','0','2023-09-27','2025-09-11 01:03:39.484458','2025-09-11 01:03:39.484458',1,1,1,5,19,6,NULL,15,1,NULL),(33,'1','IT-NO-492','  ','4GZ6JR3','0','N/A','2022-05-07',2100.00,'2022-12-10','1',2100.00,'1','N/A','0','2023-09-27','2025-09-11 01:03:39.513283','2025-09-11 01:03:39.513283',1,1,1,5,20,6,NULL,3,1,NULL),(34,'1','IT-NO-493','  ','94QZC74','0','N/A','2025-03-15',2500.00,'2025-03-15','1',2500.00,'1','N/A','0','2025-03-15','2025-09-11 01:03:39.542013','2025-09-11 01:03:39.542013',1,1,1,5,21,6,NULL,16,1,NULL),(35,'1','IT-PR-001','  ','5062159473V2C','0','N/A','2022-03-03',3500.00,'2021-01-06','1',3500.00,'0','9','2','2023-09-27','2025-09-11 01:03:39.569465','2025-09-11 01:03:39.569465',2,2,1,7,22,7,NULL,NULL,1,NULL),(36,'1','IT-PR-002','  ','50280080G4M6N','0','N/A','2022-03-03',2000.00,'2021-01-06','1',2000.00,'0','9','2','2023-09-27','2025-09-11 01:03:39.594170','2025-09-11 01:03:39.594170',2,2,1,7,23,7,NULL,NULL,1,NULL),(37,'1','IT-TV-001','  ','0AW53CSN800978W','0','N/A','2023-01-02',300.00,'2024-03-02','1',300.00,'0','9','2','2023-09-27','2025-09-11 01:03:39.617678','2025-09-11 01:03:39.617678',2,2,1,8,24,8,NULL,NULL,2,NULL),(38,'1','IT-TV-002','  ','--','0','N/A','2023-01-02',300.00,'2024-03-02','1',300.00,'0','9','2','2023-09-27','2025-09-11 01:03:39.642535','2025-09-11 01:03:39.642535',2,2,1,6,25,8,NULL,NULL,2,NULL),(39,'1','IT-VI-001','  ','FOC2420PM9H','1','N/A','2022-01-04',3500.00,'2022-01-12','1',3500.00,'0','9','2','2023-09-27','2025-09-11 01:03:39.666197','2025-09-11 01:03:39.666197',2,2,1,1,26,9,NULL,NULL,3,NULL),(40,'1','IT-VI-002','  ','FOC2541N8NK','1','N/A','2022-01-04',3500.00,'2022-01-12','1',3500.00,'0','9','2','2023-09-27','2025-09-11 01:03:39.690761','2025-09-11 01:03:39.690761',2,2,1,1,26,9,NULL,NULL,4,NULL),(41,'2','MO-CAJA-001','ALTO 56 CM-ANCHO 59 CM-FONDO 64 CM  ','','2','F/39052','1900-01-01',0.00,'2022-01-12','1',0.00,'1','10','5','2023-06-16','2025-09-11 01:03:39.717199','2025-09-11 01:03:39.717199',1,1,1,9,27,10,NULL,17,5,NULL),(42,'2','MO-CAJA-002','ALTO 101 CM-ANCHO 50 CM-FONDO 45 CM  ','','2','F/39052','1900-01-01',0.00,'2022-01-12','1',0.00,'1','11','5','2023-06-16','2025-09-11 01:03:39.746016','2025-09-11 01:03:39.746016',1,1,1,9,28,10,NULL,17,6,NULL),(43,'2','MO-CAJO-001','CAJONERA 3 SMT 344 COLOR BLANCO ','','2','F/9635+9942','2019-10-28',0.00,'2022-01-12','1',0.00,'1','10','5','2023-06-16','2025-09-11 01:03:39.773575','2025-09-11 01:03:39.773575',1,1,1,10,29,11,NULL,18,7,NULL),(44,'2','MO-CAJO-002','CAJONERA 4 0959 CC COLOR BLANCO ','','2','F/9635+9942','2019-10-28',0.00,'2022-01-12','1',0.00,'1','10','5','2023-06-16','2025-09-11 01:03:39.803626','2025-09-11 01:03:39.803626',1,1,1,10,29,11,NULL,19,8,NULL),(45,'2','MO-CAJO-283','895 COLOR BLANCO ','','2','F/475','2022-05-17',0.00,'2022-01-12','1',0.00,'1','10','5','2023-06-16','2025-09-11 01:03:39.843560','2025-09-11 01:03:39.843560',1,1,1,11,30,11,NULL,20,8,NULL),(46,'2','MO-CAJO-284','855 COLOR BLANCO ','','2','F/475','2022-05-17',0.00,'2022-01-12','1',0.00,'1','10','5','2023-06-16','2025-09-11 01:03:39.869728','2025-09-11 01:03:39.869728',1,1,1,11,30,11,NULL,21,8,NULL),(47,'2','MO-CONG-001','OPEN PLAN LEGAL - E. ESTAY PALMS-FOREST-WITH-SKY_TRUCK ','','2','F/1223','2021-06-10',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:39.910013','2025-09-11 01:03:39.910013',1,1,1,9,31,12,NULL,22,9,NULL),(48,'2','MO-CUAD-001','OFICINA GERENCIA GENERAL HLAG_IG_6 ','','2','F/5238+5295','2022-07-04',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:39.943459','2025-09-11 01:03:39.943459',1,1,1,12,32,13,NULL,23,10,NULL),(49,'2','MO-CUAD-002','OFICINA GERENCIA GENERAL HLAG_IG_44 ','','2','F/5238+5295','2022-07-04',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:39.977325','2025-09-11 01:03:39.977325',1,1,1,12,32,13,NULL,23,10,NULL),(50,'2','MO-ESCR-001',' COLOR CEMENTO ','7805437','2','12143','2024-08-01',1458.72,'2022-01-12','1',0.00,'1','9','5','2023-06-16','2025-09-11 01:03:40.006443','2025-09-11 01:03:40.007454',1,1,1,NULL,33,14,NULL,24,11,NULL),(51,'2','MO-ESCR-002','OFICINA 1 SMT 383 COLOR OLMO ','7805438','2','12143','2024-08-01',1458.72,'2022-01-12','1',0.00,'1','9','5','2023-06-16','2025-09-11 01:03:40.034002','2025-09-11 01:03:40.034002',1,1,1,NULL,33,14,NULL,24,11,NULL),(52,'2','MO-ESCR-010','OFICINA 98 COLOR OLMO ','7805446','2','12143','2024-08-01',952.97,'2022-01-12','1',0.00,'1','9','5','2023-06-16','2025-09-11 01:03:40.058106','2025-09-11 01:03:40.058106',1,1,1,NULL,34,14,NULL,24,12,NULL),(53,'2','MO-ESCR-011','OFICINA 98 COLOR CEMENTO ','7805447','2','12143','2024-08-01',952.97,'2022-01-12','1',0.00,'1','9','5','2023-06-16','2025-09-11 01:03:40.080002','2025-09-11 01:03:40.080002',1,1,1,NULL,34,14,NULL,24,13,NULL),(54,'2','MO-ESCR-035','OFICINA COLOR OLMO ','','2','F/1039','2019-10-28',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:40.106271','2025-09-11 01:03:40.106271',1,1,1,10,35,14,NULL,25,10,NULL),(55,'2','MO-ESCR-036',' COLOR OLMO ','','2','F/1039','2019-10-28',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:40.132795','2025-09-11 01:03:40.132795',1,1,1,10,35,14,NULL,26,10,NULL),(56,'2','MO-ESTA-001','CUBIERTA, TAPA, ESTRUCTURA, SEPARADOR CRISTAL Y ALMEJAS. COLOR CEMENTO Y BLANCO ','','2','F/1039','2019-10-28',0.00,'2022-01-12','1',0.00,'1','10','5','2023-06-19','2025-09-11 01:03:40.161327','2025-09-11 01:03:40.161327',1,1,1,10,36,15,NULL,23,8,NULL),(57,'2','MO-ESTA-002','CUBIERTA, TAPA, ESTRUCTURA, SEPARADOR CRISTAL Y ALMEJAS. COLOR CEMENTO Y BLANCO ','','2','F/1039','2019-10-28',0.00,'2022-01-12','1',0.00,'1','10','5','2023-06-19','2025-09-11 01:03:40.189854','2025-09-11 01:03:40.189854',1,1,1,10,37,15,NULL,23,8,NULL),(58,'2','MO-GENE-001',' COLOR OLMO ','','2','F/39052','2019-08-30',0.00,'2022-01-12','1',0.00,'1','TECHO','5','2023-06-16','2025-09-11 01:03:40.217640','2025-09-11 01:03:40.217640',1,1,1,13,38,16,NULL,NULL,1,NULL),(59,'2','MO-HORN-001','  ','7805475','2','40532','2024-08-01',428.33,'2022-01-12','1',0.00,'1','9','5','2025-01-08','2025-09-11 01:03:40.244225','2025-09-11 01:03:40.244225',1,1,1,NULL,39,17,NULL,24,14,NULL),(60,'2','MO-JARD-001','  ','7805483','2','241','2024-08-01',287.00,'2022-01-12','1',0.00,'1','9','5','2025-01-08','2025-09-11 01:03:40.279449','2025-09-11 01:03:40.279449',1,1,1,NULL,40,18,NULL,24,15,NULL),(61,'2','MO-JARD-002','  ','7805483','2','241','2024-08-01',287.00,'2022-01-12','1',0.00,'1','9','5','2025-01-08','2025-09-11 01:03:40.310118','2025-09-11 01:03:40.310118',1,1,1,NULL,40,18,NULL,24,15,NULL),(62,'2','MO-MAQU-001','ESCALA 1:200  ','','2','','2024-08-01',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:40.344226','2025-09-11 01:03:40.344226',1,1,1,14,41,19,NULL,23,8,NULL),(63,'2','MO-MAQU-002','ESCALA 1:200  ','','2','','2024-08-01',0.00,'2022-01-12','1',0.00,'1','10','5','2023-06-16','2025-09-11 01:03:40.378403','2025-09-11 01:03:40.378403',1,1,1,14,42,19,NULL,23,16,NULL),(64,'2','MO-MESA-002',' COLOR OLMO ','7805450','2','12143','2024-08-01',348.96,'2022-01-12','1',0.00,'1','9','5','2023-06-16','2025-09-11 01:03:40.409186','2025-09-11 01:03:40.409186',1,1,1,NULL,43,20,NULL,24,12,NULL),(65,'2','MO-MESA-003',' COLOR OLMO ','7805451','2','12143','2024-08-01',348.96,'2022-01-12','1',0.00,'1','9','5','2023-06-16','2025-09-11 01:03:40.438942','2025-09-11 01:03:40.438942',1,1,1,NULL,43,20,NULL,24,17,NULL),(66,'2','MO-MESA-009',' COLOR OLMO ','7805461','2','12143','2024-08-01',442.66,'2022-01-12','1',0.00,'1','9','5','2023-06-16','2025-09-11 01:03:40.470316','2025-09-11 01:03:40.470316',1,1,1,NULL,44,20,NULL,24,2,NULL),(67,'2','MO-MESA-010',' COLOR OLMO ','7805462','2','12143','2024-08-01',442.66,'2022-01-12','1',0.00,'1','9','5','2023-06-16','2025-09-11 01:03:40.498300','2025-09-11 01:03:40.498300',1,1,1,NULL,44,20,NULL,24,2,NULL),(68,'2','MO-MESA-019',' COLOR BLANCO ','7805654','2','5718','2024-08-01',100.74,'2022-01-12','1',0.00,'1','9','5','2023-06-16','2025-09-11 01:03:40.523777','2025-09-11 01:03:40.523777',1,1,1,NULL,45,20,NULL,24,18,NULL),(69,'2','MO-MESA-020',' COLOR BLANCO ','7805655','2','5718','2024-08-01',100.74,'2022-01-12','1',0.00,'1','9','5','2023-06-16','2025-09-11 01:03:40.550251','2025-09-11 01:03:40.550251',1,1,1,NULL,45,20,NULL,24,18,NULL),(70,'2','MO-MESA-030',' COLOR OLMO ','','2','F/1039','2019-10-28',0.00,'2022-01-12','1',0.00,'1','11','5','2023-06-16','2025-09-11 01:03:40.584669','2025-09-11 01:03:40.584669',1,1,1,10,46,20,NULL,27,10,NULL),(71,'2','MO-MESA-031',' COLOR OLMO ','','2','F/1039','2019-10-28',0.00,'2022-01-12','1',0.00,'1','11','5','2023-06-16','2025-09-11 01:03:40.613827','2025-09-11 01:03:40.613827',1,1,1,10,46,20,NULL,28,10,NULL),(72,'2','MO-MESA-037',' COLOR OLMO Y PATAS  BLANCAS ','','2','F/1039','2019-10-28',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:40.645314','2025-09-11 01:03:40.645314',1,1,1,9,47,20,NULL,22,19,NULL),(73,'2','MO-MESA-038',' COLOR OLMO Y PATAS  BLANCAS ','','2','F/1039','2019-10-28',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:40.674935','2025-09-11 01:03:40.674935',1,1,1,9,47,20,NULL,22,19,NULL),(74,'2','MO-MICR-001',' COLOR NEGRO ','7805476','2','40532','2024-08-01',250.27,'2022-01-12','1',250.27,'1','9','5','2025-01-08','2025-09-11 01:03:40.717751','2025-09-11 01:03:40.717751',1,1,1,NULL,48,21,NULL,24,14,NULL),(75,'2','MO-MICR-002',' COLOR NEGRO ','7805477','2','40532','2024-08-01',250.27,'2022-01-12','1',250.27,'1','9','5','2025-01-08','2025-09-11 01:03:40.741761','2025-09-11 01:03:40.741761',1,1,1,NULL,48,21,NULL,24,14,NULL),(76,'2','MO-MUEB-004',' COLOR BLANCO ','','2','','2024-08-01',0.00,'2022-01-12','1',0.00,'1','11','5','2023-06-16','2025-09-11 01:03:40.766156','2025-09-11 01:03:40.766156',1,1,1,10,49,22,NULL,29,20,NULL),(77,'2','MO-MUEB-005',' COLOR BLANCO ','','2','','2024-08-01',0.00,'2022-01-12','1',0.00,'1','11','5','2023-06-16','2025-09-11 01:03:40.795905','2025-09-11 01:03:40.795905',1,1,1,10,49,22,NULL,30,20,NULL),(78,'2','MO-PAPE-001','  ','7805484','2','12462- 12530','2024-08-01',26.08,'2022-01-12','1',0.00,'1','9','5','2025-01-07','2025-09-11 01:03:40.822580','2025-09-11 01:03:40.822580',1,1,1,NULL,50,23,NULL,24,15,NULL),(79,'2','MO-PAPE-002','  ','7805484','2','12462- 12530','2024-08-01',26.08,'2022-01-12','1',0.00,'1','9','5','2025-01-07','2025-09-11 01:03:40.848761','2025-09-11 01:03:40.848761',1,1,1,NULL,50,23,NULL,24,15,NULL),(80,'2','MO-PLAN-001','MACETERO PIRAMIDE 40 x 70 h AVOID WATERING IT OR FERTILIZING IT. ','','2','F/176-177','2022-11-14',0.00,'2022-01-12','0',0.00,'1','12','5','2023-07-12','2025-09-11 01:03:40.876852','2025-09-11 01:03:40.876852',1,1,1,15,51,18,NULL,31,10,NULL),(81,'2','MO-PLAN-002','PIRAMIDE 40 X 70 h AVOID WATERING IT OR FERTILIZING IT. ','','2','F/176-177','2022-11-14',0.00,'2022-01-12','0',0.00,'1','12','5','2023-07-12','2025-09-11 01:03:40.902490','2025-09-11 01:03:40.902490',1,1,1,15,52,18,NULL,32,7,NULL),(82,'2','MO-POLT-001','  ','7805660','2','5718','2024-08-01',347.52,'2022-01-12','1',347.52,'1','9','5','2025-01-08','2025-09-11 01:03:40.930050','2025-09-11 01:03:40.930050',1,1,1,NULL,53,22,NULL,24,21,NULL),(83,'2','MO-POLT-002','  ','7805661','2','5718','2024-08-01',347.52,'2022-01-12','1',347.52,'1','9','5','2025-01-08','2025-09-11 01:03:40.953266','2025-09-11 01:03:40.953266',1,1,1,NULL,53,22,NULL,24,21,NULL),(84,'2','MO-REFR-001',' COLOR GRIS ','7805473','2','40532','2024-08-01',1163.88,'2022-01-12','1',0.00,'1','9','5','2023-06-16','2025-09-11 01:03:40.981427','2025-09-11 01:03:40.981427',1,1,1,NULL,54,24,NULL,24,14,NULL),(85,'2','MO-REFR-002',' COLOR GRIS OSCURO ','7805474','2','40532','2024-08-01',1163.88,'2022-01-12','1',0.00,'1','9','5','2023-06-16','2025-09-11 01:03:41.013618','2025-09-11 01:03:41.013618',1,1,1,NULL,54,24,NULL,24,14,NULL),(86,'2','MO-SILL-001',' COLOR ANARANJADO ','','2','F/1045','2019-11-18',0.00,'2022-01-12','1',0.00,'1','10','5','2023-06-16','2025-09-11 01:03:41.043311','2025-09-11 01:03:41.043311',1,1,1,16,55,25,NULL,33,22,NULL),(87,'2','MO-SILL-002',' COLOR ANARANJADO ','','2','F/1045','2019-11-18',0.00,'2022-01-12','1',0.00,'1','10','5','2023-06-16','2025-09-11 01:03:41.071826','2025-09-11 01:03:41.071826',1,1,1,16,55,25,NULL,33,22,NULL),(88,'2','MO-SILL-371',' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12','1',0.00,'1','11','5','2023-06-16','2025-09-11 01:03:41.109818','2025-09-11 01:03:41.109818',1,1,1,16,56,25,NULL,34,10,NULL),(89,'2','MO-SILL-372',' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12','1',0.00,'1','11','5','2023-06-16','2025-09-11 01:03:41.142213','2025-09-11 01:03:41.142213',1,1,1,16,56,25,NULL,34,10,NULL),(90,'2','MO-SILL-404',' CUERO COLOR VERDE ','','2','F/844','2021-07-01',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:41.172049','2025-09-11 01:03:41.172049',1,1,1,17,57,25,NULL,23,19,NULL),(91,'2','MO-SILL-405',' CUERO COLOR VERDE ','','2','F/844','2021-07-01',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:41.202203','2025-09-11 01:03:41.202203',1,1,1,17,57,25,NULL,23,19,NULL),(92,'2','MO-SILL-439',' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:41.233956','2025-09-11 01:03:41.233956',1,1,1,16,58,25,NULL,32,7,NULL),(93,'2','MO-SILL-440',' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:41.263488','2025-09-11 01:03:41.263488',1,1,1,16,58,25,NULL,32,7,NULL),(94,'2','MO-SILL-441',' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:41.292949','2025-09-11 01:03:41.292949',1,1,1,16,59,25,NULL,32,7,NULL),(95,'2','MO-SILL-442',' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:41.321898','2025-09-11 01:03:41.321898',1,1,1,16,59,25,NULL,35,7,NULL),(96,'2','MO-SILL-521',' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:41.348101','2025-09-11 01:03:41.348101',1,1,1,16,60,25,NULL,27,10,NULL),(97,'2','MO-SILL-522',' COLOR NEGRO ','','2','F/1045','2019-11-18',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:41.384537','2025-09-11 01:03:41.384537',1,1,1,16,60,25,NULL,27,10,NULL),(98,'2','MO-SILL-633',' COLOR CAFÉ ','','2','','2019-11-18',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:41.411544','2025-09-11 01:03:41.411544',1,1,1,18,61,25,NULL,23,20,NULL),(99,'2','MO-SILL-634',' COLOR CAFÉ ','','2','','2019-11-18',0.00,'2022-01-12','1',0.00,'1','12','5','2023-06-16','2025-09-11 01:03:41.440141','2025-09-11 01:03:41.440141',1,1,1,18,61,25,NULL,23,20,NULL),(100,'2','MO-ESCR-001','  ','7805437','2','12143','2024-08-01',1458.72,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.466344','2025-09-11 01:03:41.466344',2,2,1,10,33,14,NULL,24,11,NULL),(101,'2','MO-ESCR-002','  ','7805438','2','12143','2024-08-01',1458.72,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.494183','2025-09-11 01:03:41.494183',2,2,1,10,33,14,NULL,24,11,NULL),(102,'2','MO-ESCR-010','  ','7805446','2','12143','2024-08-01',952.97,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.521580','2025-09-11 01:03:41.521580',2,2,1,10,34,14,NULL,24,12,NULL),(103,'2','MO-ESCR-011','  ','7805447','2','12143','2024-08-01',952.97,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.548338','2025-09-11 01:03:41.548338',2,2,1,10,34,14,NULL,24,13,NULL),(104,'2','MO-JARD-001','  ','780548322','2','241','2024-08-01',287.00,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.638996','2025-09-11 01:03:41.638996',2,2,1,15,62,26,NULL,24,15,NULL),(105,'2','MO-JARD-002','  ','780548323','2','241','2024-08-01',287.00,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.665963','2025-09-11 01:03:41.665963',2,2,1,15,62,26,NULL,24,15,NULL),(106,'2','MO-MESA-001','  ','7805436','2','117206','2024-08-01',299.68,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.693247','2025-09-11 01:03:41.693247',2,2,1,19,63,20,NULL,24,23,NULL),(107,'2','MO-MESA-002','  ','7805450','2','12143','2024-08-01',348.96,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.727399','2025-09-11 01:03:41.727399',2,2,1,10,43,20,NULL,24,12,NULL),(108,'2','MO-MESA-009','  ','7805461','2','12143','2024-08-01',442.66,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.756031','2025-09-11 01:03:41.756031',2,2,1,10,44,20,NULL,24,2,NULL),(109,'2','MO-MESA-010','  ','7805462','2','12143','2024-08-01',442.66,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.781340','2025-09-11 01:03:41.781340',2,2,1,10,44,20,NULL,24,2,NULL),(110,'2','MO-MICR-001','  ','7805476','2','40532','2024-08-01',250.27,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.812503','2025-09-11 01:03:41.812503',2,2,1,20,64,21,NULL,24,14,NULL),(111,'2','MO-MICR-002','  ','7805477','2','40532','2024-08-01',250.27,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.840339','2025-09-11 01:03:41.840339',2,2,1,20,64,21,NULL,24,14,NULL),(112,'2','MO-PAPE-001','  ','7805484','2','12462- 12530','2024-08-01',26.08,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.864278','2025-09-11 01:03:41.864278',2,2,1,10,50,23,NULL,24,15,NULL),(113,'2','MO-PAPE-002','  ','780548401','2','12462- 12530','2024-08-01',26.08,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.891804','2025-09-11 01:03:41.891804',2,2,1,10,50,23,NULL,24,15,NULL),(114,'2','MO-PISO-001','  ','7805689','2','577','2024-08-01',0.00,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.916239','2025-09-11 01:03:41.916239',2,2,1,21,65,27,NULL,24,10,NULL),(115,'2','MO-POLT-001','  ','7805660','2','5718','2024-08-01',347.52,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.947056','2025-09-11 01:03:41.947056',2,2,1,22,53,28,NULL,24,21,NULL),(116,'2','MO-POLT-002','  ','7805661','2','5718','2024-08-01',347.52,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.971508','2025-09-11 01:03:41.971508',2,2,1,22,53,28,NULL,24,21,NULL),(117,'2','MO-REFR-001','  ','7805473','2','40532','2024-08-01',1163.88,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:41.996929','2025-09-11 01:03:41.996929',2,2,1,20,54,29,NULL,24,14,NULL),(118,'2','MO-REFR-002','  ','7805474','2','40532','2024-08-01',1163.88,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:42.026179','2025-09-11 01:03:42.026179',2,2,1,20,54,29,NULL,24,14,NULL),(119,'2','MO-SILL-166','  ','7805502','2','115063','2024-08-01',576.11,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:42.056760','2025-09-11 01:03:42.056760',2,2,1,10,66,25,NULL,24,18,NULL),(120,'2','MO-SILL-167','  ','7805503','2','115063','2024-08-01',576.11,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:42.083510','2025-09-11 01:03:42.083510',2,2,1,10,66,25,NULL,24,18,NULL),(121,'2','MO-SILLA-162','  ','7805663','2','5718','2024-08-01',109.97,'2022-01-12','1',0.00,'0','9','5','2025-01-07','2025-09-11 01:03:42.109342','2025-09-11 01:03:42.109342',2,2,1,22,67,25,NULL,24,24,NULL),(122,'2','MO-SILLA-163','  ','7805664','2','5718','2024-08-01',109.97,'2022-01-12','1',0.00,'0','9','5','2025-01-07','2025-09-11 01:03:42.141977','2025-09-11 01:03:42.141977',2,2,1,22,67,25,NULL,24,24,NULL),(123,'2','MO-SILLO-001',' CUERO COLOR LIGHT GREY ','7805648','2','5718','2024-08-01',1318.36,'2022-01-12','1',1318.36,'0','9','5','2025-01-08','2025-09-11 01:03:42.170738','2025-09-11 01:03:42.170738',2,2,1,22,68,28,NULL,24,18,NULL),(124,'2','MO-SILLO-002',' CUERO COLOR LIGHT GREY ','7805649','2','5718','2024-08-01',1318.36,'2022-01-12','1',1318.36,'0','9','5','2025-01-08','2025-09-11 01:03:42.197591','2025-09-11 01:03:42.197591',2,2,1,22,68,28,NULL,24,18,NULL),(125,'2','MO-TABU-001','  ','7805468','2','12143','2024-08-01',165.77,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:42.226696','2025-09-11 01:03:42.226696',2,2,1,10,69,30,NULL,24,25,NULL),(126,'2','MO-TABU-002','  ','7805469','2','12143','2024-08-01',165.77,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:42.254778','2025-09-11 01:03:42.254778',2,2,1,10,69,30,NULL,24,25,NULL),(127,'2','MO-TELE-001','  ','7805401','2','1831694','2024-05-07',1373.96,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:42.282379','2025-09-11 01:03:42.282379',2,2,1,6,70,31,NULL,24,18,NULL),(128,'2','MO-TELE-002','  ','7805402','2','1831694','2024-05-07',1373.96,'2022-01-12','1',0.00,'0','9','5','2025-01-08','2025-09-11 01:03:42.308975','2025-09-11 01:03:42.308975',2,2,1,6,70,31,NULL,24,18,NULL);
/*!40000 ALTER TABLE `hlag_activos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hlag_areas`
--

DROP TABLE IF EXISTS `hlag_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hlag_areas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pais_id` bigint(20) DEFAULT NULL,
  `areaname_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hlag_areas_pais_id_1ede2608_fk_tablas_paises_id` (`pais_id`),
  KEY `hlag_areas_areaname_id_832e08f7_fk_tablas_nombresareas_id` (`areaname_id`),
  CONSTRAINT `hlag_areas_areaname_id_832e08f7_fk_tablas_nombresareas_id` FOREIGN KEY (`areaname_id`) REFERENCES `tablas_nombresareas` (`id`),
  CONSTRAINT `hlag_areas_pais_id_1ede2608_fk_tablas_paises_id` FOREIGN KEY (`pais_id`) REFERENCES `tablas_paises` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hlag_areas`
--

LOCK TABLES `hlag_areas` WRITE;
/*!40000 ALTER TABLE `hlag_areas` DISABLE KEYS */;
INSERT INTO `hlag_areas` VALUES (1,1,1),(2,8,1),(3,2,2),(4,4,2),(9,6,3),(10,3,4),(11,5,4),(12,7,5),(13,9,5),(14,10,5);
/*!40000 ALTER TABLE `hlag_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablas_ciudades`
--

DROP TABLE IF EXISTS `tablas_ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablas_ciudades` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `pais_id` bigint(20) DEFAULT NULL,
  `codigo` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tablas_ciudades_pais_id_7166012d_fk_tablas_paises_id` (`pais_id`),
  CONSTRAINT `tablas_ciudades_pais_id_7166012d_fk_tablas_paises_id` FOREIGN KEY (`pais_id`) REFERENCES `tablas_paises` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_ciudades`
--

LOCK TABLES `tablas_ciudades` WRITE;
/*!40000 ALTER TABLE `tablas_ciudades` DISABLE KEYS */;
INSERT INTO `tablas_ciudades` VALUES (1,'VIÑA DEL MAR',1,'VAP'),(2,'SANTIAGO',1,'SCL');
/*!40000 ALTER TABLE `tablas_ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablas_edificios`
--

DROP TABLE IF EXISTS `tablas_edificios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablas_edificios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `ciudad_id` bigint(20) DEFAULT NULL,
  `pais_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tablas_edificios_ciudad_id_bf9f3fce_fk_tablas_ciudades_id` (`ciudad_id`),
  KEY `tablas_edificios_pais_id_5b9e36f9_fk_tablas_paises_id` (`pais_id`),
  CONSTRAINT `tablas_edificios_ciudad_id_bf9f3fce_fk_tablas_ciudades_id` FOREIGN KEY (`ciudad_id`) REFERENCES `tablas_ciudades` (`id`),
  CONSTRAINT `tablas_edificios_pais_id_5b9e36f9_fk_tablas_paises_id` FOREIGN KEY (`pais_id`) REFERENCES `tablas_paises` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_edificios`
--

LOCK TABLES `tablas_edificios` WRITE;
/*!40000 ALTER TABLE `tablas_edificios` DISABLE KEYS */;
INSERT INTO `tablas_edificios` VALUES (1,'WORK MARINA',1,1),(2,'NUEVA CORDOVA',2,1);
/*!40000 ALTER TABLE `tablas_edificios` ENABLE KEYS */;
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
-- Table structure for table `tablas_nombresareas`
--

DROP TABLE IF EXISTS `tablas_nombresareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablas_nombresareas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_nombresareas`
--

LOCK TABLES `tablas_nombresareas` WRITE;
/*!40000 ALTER TABLE `tablas_nombresareas` DISABLE KEYS */;
INSERT INTO `tablas_nombresareas` VALUES (1,'CHILE'),(2,'ARGENTINA'),(3,'BRASIL'),(4,'PERU'),(5,'COLOMBIA');
/*!40000 ALTER TABLE `tablas_nombresareas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablas_paises`
--

DROP TABLE IF EXISTS `tablas_paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablas_paises` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `codigo` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_paises`
--

LOCK TABLES `tablas_paises` WRITE;
/*!40000 ALTER TABLE `tablas_paises` DISABLE KEYS */;
INSERT INTO `tablas_paises` VALUES (1,'CHILE','CL'),(2,'ARGENTINA','AR'),(3,'PERU','PE'),(4,'URUGUAY','UR'),(5,'ECUADOR','EC'),(6,'BRASIL','BR'),(7,'COLOMBIA','CO'),(8,'BOLIVIA','BO'),(9,'PUERTO RICO','PR'),(10,'GUATEMALA','GT');
/*!40000 ALTER TABLE `tablas_paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tablas_proveedores`
--

DROP TABLE IF EXISTS `tablas_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tablas_proveedores` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tablas_proveedores`
--

LOCK TABLES `tablas_proveedores` WRITE;
/*!40000 ALTER TABLE `tablas_proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `tablas_proveedores` ENABLE KEYS */;
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
INSERT INTO `tablas_usuariosinventario` VALUES (1,'CAROCEL'),(2,'SOLARFA'),(3,'DURANED'),(4,'NOZIGRO'),(5,'SCHOLRN'),(6,'HERREJI'),(7,'FERRASE'),(8,'MUENCMA'),(9,'GARCINY'),(10,'GOMEZDN'),(11,'NAVARSE'),(12,'PEONCL'),(13,'RAMOSKA'),(14,'BURGOJU'),(15,'HURTASE'),(16,'KULKAAN'),(17,'JESSICA ROJAS'),(18,'REBECA JIMENEZ'),(19,'GONZALO OLMEDO'),(20,'BLANCA CORTÉS'),(21,'KATERINA FARIAS'),(22,'COMEDOR'),(23,'DESCONOCIDO'),(24,'AARON LOPEZ'),(25,'L4 H. TAMURA'),(26,'L4 SALES'),(27,'L3 R. DIAZ'),(28,'L3'),(29,'SALA REUNION 4P'),(30,'SALA REUNION 6P'),(31,'L2'),(32,'ANA MARÍA HENRIQUEZ'),(33,'SALA 1'),(34,'L4'),(35,'ASISTENTE');
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
  `estado` varchar(1) NOT NULL,
  `perfil` varchar(1) NOT NULL,
  `cclave` smallint(5) unsigned NOT NULL CHECK (`cclave` >= 0),
  `token` varchar(64) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `pais_id` bigint(20) DEFAULT NULL,
  `tipoactivo` varchar(1) NOT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  KEY `usuarios_personas_pais_id_012cce55_fk_tablas_paises_id` (`pais_id`),
  KEY `usuarios_personas_area_id_a06f90a4_fk_hlag_areas_id` (`area_id`),
  CONSTRAINT `usuarios_personas_area_id_a06f90a4_fk_hlag_areas_id` FOREIGN KEY (`area_id`) REFERENCES `hlag_areas` (`id`),
  CONSTRAINT `usuarios_personas_pais_id_012cce55_fk_tablas_paises_id` FOREIGN KEY (`pais_id`) REFERENCES `tablas_paises` (`id`),
  CONSTRAINT `usuarios_personas_usuario_id_d98790c7_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_personas`
--

LOCK TABLES `usuarios_personas` WRITE;
/*!40000 ALTER TABLE `usuarios_personas` DISABLE KEYS */;
INSERT INTO `usuarios_personas` VALUES (1,'administrador','Eduardo','Duran','aconlledo@vilco.cl','1','1',0,'',1,1,'0',1),(3,'aconlledo','Armando','Conlledo','aconlledo@vilco.cl','1','0',0,'',10,1,'1',1);
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

-- Dump completed on 2025-09-25 17:19:59
