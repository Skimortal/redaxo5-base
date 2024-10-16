-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: redaxo
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Table structure for table `rex_action`
--

DROP TABLE IF EXISTS `rex_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preview` text COLLATE utf8mb4_unicode_ci,
  `presave` text COLLATE utf8mb4_unicode_ci,
  `postsave` text COLLATE utf8mb4_unicode_ci,
  `previewmode` tinyint(4) DEFAULT NULL,
  `presavemode` tinyint(4) DEFAULT NULL,
  `postsavemode` tinyint(4) DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_action`
--

LOCK TABLES `rex_action` WRITE;
/*!40000 ALTER TABLE `rex_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_article`
--

DROP TABLE IF EXISTS `rex_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_article` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `catname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `catpriority` int(10) unsigned NOT NULL,
  `startarticle` tinyint(1) NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `template_id` int(10) unsigned NOT NULL,
  `clang_id` int(10) unsigned NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  `yrewrite_url_type` enum('AUTO','CUSTOM','REDIRECTION_INTERNAL','REDIRECTION_EXTERNAL') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AUTO',
  `yrewrite_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `yrewrite_redirection` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `yrewrite_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `yrewrite_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `yrewrite_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `yrewrite_changefreq` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yrewrite_priority` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yrewrite_index` tinyint(1) DEFAULT NULL,
  `yrewrite_canonical_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `find_articles` (`id`,`clang_id`),
  KEY `clang_id` (`clang_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_article`
--

LOCK TABLES `rex_article` WRITE;
/*!40000 ALTER TABLE `rex_article` DISABLE KEYS */;
INSERT INTO `rex_article` VALUES (1,1,0,'Home','',0,0,1,'|',1,1,1,'2024-10-16 11:26:33','root','2024-10-16 11:26:35','root',0,'AUTO','','','','','',NULL,NULL,NULL,''),(2,1,0,'Home','',0,0,1,'|',0,1,2,'2024-10-16 11:26:33','root','2024-10-16 11:26:35','root',0,'AUTO','','','','','',NULL,NULL,NULL,''),(3,2,0,'404','',0,0,2,'|',1,1,1,'2024-10-16 11:27:19','root','2024-10-16 11:27:20','root',0,'AUTO','','','','','',NULL,NULL,NULL,''),(4,2,0,'404','',0,0,2,'|',0,1,2,'2024-10-16 11:27:19','root','2024-10-16 11:27:19','root',0,'AUTO','','','','','',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `rex_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_article_slice`
--

DROP TABLE IF EXISTS `rex_article_slice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_article_slice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(10) unsigned NOT NULL,
  `clang_id` int(10) unsigned NOT NULL,
  `ctype_id` int(10) unsigned NOT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `revision` int(11) NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `value1` mediumtext COLLATE utf8mb4_unicode_ci,
  `value2` mediumtext COLLATE utf8mb4_unicode_ci,
  `value3` mediumtext COLLATE utf8mb4_unicode_ci,
  `value4` mediumtext COLLATE utf8mb4_unicode_ci,
  `value5` mediumtext COLLATE utf8mb4_unicode_ci,
  `value6` mediumtext COLLATE utf8mb4_unicode_ci,
  `value7` mediumtext COLLATE utf8mb4_unicode_ci,
  `value8` mediumtext COLLATE utf8mb4_unicode_ci,
  `value9` mediumtext COLLATE utf8mb4_unicode_ci,
  `value10` mediumtext COLLATE utf8mb4_unicode_ci,
  `value11` mediumtext COLLATE utf8mb4_unicode_ci,
  `value12` mediumtext COLLATE utf8mb4_unicode_ci,
  `value13` mediumtext COLLATE utf8mb4_unicode_ci,
  `value14` mediumtext COLLATE utf8mb4_unicode_ci,
  `value15` mediumtext COLLATE utf8mb4_unicode_ci,
  `value16` mediumtext COLLATE utf8mb4_unicode_ci,
  `value17` mediumtext COLLATE utf8mb4_unicode_ci,
  `value18` mediumtext COLLATE utf8mb4_unicode_ci,
  `value19` mediumtext COLLATE utf8mb4_unicode_ci,
  `value20` mediumtext COLLATE utf8mb4_unicode_ci,
  `media1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media7` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media8` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media9` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media10` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medialist1` text COLLATE utf8mb4_unicode_ci,
  `medialist2` text COLLATE utf8mb4_unicode_ci,
  `medialist3` text COLLATE utf8mb4_unicode_ci,
  `medialist4` text COLLATE utf8mb4_unicode_ci,
  `medialist5` text COLLATE utf8mb4_unicode_ci,
  `medialist6` text COLLATE utf8mb4_unicode_ci,
  `medialist7` text COLLATE utf8mb4_unicode_ci,
  `medialist8` text COLLATE utf8mb4_unicode_ci,
  `medialist9` text COLLATE utf8mb4_unicode_ci,
  `medialist10` text COLLATE utf8mb4_unicode_ci,
  `link1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link3` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link4` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link5` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link6` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link7` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link8` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link9` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link10` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linklist1` text COLLATE utf8mb4_unicode_ci,
  `linklist2` text COLLATE utf8mb4_unicode_ci,
  `linklist3` text COLLATE utf8mb4_unicode_ci,
  `linklist4` text COLLATE utf8mb4_unicode_ci,
  `linklist5` text COLLATE utf8mb4_unicode_ci,
  `linklist6` text COLLATE utf8mb4_unicode_ci,
  `linklist7` text COLLATE utf8mb4_unicode_ci,
  `linklist8` text COLLATE utf8mb4_unicode_ci,
  `linklist9` text COLLATE utf8mb4_unicode_ci,
  `linklist10` text COLLATE utf8mb4_unicode_ci,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `slice_priority` (`article_id`,`priority`,`module_id`),
  KEY `find_slices` (`clang_id`,`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_article_slice`
--

LOCK TABLES `rex_article_slice` WRITE;
/*!40000 ALTER TABLE `rex_article_slice` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_article_slice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_clang`
--

DROP TABLE IF EXISTS `rex_clang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_clang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_clang`
--

LOCK TABLES `rex_clang` WRITE;
/*!40000 ALTER TABLE `rex_clang` DISABLE KEYS */;
INSERT INTO `rex_clang` VALUES (1,'de','deutsch',1,1,0),(2,'en','englisch',2,1,0);
/*!40000 ALTER TABLE `rex_clang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_config`
--

DROP TABLE IF EXISTS `rex_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_config` (
  `namespace` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`namespace`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_config`
--

LOCK TABLES `rex_config` WRITE;
/*!40000 ALTER TABLE `rex_config` DISABLE KEYS */;
INSERT INTO `rex_config` VALUES ('be_style/customizer','codemirror','1'),('be_style/customizer','codemirror_darktheme','\"dracula\"'),('be_style/customizer','codemirror_theme','\"eclipse\"'),('be_style/customizer','codemirror-langs','0'),('be_style/customizer','codemirror-options','\"\"'),('be_style/customizer','codemirror-selectors','\"\"'),('be_style/customizer','codemirror-tools','0'),('be_style/customizer','labelcolor','\"#3bb594\"'),('be_style/customizer','showlink','1'),('capacity','largedir','0'),('capacity','largefile','0'),('capacity','space','0'),('consent_manager','hidebodyscrollbar','false'),('consent_manager','justInstalled','true'),('consent_manager','lifespan','365'),('consent_manager','outputowncss','false'),('consent_manager','skip_consent','\"\"'),('consent_manager','theme','false'),('core','package-config','{\"analytics\":{\"install\":true,\"status\":true},\"backup\":{\"install\":true,\"status\":true},\"be_style\":{\"install\":true,\"status\":true,\"plugins\":{\"customizer\":{\"install\":true,\"status\":true},\"redaxo\":{\"install\":true,\"status\":true}}},\"bloecks\":{\"install\":true,\"status\":true,\"plugins\":{\"cutncopy\":{\"install\":false,\"status\":false},\"dragndrop\":{\"install\":false,\"status\":false}}},\"capacity\":{\"install\":true,\"status\":true},\"consent_manager\":{\"install\":true,\"status\":true},\"cronjob\":{\"install\":false,\"status\":false,\"plugins\":{\"article_status\":{\"install\":false,\"status\":false},\"optimize_tables\":{\"install\":false,\"status\":false}}},\"debug\":{\"install\":false,\"status\":false},\"developer\":{\"install\":true,\"status\":true},\"ffmpeg\":{\"install\":true,\"status\":true},\"focuspoint\":{\"install\":true,\"status\":true},\"install\":{\"install\":true,\"status\":true},\"markitup\":{\"install\":true,\"status\":true},\"mblock\":{\"install\":true,\"status\":true},\"media_manager\":{\"install\":true,\"status\":true},\"media_srcset\":{\"install\":true,\"status\":true},\"mediapool\":{\"install\":true,\"status\":true},\"metainfo\":{\"install\":true,\"status\":true},\"mform\":{\"install\":true,\"status\":true},\"modulsammlung\":{\"install\":true,\"status\":true,\"plugins\":{\"documentation\":{\"install\":false,\"status\":false}}},\"modulsuche\":{\"install\":true,\"status\":true},\"mostconnect\":{\"install\":true,\"status\":true},\"multiupload\":{\"install\":true,\"status\":true,\"plugins\":{\"imageoptimizer\":{\"install\":true,\"status\":true},\"upload_precompressor\":{\"install\":true,\"status\":true}}},\"navigation_factory\":{\"install\":true,\"status\":true},\"nv_betheme\":{\"install\":true,\"status\":true},\"phpmailer\":{\"install\":false,\"status\":false},\"project\":{\"install\":true,\"status\":true},\"sprog\":{\"install\":true,\"status\":true},\"structure\":{\"install\":true,\"status\":true,\"plugins\":{\"content\":{\"install\":true,\"status\":true},\"history\":{\"install\":false,\"status\":false},\"version\":{\"install\":false,\"status\":false}}},\"users\":{\"install\":true,\"status\":true},\"yform\":{\"install\":true,\"status\":true,\"plugins\":{\"email\":{\"install\":true,\"status\":true},\"manager\":{\"install\":true,\"status\":true},\"rest\":{\"install\":false,\"status\":false},\"tools\":{\"install\":false,\"status\":false}}},\"yrewrite\":{\"install\":true,\"status\":true},\"yrewrite_scheme\":{\"install\":true,\"status\":true}}'),('core','package-order','[\"be_style\",\"be_style\\/customizer\",\"be_style\\/redaxo\",\"users\",\"analytics\",\"backup\",\"consent_manager\",\"developer\",\"install\",\"markitup\",\"mblock\",\"media_manager\",\"ffmpeg\",\"media_srcset\",\"mediapool\",\"focuspoint\",\"mform\",\"modulsammlung\",\"mostconnect\",\"multiupload\",\"multiupload\\/imageoptimizer\",\"multiupload\\/upload_precompressor\",\"navigation_factory\",\"nv_betheme\",\"sprog\",\"structure\",\"capacity\",\"metainfo\",\"structure\\/content\",\"bloecks\",\"yform\",\"yform\\/email\",\"yform\\/manager\",\"yrewrite\",\"yrewrite_scheme\",\"modulsuche\",\"project\"]'),('core','utf8mb4','true'),('core','version','\"5.17.1\"'),('developer','actions','true'),('developer','delete','true'),('developer','dir_suffix','true'),('developer','items','{\"templates\":{\"1\":1729083118}}'),('developer','modules','true'),('developer','prefix','false'),('developer','rename','true'),('developer','sync_backend','true'),('developer','sync_frontend','true'),('developer','templates','true'),('developer','umlauts','false'),('developer','yform_email','true'),('ffmpeg','command','\"ffmpeg -y -i INPUT -vcodec h264   OUTPUT.mp4\"'),('mblock','mblock_delete','1'),('mblock','mblock_scroll','1'),('mblock','mblock_theme','\"default_theme\"'),('media_manager','avif_quality','60'),('media_manager','avif_speed','6'),('media_manager','interlace','[\"jpg\"]'),('media_manager','jpg_quality','80'),('media_manager','png_compression','5'),('media_manager','webp_quality','85'),('multiupload/imageoptimizer','advpng_bin','\"\\/usr\\/bin\\/advpng\"'),('multiupload/imageoptimizer','gif_mode','false'),('multiupload/imageoptimizer','gifsicle_bin','\"\\/usr\\/bin\\/gifsicle\"'),('multiupload/imageoptimizer','jpeg_mode','\"jpegoptim\"'),('multiupload/imageoptimizer','jpegoptim_bin','\"\\/usr\\/bin\\/jpegoptim\"'),('multiupload/imageoptimizer','jpegtran_bin','\"\\/usr\\/bin\\/jpegtran\"'),('multiupload/imageoptimizer','optimize_uploaded_files','true'),('multiupload/imageoptimizer','optipng_bin','\"\\/usr\\/bin\\/optipng\"'),('multiupload/imageoptimizer','png_mode','\"pngquant\"'),('multiupload/imageoptimizer','pngcrush_bin','\"\\/usr\\/bin\\/pngcrush\"'),('multiupload/imageoptimizer','pngout_bin','\"\\/usr\\/bin\\/pngout\"'),('multiupload/imageoptimizer','pngquant_bin','\"\\/usr\\/bin\\/pngquant\"'),('multiupload/upload_precompressor','jpg_quality','\"100\"'),('multiupload/upload_precompressor','max_pixel','\"1200\"'),('nv_betheme','active','\"|1|\"'),('nv_betheme','color','\"#0084A4\"'),('nv_betheme','login_background_active','\"|1|\"'),('nv_betheme','login_background_credits','\"\"'),('nv_betheme','login_background_image','\"\"'),('nv_betheme','login_branding_active','\"|1|\"'),('nv_betheme','login_branding_image','\"\"'),('nv_betheme','logo','\"\"'),('nv_betheme','serverName','\"REDAXO\"'),('nv_betheme','style','\"dark\"'),('sprog','chunkSizeArticles','4'),('structure','notfound_article_id','1'),('structure','start_article_id','1'),('yrewrite','unicode_urls','false'),('yrewrite','yrewrite_hide_url_block','false'),('yrewrite_scheme','excluded_categories','[]'),('yrewrite_scheme','scheme','\"yrewrite_scheme_suffix\"'),('yrewrite_scheme','suffix','\"\\/\"'),('yrewrite_scheme','urlreplacer','\"\"');
/*!40000 ALTER TABLE `rex_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_consent_manager_cache_log`
--

DROP TABLE IF EXISTS `rex_consent_manager_cache_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_consent_manager_cache_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `consent` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_consent_manager_cache_log`
--

LOCK TABLES `rex_consent_manager_cache_log` WRITE;
/*!40000 ALTER TABLE `rex_consent_manager_cache_log` DISABLE KEYS */;
INSERT INTO `rex_consent_manager_cache_log` VALUES (1,'{\"domains\":[],\"cookiegroups\":[],\"cookies\":[],\"texts\":[],\"cacheLogId\":0,\"majorVersion\":\"4.3.0\"}','root','2024-10-16 13:43:52');
/*!40000 ALTER TABLE `rex_consent_manager_cache_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_consent_manager_consent_log`
--

DROP TABLE IF EXISTS `rex_consent_manager_consent_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_consent_manager_consent_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consentid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consents` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cachelogid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_consent_manager_consent_log`
--

LOCK TABLES `rex_consent_manager_consent_log` WRITE;
/*!40000 ALTER TABLE `rex_consent_manager_consent_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_consent_manager_consent_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_consent_manager_cookie`
--

DROP TABLE IF EXISTS `rex_consent_manager_cookie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_consent_manager_cookie` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(10) unsigned NOT NULL,
  `clang_id` int(10) unsigned NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_link_privacy` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `definition` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `script` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `script_unselect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedate` datetime NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_consent_manager_cookie`
--

LOCK TABLES `rex_consent_manager_cookie` WRITE;
/*!40000 ALTER TABLE `rex_consent_manager_cookie` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_consent_manager_cookie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_consent_manager_cookiegroup`
--

DROP TABLE IF EXISTS `rex_consent_manager_cookiegroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_consent_manager_cookiegroup` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(10) unsigned NOT NULL,
  `clang_id` int(10) unsigned NOT NULL,
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prio` int(10) unsigned NOT NULL,
  `required` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedate` datetime NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_consent_manager_cookiegroup`
--

LOCK TABLES `rex_consent_manager_cookiegroup` WRITE;
/*!40000 ALTER TABLE `rex_consent_manager_cookiegroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_consent_manager_cookiegroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_consent_manager_domain`
--

DROP TABLE IF EXISTS `rex_consent_manager_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_consent_manager_domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacy_policy` int(10) unsigned NOT NULL,
  `legal_notice` int(10) unsigned NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_consent_manager_domain`
--

LOCK TABLES `rex_consent_manager_domain` WRITE;
/*!40000 ALTER TABLE `rex_consent_manager_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_consent_manager_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_consent_manager_text`
--

DROP TABLE IF EXISTS `rex_consent_manager_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_consent_manager_text` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(10) unsigned NOT NULL,
  `clang_id` int(10) unsigned NOT NULL,
  `uid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updatedate` datetime NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_consent_manager_text`
--

LOCK TABLES `rex_consent_manager_text` WRITE;
/*!40000 ALTER TABLE `rex_consent_manager_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_consent_manager_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_markitup_profiles`
--

DROP TABLE IF EXISTS `rex_markitup_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_markitup_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `urltype` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minheight` smallint(5) unsigned NOT NULL,
  `maxheight` smallint(5) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `markitup_buttons` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_markitup_profiles`
--

LOCK TABLES `rex_markitup_profiles` WRITE;
/*!40000 ALTER TABLE `rex_markitup_profiles` DISABLE KEYS */;
INSERT INTO `rex_markitup_profiles` VALUES (1,'textile_full','Textile default configuration','relative',300,800,'textile','bold,code,clips[Snippetname1=Snippettext1|Snippetname2=Snippettext2],deleted,emaillink,externallink,groupheading[1|2|3|4|5|6],grouplink[file|internal|external|mailto],heading1,heading2,heading3,heading4,heading5,heading6,internallink,italic,media,medialink,orderedlist,paragraph,quote,sub,sup,table,underline,unorderedlist'),(2,'markdown_full','Markdown default configuration','relative',300,800,'markdown','bold,code,clips[Snippetname1=Snippettext1|Snippetname2=Snippettext2],deleted,emaillink,externallink,groupheading[1|2|3|4|5|6],grouplink[file|internal|external|mailto],heading1,heading2,heading3,heading4,heading5,heading6,internallink,italic,media,medialink,orderedlist,paragraph,quote,sub,sup,table,underline,unorderedlist');
/*!40000 ALTER TABLE `rex_markitup_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_markitup_snippets`
--

DROP TABLE IF EXISTS `rex_markitup_snippets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_markitup_snippets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_markitup_snippets`
--

LOCK TABLES `rex_markitup_snippets` WRITE;
/*!40000 ALTER TABLE `rex_markitup_snippets` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_markitup_snippets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_mblock_rexform_demo`
--

DROP TABLE IF EXISTS `rex_mblock_rexform_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_mblock_rexform_demo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(1) DEFAULT '1',
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mblock_field` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_mblock_rexform_demo`
--

LOCK TABLES `rex_mblock_rexform_demo` WRITE;
/*!40000 ALTER TABLE `rex_mblock_rexform_demo` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_mblock_rexform_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_media`
--

DROP TABLE IF EXISTS `rex_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci,
  `filetype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `originalname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filesize` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  `med_focuspoint` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_media`
--

LOCK TABLES `rex_media` WRITE;
/*!40000 ALTER TABLE `rex_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_media_category`
--

DROP TABLE IF EXISTS `rex_media_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_media_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_media_category`
--

LOCK TABLES `rex_media_category` WRITE;
/*!40000 ALTER TABLE `rex_media_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_media_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_media_manager_type`
--

DROP TABLE IF EXISTS `rex_media_manager_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_media_manager_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_media_manager_type`
--

LOCK TABLES `rex_media_manager_type` WRITE;
/*!40000 ALTER TABLE `rex_media_manager_type` DISABLE KEYS */;
INSERT INTO `rex_media_manager_type` VALUES (1,1,'rex_media_small','200 × 200 px','2024-10-16 11:17:21','backend','2024-10-16 11:17:21','backend'),(2,1,'rex_media_medium','600 × 600 px','2024-10-16 11:17:21','backend','2024-10-16 11:17:21','backend'),(3,1,'rex_media_large','1200 × 1200 px','2024-10-16 11:17:21','backend','2024-10-16 11:17:21','backend'),(4,0,'yrewrite_seo_image','YRewrite SEO Vorschaubild für Sitemap und Open Graph Tags','0000-00-00 00:00:00','','0000-00-00 00:00:00',''),(5,0,'focuspoint_media_detail','','2024-10-16 15:49:28','root','2024-10-16 15:49:28','root'),(6,0,'modulsuche_thumbnail','Mediatype für die Thumbnails in der Blockauswahl. (modulsuche)','0000-00-00 00:00:00','','0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `rex_media_manager_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_media_manager_type_effect`
--

DROP TABLE IF EXISTS `rex_media_manager_type_effect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_media_manager_type_effect` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(10) unsigned NOT NULL,
  `effect` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(10) unsigned NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_media_manager_type_effect`
--

LOCK TABLES `rex_media_manager_type_effect` WRITE;
/*!40000 ALTER TABLE `rex_media_manager_type_effect` DISABLE KEYS */;
INSERT INTO `rex_media_manager_type_effect` VALUES (1,1,'resize','{\"rex_effect_crop\":{\"rex_effect_crop_width\":\"\",\"rex_effect_crop_height\":\"\",\"rex_effect_crop_offset_width\":\"\",\"rex_effect_crop_offset_height\":\"\",\"rex_effect_crop_hpos\":\"center\",\"rex_effect_crop_vpos\":\"middle\"},\"rex_effect_filter_blur\":{\"rex_effect_filter_blur_amount\":\"80\",\"rex_effect_filter_blur_radius\":\"8\",\"rex_effect_filter_blur_threshold\":\"3\"},\"rex_effect_filter_sharpen\":{\"rex_effect_filter_sharpen_amount\":\"80\",\"rex_effect_filter_sharpen_radius\":\"0.5\",\"rex_effect_filter_sharpen_threshold\":\"3\"},\"rex_effect_flip\":{\"rex_effect_flip_flip\":\"X\"},\"rex_effect_header\":{\"rex_effect_header_download\":\"open_media\",\"rex_effect_header_cache\":\"no_cache\"},\"rex_effect_insert_image\":{\"rex_effect_insert_image_brandimage\":\"\",\"rex_effect_insert_image_hpos\":\"left\",\"rex_effect_insert_image_vpos\":\"top\",\"rex_effect_insert_image_padding_x\":\"-10\",\"rex_effect_insert_image_padding_y\":\"-10\"},\"rex_effect_mediapath\":{\"rex_effect_mediapath_mediapath\":\"\"},\"rex_effect_mirror\":{\"rex_effect_mirror_height\":\"\",\"rex_effect_mirror_set_transparent\":\"colored\",\"rex_effect_mirror_bg_r\":\"\",\"rex_effect_mirror_bg_g\":\"\",\"rex_effect_mirror_bg_b\":\"\"},\"rex_effect_resize\":{\"rex_effect_resize_width\":\"200\",\"rex_effect_resize_height\":\"200\",\"rex_effect_resize_style\":\"maximum\",\"rex_effect_resize_allow_enlarge\":\"not_enlarge\"},\"rex_effect_workspace\":{\"rex_effect_workspace_width\":\"\",\"rex_effect_workspace_height\":\"\",\"rex_effect_workspace_hpos\":\"left\",\"rex_effect_workspace_vpos\":\"top\",\"rex_effect_workspace_set_transparent\":\"colored\",\"rex_effect_workspace_bg_r\":\"\",\"rex_effect_workspace_bg_g\":\"\",\"rex_effect_workspace_bg_b\":\"\"}}',1,'2024-10-16 11:17:21','backend','2024-10-16 11:17:21','backend'),(2,2,'resize','{\"rex_effect_crop\":{\"rex_effect_crop_width\":\"\",\"rex_effect_crop_height\":\"\",\"rex_effect_crop_offset_width\":\"\",\"rex_effect_crop_offset_height\":\"\",\"rex_effect_crop_hpos\":\"center\",\"rex_effect_crop_vpos\":\"middle\"},\"rex_effect_filter_blur\":{\"rex_effect_filter_blur_amount\":\"80\",\"rex_effect_filter_blur_radius\":\"8\",\"rex_effect_filter_blur_threshold\":\"3\"},\"rex_effect_filter_sharpen\":{\"rex_effect_filter_sharpen_amount\":\"80\",\"rex_effect_filter_sharpen_radius\":\"0.5\",\"rex_effect_filter_sharpen_threshold\":\"3\"},\"rex_effect_flip\":{\"rex_effect_flip_flip\":\"X\"},\"rex_effect_header\":{\"rex_effect_header_download\":\"open_media\",\"rex_effect_header_cache\":\"no_cache\"},\"rex_effect_insert_image\":{\"rex_effect_insert_image_brandimage\":\"\",\"rex_effect_insert_image_hpos\":\"left\",\"rex_effect_insert_image_vpos\":\"top\",\"rex_effect_insert_image_padding_x\":\"-10\",\"rex_effect_insert_image_padding_y\":\"-10\"},\"rex_effect_mediapath\":{\"rex_effect_mediapath_mediapath\":\"\"},\"rex_effect_mirror\":{\"rex_effect_mirror_height\":\"\",\"rex_effect_mirror_set_transparent\":\"colored\",\"rex_effect_mirror_bg_r\":\"\",\"rex_effect_mirror_bg_g\":\"\",\"rex_effect_mirror_bg_b\":\"\"},\"rex_effect_resize\":{\"rex_effect_resize_width\":\"600\",\"rex_effect_resize_height\":\"600\",\"rex_effect_resize_style\":\"maximum\",\"rex_effect_resize_allow_enlarge\":\"not_enlarge\"},\"rex_effect_workspace\":{\"rex_effect_workspace_width\":\"\",\"rex_effect_workspace_height\":\"\",\"rex_effect_workspace_hpos\":\"left\",\"rex_effect_workspace_vpos\":\"top\",\"rex_effect_workspace_set_transparent\":\"colored\",\"rex_effect_workspace_bg_r\":\"\",\"rex_effect_workspace_bg_g\":\"\",\"rex_effect_workspace_bg_b\":\"\"}}',1,'2024-10-16 11:17:21','backend','2024-10-16 11:17:21','backend'),(3,3,'resize','{\"rex_effect_crop\":{\"rex_effect_crop_width\":\"\",\"rex_effect_crop_height\":\"\",\"rex_effect_crop_offset_width\":\"\",\"rex_effect_crop_offset_height\":\"\",\"rex_effect_crop_hpos\":\"center\",\"rex_effect_crop_vpos\":\"middle\"},\"rex_effect_filter_blur\":{\"rex_effect_filter_blur_amount\":\"80\",\"rex_effect_filter_blur_radius\":\"8\",\"rex_effect_filter_blur_threshold\":\"3\"},\"rex_effect_filter_sharpen\":{\"rex_effect_filter_sharpen_amount\":\"80\",\"rex_effect_filter_sharpen_radius\":\"0.5\",\"rex_effect_filter_sharpen_threshold\":\"3\"},\"rex_effect_flip\":{\"rex_effect_flip_flip\":\"X\"},\"rex_effect_header\":{\"rex_effect_header_download\":\"open_media\",\"rex_effect_header_cache\":\"no_cache\"},\"rex_effect_insert_image\":{\"rex_effect_insert_image_brandimage\":\"\",\"rex_effect_insert_image_hpos\":\"left\",\"rex_effect_insert_image_vpos\":\"top\",\"rex_effect_insert_image_padding_x\":\"-10\",\"rex_effect_insert_image_padding_y\":\"-10\"},\"rex_effect_mediapath\":{\"rex_effect_mediapath_mediapath\":\"\"},\"rex_effect_mirror\":{\"rex_effect_mirror_height\":\"\",\"rex_effect_mirror_set_transparent\":\"colored\",\"rex_effect_mirror_bg_r\":\"\",\"rex_effect_mirror_bg_g\":\"\",\"rex_effect_mirror_bg_b\":\"\"},\"rex_effect_resize\":{\"rex_effect_resize_width\":\"1200\",\"rex_effect_resize_height\":\"1200\",\"rex_effect_resize_style\":\"maximum\",\"rex_effect_resize_allow_enlarge\":\"not_enlarge\"},\"rex_effect_workspace\":{\"rex_effect_workspace_width\":\"\",\"rex_effect_workspace_height\":\"\",\"rex_effect_workspace_hpos\":\"left\",\"rex_effect_workspace_vpos\":\"top\",\"rex_effect_workspace_set_transparent\":\"colored\",\"rex_effect_workspace_bg_r\":\"\",\"rex_effect_workspace_bg_g\":\"\",\"rex_effect_workspace_bg_b\":\"\"}}',1,'2024-10-16 11:17:21','backend','2024-10-16 11:17:21','backend'),(4,4,'resize','{\"rex_effect_resize\":{\"rex_effect_resize_width\":\"4096\",\"rex_effect_resize_height\":\"4096\",\"rex_effect_resize_style\":\"maximum\",\"rex_effect_resize_allow_enlarge\":\"not_enlarge\"}}',1,'2024-10-16 09:26:00','','0000-00-00 00:00:00',''),(5,5,'resize','{\"rex_effect_resize\":{\"rex_effect_resize_width\":\"1024\",\"rex_effect_resize_height\":\"1024\",\"rex_effect_resize_style\":\"maximum\",\"rex_effect_resize_allow_enlarge\":\"enlarge\"}}',0,'2024-10-16 15:49:28','root','2024-10-16 15:49:28','root'),(6,6,'resize','{\"rex_effect_rounded_corners\":{\"rex_effect_rounded_corners_topleft\":\"\",\"rex_effect_rounded_corners_topright\":\"\",\"rex_effect_rounded_corners_bottomleft\":\"\",\"rex_effect_rounded_corners_bottomright\":\"\"},\"rex_effect_workspace\":{\"rex_effect_workspace_width\":\"\",\"rex_effect_workspace_height\":\"\",\"rex_effect_workspace_hpos\":\"left\",\"rex_effect_workspace_vpos\":\"top\",\"rex_effect_workspace_set_transparent\":\"colored\",\"rex_effect_workspace_bg_r\":\"\",\"rex_effect_workspace_bg_g\":\"\",\"rex_effect_workspace_bg_b\":\"\"},\"rex_effect_crop\":{\"rex_effect_crop_width\":\"\",\"rex_effect_crop_height\":\"\",\"rex_effect_crop_offset_width\":\"\",\"rex_effect_crop_offset_height\":\"\",\"rex_effect_crop_hpos\":\"center\",\"rex_effect_crop_vpos\":\"middle\"},\"rex_effect_insert_image\":{\"rex_effect_insert_image_brandimage\":\"\",\"rex_effect_insert_image_hpos\":\"left\",\"rex_effect_insert_image_vpos\":\"top\",\"rex_effect_insert_image_padding_x\":\"-10\",\"rex_effect_insert_image_padding_y\":\"-10\"},\"rex_effect_rotate\":{\"rex_effect_rotate_rotate\":\"0\"},\"rex_effect_filter_colorize\":{\"rex_effect_filter_colorize_filter_r\":\"\",\"rex_effect_filter_colorize_filter_g\":\"\",\"rex_effect_filter_colorize_filter_b\":\"\"},\"rex_effect_image_properties\":{\"rex_effect_image_properties_jpg_quality\":\"\",\"rex_effect_image_properties_png_compression\":\"\",\"rex_effect_image_properties_webp_quality\":\"\",\"rex_effect_image_properties_interlace\":null},\"rex_effect_filter_brightness\":{\"rex_effect_filter_brightness_brightness\":\"\"},\"rex_effect_flip\":{\"rex_effect_flip_flip\":\"X\"},\"rex_effect_image_format\":{\"rex_effect_image_format_convert_to\":\"webp\"},\"rex_effect_filter_contrast\":{\"rex_effect_filter_contrast_contrast\":\"\"},\"rex_effect_filter_sharpen\":{\"rex_effect_filter_sharpen_amount\":\"80\",\"rex_effect_filter_sharpen_radius\":\"0.5\",\"rex_effect_filter_sharpen_threshold\":\"3\"},\"rex_effect_resize\":{\"rex_effect_resize_width\":\"100\",\"rex_effect_resize_height\":\"100\",\"rex_effect_resize_style\":\"minimum\",\"rex_effect_resize_allow_enlarge\":\"enlarge\"},\"rex_effect_filter_blur\":{\"rex_effect_filter_blur_repeats\":\"10\",\"rex_effect_filter_blur_type\":\"gaussian\",\"rex_effect_filter_blur_smoothit\":\"\"},\"rex_effect_mirror\":{\"rex_effect_mirror_height\":\"\",\"rex_effect_mirror_opacity\":\"100\",\"rex_effect_mirror_set_transparent\":\"colored\",\"rex_effect_mirror_bg_r\":\"\",\"rex_effect_mirror_bg_g\":\"\",\"rex_effect_mirror_bg_b\":\"\"},\"rex_effect_header\":{\"rex_effect_header_download\":\"open_media\",\"rex_effect_header_cache\":\"no_cache\",\"rex_effect_header_filename\":\"filename\"},\"rex_effect_convert2img\":{\"rex_effect_convert2img_convert_to\":\"jpg\",\"rex_effect_convert2img_density\":\"150\",\"rex_effect_convert2img_color\":\"\"},\"rex_effect_mediapath\":{\"rex_effect_mediapath_mediapath\":\"\"}}',1,'2024-10-16 14:06:20','modulsuche','0000-00-00 00:00:00',''),(7,6,'crop','{\"rex_effect_rounded_corners\":{\"rex_effect_rounded_corners_topleft\":\"\",\"rex_effect_rounded_corners_topright\":\"\",\"rex_effect_rounded_corners_bottomleft\":\"\",\"rex_effect_rounded_corners_bottomright\":\"\"},\"rex_effect_workspace\":{\"rex_effect_workspace_width\":\"\",\"rex_effect_workspace_height\":\"\",\"rex_effect_workspace_hpos\":\"left\",\"rex_effect_workspace_vpos\":\"top\",\"rex_effect_workspace_set_transparent\":\"colored\",\"rex_effect_workspace_bg_r\":\"\",\"rex_effect_workspace_bg_g\":\"\",\"rex_effect_workspace_bg_b\":\"\"},\"rex_effect_crop\":{\"rex_effect_crop_width\":\"100\",\"rex_effect_crop_height\":\"100\",\"rex_effect_crop_offset_width\":\"\",\"rex_effect_crop_offset_height\":\"\",\"rex_effect_crop_hpos\":\"center\",\"rex_effect_crop_vpos\":\"middle\"},\"rex_effect_insert_image\":{\"rex_effect_insert_image_brandimage\":\"\",\"rex_effect_insert_image_hpos\":\"left\",\"rex_effect_insert_image_vpos\":\"top\",\"rex_effect_insert_image_padding_x\":\"-10\",\"rex_effect_insert_image_padding_y\":\"-10\"},\"rex_effect_rotate\":{\"rex_effect_rotate_rotate\":\"0\"},\"rex_effect_filter_colorize\":{\"rex_effect_filter_colorize_filter_r\":\"\",\"rex_effect_filter_colorize_filter_g\":\"\",\"rex_effect_filter_colorize_filter_b\":\"\"},\"rex_effect_image_properties\":{\"rex_effect_image_properties_jpg_quality\":\"\",\"rex_effect_image_properties_png_compression\":\"\",\"rex_effect_image_properties_webp_quality\":\"\",\"rex_effect_image_properties_interlace\":null},\"rex_effect_filter_brightness\":{\"rex_effect_filter_brightness_brightness\":\"\"},\"rex_effect_flip\":{\"rex_effect_flip_flip\":\"X\"},\"rex_effect_image_format\":{\"rex_effect_image_format_convert_to\":\"webp\"},\"rex_effect_filter_contrast\":{\"rex_effect_filter_contrast_contrast\":\"\"},\"rex_effect_filter_sharpen\":{\"rex_effect_filter_sharpen_amount\":\"80\",\"rex_effect_filter_sharpen_radius\":\"0.5\",\"rex_effect_filter_sharpen_threshold\":\"3\"},\"rex_effect_resize\":{\"rex_effect_resize_width\":\"\",\"rex_effect_resize_height\":\"\",\"rex_effect_resize_style\":\"maximum\",\"rex_effect_resize_allow_enlarge\":\"enlarge\"},\"rex_effect_filter_blur\":{\"rex_effect_filter_blur_repeats\":\"10\",\"rex_effect_filter_blur_type\":\"gaussian\",\"rex_effect_filter_blur_smoothit\":\"\"},\"rex_effect_mirror\":{\"rex_effect_mirror_height\":\"\",\"rex_effect_mirror_opacity\":\"100\",\"rex_effect_mirror_set_transparent\":\"colored\",\"rex_effect_mirror_bg_r\":\"\",\"rex_effect_mirror_bg_g\":\"\",\"rex_effect_mirror_bg_b\":\"\"},\"rex_effect_header\":{\"rex_effect_header_download\":\"open_media\",\"rex_effect_header_cache\":\"no_cache\",\"rex_effect_header_filename\":\"filename\"},\"rex_effect_convert2img\":{\"rex_effect_convert2img_convert_to\":\"jpg\",\"rex_effect_convert2img_density\":\"150\",\"rex_effect_convert2img_color\":\"\"},\"rex_effect_mediapath\":{\"rex_effect_mediapath_mediapath\":\"\"}}',1,'2024-10-16 14:06:20','modulsuche','0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `rex_media_manager_type_effect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_metainfo_field`
--

DROP TABLE IF EXISTS `rex_metainfo_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_metainfo_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(10) unsigned NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_id` int(10) unsigned DEFAULT NULL,
  `default` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci,
  `validate` text COLLATE utf8mb4_unicode_ci,
  `callback` text COLLATE utf8mb4_unicode_ci,
  `restrictions` text COLLATE utf8mb4_unicode_ci,
  `templates` text COLLATE utf8mb4_unicode_ci,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_metainfo_field`
--

LOCK TABLES `rex_metainfo_field` WRITE;
/*!40000 ALTER TABLE `rex_metainfo_field` DISABLE KEYS */;
INSERT INTO `rex_metainfo_field` VALUES (1,'translate:focuspoint_field_label','med_focuspoint',1,'',14,'','','',NULL,'',NULL,'2024-10-16 15:49:28','root','2024-10-16 15:49:28','root');
/*!40000 ALTER TABLE `rex_metainfo_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_metainfo_type`
--

DROP TABLE IF EXISTS `rex_metainfo_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_metainfo_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dbtype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dblength` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_metainfo_type`
--

LOCK TABLES `rex_metainfo_type` WRITE;
/*!40000 ALTER TABLE `rex_metainfo_type` DISABLE KEYS */;
INSERT INTO `rex_metainfo_type` VALUES (1,'text','text',0),(2,'textarea','text',0),(3,'select','varchar',255),(4,'radio','varchar',255),(5,'checkbox','varchar',255),(6,'REX_MEDIA_WIDGET','varchar',255),(7,'REX_MEDIALIST_WIDGET','text',0),(8,'REX_LINK_WIDGET','varchar',255),(9,'REX_LINKLIST_WIDGET','text',0),(10,'date','text',0),(11,'datetime','text',0),(12,'legend','text',0),(13,'time','text',0),(14,'Focuspoint (AddOn)','varchar',20);
/*!40000 ALTER TABLE `rex_metainfo_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_module`
--

DROP TABLE IF EXISTS `rex_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `output` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci,
  `revision` int(10) unsigned NOT NULL,
  `modulsuche_module_thumbnail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `modulsuche_module_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_module`
--

LOCK TABLES `rex_module` WRITE;
/*!40000 ALTER TABLE `rex_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_module_action`
--

DROP TABLE IF EXISTS `rex_module_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_module_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(10) unsigned NOT NULL,
  `action_id` int(10) unsigned NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_module_action`
--

LOCK TABLES `rex_module_action` WRITE;
/*!40000 ALTER TABLE `rex_module_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_module_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_sprog_abbreviation`
--

DROP TABLE IF EXISTS `rex_sprog_abbreviation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_sprog_abbreviation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clang_id` int(11) NOT NULL,
  `abbreviation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `find_abbreviations` (`clang_id`,`abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_sprog_abbreviation`
--

LOCK TABLES `rex_sprog_abbreviation` WRITE;
/*!40000 ALTER TABLE `rex_sprog_abbreviation` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_sprog_abbreviation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_sprog_wildcard`
--

DROP TABLE IF EXISTS `rex_sprog_wildcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_sprog_wildcard` (
  `pid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `clang_id` int(11) NOT NULL,
  `wildcard` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `replace` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_sprog_wildcard`
--

LOCK TABLES `rex_sprog_wildcard` WRITE;
/*!40000 ALTER TABLE `rex_sprog_wildcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_sprog_wildcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_template`
--

DROP TABLE IF EXISTS `rex_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` text COLLATE utf8mb4_unicode_ci,
  `revision` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_template`
--

LOCK TABLES `rex_template` WRITE;
/*!40000 ALTER TABLE `rex_template` DISABLE KEYS */;
INSERT INTO `rex_template` VALUES (1,NULL,'Default','<?php\r\nheader(\"Content-Type: text/html; charset=utf-8\");\r\n\r\n$ssa = rex_article::getSiteStartArticle();\r\n$article = rex_article::get($this->getValue(\"article_id\"));\r\n\r\n$isSsa = $ssa->getId() == $article->getId();\r\n\r\n$headerImages = array_filter(explode(\",\", getHierarchicalVar(\"art_header_images\", $article, $ssa)));\r\n$headerType = $article->getValue(\"art_header_type\");\r\n$headerText = $article->getValue(\"art_header_text\");\r\n$headerTheme = $article->getValue(\"art_header_theme\");\r\n\r\n$cssFiles = array();\r\n$cssFiles[\'main\'] = rex_addon::get(\'mostconnect\')->getPath(\'assets/css/main.less\');\r\n\r\nrex_less_compiler::compile($cssFiles);\r\n\r\n$project = rex_addon::get(\'mostconnect\');\r\n?>\r\n<!DOCTYPE html>\r\n<html lang=\"<?php echo rex_clang::getCurrent()->getCode(); ?>\">\r\n<head>\r\n    <meta charset=\"utf-8\" />\r\n    <?php\r\n    $seo = new rex_yrewrite_seo();\r\n    echo $seo->getTags();\r\n    ?>\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n    <?php foreach($cssFiles as $cssFile => $lessFile) { ?>\r\n        <link href=\"/..<?php echo $project->getAssetsUrl(\'css/\'.$cssFile.\'.css\'); ?>\" rel=\"stylesheet\">\r\n    <?php } ?>\r\n    <?php echo seo42::getLangTags(); ?>\r\n</head>\r\n\r\n<body id=\"body\">\r\n<header id=\"navigation\" class=\"navbar-fixed-top\">\r\n    <nav class=\"collapse navbar-collapse navbar-right\" role=\"navigation\">\r\n        <?php\r\n        $nav = new rex_nav();\r\n        $nav->setShowAll(false);\r\n        $nav->setListId(\'nav\', 1);\r\n        $nav->setListClass(\'nav navbar-nav\', 1);\r\n        $nav->setLevelCount(1);\r\n        $nav->addCallback(\'RootNavigation::checkMetadata\');\r\n        echo $nav->getNavigation();\r\n        ?>\r\n    </nav>\r\n</header>\r\n\r\n<main class=\"mainContainer\">\r\n    REX_ARTICLE[]\r\n    <?php\r\n    /**\r\n    // Output Slices/Content\r\n    $slices = getSections($article);\r\n    if(!$slices) {\r\n        $slices = getAllSlices($article);\r\n    }\r\n    $out = \'\';\r\n    foreach ($slices as $slice) {\r\n        if($slice->getModuleId() != 79) {\r\n            $out .= $slice->getSlice();\r\n        }\r\n    }\r\n    print $out;\r\n     */\r\n    ?>\r\n</main>\r\n\r\n<footer id=\"footer\">\r\n</footer>\r\n\r\n<script src=\"/..<?php echo $project->getAssetsUrl(\'js/main.js\'); ?>\"></script>\r\n</body>\r\n</html>',1,'2024-10-16 11:17:21','backend','2024-10-16 14:51:58','root','{\"ctype\":[],\"modules\":{\"1\":{\"all\":\"1\"}},\"categories\":{\"all\":\"1\"}}',0);
/*!40000 ALTER TABLE `rex_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_user`
--

DROP TABLE IF EXISTS `rex_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `startpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` text COLLATE utf8mb4_unicode_ci,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_tries` tinyint(4) NOT NULL DEFAULT '0',
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_changed` datetime NOT NULL,
  `previous_passwords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_change_required` tinyint(1) NOT NULL,
  `lasttrydate` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_user`
--

LOCK TABLES `rex_user` WRITE;
/*!40000 ALTER TABLE `rex_user` DISABLE KEYS */;
INSERT INTO `rex_user` VALUES (1,'Administrator',NULL,'root','$2y$10$HI09RRJ4nygu1kpNFLexqOlDqkouLg9yGptMYIJRy1pNd1j08bptW',NULL,1,1,'','',NULL,NULL,0,'2024-10-16 11:17:34','setup','2024-10-16 11:17:34','setup','2024-10-16 11:17:34','[]',0,'2024-10-16 15:28:58','2024-10-16 15:28:58','3095574d6e95a2deecad117daa107a1a',0);
/*!40000 ALTER TABLE `rex_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_user_passkey`
--

DROP TABLE IF EXISTS `rex_user_passkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_user_passkey` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `public_key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rex_user_passkey_user_id` (`user_id`),
  CONSTRAINT `rex_user_passkey_user_id` FOREIGN KEY (`user_id`) REFERENCES `rex_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_user_passkey`
--

LOCK TABLES `rex_user_passkey` WRITE;
/*!40000 ALTER TABLE `rex_user_passkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_user_passkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_user_role`
--

DROP TABLE IF EXISTS `rex_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_user_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `perms` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `createuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  `updateuser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revision` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_user_role`
--

LOCK TABLES `rex_user_role` WRITE;
/*!40000 ALTER TABLE `rex_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_user_session`
--

DROP TABLE IF EXISTS `rex_user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_user_session` (
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `cookie_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passkey_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL,
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `starttime` datetime NOT NULL,
  `last_activity` datetime NOT NULL,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `cookie_key` (`cookie_key`),
  KEY `rex_user_session_user_id` (`user_id`),
  KEY `rex_user_session_passkey_id` (`passkey_id`),
  CONSTRAINT `rex_user_session_passkey_id` FOREIGN KEY (`passkey_id`) REFERENCES `rex_user_passkey` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rex_user_session_user_id` FOREIGN KEY (`user_id`) REFERENCES `rex_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_user_session`
--

LOCK TABLES `rex_user_session` WRITE;
/*!40000 ALTER TABLE `rex_user_session` DISABLE KEYS */;
INSERT INTO `rex_user_session` VALUES ('3095574d6e95a2deecad117daa107a1a',1,NULL,NULL,'172.23.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36','2024-10-16 15:28:58','2024-10-16 16:50:52'),('d37b08c51164de553680536840ff8df3',1,NULL,NULL,'172.23.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36','2024-10-16 11:17:42','2024-10-16 15:26:48');
/*!40000 ALTER TABLE `rex_user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_yform_email_template`
--

DROP TABLE IF EXISTS `rex_yform_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_yform_email_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mail_from` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mail_from_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mail_reply_to` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mail_reply_to_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body_html` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_yform_email_template`
--

LOCK TABLES `rex_yform_email_template` WRITE;
/*!40000 ALTER TABLE `rex_yform_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_yform_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_yform_field`
--

DROP TABLE IF EXISTS `rex_yform_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_yform_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prio` int(11) NOT NULL,
  `type_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `db_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `list_hidden` tinyint(1) NOT NULL,
  `search` tinyint(1) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `not_required` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `multiple` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expanded` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `choices` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `choice_attributes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_yform_field`
--

LOCK TABLES `rex_yform_field` WRITE;
/*!40000 ALTER TABLE `rex_yform_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_yform_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_yform_history`
--

DROP TABLE IF EXISTS `rex_yform_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_yform_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataset_id` int(11) NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dataset` (`table_name`,`dataset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_yform_history`
--

LOCK TABLES `rex_yform_history` WRITE;
/*!40000 ALTER TABLE `rex_yform_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_yform_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_yform_history_field`
--

DROP TABLE IF EXISTS `rex_yform_history_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_yform_history_field` (
  `history_id` int(11) NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`history_id`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_yform_history_field`
--

LOCK TABLES `rex_yform_history_field` WRITE;
/*!40000 ALTER TABLE `rex_yform_history_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_yform_history_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_yform_table`
--

DROP TABLE IF EXISTS `rex_yform_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_yform_table` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `list_amount` int(11) NOT NULL DEFAULT '50',
  `list_sortfield` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'id',
  `list_sortorder` enum('ASC','DESC') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ASC',
  `prio` int(11) NOT NULL,
  `search` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `export` tinyint(1) NOT NULL,
  `import` tinyint(1) NOT NULL,
  `mass_deletion` tinyint(1) NOT NULL,
  `mass_edit` tinyint(1) NOT NULL,
  `schema_overwrite` tinyint(1) NOT NULL DEFAULT '1',
  `history` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_name` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_yform_table`
--

LOCK TABLES `rex_yform_table` WRITE;
/*!40000 ALTER TABLE `rex_yform_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_yform_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_yrewrite_alias`
--

DROP TABLE IF EXISTS `rex_yrewrite_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_yrewrite_alias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias_domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain_id` int(11) NOT NULL,
  `clang_start` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias_domain` (`alias_domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_yrewrite_alias`
--

LOCK TABLES `rex_yrewrite_alias` WRITE;
/*!40000 ALTER TABLE `rex_yrewrite_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_yrewrite_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_yrewrite_domain`
--

DROP TABLE IF EXISTS `rex_yrewrite_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_yrewrite_domain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mount_id` int(11) NOT NULL,
  `start_id` int(11) NOT NULL,
  `notfound_id` int(11) NOT NULL,
  `clangs` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clang_start` int(11) NOT NULL,
  `clang_start_auto` tinyint(1) NOT NULL,
  `clang_start_hidden` tinyint(1) NOT NULL,
  `robots` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_scheme` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_redirect` tinyint(1) NOT NULL,
  `auto_redirect_days` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_yrewrite_domain`
--

LOCK TABLES `rex_yrewrite_domain` WRITE;
/*!40000 ALTER TABLE `rex_yrewrite_domain` DISABLE KEYS */;
INSERT INTO `rex_yrewrite_domain` VALUES (1,'http://localhost:8080/',0,1,2,'',1,0,0,'User-agent: *\r\nDisallow:','%T / %SN','',0,0);
/*!40000 ALTER TABLE `rex_yrewrite_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rex_yrewrite_forward`
--

DROP TABLE IF EXISTS `rex_yrewrite_forward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rex_yrewrite_forward` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `url` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_id` int(11) NOT NULL,
  `clang` int(11) NOT NULL,
  `extern` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `movetype` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rex_yrewrite_forward`
--

LOCK TABLES `rex_yrewrite_forward` WRITE;
/*!40000 ALTER TABLE `rex_yrewrite_forward` DISABLE KEYS */;
/*!40000 ALTER TABLE `rex_yrewrite_forward` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-16 14:56:02
