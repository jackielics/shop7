-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: shop7
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add 商品',6,'add_goods'),(22,'Can change 商品',6,'change_goods'),(23,'Can delete 商品',6,'delete_goods'),(24,'Can view 商品',6,'view_goods'),(25,'Can add 商品类别',7,'add_goodscategory'),(26,'Can change 商品类别',7,'change_goodscategory'),(27,'Can delete 商品类别',7,'delete_goodscategory'),(28,'Can view 商品类别',7,'view_goodscategory'),(29,'Can add 热搜词',8,'add_hotsearchwords'),(30,'Can change 热搜词',8,'change_hotsearchwords'),(31,'Can delete 热搜词',8,'delete_hotsearchwords'),(32,'Can view 热搜词',8,'view_hotsearchwords'),(33,'Can add 首页商品类别广告',9,'add_indexad'),(34,'Can change 首页商品类别广告',9,'change_indexad'),(35,'Can delete 首页商品类别广告',9,'delete_indexad'),(36,'Can view 首页商品类别广告',9,'view_indexad'),(37,'Can add 商品图片',10,'add_goodsimage'),(38,'Can change 商品图片',10,'change_goodsimage'),(39,'Can delete 商品图片',10,'delete_goodsimage'),(40,'Can view 商品图片',10,'view_goodsimage'),(41,'Can add 品牌',11,'add_goodscategorybrand'),(42,'Can change 品牌',11,'change_goodscategorybrand'),(43,'Can delete 品牌',11,'delete_goodscategorybrand'),(44,'Can view 品牌',11,'view_goodscategorybrand'),(45,'Can add 轮播商品',12,'add_banner'),(46,'Can change 轮播商品',12,'change_banner'),(47,'Can delete 轮播商品',12,'delete_banner'),(48,'Can view 轮播商品',12,'view_banner'),(49,'Can add 订单商品',13,'add_ordergoods'),(50,'Can change 订单商品',13,'change_ordergoods'),(51,'Can delete 订单商品',13,'delete_ordergoods'),(52,'Can view 订单商品',13,'view_ordergoods'),(53,'Can add 订单',14,'add_orderinfo'),(54,'Can change 订单',14,'change_orderinfo'),(55,'Can delete 订单',14,'delete_orderinfo'),(56,'Can view 订单',14,'view_orderinfo'),(57,'Can add 购物车',15,'add_shoppingcart'),(58,'Can change 购物车',15,'change_shoppingcart'),(59,'Can delete 购物车',15,'delete_shoppingcart'),(60,'Can view 购物车',15,'view_shoppingcart'),(61,'Can add 收货地址',16,'add_useraddress'),(62,'Can change 收货地址',16,'change_useraddress'),(63,'Can delete 收货地址',16,'delete_useraddress'),(64,'Can view 收货地址',16,'view_useraddress'),(65,'Can add 用户收藏',17,'add_userfav'),(66,'Can change 用户收藏',17,'change_userfav'),(67,'Can delete 用户收藏',17,'delete_userfav'),(68,'Can view 用户收藏',17,'view_userfav'),(69,'Can add 用户留言',18,'add_userleavingmessage'),(70,'Can change 用户留言',18,'change_userleavingmessage'),(71,'Can delete 用户留言',18,'delete_userleavingmessage'),(72,'Can view 用户留言',18,'view_userleavingmessage'),(73,'Can add 短信验证码',19,'add_verifycode'),(74,'Can change 短信验证码',19,'change_verifycode'),(75,'Can delete 短信验证码',19,'delete_verifycode'),(76,'Can view 短信验证码',19,'view_verifycode'),(77,'Can add 用户',20,'add_userprofile'),(78,'Can change 用户',20,'change_userprofile'),(79,'Can delete 用户',20,'delete_userprofile'),(80,'Can view 用户',20,'view_userprofile'),(81,'Can add Token',21,'add_token'),(82,'Can change Token',21,'change_token'),(83,'Can delete Token',21,'delete_token'),(84,'Can view Token',21,'view_token'),(85,'Can add token',22,'add_tokenproxy'),(86,'Can change token',22,'change_tokenproxy'),(87,'Can delete token',22,'delete_tokenproxy'),(88,'Can view token',22,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('4b4114275d30a4bf9b7f8eeaa836be03fa7c7f90','2023-04-04 17:01:48.769819',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-04-04 15:25:15.472304','52','融氏纯玉米胚芽油5l桶',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u552f\\u4e00\\u8d27\\u53f7\", \"\\u5546\\u54c1\\u7b80\\u77ed\\u63cf\\u8ff0\", \"\\u662f\\u5426\\u65b0\\u54c1\", \"\\u662f\\u5426\\u70ed\\u9500\"]}}]',6,1),(2,'2023-04-04 16:16:41.014517','51','稻园牌稻米油粮油米糠油绿色植物油',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u552f\\u4e00\\u8d27\\u53f7\", \"\\u5546\\u54c1\\u7b80\\u77ed\\u63cf\\u8ff0\"]}}]',6,1),(3,'2023-04-04 16:16:52.263612','51','稻园牌稻米油粮油米糠油绿色植物油',2,'[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u65b0\\u54c1\", \"\\u662f\\u5426\\u70ed\\u9500\"]}}]',6,1),(4,'2023-04-04 16:19:09.238111','24','酒水饮料',2,'[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u5bfc\\u822a\"]}}]',7,1),(5,'2023-04-04 16:19:09.247814','1','生鲜食品',2,'[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u5bfc\\u822a\"]}}]',7,1),(6,'2023-04-06 11:20:21.362318','12','新疆巴尔鲁克生鲜牛排眼肉牛扒1200g',2,'[{\"changed\": {\"fields\": [\"\\u5546\\u54c1\\u552f\\u4e00\\u8d27\\u53f7\", \"\\u5546\\u54c1\\u7b80\\u77ed\\u63cf\\u8ff0\", \"\\u5185\\u5bb9\"]}}]',6,1),(7,'2023-04-06 11:23:17.536774','51','稻园牌稻米油粮油米糠油绿色植物油',2,'[{\"changed\": {\"fields\": [\"\\u662f\\u5426\\u70ed\\u9500\"]}}]',6,1),(8,'2023-04-07 11:37:17.516030','1','新鲜水果甜蜜香脆单果约800克',1,'[{\"added\": {}}]',12,1),(9,'2023-04-07 11:37:27.725794','2','田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛',1,'[{\"added\": {}}]',12,1),(10,'2023-04-07 11:37:40.300590','3','酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐',1,'[{\"added\": {}}]',12,1),(11,'2023-04-07 14:47:19.183422','1','a',1,'[{\"added\": {}}]',11,1),(12,'2023-04-07 14:47:31.991095','2','b',1,'[{\"added\": {}}]',11,1),(13,'2023-04-07 14:47:52.880391','3','c',1,'[{\"added\": {}}]',11,1),(14,'2023-04-07 14:48:09.131868','4','d',1,'[{\"added\": {}}]',11,1),(15,'2023-04-07 14:48:31.424878','5','e',1,'[{\"added\": {}}]',11,1),(16,'2023-04-07 14:48:47.657904','6','ff',1,'[{\"added\": {}}]',11,1),(17,'2023-04-07 14:53:50.600411','1','新鲜水果甜蜜香脆单果约800克',1,'[{\"added\": {}}]',9,1),(18,'2023-04-07 14:54:26.046740','2','田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛',1,'[{\"added\": {}}]',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(21,'authtoken','token'),(22,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(12,'goods','banner'),(6,'goods','goods'),(7,'goods','goodscategory'),(11,'goods','goodscategorybrand'),(10,'goods','goodsimage'),(8,'goods','hotsearchwords'),(9,'goods','indexad'),(5,'sessions','session'),(13,'trade','ordergoods'),(14,'trade','orderinfo'),(15,'trade','shoppingcart'),(16,'user_operation','useraddress'),(17,'user_operation','userfav'),(18,'user_operation','userleavingmessage'),(20,'users','userprofile'),(19,'users','verifycode');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-04-03 08:57:03.668926'),(2,'contenttypes','0002_remove_content_type_name','2023-04-03 08:57:03.814516'),(3,'auth','0001_initial','2023-04-03 08:57:04.222573'),(4,'auth','0002_alter_permission_name_max_length','2023-04-03 08:57:04.292591'),(5,'auth','0003_alter_user_email_max_length','2023-04-03 08:57:04.303143'),(6,'auth','0004_alter_user_username_opts','2023-04-03 08:57:04.317376'),(7,'auth','0005_alter_user_last_login_null','2023-04-03 08:57:04.337376'),(8,'auth','0006_require_contenttypes_0002','2023-04-03 08:57:04.339819'),(9,'auth','0007_alter_validators_add_error_messages','2023-04-03 08:57:04.351770'),(10,'auth','0008_alter_user_username_max_length','2023-04-03 08:57:04.360180'),(11,'auth','0009_alter_user_last_name_max_length','2023-04-03 08:57:04.373367'),(12,'auth','0010_alter_group_name_max_length','2023-04-03 08:57:04.409545'),(13,'auth','0011_update_proxy_permissions','2023-04-03 08:57:04.444176'),(14,'auth','0012_alter_user_first_name_max_length','2023-04-03 08:57:04.459806'),(15,'users','0001_initial','2023-04-03 08:57:05.068295'),(16,'admin','0001_initial','2023-04-03 08:57:05.238533'),(17,'admin','0002_logentry_remove_auto_add','2023-04-03 08:57:05.250570'),(18,'admin','0003_logentry_add_action_flag_choices','2023-04-03 08:57:05.270203'),(19,'goods','0001_initial','2023-04-03 08:57:05.923457'),(20,'sessions','0001_initial','2023-04-03 08:57:05.970735'),(21,'trade','0001_initial','2023-04-03 08:57:06.116627'),(22,'trade','0002_initial','2023-04-03 08:57:06.387239'),(23,'user_operation','0001_initial','2023-04-03 08:57:06.473257'),(24,'user_operation','0002_initial','2023-04-03 08:57:06.779820'),(25,'authtoken','0001_initial','2023-04-04 16:53:10.201850'),(26,'authtoken','0002_auto_20160226_1747','2023-04-04 16:53:10.332536'),(27,'authtoken','0003_tokenproxy','2023-04-04 16:53:10.340437');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2hc96pmbe9mlngisqz6m9m3sai2joinz','.eJxVjDsOwjAQBe_iGlksdvyhpOcM1np3jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uzAnX43TLSQ9oG-I7tNmma2jKPWW-K3mnX14nledndv4OKvX5rJxS8iWhcMJIBvPgjFIskplC2ATgXIBgsRgcuMp-gSABPPLAvxar3B-xOOG0:1pjWzf:wT28BFumcebsjz44woIU6-sd5_b0nC1-LiXsX4dy9JQ','2023-04-18 11:05:59.347890'),('68qa15g23quljjgs8wrmxkopgux7pvvt','.eJxVi8EOwiAQRP-Fs2nApSx41A8hLCyhMWriFj2Y_nvbxIPe5s2b-aiY-txiF37GqaiTOqrDb0cpX_m-ix1leE38luHSZX7czl_3d2hJ2rYOwRlyzLWirx5D2VI2GaxGArAOkYt1xGDJu-IhBwO6jAkM6jGAVssKRogxzw:1pkKbk:RiKhWnGyH8hfPZii69n-CG9P09riYszdqpi2Lh7gW5g','2023-04-20 16:04:36.738295'),('aytaotjseug2xg6bj1xqqav4yir2etk6','.eJxVjDsOwjAQBe_iGlksdvyhpOcM1np3jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uzAnX43TLSQ9oG-I7tNmma2jKPWW-K3mnX14nledndv4OKvX5rJxS8iWhcMJIBvPgjFIskplC2ATgXIBgsRgcuMp-gSABPPLAvxar3B-xOOG0:1pjb1u:64gXS4AgzvWNyXI-LN0BAw1pR9SeKCifvmrgwyfuV2E','2023-04-18 15:24:34.630068'),('gd3cjlho4eck2tq4xp0gzdxx272f3k85','.eJxVi8EOwiAQRP-Fs2nApSx41A8hLCyhMWriFj2Y_nvbxIPe5s2b-aiY-txiF37GqaiTOqrDb0cpX_m-ix1leE38luHSZX7czl_3d2hJ2rYOwRlyzLWirx5D2VI2GaxGArAOkYt1xGDJu-IhBwO6jAkM6jGAVssKRogxzw:1pkJTP:sr5XA7tF0bQdx5zPP_-l_GsTGQ4SfuAOxpPkhj_O-54','2023-04-20 14:51:55.367634'),('hjfpgc8iv9yuej208s5j9vljkx8br7k2','.eJxVjDsOwjAQBe_iGlksdvyhpOcM1np3jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uzAnX43TLSQ9oG-I7tNmma2jKPWW-K3mnX14nledndv4OKvX5rJxS8iWhcMJIBvPgjFIskplC2ATgXIBgsRgcuMp-gSABPPLAvxar3B-xOOG0:1pjXeG:sKqHiH9eBwWqQlK_sLhJPuJQEvY9SJXMap2zQpI0pMM','2023-04-18 11:47:56.365738'),('lnerbivz6jsgmujkj8y2ky6q4olwn2mj','.eJxVizsOwjAQBe_iGkUsdvyhhINY6_3IEQIkHEOBcvcQiQLKefPmbTL2uebe5JEnNkcDZve7FaSL3DaxYRuek7zacO5tvl9PX_cXVGz18_ZCMdiE1kcrBSBI2IM6JLFKxUXgokAwOkwefGI-gEqEQDxyUHVmWQE_qTKq:1pkfqy:StK7EMmSSnEcC6zYgeXHRYaY_tkXlGRlk6pjnAW6jqc','2023-04-21 14:45:44.478216'),('qfn59e54xu9vwwl0lejoo88h3est7sfw','.eJxVizsOwjAQBe_iGkUsdvyhhINY6_3IEQIkHEOBcvcQiQLKefPmbTL2uebe5JEnNkcDZve7FaSL3DaxYRuek7zacO5tvl9PX_cXVGz18_ZCMdiE1kcrBSBI2IM6JLFKxUXgokAwOkwefGI-gEqEQDxyUHVmWQE_qTKq:1pkG63:TfZH7VEWdrx5IFPcr_TrebVHv4FEaErzt_UjptwxHRI','2023-04-20 11:15:35.234566'),('qyr9ydaogqezks2mzeyhhqb0vvma9eyp','.eJxVjDsOwjAQBe_iGlksdvyhpOcM1np3jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uzAnX43TLSQ9oG-I7tNmma2jKPWW-K3mnX14nledndv4OKvX5rJxS8iWhcMJIBvPgjFIskplC2ATgXIBgsRgcuMp-gSABPPLAvxar3B-xOOG0:1pjbq7:pdxl1kCtuKDHc_biC0lq-sOry15soAYrwpcFxJUN9bY','2023-04-18 16:16:27.889246'),('wczinhdqdx2qe2w3887l2lysfxq0qxcp','.eJxVizsOwjAQBe_iGkUsdvyhhINY6_3IEQIkHEOBcvcQiQLKefPmbTL2uebe5JEnNkcDZve7FaSL3DaxYRuek7zacO5tvl9PX_cXVGz18_ZCMdiE1kcrBSBI2IM6JLFKxUXgokAwOkwefGI-gEqEQDxyUHVmWQE_qTKq:1pkbW1:wBlKpoNOYrcdo9vMEl6n_2VUC54RsIGpQjKeDZbObGg','2023-04-21 10:07:49.964694'),('wgg93zlgawe6jvvcuc5nf2wym7i7qaok','.eJxVjDsOwjAQBe_iGlksdvyhpOcM1np3jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uzAnX43TLSQ9oG-I7tNmma2jKPWW-K3mnX14nledndv4OKvX5rJxS8iWhcMJIBvPgjFIskplC2ATgXIBgsRgcuMp-gSABPPLAvxar3B-xOOG0:1pjaFG:6QV-jUDDIsTLlkkIThkSX7LL9OUlmDzq3IElqqG6VNw','2023-04-18 14:34:18.119367');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_banner`
--

DROP TABLE IF EXISTS `goods_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_banner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `index` int NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_banner_goods_id_99e23129_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_banner_goods_id_99e23129_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_banner`
--

LOCK TABLES `goods_banner` WRITE;
/*!40000 ALTER TABLE `goods_banner` DISABLE KEYS */;
INSERT INTO `goods_banner` VALUES (1,'banner/banner1_gHESS7L.jpg',1,'2023-04-07 11:35:00.000000',1),(2,'banner/banner2_kbBRRvw.jpg',2,'2023-04-07 11:37:00.000000',2),(3,'banner/banner3_YvhggMp.jpg',3,'2023-04-07 11:37:00.000000',3);
/*!40000 ALTER TABLE `goods_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goods`
--

DROP TABLE IF EXISTS `goods_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_goods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goods_sn` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `click_num` int NOT NULL,
  `sold_num` int NOT NULL,
  `fav_num` int NOT NULL,
  `goods_num` int NOT NULL,
  `market_price` double NOT NULL,
  `shop_price` double NOT NULL,
  `goods_brief` longtext NOT NULL,
  `goods_desc` longtext NOT NULL,
  `ship_free` tinyint(1) NOT NULL,
  `goods_front_image` varchar(100) DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL,
  `is_hot` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` (`category_id`),
  CONSTRAINT `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goods`
--

LOCK TABLES `goods_goods` WRITE;
/*!40000 ALTER TABLE `goods_goods` DISABLE KEYS */;
INSERT INTO `goods_goods` VALUES (1,'','新鲜水果甜蜜香脆单果约800克',0,0,0,0,232,156,'食用百香果可以增加胃部饱腹感，减少余热量的摄入，还可以吸附胆固醇和胆汁之类有机分子，抑制人体对脂肪的吸收。因此，长期食用有利于改善人体营养吸收结构，降低体内脂肪，塑造健康优美体态。','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/1_P_1449024889889.jpg',0,0,'2023-04-04 10:22:59.001442',20),(2,'','田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛',0,0,0,0,106,88,'前腿+后腿+羊排共8斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/2_P_1448945810202.jpg',0,0,'2023-04-04 10:22:59.037498',7),(3,'','酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐',0,0,0,0,286,238,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/7_P_1448945104883.jpg',0,0,'2023-04-04 10:22:59.044887',15),(4,'','日本蒜蓉粉丝扇贝270克6只装',0,0,0,0,156,108,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/47_P_1448946213263.jpg',0,0,'2023-04-04 10:22:59.047846',20),(5,'','内蒙新鲜牛肉1斤清真生鲜牛肉火锅食材',0,0,0,0,106,88,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/10_P_1448944572085.jpg',0,0,'2023-04-04 10:22:59.051224',7),(6,'','乌拉圭进口牛肉卷特级肥牛卷',0,0,0,0,90,75,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/4_P_1448945381985.jpg',0,0,'2023-04-04 10:22:59.055464',21),(7,'','五星眼肉牛排套餐8片装原味原切生鲜牛肉',0,0,0,0,150,125,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/8_P_1448945032810.jpg',0,0,'2023-04-04 10:22:59.059200',23),(8,'','澳洲进口120天谷饲牛仔骨4份原味生鲜',0,0,0,0,31,26,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/11_P_1448944388277.jpg',0,0,'2023-04-04 10:22:59.063895',7),(9,'','潮香村澳洲进口牛排家庭团购套餐20片',0,0,0,0,239,199,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/6_P_1448945167279.jpg',0,0,'2023-04-04 10:22:59.071442',22),(10,'','爱食派内蒙古呼伦贝尔冷冻生鲜牛腱子肉1000g',0,0,0,0,202,168,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/9_P_1448944791617.jpg',0,0,'2023-04-04 10:22:59.077674',20),(11,'','澳洲进口牛尾巴300g新鲜肥牛肉',0,0,0,0,306,255,'新鲜羊羔肉整只共15斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/3_P_1448945490837.jpg',0,0,'2023-04-04 10:22:59.082606',2),(12,'xxxx111','新疆巴尔鲁克生鲜牛排眼肉牛扒1200g',0,0,0,0,126,88,'dfafda','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><br/></p><p>这里实际是肉，不是梨，梨是随便放的</p>',1,'goods/images/48_P_1448943988970.jpg',0,0,'2023-04-04 10:22:00.000000',7),(13,'','澳洲进口安格斯牛切片上脑牛排1000g',0,0,0,0,144,120,'澳大利亚是国际公认的没有疯牛病和口蹄疫的国家。为了保持澳大利亚产品的高标准，澳大利亚牛肉业和各级政府共同努力简历了严格的标准和体系，以保证生产的整体化和产品的可追溯性','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/5_P_1448945270390.jpg',0,0,'2023-04-04 10:22:59.092338',12),(14,'','帐篷出租',0,0,0,0,120,100,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'images/201705/goods_img/53_P_1495068879687.jpg',0,0,'2023-04-04 10:22:59.096383',21),(15,'','52度茅台集团国隆双喜酒500mlx6',0,0,0,0,23,19,'贵州茅台酒厂（集团）保健酒业有限公司生产，是以“龙”字打头的酒水。中国龙文化上下8000年，源远而流长，龙的形象是一种符号、一种意绪、一种血肉相联的情感。','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/16_P_1448947194687.jpg',0,0,'2023-04-04 10:22:59.099930',37),(16,'','52度水井坊臻酿八號500ml',0,0,0,0,43,36,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/14_P_1448947354031.jpg',0,0,'2023-04-04 10:22:59.103243',36),(17,'','53度茅台仁酒500ml',0,0,0,0,190,158,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/12_P_1448947547989.jpg',0,0,'2023-04-04 10:22:59.108596',32),(18,'','双响炮洋酒JimBeamwhiskey美国白占边',0,0,0,0,38,28,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/46_P_1448946598711.jpg',0,0,'2023-04-04 10:22:59.116065',29),(19,'','西夫拉姆进口洋酒小酒版',0,0,0,0,55,46,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/21_P_1448946793276.jpg',0,0,'2023-04-04 10:22:59.124943',36),(20,'','茅台53度飞天茅台500ml',0,0,0,0,22,18,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/15_P_1448947257324.jpg',0,0,'2023-04-04 10:22:59.139751',30),(21,'','52度兰陵·紫气东来1600mL山东名酒',0,0,0,0,42,35,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/13_P_1448947460386.jpg',0,0,'2023-04-04 10:22:59.144751',29),(22,'','JohnnieWalker尊尼获加黑牌威士忌',0,0,0,0,24,20,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/50_P_1448946543091.jpg',0,0,'2023-04-04 10:22:59.148938',36),(23,'','人头马CLUB特优香槟干邑350ml',0,0,0,0,31,26,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/51_P_1448946466595.jpg',0,0,'2023-04-04 10:22:59.152649',30),(24,'','张裕干红葡萄酒750ml*6支',0,0,0,0,54,45,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/17_P_1448947102246.jpg',0,0,'2023-04-04 10:22:59.155976',31),(25,'','原瓶原装进口洋酒烈酒法国云鹿XO白兰地',0,0,0,0,46,38,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/20_P_1448946850602.jpg',0,0,'2023-04-04 10:22:59.158886',29),(26,'','法国原装进口圣贝克干红葡萄酒750ml',0,0,0,0,82,68,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/19_P_1448946951581.jpg',0,0,'2023-04-04 10:22:59.166058',25),(27,'','法国百利威干红葡萄酒AOP级6支装',0,0,0,0,67,56,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/18_P_1448947011435.jpg',0,0,'2023-04-04 10:22:59.172144',25),(28,'','芝华士12年苏格兰威士忌700ml',0,0,0,0,71,59,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/22_P_1448946729629.jpg',0,0,'2023-04-04 10:22:59.180050',30),(29,'','深蓝伏特加巴维兰利口酒送预调酒',0,0,0,0,31,18,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/45_P_1448946661303.jpg',0,0,'2023-04-04 10:22:59.183022',36),(30,'','赣南脐橙特级果10斤装',0,0,0,0,43,36,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/32_P_1448948525620.jpg',0,0,'2023-04-04 10:22:59.188990',62),(31,'','泰国菠萝蜜16-18斤1个装',0,0,0,0,11,9,'【懒人吃法】菠萝蜜果肉，冰袋保鲜，收货就吃，冰爽Q脆甜，2斤装，全国顺丰空运包邮，发出后48小时内可达，一线城市基本隔天可达','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/30_P_1448948663450.jpg',0,0,'2023-04-04 10:22:59.198487',66),(32,'','四川双流草莓新鲜水果礼盒2盒',0,0,0,0,22,18,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/31_P_1448948598947.jpg',0,0,'2023-04-04 10:22:59.204473',70),(33,'','新鲜头茬非洲冰草冰菜',0,0,0,0,67,56,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/35_P_1448948333610.jpg',0,0,'2023-04-04 10:22:59.208735',58),(34,'','仿真蔬菜水果果蔬菜模型',0,0,0,0,6,5,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/36_P_1448948234405.jpg',0,0,'2023-04-04 10:22:59.218421',58),(35,'','现摘芭乐番石榴台湾珍珠芭乐',0,0,0,0,28,23,'海南产精品释迦果,\n        释迦是水果中的贵族,\n        产量少,\n        味道很甜,\n        奶香十足,\n        非常可口,\n        果裹果园顺丰空运,\n        保证新鲜.果子个大,\n        一斤1-2个左右,\n        大个头的果子更尽兴!\n        ','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/33_P_1448948479966.jpg',0,0,'2023-04-04 10:22:59.230771',62),(36,'','潍坊萝卜5斤/箱礼盒',0,0,0,0,46,38,'脐橙规格是65-90MM左右（标准果果径平均70MM左右，精品果果径平均80MM左右），一斤大概有2-4个左右，脐橙产自江西省赣州市信丰县安西镇，全过程都是采用农家有机肥种植，生态天然','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/34_P_1448948399009.jpg',0,0,'2023-04-04 10:22:59.235233',70),(37,'','休闲零食膨化食品焦糖/奶油/椒麻味',0,0,0,0,154,99,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/43_P_1448948762645.jpg',0,0,'2023-04-04 10:22:59.237986',74),(38,'','蒙牛未来星儿童成长牛奶骨力型190ml*15盒',0,0,0,0,84,70,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/38_P_1448949220255.jpg',0,0,'2023-04-04 10:22:59.242152',105),(39,'','蒙牛特仑苏有机奶250ml×12盒',0,0,0,0,70,32,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/44_P_1448948850187.jpg',0,0,'2023-04-04 10:22:59.244899',103),(40,'','1元支付测试商品',0,0,0,0,1,1,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'images/201511/goods_img/49_P_1448162819889.jpg',0,0,'2023-04-04 10:22:59.248034',102),(41,'','德运全脂新鲜纯牛奶1L*10盒装整箱',0,0,0,0,70,58,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/40_P_1448949038702.jpg',0,0,'2023-04-04 10:22:59.251294',103),(42,'','木糖醇红枣早餐奶即食豆奶粉538g',0,0,0,0,38,32,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/39_P_1448949115481.jpg',0,0,'2023-04-04 10:22:59.261009',106),(43,'','高钙液体奶200ml*24盒',0,0,0,0,26,22,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/41_P_1448948980358.jpg',0,0,'2023-04-04 10:22:59.270637',107),(44,'','新西兰进口全脂奶粉900g',0,0,0,0,720,600,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/37_P_1448949284365.jpg',0,0,'2023-04-04 10:22:59.278508',104),(45,'','伊利官方直营全脂营养舒化奶250ml*12盒*2提',0,0,0,0,43,36,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/42_P_1448948895193.jpg',0,0,'2023-04-04 10:22:59.283326',103),(46,'','维纳斯橄榄菜籽油5L/桶',0,0,0,0,187,156,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/27_P_1448947771805.jpg',0,0,'2023-04-04 10:22:59.287214',51),(47,'','糙米450gx3包粮油米面',0,0,0,0,18,15,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/23_P_1448948070348.jpg',0,0,'2023-04-04 10:22:59.290144',41),(48,'','精炼一级大豆油5L色拉油粮油食用油',0,0,0,0,54,45,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/26_P_1448947825754.jpg',0,0,'2023-04-04 10:22:59.292448',56),(49,'','橄榄玉米油5L*2桶',0,0,0,0,31,26,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/28_P_1448947699948.jpg',0,0,'2023-04-04 10:22:59.294749',54),(50,'','山西黑米农家黑米4斤',0,0,0,0,11,9,'','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/24_P_1448948023823.jpg',0,0,'2023-04-04 10:22:59.297428',55),(51,'dfa','稻园牌稻米油粮油米糠油绿色植物油',0,0,0,0,14,12,'fdafa','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/25_P_1448947875346.jpg',1,0,'2023-04-04 10:22:00.000000',47),(52,'dfafa','融氏纯玉米胚芽油5l桶',0,0,0,0,14,12,'这是一个梨','<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>',1,'goods/images/29_P_1448947631994.jpg',1,1,'2023-04-04 10:22:00.000000',41);
/*!40000 ALTER TABLE `goods_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goodsbrand`
--

DROP TABLE IF EXISTS `goods_goodsbrand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_goodsbrand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `desc` longtext NOT NULL,
  `image` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsbrand_category_id_6fc84a73_fk_goods_goodscategory_id` (`category_id`),
  CONSTRAINT `goods_goodsbrand_category_id_6fc84a73_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goodsbrand`
--

LOCK TABLES `goods_goodsbrand` WRITE;
/*!40000 ALTER TABLE `goods_goodsbrand` DISABLE KEYS */;
INSERT INTO `goods_goodsbrand` VALUES (1,'a','aaaaaaa','brands/lyfs-1_rvn9HS0.jpg','2023-04-07 14:46:00.000000',1),(2,'b','bbbbbbb','brands/scsg-2_QlxfmSc.jpg','2023-04-07 14:47:00.000000',1),(3,'c','cccccccc','brands/scsg-3_3RoZrPF.jpg','2023-04-07 14:47:00.000000',1),(4,'d','dddddddddddddd','brands/sxsp-1_EvOVymc.jpg','2023-04-07 14:47:00.000000',24),(5,'e','eeeee','brands/sxsp-2_gmz7IPy.jpg','2023-04-07 14:48:00.000000',24),(6,'ff','fffffffffffffffff','brands/sxsp-3_VgAoiZx.jpg','2023-04-07 14:48:00.000000',24);
/*!40000 ALTER TABLE `goods_goodsbrand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goodscategory`
--

DROP TABLE IF EXISTS `goods_goodscategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_goodscategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `code` varchar(30) NOT NULL,
  `desc` longtext NOT NULL,
  `category_type` int NOT NULL,
  `is_tab` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `parent_category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodscategory_parent_category_id_ccec2509_fk_goods_goo` (`parent_category_id`),
  CONSTRAINT `goods_goodscategory_parent_category_id_ccec2509_fk_goods_goo` FOREIGN KEY (`parent_category_id`) REFERENCES `goods_goodscategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goodscategory`
--

LOCK TABLES `goods_goodscategory` WRITE;
/*!40000 ALTER TABLE `goods_goodscategory` DISABLE KEYS */;
INSERT INTO `goods_goodscategory` VALUES (1,'生鲜食品','sxsp','',1,1,'2023-04-04 10:22:39.524413',NULL),(2,'精品肉类','jprl','',2,0,'2023-04-04 10:22:39.544919',1),(3,'羊肉','yr','',3,0,'2023-04-04 10:22:39.561957',2),(4,'禽类','ql','',3,0,'2023-04-04 10:22:39.563027',2),(5,'猪肉','zr','',3,0,'2023-04-04 10:22:39.564158',2),(6,'牛肉','nr','',3,0,'2023-04-04 10:22:39.566941',2),(7,'海鲜水产','hxsc','',2,0,'2023-04-04 10:22:39.570066',1),(8,'参鲍','cb','',3,0,'2023-04-04 10:22:39.571917',7),(9,'鱼','yu','',3,0,'2023-04-04 10:22:39.573104',7),(10,'虾','xia','',3,0,'2023-04-04 10:22:39.573789',7),(11,'蟹/贝','xb','',3,0,'2023-04-04 10:22:39.574347',7),(12,'蛋制品','dzp','',2,0,'2023-04-04 10:22:39.575003',1),(13,'松花蛋/咸鸭蛋','xhd_xyd','',3,0,'2023-04-04 10:22:39.575535',12),(14,'鸡蛋','jd','',3,0,'2023-04-04 10:22:39.579270',12),(15,'叶菜类','ycl','',2,0,'2023-04-04 10:22:39.580239',1),(16,'生菜','sc','',3,0,'2023-04-04 10:22:39.581450',15),(17,'菠菜','bc','',3,0,'2023-04-04 10:22:39.582240',15),(18,'圆椒','yj','',3,0,'2023-04-04 10:22:39.583149',15),(19,'西兰花','xlh','',3,0,'2023-04-04 10:22:39.593842',15),(20,'根茎类','gjl','',2,0,'2023-04-04 10:22:39.595136',1),(21,'茄果类','qgl','',2,0,'2023-04-04 10:22:39.596137',1),(22,'菌菇类','jgl','',2,0,'2023-04-04 10:22:39.600136',1),(23,'进口生鲜','jksx','',2,0,'2023-04-04 10:22:39.606044',1),(24,'酒水饮料','jsyl','',1,1,'2023-04-04 10:22:39.607676',NULL),(25,'白酒','bk','',2,0,'2023-04-04 10:22:39.609142',24),(26,'五粮液','wly','',3,0,'2023-04-04 10:22:39.610621',25),(27,'泸州老窖','lzlj','',3,0,'2023-04-04 10:22:39.613002',25),(28,'茅台','mt','',3,0,'2023-04-04 10:22:39.619625',25),(29,'葡萄酒','ptj','',2,0,'2023-04-04 10:22:39.626455',24),(30,'洋酒','yj','',2,0,'2023-04-04 10:22:39.628855',24),(31,'啤酒','pj','',2,0,'2023-04-04 10:22:39.633867',24),(32,'其他酒品','qtjp','',2,0,'2023-04-04 10:22:39.638876',24),(33,'其他品牌','qtpp','',3,0,'2023-04-04 10:22:39.641215',32),(34,'黄酒','hj','',3,0,'2023-04-04 10:22:39.644972',32),(35,'养生酒','ysj','',3,0,'2023-04-04 10:22:39.646097',32),(36,'饮料/水','yls','',2,0,'2023-04-04 10:22:39.649146',24),(37,'红酒','hj','',2,0,'2023-04-04 10:22:39.650552',24),(38,'白兰地','bld','',3,0,'2023-04-04 10:22:39.651695',37),(39,'威士忌','wsj','',3,0,'2023-04-04 10:22:39.655086',37),(40,'粮油副食','粮油副食','',1,0,'2023-04-04 10:22:39.657240',NULL),(41,'食用油','食用油','',2,0,'2023-04-04 10:22:39.658218',40),(42,'其他食用油','其他食用油','',3,0,'2023-04-04 10:22:39.663028',41),(43,'菜仔油','菜仔油','',3,0,'2023-04-04 10:22:39.668257',41),(44,'花生油','花生油','',3,0,'2023-04-04 10:22:39.671098',41),(45,'橄榄油','橄榄油','',3,0,'2023-04-04 10:22:39.674962',41),(46,'礼盒','礼盒','',3,0,'2023-04-04 10:22:39.676206',41),(47,'米面杂粮','米面杂粮','',2,0,'2023-04-04 10:22:39.681799',40),(48,'面粉/面条','面粉/面条','',3,0,'2023-04-04 10:22:39.683876',47),(49,'大米','大米','',3,0,'2023-04-04 10:22:39.684873',47),(50,'意大利面','意大利面','',3,0,'2023-04-04 10:22:39.685483',47),(51,'厨房调料','厨房调料','',2,0,'2023-04-04 10:22:39.686807',40),(52,'调味油/汁','调味油/汁','',3,0,'2023-04-04 10:22:39.687414',51),(53,'酱油/醋','酱油/醋','',3,0,'2023-04-04 10:22:39.687963',51),(54,'南北干货','南北干货','',2,0,'2023-04-04 10:22:39.689853',40),(55,'方便速食','方便速食','',2,0,'2023-04-04 10:22:39.690747',40),(56,'调味品','调味品','',2,0,'2023-04-04 10:22:39.691377',40),(57,'蔬菜水果','蔬菜水果','',1,0,'2023-04-04 10:22:39.692874',NULL),(58,'有机蔬菜','有机蔬菜','',2,0,'2023-04-04 10:22:39.693760',57),(59,'西红柿','西红柿','',3,0,'2023-04-04 10:22:39.694324',58),(60,'韭菜','韭菜','',3,0,'2023-04-04 10:22:39.697745',58),(61,'青菜','青菜','',3,0,'2023-04-04 10:22:39.699471',58),(62,'精选蔬菜','精选蔬菜','',2,0,'2023-04-04 10:22:39.701971',57),(63,'甘蓝','甘蓝','',3,0,'2023-04-04 10:22:39.703460',62),(64,'胡萝卜','胡萝卜','',3,0,'2023-04-04 10:22:39.708956',62),(65,'黄瓜','黄瓜','',3,0,'2023-04-04 10:22:39.711178',62),(66,'进口水果','进口水果','',2,0,'2023-04-04 10:22:39.714551',57),(67,'火龙果','火龙果','',3,0,'2023-04-04 10:22:39.715804',66),(68,'菠萝蜜','菠萝蜜','',3,0,'2023-04-04 10:22:39.716432',66),(69,'奇异果','奇异果','',3,0,'2023-04-04 10:22:39.722442',66),(70,'国产水果','国产水果','',2,0,'2023-04-04 10:22:39.724265',57),(71,'水果礼盒','水果礼盒','',3,0,'2023-04-04 10:22:39.725869',70),(72,'苹果','苹果','',3,0,'2023-04-04 10:22:39.726894',70),(73,'雪梨','雪梨','',3,0,'2023-04-04 10:22:39.727909',70),(74,'休闲食品','休闲食品','',1,0,'2023-04-04 10:22:39.730316',NULL),(75,'休闲零食','休闲零食','',2,0,'2023-04-04 10:22:39.731962',74),(76,'果冻','果冻','',3,0,'2023-04-04 10:22:39.735305',75),(77,'枣类','枣类','',3,0,'2023-04-04 10:22:39.738541',75),(78,'蜜饯','蜜饯','',3,0,'2023-04-04 10:22:39.739704',75),(79,'肉类零食','肉类零食','',3,0,'2023-04-04 10:22:39.740853',75),(80,'坚果炒货','坚果炒货','',3,0,'2023-04-04 10:22:39.743133',75),(81,'糖果','糖果','',2,0,'2023-04-04 10:22:39.743979',74),(82,'创意喜糖','创意喜糖','',3,0,'2023-04-04 10:22:39.744578',81),(83,'口香糖','口香糖','',3,0,'2023-04-04 10:22:39.745855',81),(84,'软糖','软糖','',3,0,'2023-04-04 10:22:39.747803',81),(85,'棒棒糖','棒棒糖','',3,0,'2023-04-04 10:22:39.749044',81),(86,'巧克力','巧克力','',2,0,'2023-04-04 10:22:39.750938',74),(87,'夹心巧克力','夹心巧克力','',3,0,'2023-04-04 10:22:39.752426',86),(88,'白巧克力','白巧克力','',3,0,'2023-04-04 10:22:39.753763',86),(89,'松露巧克力','松露巧克力','',3,0,'2023-04-04 10:22:39.754893',86),(90,'黑巧克力','黑巧克力','',3,0,'2023-04-04 10:22:39.758242',86),(91,'肉干肉脯/豆干','肉干肉脯/豆干','',2,0,'2023-04-04 10:22:39.763103',74),(92,'牛肉干','牛肉干','',3,0,'2023-04-04 10:22:39.766025',91),(93,'猪肉脯','猪肉脯','',3,0,'2023-04-04 10:22:39.769391',91),(94,'牛肉粒','牛肉粒','',3,0,'2023-04-04 10:22:39.775994',91),(95,'猪肉干','猪肉干','',3,0,'2023-04-04 10:22:39.776634',91),(96,'鱿鱼丝/鱼干','鱿鱼丝/鱼干','',2,0,'2023-04-04 10:22:39.777490',74),(97,'鱿鱼足','鱿鱼足','',3,0,'2023-04-04 10:22:39.778192',96),(98,'鱿鱼丝','鱿鱼丝','',3,0,'2023-04-04 10:22:39.778880',96),(99,'墨鱼/乌贼','墨鱼/乌贼','',3,0,'2023-04-04 10:22:39.780033',96),(100,'鱿鱼仔','鱿鱼仔','',3,0,'2023-04-04 10:22:39.781078',96),(101,'鱿鱼片','鱿鱼片','',3,0,'2023-04-04 10:22:39.782791',96),(102,'奶类食品','奶类食品','',1,0,'2023-04-04 10:22:39.783368',NULL),(103,'进口奶品','进口奶品','',2,0,'2023-04-04 10:22:39.783972',102),(104,'国产奶品','国产奶品','',2,0,'2023-04-04 10:22:39.784786',102),(105,'奶粉','奶粉','',2,0,'2023-04-04 10:22:39.787072',102),(106,'有机奶','有机奶','',2,0,'2023-04-04 10:22:39.787702',102),(107,'原料奶','原料奶','',2,0,'2023-04-04 10:22:39.788260',102),(108,'天然干货','天然干货','',1,0,'2023-04-04 10:22:39.789130',NULL),(109,'菌菇类','菌菇类','',2,0,'2023-04-04 10:22:39.789695',108),(110,'腌干海产','腌干海产','',2,0,'2023-04-04 10:22:39.791763',108),(111,'汤料','汤料','',2,0,'2023-04-04 10:22:39.792456',108),(112,'豆类','豆类','',2,0,'2023-04-04 10:22:39.795211',108),(113,'干菜/菜干','干菜/菜干','',2,0,'2023-04-04 10:22:39.795831',108),(114,'干果/果干','干果/果干','',2,0,'2023-04-04 10:22:39.796455',108),(115,'豆制品','豆制品','',2,0,'2023-04-04 10:22:39.797449',108),(116,'腊味','腊味','',2,0,'2023-04-04 10:22:39.798055',108),(117,'精选茗茶','精选茗茶','',1,0,'2023-04-04 10:22:39.798731',NULL),(118,'白茶','白茶','',2,0,'2023-04-04 10:22:39.800929',117),(119,'红茶','红茶','',2,0,'2023-04-04 10:22:39.802135',117),(120,'绿茶','绿茶','',2,0,'2023-04-04 10:22:39.802911',117);
/*!40000 ALTER TABLE `goods_goodscategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goodsimage`
--

DROP TABLE IF EXISTS `goods_goodsimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_goodsimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goodsimage`
--

LOCK TABLES `goods_goodsimage` WRITE;
/*!40000 ALTER TABLE `goods_goodsimage` DISABLE KEYS */;
INSERT INTO `goods_goodsimage` VALUES (1,'goods/images/1_P_1449024889889.jpg','2023-04-04 10:22:59.024538',1),(2,'goods/images/1_P_1449024889264.jpg','2023-04-04 10:22:59.027832',1),(3,'goods/images/1_P_1449024889726.jpg','2023-04-04 10:22:59.033736',1),(4,'goods/images/1_P_1449024889018.jpg','2023-04-04 10:22:59.034653',1),(5,'goods/images/1_P_1449024889287.jpg','2023-04-04 10:22:59.035734',1),(6,'goods/images/2_P_1448945810202.jpg','2023-04-04 10:22:59.043537',2),(7,'goods/images/2_P_1448945810814.jpg','2023-04-04 10:22:59.044334',2),(8,'goods/images/7_P_1448945104883.jpg','2023-04-04 10:22:59.046727',3),(9,'goods/images/7_P_1448945104734.jpg','2023-04-04 10:22:59.047325',3),(10,'goods/images/47_P_1448946213263.jpg','2023-04-04 10:22:59.050001',4),(11,'goods/images/47_P_1448946213157.jpg','2023-04-04 10:22:59.050647',4),(12,'goods/images/10_P_1448944572085.jpg','2023-04-04 10:22:59.053452',5),(13,'goods/images/10_P_1448944572532.jpg','2023-04-04 10:22:59.054124',5),(14,'goods/images/10_P_1448944572872.jpg','2023-04-04 10:22:59.054751',5),(15,'goods/images/4_P_1448945381985.jpg','2023-04-04 10:22:59.057468',6),(16,'goods/images/4_P_1448945381013.jpg','2023-04-04 10:22:59.058145',6),(17,'goods/images/8_P_1448945032810.jpg','2023-04-04 10:22:59.062251',7),(18,'goods/images/8_P_1448945032646.jpg','2023-04-04 10:22:59.062952',7),(19,'goods/images/11_P_1448944388277.jpg','2023-04-04 10:22:59.067265',8),(20,'goods/images/11_P_1448944388034.jpg','2023-04-04 10:22:59.068668',8),(21,'goods/images/11_P_1448944388201.jpg','2023-04-04 10:22:59.070237',8),(22,'goods/images/6_P_1448945167279.jpg','2023-04-04 10:22:59.075247',9),(23,'goods/images/6_P_1448945167015.jpg','2023-04-04 10:22:59.076718',9),(24,'goods/images/9_P_1448944791617.jpg','2023-04-04 10:22:59.079704',10),(25,'goods/images/9_P_1448944791129.jpg','2023-04-04 10:22:59.080326',10),(26,'goods/images/9_P_1448944791077.jpg','2023-04-04 10:22:59.081276',10),(27,'goods/images/9_P_1448944791229.jpg','2023-04-04 10:22:59.081911',10),(28,'goods/images/3_P_1448945490837.jpg','2023-04-04 10:22:59.086267',11),(29,'goods/images/3_P_1448945490084.jpg','2023-04-04 10:22:59.087491',11),(30,'goods/images/48_P_1448943988970.jpg','2023-04-04 10:22:59.090284',12),(31,'goods/images/48_P_1448943988898.jpg','2023-04-04 10:22:59.091081',12),(32,'goods/images/48_P_1448943988439.jpg','2023-04-04 10:22:59.091706',12),(33,'goods/images/5_P_1448945270390.jpg','2023-04-04 10:22:59.094680',13),(34,'goods/images/5_P_1448945270067.jpg','2023-04-04 10:22:59.095324',13),(35,'goods/images/5_P_1448945270432.jpg','2023-04-04 10:22:59.095847',13),(36,'images/201705/goods_img/53_P_1495068879687.jpg','2023-04-04 10:22:59.099207',14),(37,'goods/images/16_P_1448947194687.jpg','2023-04-04 10:22:59.102066',15),(38,'goods/images/14_P_1448947354031.jpg','2023-04-04 10:22:59.106470',16),(39,'goods/images/14_P_1448947354433.jpg','2023-04-04 10:22:59.107799',16),(40,'goods/images/12_P_1448947547989.jpg','2023-04-04 10:22:59.111453',17),(41,'goods/images/46_P_1448946598711.jpg','2023-04-04 10:22:59.120570',18),(42,'goods/images/46_P_1448946598301.jpg','2023-04-04 10:22:59.122807',18),(43,'goods/images/21_P_1448946793276.jpg','2023-04-04 10:22:59.130144',19),(44,'goods/images/21_P_1448946793153.jpg','2023-04-04 10:22:59.137956',19),(45,'goods/images/15_P_1448947257324.jpg','2023-04-04 10:22:59.142690',20),(46,'goods/images/15_P_1448947257580.jpg','2023-04-04 10:22:59.143838',20),(47,'goods/images/13_P_1448947460386.jpg','2023-04-04 10:22:59.147054',21),(48,'goods/images/13_P_1448947460276.jpg','2023-04-04 10:22:59.147662',21),(49,'goods/images/13_P_1448947460353.jpg','2023-04-04 10:22:59.148158',21),(50,'goods/images/50_P_1448946543091.jpg','2023-04-04 10:22:59.150995',22),(51,'goods/images/50_P_1448946542182.jpg','2023-04-04 10:22:59.151643',22),(52,'goods/images/51_P_1448946466595.jpg','2023-04-04 10:22:59.154664',23),(53,'goods/images/51_P_1448946466208.jpg','2023-04-04 10:22:59.155200',23),(54,'goods/images/17_P_1448947102246.jpg','2023-04-04 10:22:59.158128',24),(55,'goods/images/20_P_1448946850602.jpg','2023-04-04 10:22:59.163200',25),(56,'goods/images/19_P_1448946951581.jpg','2023-04-04 10:22:59.170023',26),(57,'goods/images/19_P_1448946951726.jpg','2023-04-04 10:22:59.171313',26),(58,'goods/images/18_P_1448947011435.jpg','2023-04-04 10:22:59.179359',27),(59,'goods/images/22_P_1448946729629.jpg','2023-04-04 10:22:59.182187',28),(60,'goods/images/45_P_1448946661303.jpg','2023-04-04 10:22:59.186439',29),(61,'goods/images/32_P_1448948525620.jpg','2023-04-04 10:22:59.196950',30),(62,'goods/images/30_P_1448948663450.jpg','2023-04-04 10:22:59.201854',31),(63,'goods/images/30_P_1448948662571.jpg','2023-04-04 10:22:59.202716',31),(64,'goods/images/30_P_1448948663221.jpg','2023-04-04 10:22:59.203770',31),(65,'goods/images/31_P_1448948598947.jpg','2023-04-04 10:22:59.206791',32),(66,'goods/images/31_P_1448948598475.jpg','2023-04-04 10:22:59.207768',32),(67,'goods/images/35_P_1448948333610.jpg','2023-04-04 10:22:59.213724',33),(68,'goods/images/35_P_1448948333313.jpg','2023-04-04 10:22:59.215015',33),(69,'goods/images/36_P_1448948234405.jpg','2023-04-04 10:22:59.229291',34),(70,'goods/images/36_P_1448948234250.jpg','2023-04-04 10:22:59.230244',34),(71,'goods/images/33_P_1448948479966.jpg','2023-04-04 10:22:59.233465',35),(72,'goods/images/33_P_1448948479886.jpg','2023-04-04 10:22:59.234309',35),(73,'goods/images/34_P_1448948399009.jpg','2023-04-04 10:22:59.237338',36),(74,'goods/images/43_P_1448948762645.jpg','2023-04-04 10:22:59.241105',37),(75,'goods/images/38_P_1448949220255.jpg','2023-04-04 10:22:59.244288',38),(76,'goods/images/44_P_1448948850187.jpg','2023-04-04 10:22:59.247005',39),(77,'images/201511/goods_img/49_P_1448162819889.jpg','2023-04-04 10:22:59.250366',40),(78,'goods/images/40_P_1448949038702.jpg','2023-04-04 10:22:59.257871',41),(79,'goods/images/39_P_1448949115481.jpg','2023-04-04 10:22:59.265770',42),(80,'goods/images/41_P_1448948980358.jpg','2023-04-04 10:22:59.276146',43),(81,'goods/images/37_P_1448949284365.jpg','2023-04-04 10:22:59.282139',44),(82,'goods/images/42_P_1448948895193.jpg','2023-04-04 10:22:59.286339',45),(83,'goods/images/27_P_1448947771805.jpg','2023-04-04 10:22:59.289499',46),(84,'goods/images/23_P_1448948070348.jpg','2023-04-04 10:22:59.291776',47),(85,'goods/images/26_P_1448947825754.jpg','2023-04-04 10:22:59.294181',48),(86,'goods/images/28_P_1448947699948.jpg','2023-04-04 10:22:59.296129',49),(87,'goods/images/28_P_1448947699777.jpg','2023-04-04 10:22:59.296884',49),(88,'goods/images/24_P_1448948023823.jpg','2023-04-04 10:22:59.299949',50),(89,'goods/images/24_P_1448948023977.jpg','2023-04-04 10:22:59.301287',50),(90,'goods/images/25_P_1448947875346.jpg','2023-04-04 10:22:59.307973',51),(91,'goods/images/29_P_1448947631994.jpg','2023-04-04 10:22:59.319548',52);
/*!40000 ALTER TABLE `goods_goodsimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_hotsearchwords`
--

DROP TABLE IF EXISTS `goods_hotsearchwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_hotsearchwords` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `keywords` varchar(20) NOT NULL,
  `index` int NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_hotsearchwords`
--

LOCK TABLES `goods_hotsearchwords` WRITE;
/*!40000 ALTER TABLE `goods_hotsearchwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_hotsearchwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_indexad`
--

DROP TABLE IF EXISTS `goods_indexad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_indexad` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_id` bigint NOT NULL,
  `goods_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_indexad_category_id_cf834e34_fk_goods_goodscategory_id` (`category_id`),
  KEY `goods_indexad_goods_id_e1361e4f_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `goods_indexad_category_id_cf834e34_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`),
  CONSTRAINT `goods_indexad_goods_id_e1361e4f_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_indexad`
--

LOCK TABLES `goods_indexad` WRITE;
/*!40000 ALTER TABLE `goods_indexad` DISABLE KEYS */;
INSERT INTO `goods_indexad` VALUES (1,1,1),(2,24,2);
/*!40000 ALTER TABLE `goods_indexad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade_ordergoods`
--

DROP TABLE IF EXISTS `trade_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trade_ordergoods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goods_num` int NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` (`goods_id`),
  KEY `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` (`order_id`),
  CONSTRAINT `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` FOREIGN KEY (`order_id`) REFERENCES `trade_orderinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade_ordergoods`
--

LOCK TABLES `trade_ordergoods` WRITE;
/*!40000 ALTER TABLE `trade_ordergoods` DISABLE KEYS */;
INSERT INTO `trade_ordergoods` VALUES (3,1,'2023-04-07 11:17:38.156501',11,2),(4,1,'2023-04-07 11:17:38.210896',13,2);
/*!40000 ALTER TABLE `trade_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade_orderinfo`
--

DROP TABLE IF EXISTS `trade_orderinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trade_orderinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(30) DEFAULT NULL,
  `trade_no` varchar(100) DEFAULT NULL,
  `pay_status` varchar(30) NOT NULL,
  `post_script` varchar(200) NOT NULL,
  `order_mount` double NOT NULL,
  `pay_time` datetime(6) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `signer_name` varchar(20) NOT NULL,
  `singer_mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  UNIQUE KEY `trade_no` (`trade_no`),
  KEY `trade_orderinfo_user_id_08ffa22c_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `trade_orderinfo_user_id_08ffa22c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade_orderinfo`
--

LOCK TABLES `trade_orderinfo` WRITE;
/*!40000 ALTER TABLE `trade_orderinfo` DISABLE KEYS */;
INSERT INTO `trade_orderinfo` VALUES (2,'20230407111738122',NULL,'paying','aaa',200,NULL,'横岗街道迪声培训','龙哥','18948796072','2023-04-07 11:17:38.137900',1);
/*!40000 ALTER TABLE `trade_orderinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade_shoppingcart`
--

DROP TABLE IF EXISTS `trade_shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trade_shoppingcart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nums` int NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `goods_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trade_shoppingcart_user_id_goods_id_92225e66_uniq` (`user_id`,`goods_id`),
  KEY `trade_shoppingcart_goods_id_8b0f3cb4_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `trade_shoppingcart_goods_id_8b0f3cb4_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `trade_shoppingcart_user_id_da423c9c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade_shoppingcart`
--

LOCK TABLES `trade_shoppingcart` WRITE;
/*!40000 ALTER TABLE `trade_shoppingcart` DISABLE KEYS */;
INSERT INTO `trade_shoppingcart` VALUES (3,5,'2023-04-07 10:04:05.031692',1,2);
/*!40000 ALTER TABLE `trade_shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operation_useraddress`
--

DROP TABLE IF EXISTS `user_operation_useraddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_operation_useraddress` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `province` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `signer_name` varchar(100) NOT NULL,
  `signer_mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_usera_user_id_fe128593_fk_users_use` (`user_id`),
  CONSTRAINT `user_operation_usera_user_id_fe128593_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operation_useraddress`
--

LOCK TABLES `user_operation_useraddress` WRITE;
/*!40000 ALTER TABLE `user_operation_useraddress` DISABLE KEYS */;
INSERT INTO `user_operation_useraddress` VALUES (2,'天津市','天津城区','河西区','白杨镇三区','龙哥','18948796072','2023-04-06 16:51:53.205662',1),(3,'山西省','长治市','长子县','白杨镇三区水库旁','龙哥2','18948796172','2023-04-06 16:52:15.979861',1);
/*!40000 ALTER TABLE `user_operation_useraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operation_userfav`
--

DROP TABLE IF EXISTS `user_operation_userfav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_operation_userfav` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `goods_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_operation_userfav_user_id_goods_id_2dbadda7_uniq` (`user_id`,`goods_id`),
  KEY `user_operation_userfav_goods_id_57fc554f_fk_goods_goods_id` (`goods_id`),
  CONSTRAINT `user_operation_userfav_goods_id_57fc554f_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`),
  CONSTRAINT `user_operation_userfav_user_id_4e4de070_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operation_userfav`
--

LOCK TABLES `user_operation_userfav` WRITE;
/*!40000 ALTER TABLE `user_operation_userfav` DISABLE KEYS */;
INSERT INTO `user_operation_userfav` VALUES (4,'2023-04-06 14:52:04.246986',2,2),(7,'2023-04-06 16:24:21.338394',10,1);
/*!40000 ALTER TABLE `user_operation_userfav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_operation_userleavingmessage`
--

DROP TABLE IF EXISTS `user_operation_userleavingmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_operation_userleavingmessage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message_type` int NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  `file` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_operation_userl_user_id_70d909d6_fk_users_use` (`user_id`),
  CONSTRAINT `user_operation_userl_user_id_70d909d6_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_operation_userleavingmessage`
--

LOCK TABLES `user_operation_userleavingmessage` WRITE;
/*!40000 ALTER TABLE `user_operation_userleavingmessage` DISABLE KEYS */;
INSERT INTO `user_operation_userleavingmessage` VALUES (2,2,'商品太少','请增加商品','message/images/mm_lg05Jye.jpg','2023-04-06 16:38:16.825249',1);
/*!40000 ALTER TABLE `user_operation_userleavingmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_userprofile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$260000$AhkvcHGqZyvN15ekkbU7im$1+3Dq+jlyLGiAQJcTQiHjqU+wYS+EpfmWoHQf6aLgGY=','2023-04-07 14:45:44.471842',1,'admin','','',1,1,'2023-04-04 11:05:09.175110','龙哥','2023-04-04','male','18912345678','123@qq.com'),(2,'pbkdf2_sha256$260000$TgM9lNyx9xsUu4lWfmKHvI$RB2euOLNnP0cxBq+YQzMUgM9rgConSFmAjblWcGbjsY=','2023-04-07 10:03:57.928440',1,'luke','','',1,1,'2023-04-06 09:34:07.108991',NULL,NULL,'female',NULL,'134@qq.com'),(4,'pbkdf2_sha256$260000$D2q7Yu6PWejgqZBGn36yn3$0u4tisSao5Z0miq11WAUf3ImENRkZscUBtCTpBT91TI=',NULL,0,'18948796072','','',0,1,'2023-04-06 10:56:43.083117',NULL,NULL,'female','18948796072',NULL);
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_userprofile_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userprofile_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userprofile_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_verifycode`
--

DROP TABLE IF EXISTS `users_verifycode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_verifycode` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_verifycode`
--

LOCK TABLES `users_verifycode` WRITE;
/*!40000 ALTER TABLE `users_verifycode` DISABLE KEYS */;
INSERT INTO `users_verifycode` VALUES (1,'1234','18933445566','2023-04-06 09:52:41.000000'),(2,'3701','18948796072','2023-04-06 10:18:59.721257'),(3,'2935','18948796072','2023-04-06 10:56:20.544740');
/*!40000 ALTER TABLE `users_verifycode` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-04 16:33:45
